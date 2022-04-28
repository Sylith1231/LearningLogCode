// The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Firestore.
const admin = require("firebase-admin");

const serviceAccount = require("./hilldash-firebase-adminsdk-01abc-123ab4c5d6.json");

const parsePhoneNumber = require("libphonenumber-js");
const { FunctionBuilder } = require("firebase-functions/v1");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

exports.phone = functions
  .region("europe-west2")
  .https.onRequest(async (req, res) => {
    stra = parsePhoneNumber.isPossiblePhoneNumber(
      req.query.number,
      req.query.code
    );
    strb = parsePhoneNumber.isValidPhoneNumber(
      req.query.number,
      req.query.code
    );
    strc = stra + "   \n   " + strb;
    res.send(strc);
  });

exports.phoneValid = functions
  .region("europe-west2")
  .https.onCall(async (data, context) => {
    console.log("running validity check body");
    if (parsePhoneNumber.isValidPhoneNumber(data.number, data.code)) {
      return null;
    } else {
      return "Invalid phone number.";
    }
  });

exports.phoneRegistered = functions
  .region("europe-west2")
  .https.onCall(async (data, context) => {
    console.log("runing registered check body");
    return admin
      .auth()
      .getUserByPhoneNumber(data.number)
      .then((userRecord) => {
        return "Phone number already registered.";
      })
      .catch((error) => {
        console.log(error.code);
        if (error.code == "auth/user-not-found") {
          return null;
        }
        if (error.code == "auth/invalid-phone-number") {
          return "Invalid phone number.";
        } else {
          console.log(error.code);
          return "An error occurred. Please try again later.";
        }
      });
  });

exports.createUser = functions.https.onCall((data, context) => {
  console.log("trying to create user");
  let userObject;
  return admin
    .auth()
    .createUser({
      email: data.email,
      password: data.password,
      phoneNumber: data.number,
    })
    .then(async (user) => {
      parsedNumber = parsePhoneNumber.parsePhoneNumber(user.phoneNumber);
      nationalNumber = parsedNumber["nationalNumber"];
      userObject = user;
      await admin
        .firestore()
        .collection("baskets")
        .doc(user.uid)
        .set({});

      return admin
        .firestore()
        .collection("users")
        .doc(user.uid)
        .set({
          firstName: data.firstName,
          lastName: data.lastName,
          college: data.college, 
          nationalNumber: nationalNumber,
          phoneVerified: false 
        });

    })
    .then(() => {
      const user = userObject;
      // Do whathever you want with user
      console.log(`id = ${user.uid}`);
      return admin.auth().createCustomToken(user.uid);
      // Don't forget to return data that can be JSON encoded, see the doc: https://firebase.google.com/docs/functions/callable#sending_back_the_result
      // In your case the JWT Object I guess
      // return ...
    })
    .catch((error) => {
      console.log("Error creating new user:", error);
    });
});

