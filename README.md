# WeatherUnderground API Kata Instructions

This is a practice exercise for accessing a public API using TDD practices in iOS and objective-C.  The goal of this exercise is to use TDD practices to create a basic app that updates the screen with the current temperature for Detroit, Michigan (or your preferred location), as reported by Weather Underground's API.  It assumes usage of AFNetworking and the Kiwi testing framework.  

This exercise is designed to be used as a kata, i.e., as an exercise that is repeated multiple times.  The  kata is broken down into different 'levels'.  The levels start with level 1 and proceed up to level _____.  Each level has its own branch with a unique README.md instructions file dedicated to it.

Level 1 should be your first level because the instructions walk you through completion of the kata step by step and provides all the required code.  Its purpose is to familiarize you with the steps that are necessary to complete the exercise.  As with all the levels, you should not move on to the next level until you feel completely comfortable, almost to the point of being bored, with the current level.  In other words, don't be afraid to repeat the levels, the repitition is what makes this a kata.

Level 2 is a definite step up in difficulty. It still guides you through all of the steps necessary to complete the kata, but it no longer provides you with any code.  You have to fill that in yourself.  That doesn't mean you aren't allowed to research online, it just means you should only look back to the code in the Level 1 instructions as a last resort.

Level 3 is only a small step short of completing the kata without any help.  It outlines the general steps needed to complete the kata, but it doesn't give you much detail beyond that.  If you're feeling expecially confident, you may want to consider skipping Level 3.

In Level 4 you throw away these instructions because you don't need them anymore.  Trust me, you're going to get there sooner than you think!

This is very much a work in progress.  If you find anything confusing or think there is a mistake, then there's probably something that needs to be improved.  Let me know about it or, even beter, send me a pull request!

## A few things to keep in mind

1. This kata only presents one way of accomplishing the goal of obtaining the current temperature from Weather Underground API and displaying it on the screen.  It is not the only way, and there are many other ways that this could be accomplished that are perfectly valid.  In fact, for the sake of not making this exercise more complicated than it needed to be, I haev intentionally made some design decisions that are not best practices.  So as you progress as a programmer, you very well may want to do things differently than I have instructed in this kata.  Defeinitely be open to any other ways you might complete this kata because learning about them (and why they are or are not better than what we do here) will make you a better programmer.

	Likewise, this kata only presents one way you could use TDD to drive the creation of this program.  The decision about which (and how many) tests to create is a matter of judgment and there is no single right answer.  Just view the particular tests that are laid out below as one suggested set of tests that can be used.
	
	As such, once you get to the higher levels where the kata instructions are less specific, don't worry if you do not follow the steps in the kata perfectly.  As long as you complete the kata using good TDD practices, you're fine.  In fact, veering from the kata's instructions somewhat is a great way to gain a better understanding of the kata and TDD.  For at least level 1, however, it is probably a good idea to stick to the instructions.

2. I have made some of the methods and properties in the following code public for the sake of keeping this example simple.  However, it is definitely worth learning how to keep as much of your code private as possible even when using tests (look into creating categories for tests if you're feeling ambitious).  It will help you write cleaner code.

3.	I plan to keep updating and improving this kata as I get feedback (hint, hint), so if you do fork or clone this repo, make sure you periodically check back in and pull the latest changes.

## Setup

The setup for this project involves nothing more than an empty XCode iPhone application and a pod install with AFNetworking and Kiwi. An empty project that can be used as a starting point for this kata is included in the master branch.  All you need to do is have cocoa pods installed on your machine (if you don't, go [here] (http://cocoapods.org)), and run pod install to install the dependencies identified in the included Podfile.  Then make sure you open the project using the WatherApiKata.xcworkspace file so that the pods you just installed are used (don't use the .xcodeproj file to open your project anymore!).  

As you work through this exercise, you should refer to any documentation that you find helpful, especially:

1. [Kiwi Wiki] (https://github.com/allending/Kiwi/wiki)

2. [AFNetworking documentation] (http://cocoadocs.org/docsets/AFNetworking/2.2.3/)

3. [Weather Underground API documenatation] (http://www.wunderground.com/weather/api/d/docs)

### Weather Underground User Key

You will need a free Weather Underground user key to complete this kata.  You can get one of these by going to the [Weather Underground API page] (http://www.wunderground.com/weather/api/) and clicking on the orange "Sign Up For Free!" button.  Create an account and log in.  Then click on the blue "Explore My Options" button, which will present you with the various plans you can get.  The free "Stratus Plan" is selected by default, so you can go ahead and click the blue "Purchase Key" button.  Complete the next screen with the requested information about how you intend to use the key and again click the blue "Purchase Key" button.  You will then be provided with a 16-digit API Key.  Great, you're ready to do the kata!

# Onward to the kata . . .

[Level 1] (https://github.com/mchowning/WeatherApiKata/tree/level-1)

[Level 2] (https://github.com/mchowning/WeatherApiKata/tree/level-2)

[Level 3] (https://github.com/mchowning/WeatherApiKata/tree/level-3)

[Level 4] (https://github.com/mchowning/WeatherApiKata/tree/level-4)

