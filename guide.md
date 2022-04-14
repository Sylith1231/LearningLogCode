## Learning Flutter

Flutter is an open-source SDK for creating <ins></ins**cross-platform>**cross-platform apps from a single codebase**</ins>. It was released by Google in 2017 and has already become the world's most popular framework for cross-platform mobile development (https://www.statista.com/statistics/869224/worldwide-software-developer-working-hours/). If you're interested in developing for mobile but are torn between frameworks, then these key strengths of Flutter may make it the more compelling option for you:
* Flutter's rapid adoption means there's already a huge open-source community which will only keep growing. **Don't be late to the party**.
* A single codebase means it's much quicker to develop a minimum viable product, compared to native development. **Great for inidivual/small/low-budget pojects**.
* Seamless interoperability with Firebase (also developed by Google), means it's extremely easy to connect your frontend with your backend. **World-class frontend/backend harmony**.
* Dart source code is compiled to native code and can access platform-specific features. **Performs at close-to native level**.

## Who is this aimed at?

This guide is aimed at anyone **taking the Programming Black module** who is **interested in cross-platform mobile app devleopment**, primarily as an individual or small group. I think of Flutter as being the perfect tool for quickly bringing an app idea to life, but that isn't by any means to say it isn't also prominent in the professional world.

Since readers should have taken the Programming Black module, I will assume that they are familiar with HTML/CSS, VSCode, HTTP requests and JavaScript. I will also assume VSCode is already installed on their machine.


## Where  from here?

Naturally 1500 words isn't enough to discuss all there is to Flutter, or even the part of it that I've learned over the last 4/5 months. However, what I hope to do is outline what I consider to be the most important aspects of Flutter,  and provide you with links to the material that I believe teaches, explains or demonstrates it best.

With that being said, these are the aspects of Flutter that I consider crucial in creating a functional app, and the order in which I would learn them if I were to start from scratch:

1. Installation and IDE setup.
1. Widgets and running my first app.
1. Incorporating state.
	- Simple state.
	- Provider package.
1. Navigating between screens.
1. Firebase
	- Auth.
	- FireStore.
	- Cloud Functions
1. File Structure



## Installation
The first thing to do is install the SDK and setup your IDE. Following steps 1 to 3 of the official installation flow (linked below) should get you ready to go and ensure everything is setup correctly:

https://docs.flutter.dev/get-started/install




## Widgets

The core tenet of Flutter is that <ins>**Everything is a widget**</ins>. You can think of widgets as atomic units of an app; the app is a Lego model and widgets are inidivudal Lego bricks. Everything, from the content of the screen, to its positioning and style, to the way you interact with it, is controlled by widgets. You deeply nest these widgets to create a 'Widget tree'. The first half of the article below and the first video give a good, brief introduction. The 3rd link provides excellent explanation and goes a bit deeper, showing you widgets in action and helping you to visualise the widget tree.

https://flutterbyexample.com/lesson/thinking-in-widgets
https://www.youtube.com/watch?v=1xipg02Wu8s&t=327s
https://www.youtube.com/watch?v=xWV71C2kp38 

I've created a single page app with some simple widgets:

https://github.com/Sylith1231/LearningLogCode/blob/main/lib/main.dart

Copy the code into your lib/main.dart file and run flutter. A screen with a Container, Text, Image and ElevatedButton widget will appear. Read through the code and comments and try to see what's happening. I would advise changing and exploring some of the properties. For example, the colour and dimensions of the container, the style of the text or the src of the image. 

**Hovering over a widget in VSCode will show you its constructor**. You can see the properties it has and their types. Now try adding new widgets to the tree. Here is a guide to some of the basic widgets you might want to experiment with:

**For guides on how to use specific widgets, I highly recommend the YouTube channel 'johannes milke'**.

https://docs.flutter.dev/development/ui/widgets/basics

It's important to become familiar with the documentation of widgets. With *everything* being a widget in Flutter, you'll never learn all of them. Get used to quickly scanning the documentation, rather than trying to commit everything to memory.



## State

Apps are entirely dependent on their current state - i.e the current values of things with the potential to change. For example:

- Is the user logged in or not? 
	- Determines wether to show home page or login page.
- Is the app loading some content?
	- Determines wether to show a loading indicator.
- What the user entered into a form field?
	- Determines wether to show an error message if the input is wrong.

To manage state in flutter we must first be operating within a stateful widget. The difference between stateful and stateless widgets was initially confusing to me. I reccommend using only stateful widgets when you start out learning. This avoids potential errors and you can easily refactor your code at a later date.

State is actually quite simple but there are lots of 'gotchas'. In fact it appears in the starter app that you'll have seen when you created your first project. Creating state can be as simple as creating a variable at the top level of your class extending state (automatically created for you using VSCode):

