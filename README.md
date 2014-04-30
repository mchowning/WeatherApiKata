# WeatherUnderground API Kata (Level 3)

This is a practice exercise for accessing a public API using TDD practices in iOS and objective-C.  The goal of this exercise is to use TDD practices to create a basic app that updates the screen with the current temperature for Detroit, Michigan (or your preferred location), as reported by Weather Underground's API.  It assumes usage of AFNetworking and the Kiwi testing framework.  

This exercise is designed to be used as a kata, i.e., as an exercise that is repeated multiple times.  The  kata is broken down into different 'levels'.  The levels start with level 1 and proceed up to level _____.  Each level has its own branch with a unique README.md instructions file dedicated to it:

LINK

LINK

LINK

LINK

Level 1 should be your first level because the instructions walk you through completion of the kata step by step and provides all the required code.  Its purpose is to familiarize you with the steps that are necessary to complete the exercise.  As with all the levels, you should not move on to the next level until you feel completely comfortable, almost to the point of being bored, with the current level.  In other words, don't be afraid to repeat the levels, the repitition is what makes this a kata.

Level 2 is a step up in difficulty. It still guides you through all of the steps necessary to complete the kata, it no longer provides you with the necessary code.  You have to fill that in yourself (that doesn't mean you aren't allowed to research online, it just means you shouldn't look back to the Level 1 instructions and copy the code from there).  Once you feel comfortable with Level 2, you can then proceed to Level 3.

Level 3 is only a small step short of completing the kata without any help.  It provides you with the general outline of the steps needed to complete the kata, but it doesn't give you much detail about the steps.

The last Level is to throw away these instructions because you don't need them anymore.  Trust me, you're going to get there sooner than you think!

## Some things to keep in mind

1. This kata only presents one way of accomplishing the goal of obtaining the current temperature from Weather Underground API and displaying it on the screen.  It is not the only way, and there are many other ways that this could be accomplished that are perfectly valid.  Be open to any other ways you might encounter because learning about them (and why they are or are not better) will make you a better programmer.

2. Similarly, this kata only presents one way you could use TDD to drive the creation of this program.  The decision about which (and how many) tests to create is a matter of judgment and there is no single right answer.  Just view the particular tests that are laid out below as one suggested set of tests that can be used.

3. I have made some of the methods and properties in the following code public for the sake of keeping this example simple.  It is definitely worth learning, however, how to keep as much of your code private as possible even when using tests.  It will help you write much cleaner code.

4.	I plan to keep updating and improving this kata as I get feedback (hint, hint), so if you do fork or clone it, make sure you check back in and periodically pull the latest changes.

5. 	Once you get to the higher levels where the kata instructions are less specific, don't worry if you do not follow the steps in the kata perfectly.  As long as you complete the kata using good TDD practices, you're fine.  In fact, I think that veering from the kata somewhat to do things your own way is a great way to gain a better understanding of the kata (and why the decisions I made regarding how to complete it were, or in some cases were not, the best decisions).  For at least level 1, however, it is probably a good idea to stick to the instructions in the kata.

## Setup

The setup for this project involves nothing more than an empty XCode iPhone application and a pod install with AFNetworking and Kiwi. An empty project that can be used as a starting point for this kata is included in the master branch.  All you need to do is have cocoa pods installed on your machine (if you don't, go [here] (http://cocoapods.org)), and run pod install to install the dependencies identified in the included Podfile.  Then make sure you open the project using the WatherApiKata.xcworkspace file so that the pods you just installed are used (do not use the .xcodeproj file to open your project anymore!).  

As you work through this exercise, you should refer to any documentation that you find helpful, including the following:

1. [Kiwi Wiki] (https://github.com/allending/Kiwi/wiki)

2. [AFNetworking documentation] (http://cocoadocs.org/docsets/AFNetworking/2.2.3/)

3. [Weather Underground API documenatation] (http://www.wunderground.com/weather/api/d/docs)

This is very much a work in progress.  If you find anything confusing or think there is a mistake, you're probably right!  Send me a pull request and let's make it better!

### Weather Underground User Key

You will need a free Weather Underground user key to complete this kata.  You can get one of these by going to the [Weather Underground API page] (http://www.wunderground.com/weather/api/) and clicking on the orange "Sign Up For Free!" button.  Create an account and log in.  Then click on the blue "Explore My Options" button, which will present you with the various plans you can get.  The free "Stratus Plan" is selected by default, so you can go ahead and click the blue "Purchase Key" button.  Complete the next screen with the requested information about how you intend to use the key and again click the blue "Purchase Key" button.  You will then be provided with a 16-digit API Key.  Great, you're ready to do the kata!

--------------------

# The Kata (finally)

# Level 3

Let's start with a brief overview.  Our program is going to have two classes along with a xib file.  The first class that we will create is the WAKWeatherService class.  It will be the job of this class to go and get the current temperature from the Weather Underground API and to make that result available to other classes.  The next class we will create is the WAKViewController.  This class is responsible for instantiating a WAKWeatherService, telling it to go get the current temperature, and then to display the result on the screen.  Alright, let's get started. 

## WAKWeatherService 

Remember to use TDD for each of these steps, even it's not specifically mentioned.  Also, don't forget to do any necessary refactoring each time you get all your tests to green.

1.	Create a getCurrentTemp method for the WAKWeatherService

2.	Give the WAKWeatherService class a property that contains the AFNetworking object that will make a network call to the Weather Underground API.

3.	Test and make sure that the WAKWeatherService's AFNetworking property is actually assigned to an instance of the relevant AFNetworking class. 
           
4.	Insure that the proper method call is made on the WAKWeatherService's AFNetworking property when getCurrentTemp is called
   
5.	Check that the proper URL is sent to the AFNetworking property.
       
6.	Check that the proper success block is sent to the AFNetworking property.
       			
7.  Make sure that the temperature that the WAKWeatherService provides to the success block that it receives in the getCurrentTemp: method is the temperature received from the network call
				
That's it for the WAKWeatherService object!
			
## WAKViewController	

1.	Give the WAKViewController a UILabel property with a public IBOutlet property

2.	Insure that the WAKViewController has a WAKWeatherService object that is assigned to a public property 

3.	Get the current temperature from the WAKWeatherService class to the screen when the view is loaded

4.	Make sure that the AppDelegate loads the WAKViewController

## All Done!

