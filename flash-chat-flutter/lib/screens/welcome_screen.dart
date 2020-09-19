import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // prepackaged animations;
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //Create animation controller to build custom animations
  AnimationController controller;
  // Normal Ticker will generate values in linear way for the duration specified
  // to have some curvy nature of generating values of ticker for the animation need to use 'CurvedAnimation'
  Animation animation; // to store curvedAnimation
  static int count = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 5,
      ),
      // vsync is a mandatory property, the state widget which we show animation
      // will be its value and its should qualify the behaviour of 'SingleTickerProviderStateMixin' if we
      // have a singe animation otherwise use 'TickerProviderStateMixin', instead of In-heritance we
      // use the advantage of dart 'mixin' here
      vsync: this,
      //upperBound: 100.0 // now animation happens from 0 to 100 value
      // if we apply curved animation to controller, upper bound cant be greater than 1.0
    );

    /* Code
    animation = CurvedAnimation(
        parent: controller, // parent has to be animationController
        curve: Curves.decelerate); // need to mention the type of curve
    */

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    // to start the animation
    // to proceed animation forward,animation controller will animate a number will proceed from 0-1, for
    // every tick of the ticker, the controller will increase the number in 1sec we might get 60 ticks on ticker
    // here our controller will animate from 0 - 1 in 60 steps.
    // forward will increase controller from 0 to upper bound value, animation grow from small to large size
    controller.forward();

    // controller.reverse() will decrease controller from upper bound value to lower bound value, animation shrink from large size to small
    // controller.reverse(from: 1.0);
/*
    // To make our animation to work in loops we need the below callback to know transitions
    animation.addStatusListener((status) {
      print('Animation status : $status');
      // this callback is called when the animation is completed, when we give controller.forward()
      // the animation start with the ticker, when the animation is completed its intimated to this
      // callback method as 'AnimatonStatus.completed' from the passed in parameter to this function.

      // This method will be helpful to implement animation loops, once we
      // come to know the animation is completed we can start it again.

      // If we operate our animation using controller.reverse(), in reverse way, we get the status
      // of animation as 'AnimationStatus.dismissed'
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
*/
    // to view the controller working, this method will be called back for every ticker tick
    controller.addListener(() {
      //print('${controller.value} and count : ${count++}');
      // setState defined  in callback listener will refresh the widget in all places where
      // the controller and its fields are used
      setState(() {});

      // print('${animation.value} and count : ${count++}');
    });
    Firebase.initializeApp();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // this overridden method will be called for welcome screen when the screen is
    // killed / closed. this is the right place to kill / release the resources of animation controller.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // using 'backgroundColor: Colors.red.withOpacity(controller.value)' we use controller
      // value to change opacity of a color which will appear as animation. controller value
      // will change from lower bound to upper bound

      //backgroundColor: Colors.white,
      backgroundColor: animation.value, // to check tween animation
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // first screen hero widget
                Hero(
                  // this tag will be helpful to find the next screen ending animation location
                  tag: 'logo',
                  child: Container(
                    // this image we animate to next screen using hero widget
                    child: Image.asset('images/logo.png'),
                    //making 60.0 to controller.value will make logo grow from 0.0 height to 100.0 as our upper bound is 100.0
                    /// height: animation.value * 100,
                    //making 60.0 to animation.value will make logo grow from 0.0 height to 1.0 as per custom CurvedAnimation
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                /*           Text(
                  // way of showing text in animation about percentage increasing from 0% to 100%
                  // value of upper-bound of controller changed into 100, animation time is 1sec, based of
                  // widget show-cast speed the no of ticks from ticker can vary for animation secs of 1 sec.
                  // if the animation second is eg:4secs, we will get more ticks
                  // 'Flash Chat' is changed to '${controller.value.toInt()}%',
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),*/
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonTitle: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              buttonTitle: 'Register',
              buttonColor: Colors.blueAccent,
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
Hero Animations(The hero refers to the widget that flies between screens):
If user navigates from page1 to page2, if there's a shared element(button / widget)
from page1 to page2. That element is animated to travel from page1 to page2 in animated way

Needed elements to have Hero Animations:
a. 2 Hero widgets (one on first screen and second on next screen)
b. a 'shared tag property' used in between the 2 hero widgets.
c. navigator based screen transitions

This is called as 'shared element transition' in android.

Needed elements in MAKING CUSTOM ANIMATIONS:
1.  A ticker. (the timing of which our animation should animate- everytime ticker ticks, it triggers
                    a new setState so that we can render UI)
2. Animation Controller. (Manager of the animation, instructs the animation to start, stop, loopback
                                            duration of animation)
3. An Animation value. (usually will go from 0 to 1, usually with this value we should be able to change
                                    things like height/size of component / color/ opacity of component
                                    this value will be used in animating any UI component


TweenAnimation:
Its basically a set of predefined tween animations that essentially go in between values
eg: if we have a starting color and ending color, tween animation will go in-between in a
smooth transition.

build the tween with 'begin' and 'end' value, call its method 'animate()' to get the
animation object, used the animation.value to perform the animation.

Prepackaged Animations:
We can go to pub.dartlang.org/flutter/packages and search for 'animate'
to use prepackaged animations. we can mention those in pub.yaml, and use it
instantaneously.

Firebase:

1. Its a cloud service provided by google, go to the firebase site and login using a gmail
2. Create a app for android type / ios type, follow the steps to add the app details in that setup.
3. The firebase app setup process will provide steps to make changes in main build.gradle file and
in app/build.gradle file (should include the flutter app required services - auth and firestore packages)
4. include flutter relevant packages in flutter app 'pubspec.yaml' file
  firebase_core: ^0.5.0
  firebase_auth: ^0.18.0+1
  cloud_firestore: ^0.14.0+2
 5. use firebase in flutter code by importing relevent packages.
 6. In FireBase site -> develop -> authentication -> enable relevent(email/facebook.twitter) authentication
  for our android application which we configured.
  6. For Database usage in Firebase site we need to configure.
  Fitebase Site -> develop -> cloud firestore -> start in test mode -> add collection -> give a name for collection
  to store all the messages of our app -> add a database fields to save our data.
  7. make modifications in code to store in database.
                      1.  database 'collection name' and database fields name mentioned in fire-store is important
                          to push the data to FireStore.
                      2. collection name for this app is 'messages'
                      3. data base field name for this app is 'text' and 'sender'

* */
