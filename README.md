# WeatherUnderground API Kata

General instructions are included in the master branch.

[Master] (https://github.com/mchowning/WeatherApiKata/tree/master)

Level 1

[Level 2] (https://github.com/mchowning/WeatherApiKata/tree/level-2)

[Level 3] (https://github.com/mchowning/WeatherApiKata/tree/level-3)

[Level 4] (https://github.com/mchowning/WeatherApiKata/tree/level-4)

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