```dart
class  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<> {
  bool aStateVariable = true;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
```

This video by Johannes Milke explains the lifecycle of state variables:
https://www.youtube.com/watch?v=FL_U8ORv-2Q

This guide walks you through implementing state using SetState():
https://docs.flutter.dev/development/ui/interactive

You should also know how to use the ternary operator. The syntax in JS and Dart are the same so I've provided a link to the mozilla documentation:
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_Operator

**Beware:** While exploring state management, you may read about the Provider package. This is great for complex state management between screens but I find it to also be a very complicated package. It's easy to copy/paste boilerplate code to achieve what you want but this isn't particularly useful without also understanding it. Make sure you're super comfortable with simple state before learning about Provider - despite being in the flutter beginner tutorials, it isn't beginner-friendly.

I've created a quick exercise to practice simple state management. Copy the code from the following link into your lib/main.dart file:

https://github.com/Sylith1231/LearningLogCode/blob/main/lib/stateTest.dart

The aim is to try and edit the code where prompted to achieve the effects described in the comments. My solution can be found at the following link and looks like this:

https://github.com/Sylith1231/LearningLogCode/blob/main/lib/stateAnswer.dart

https://user-images.githubusercontent.com/83509890/163424581-aad021a7-149c-474f-a677-ba58aeed6ad2.MP4

## Navigation between screens

Navigation is one of the most fundamental aspects of an app and, as such, should be simple to implement. If learned correctly it is, however I got myself very confused when first learning to navigate between pages.

The most critical piece of advice I can give is to **use the Navigator API**. Flutter has a newer navigation API called Router which is considerably more complicated and less documented. It's generally agreed that (at time of writing) the Router API documentation is not great. The introduction of the Router API also didn't bring about any breaking changes for the Navigator API. Navigator provides lots of functionality with lots of official and 3rd party tutorials on how to use it.

I recommend Flutter's navigation cookbook:
https://docs.flutter.dev/cookbook/navigation/navigation-basics

Johannes Milke's tutorial (chapters 1, 2 and 3):
https://www.youtube.com/watch?v=yuGaEsLRB38

And, afterwards, the Navigator API documentation:
https://api.flutter.dev/flutter/widgets/Navigator-class.html

## Firebase

Unfortunately I don't have nearly enough words to discuss FireBase in as much depth as I'd like. Thankfully, it interoperates with Flutter beautifully and the documentation for FlutterFire (a set of plugins for connecting Flutter to Firebase) is fantastic.

**Getting Started With FB on Flutter** https://www.youtube.com/watch?v=EXp0gq9kGxI&t=7s
**FlutterFire Documentation**: https://firebase.flutter.dev/docs/overview/

From here, the FlutterFire documentation has great instructions on incorporating different FireBase packages into your application, each with different purposes:

- **Authentication:** Creating user accounts and managing sign in.
- **Firestore:** Creating and linking a database for your app.
- **Cloud Messaging:**  Incorporating push notifications.
- **Cloud Functions:**  For using NodeJS in your project.

## Is it worth it?

For someone who wants to develop mobile applications, I believe Flutter is well worth learning. Although the learning curve is steep, the reward far outweighs the effort. Really, as an individual wanting to develop for Android and iOS, you're cornered into using a cross-platform framework unless you're proficient in multiple languages for mobile development. Within this category of cross-platform mobile framework, Flutter has only one worthy competitor - React Native.

In years gone by, it would have been a much harder decision to choose between Flutter and React-Native but today I think Flutter really should be the go-to pick for anyone trying to pick one.

The figures below (Statista survey followed by Stack Overflow developer surveys) both show Flutter's huge growth in recent years. Having used it for 5 months now, I'm extremely impressed at the speed I've been able to pick it up, it's development tools, and community support. I would highly recommend learning it if you have the time and interest.

<img width="726" alt="Screenshot 2022-04-14 at 17 57 12" src="https://user-images.githubusercontent.com/83509890/163437466-a4b6ffbb-20f3-4d98-a887-171f7f5fa2a3.png">

2019             |  2020          | 2021
:-------------------------:|:-------------------------:|:-------------------------:
<img width="300" alt="Screenshot 2022-04-04 at 17 57 36" src="https://user-images.githubusercontent.com/83509890/163437692-39507291-d07e-4827-802b-75069eaee429.png">  |  <img width="300" alt="Screenshot 2022-04-04 at 17 53 13" src="https://user-images.githubusercontent.com/83509890/163437907-82b207d0-2761-4886-bede-7891ae579100.png"> | <img width="300" alt="Screenshot 2022-04-04 at 17 53 21" src="https://user-images.githubusercontent.com/83509890/163437948-2d968d59-8e46-4e22-b1f6-e480943ea780.png">






