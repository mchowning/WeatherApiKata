# WeatherUnderground API Kata

# LEVEL 1

This is a practice exercise for accessing a public API using TDD practices in iOS and objective-C.  It assumes usage of AFNetworking and the Kiwi testing framework.

The goal of this exercise is to use TDD practices to create a basic app that updates the screen with the current temperature for Detroit, Michigan (or your preferred location), as reported by Weather Underground's API.  This exercise is designed to be used as a kata, i.e., as an exercise that is repeated multiple times.  The  kata is broken down into different 'levels'.  The levels start with level 1 and proceed up to level _____.  Each level has its own branch with a unique README.md instructions file dedicated to it:

LINK

LINK

LINK

LINK

Level 1 is the easiest because the instructions walk you through completion of the kata step by step and provides all the required code.  It's purpose is to familiarize you with the steps that are necessary to complete the exercise.  As with all the levels, you should not move on to the next level until you feel completely comfortable, almost to the point of being bored, with the current level.  In other words, you should not be afraid to repeat the levels.

Level 2 is a step up in difficulty because although it still guides you through all of the steps necessary to complete the kata, it no longer provides you with the necessary code.  You have to fill that in yourself (that doesn't mean you aren't allowed to research online, it just means you shouldn't look back to the Level 1 instructions and copy the code from there).  Once you feel comfortable with Level 2, you can then proceed to Level 3, which ....................  

Level 3 ............................

The last Level is to throw away these instructions because you don't need them anymore.  Trust me, you're going to get there sooner than you think!

## Some things to keep in mind

1. This kata only presents one way of accomplishing the goal of obtaining the current temperature from Weather Underground API and displaying it on the screen.  It is not the only way, and there are many other ways that this could be accomplished that are perfectly valid.  Be open to any other ways you might encounter because learning about them (and why they are or are not better) will make you a better programmer.

2. Similarly, this kata only presents one way you could use TDD to drive the creation of this program.  The decision about which (and how many) tests to create is a matter of judgment and there is no single right answer.  Just view the particular tests that are laid out below as one suggested set of tests that can be used.

3. I have made some of the methods and properties in the following code public for the sake of keeping this example simple.  It is definitely worth learning, however, how to keep as much of your code private as possible even when using tests.  It will help you write much cleaner code.


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

# Level 1

Let's start with a brief overview.  Our program is going to have two classes along with a xib file.  The first class that we will create is the WAKWeatherService class.  It will be the job of this class to go and get the current temperature from the Weather Underground API and to make that result available to other classes.  The next class we will create is the WAKViewController.  This class is responsible for instantiating a WAKWeatherService, telling it to go get the current temperature, and then to display the result on the screen.  Alright, let's get started. 

## WAKWeatherService

+ Create a Weather Service class that obtains the current temperature from the Weather Underground API

	- Create a WAKWeatherService class that has a method called getCurrentTemp

		* Create a test class named WAKWeatherServiceSpec:

		    We're working on test-development so we need to start with a test class.  This class should go in the "api-kataTests" folder and only have the api-kataTests target selected.  

		* Make a WAKWeatherService class that has a getCurrentTemp method
		1. Setup an empty Kiwi spec for testing WAKWeatherService:
		
		    	  This is the basic setup that must be contained within any Kiwi file:
		    	  
			    ```  
			    #import <Kiwi/Kiwi.h>

			    SPEC_BEGIN(WAKWeatherServiceSpec)
			    
			    describe(@"WAKWeatherService", ^{
			    
			    )};
			    
			    SPEC_END
			    ```
			    			   		    
		    	You should have no errors.  Note that the describe block is generally describing what object or class is going to be tested.
		    
			2. Import WAKWeatherService into the test

		    	  We want our program to have a WAKWeatherService class, so let's use wishful thinking and put it into our test.  First, add the appropriate import statement:
		    	  
			    ```
			    #import "WAKWeatherService.h"
			    ```
			    
			    That should throw up a nice big red error because there we haven't actually made a WAKWeatherService class yet.  We're going to count that as a failed test, which means that we get to write actual non-test code in order to get our test to "pass" (which in this case, just means not throwing up an error).
			    
				* Create a WAKWeatherService class in your project.

			    	   This class should only extend NSObject and have WeatherApiKata as its target.  The error in your test class should disappear (you may have to rebuild your project).
			    
  			3. Test whether the WAKWeatherService has a getCurrentTemp method

  			    Time to actually write a real test.  In order to see if the WAKWeatherService has a getCurrentTemp method, we're going to test whether a WAKWeatherService object will respond to a method with the name getCurrentTemp.  A method's name is called its "selector", so we'll actually test whether WAKWeatherService responds to a getCurrentTemp selector.  The first step is to actually create a specific instance of a WAKWeatherService in our test.  Then we will have Kiwi test wether that specific object responds to a selector with the name getCurrentTemp.  Like all Kiwi tests, this will all be done within an "it" block within the describe block that we already wrote.


			    ```
			    it(@"has a getCurrentTemp method", ^{
			        WAKWeatherService *weatherService = [[WAKWeatherService alloc] init];
			        [[weatherService should] respondToSelector:@selector(getCurrentTemp)];
			    });			    
			    ```  			   
		    
			    Note that the string in the it block ("has a getCurrentTemp method") is written so that if there is an error, the test result printout, which will append this string to the string in the describe block ("WAKWeatherService"), provides a description of the desired behavior that is easy to read: "WAKWeatherService has a getCurrentTemp method".
			    
			    Run this test and you should get a test failure because the WAKWeatherService does not have any method named getCurrentTemp.  In fact, recent versions of Xcode will actually give you a warning about this by stating that "@selector"(getCurrentTemp)" is an undeclared selector.
			    
				* Create a getCurrentTemp method

				    First, go to your WAKWeatherService.h file and add the method to the public interface (because we want other classes, including our test, to be able to see it).  Since we do not have any tests addressing what, if any, kind of return value this method will have, we will leave it void until we have a test that requires something else.
				    
					_WAKWeatherService.h:_
				    
				    ```
				    - (void)getCurrentTemp; 
				    ```
				    
				    If you rerun your tests now, you will see that it still fails.  This is because the WAKWeatherService will not "respond" to the getCurrentTemp selector for the purposes of our test until it has some kind of implementation (even an empy implementation) in the .m file, so let's do that.
				    
				    _WAKWeatherService.m_
				   
				    ```
				    - (void) getCurrentTemp {
				    
				    }
				    ```

	- Give the WAKWeatherService class a property that contains the AFNetowrking object that will make a network call to the Weather Underground API.

		* Determine how AFNetworking makes network calls

		    Our WAKWeatherService needs to communicate with the Weather Underground API, and the way it is going to do that is through AFNetworking framework.  In particular, it is going to make a "GET" request.  
	    
		    Unless you are already familiar with AFNetworking, we're going to need to check the [AFNetworking documentation] (http://cocoadocs.org/docsets/AFNetworking/2.2.3/) to see how this is done.  Conveniently enough, about a third of the way down the linked page is a "Usage" section, and the first thing it discusses is how to perform a "GET Request".  Just what we were looking for, and it even gives an example.
		    
		    You should go look at the example yourself, but in essence it says that there is an "AFHTTPRequestOperationManager" object that has a GET:parameters:success:failure: method which will perform a get request.  At this point, the only important part of this is that it is an AFHTTPRequestOperationManager that performs the request.  
		    
		* Give the WAKWeatherService an AFHTTPRequestOperationManager

		    The AFHTTPRequestOperationManager is going to be a "collaborator" with our WAKWeatherService class (i.e., our AFHTTPReuqestOperationManager is going to use this object to accomplish what it wants to do).  In order for our WAKWeatherService class to use that collaborator, and for our tests to test it, we are going to give our WAKWeatherService class a property (named "manager") that contains an AFHTTPRequestOperationManager object.  Let's add a test for that object in a new it block:
		    
		    ```
		    it(@"has an AFHTTPRequestOperationManager object stored as a property", ^{
		        WAKWeatherService *weatherService = [[WAKWeatherService alloc] init];
		        [[weatherService.manager should] beKindOfClass:[AFHTTPRequestOperationManager class]];
		    });
		    ```
		    
		    You should get an error before you even run this test because we are trying to access a manager property on our WAKWeatherService object, but no such property exists yet.  Let's treat that as a test failure and fix it.
		    
			* Create a AFHTTPRequestOperationManager property in our WAKWeatherService class

			    To do this, we're just going to create the relevant property in the WAKWeatherService.h file.  Note that the reason we're declaring this property in the .h file instead of the .m file is so that our test can see it.  Usually it is not a good idea to expose a property (or method) just so that your test can see it (and there are ways we could avoid doing it here--if you're feeling ambitious, look into categories), but for the sake of keeping the codr straighforward in this kata, we're just going to make this property public by putting it in the .h file:
			    
			    _WAKWeatherService.h:_
			    
			    ```
			    #import <AFNetworking.h>
			    ```
			    . . .
			     
			    ```
			    @property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
			    ```
			    
			    The error in your test should now be gone.
			   
			* Create an AFHTTPRequestOperationManager and assign it to the WAKWeatherService class's manager property.

			    Although our test is no longer throwing a compilation error, if you run it, it fails because it expected the manager property on our WAKWeatherService object to not be nil.  The problem is that we never create an actual AFHTTPRequstOperationManager and assign it to the manager property, so when the test looks to see if the object that is assigned to the manager property is of the AFHTTPRequestOperationManager class it fails because the manager is not an AFHTTPRequestOperationManager, it's nil.  A simple way to do this is to override the init method for our WAKWeatherService class and have it assign an AFHTTPRequestOperationManager object to the manager property.  
			    
			    _Note that most of the code in the snippet below is boilerplate that Xcode will autocomplete for you if you start typing init at the beginning of a line_
			    
			    _WAKWeatherService.m:_
			    
                ```
			    - (instancetype)init {
			        self = [super init];
			        if (self) {
			            self.manager = [[AFHTTPRequestOperationManager alloc] init];
			        }
			        return self;
			    }
			    ```
                Your test should now pass because when you initialize the WAKWeatherService in the first line of your test, you are running the init method, which creates an AFHTTPRequestOperationManager and assigns it to the WAKWeatherService's manager property.
                
            * Anytime all of your tests are green, you should look to see if there is anything you can refactor.  One of the largest red flags for possible refactoring is when you have duplicated code.  If you look at our tests, you can see that we have declare the WAKWeatehrService object in both of our tests.  Furthermore, because this is the object we are testing, it is likely that we will need this object in any future tests as well.  Therefore, we should refactor the creation of that object into a beforeEach block.  To do this we first need to declare a WAKWeatherService variable that is accessible in all of the relevant blocks.  Then we need to fill that variable with a new WAKWeatherService object bofore each test by using a beforeEach block.  This lets us remove the declaration of the WAKWeatherService object from each of our tests.
            
            _WAKWeatherServiceSpec.m_
            
            ```
            describe(@"WAKWeatherService", ^{
                
                __block WAKWeatherService *weatherService;
                beforeEach(^{
                    weatherService = [[WAKWeatherService alloc] init];
                });
                
                it(@"has a getCurrentTemp method", ^{
                    [[sut should] respondToSelector:@selector(getCurrentTemp)];
                });
                
                it(@"has an AFHTTPRequestOperationManager object stored as a property", ^{
                    [[sut.manager should] beKindOfClass:[AFHTTPRequestOperationManager class]];
                });
            });
            ```
            
            Go ahead and rerun your tests in order to make sure they both still pass.
            
    + Insure that the proper method call is made on the WAKWeatherService's manager property when getCurrentTemp is called.
    
        * Check that the proper method is called on the manager.
        
            Earlier when we researched AFNetworking and saw how it performed the get request we wanted we saw that it involved calling a specific selector (GET:parameters:success:failure:) on a AFHTTPRequestOperationManager.  We now want to make sure that method is WAKWeatherService calls that method on its manager property (which is an AFHTTPRequestOperationManager.  In particular, we want the WAKWeatherService to do this anytime its getCurrentTemp method is called so that it can actually get the current temperature from teh Weather Underground API.  Because this test and many of our future tests are all going to be testing teh behavior of the WAKWeatherService when its getCurrentTemp method is called, we're going to put these tests into a "context" block in order to keep our tests organized.  Let's go ahead and add that to the end of our test now.
            
            _WAKWeatherServiceSpec.m:_
            
            ```
            describe(@"WAKWeatherService", ^{
                
                __block WAKWeatherService *weatherService;
                beforeEach(^{
                    weatherService = [[WAKWeatherService alloc] init];
                });
                
                it(@"has a getCurrentTemp method", ^{
                    [[sut should] respondToSelector:@selector(getCurrentTemp)];
                });
                
                it(@"has an AFHTTPRequestOperationManager object stored as a property", ^{
                    [[sut.manager should] beKindOfClass:[AFHTTPRequestOperationManager class]];
                });
                
                context(@"when its getCurrentTemp method is called", ^{
                
                });
            });
            ```
            
            Now we want to actually add the test that says we expect the GET:parameters:success:failure: method to be called on the WAKWeatherService's manager property anytime the WAKWeatherService's getCurrentTemp method is called.  We do this by first replacing the WAKWeatherService's manager property with a mock object (because we do not actually want to make a network call in our test).  Then we tell the mock AFHTTPRequestOperationManager that we created to only let this test pass if the GET:parameters:success:failure: method is called on it.  Lastly, we call the WAKWeatherService's getCurrentTemp method, which is what we want to cause the call to GET:parameters:success:failure:.  Note that we do not have to recreate the WAKWeatherService object itself because it is already created by the beforeEach block we created earlier.
            
            _WAKWeatherServiceSpec.m:_
            ```
            context(@"when its getCurrentTemp method is called", ^{
            
                it(@"calls GET:parameters:success:failure: on its manager property", ^{
                    weatherService.manager = [AFHTTPRequestOperationManager nullMock];
                    [[weatherService.manager should] receive:@selector(GET:parameters:success:failure:)];
                    [weatherService getCurrentTemp];
                });
                
            });
            ```
            
            Run the test, and it should compile, but fail.
            
            It is simple enough to make this test pass.  We just need to make the WAKWeatherService's getCurrentTemp call the GET:parameters:success:failure: method on its manager property.  Our test isn't concerned about what arguments are passed into the method, so we will just pass nil for now.
            
            _WAKWeatherService.m:_
            
            ```
            - (void)getCurrentTemp {
                [self.manager GET:nil 
                       parameters:nil 
                          success:nil 
                          failure:nil];
            }
            ```
            
            Your test should now pass.  Obviously, not much is going to happen as long as we're just sending a bunch of nil arguments in this method call, so our next task is to make sure that the proper arguments are sent.
    
        * Check that the proper URL is sent to the manager.
        
            *   Do a little spiking to determine the url we need to pass.
            
                Before we can write a test that makes sure the proper url is being passed, we have to actually know what the proper url is.  We're going to figure this out by doing a bit of spiking.  Spiking is really just a fancy way of saying that we're going to play with the API a little bit to figure out what works before we start working on our test.
                
                To start figuring out what kind of url the Weather Underground API requires, we should head back to the [Weather Underground API documentation]() and see what it has to say.  Conveniently enough, the very first page gives an example of the kind of request that will obtain the current conditions for San Francisco, CA:
                
                _http://api.wunderground.com/api/__[your 16-character API key]__/conditions/q/CA/San_Francisco.json_
                
                Note that there is even a button that shows you the response that is returned with this query.  The response is in a json format, which is roughly like an array/dictionary combination.  The top level of the response will be either an array or a dictionary.  In this case we can tell that it is a dictionary for two reasons: (1) it uses the {} that dictionaries use instead of the [] that arrays use; and (2) it has key value pairs (which arrays do not have).
                
                _Note: It can be hard to read plain json, but there are a number of json reading extensions that you can download for free that will make the json much easier to read.  I have had good luck with [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc) for Google chrome.  It's helpful to use one of these and then collapse all of the entries so that you can slowly open them and see how the json is organized._  
                
                In this case, once you close everything in the json using a json reader, you can see that the json response has two base keys: a "response" and a "current_location" (you can see this even without a json reader, it's just less obvious).  Opening the response dictionary shows that it contains another dictionary with just a few keys that do not relate to weather.  In other words, it's not what we're looking for.  So let's close the "response" portion and open the "current_observation" portion.  That looks much more promising.  It contains some more dictionaries (i.e., the "image" and "display_location" keys), and then it contains a bunch of keys that relate directly to weather information.  In particular, it contains a key named "temp_f" that appears to provide the current temperature in degrees fehrenheit.  That's what we want.
                
                Now we just need to use this example url as a jumping off point for our goal of getting the current temperature for Detroit.  The first thing to note is that the 16-character string after the /api/ portion of the url is the 16-digit API key we got when we signed up earlier.  Likewise, it looks like we could probably substitute MI/Detroit.json for CA/San_Francisco.json.  This seems like a pretty good guess, so let's just construct a url like that and put it into our browser to see what happens.  In particular, let's just replace the CA/San_Francisco.json with MI/Detroit.json and see if it works (make sure you include your 16-character API key at the appropriate place).
                
                _http://api.wunderground.com/api/__[your 16-character API key]__/conditions/q/**MI/Detroit.json**_
                
                Looks like it works to me.  Although trial and error has worked for us here, you can't always rely on that.  Sometimes you will have to search for specific documentation regarding how to use the API.  In fact, Weather Underground provides [detailed documentation](http://www.wunderground.com/weather/api/d/docs?d=data/index) regarding how to construct more complicated url requests if you're curious.
                
                Now that we know what url we want to use for our GET request, let's write a test to make sure that our program uses that url
            
            * Test that the proper url is used
            
            	This test is going to want to look and see what when the GET:parameters:success:failure method is called on the WAKWeatherService's manager property, the url that is passed as the argument to the GET: portion of the method call is the url we figured out in the previous section.  Like we did in the last test, we want to substitute a mock object for the WAKWeatherService's manager property so that an actual network call is not made.  Then, the way we will can get ahold of the objects passed into the GET:parameters:success:failure: method call is through the use of a KWCaptureSpy object (remember, the test we just wrote made sure that this method call was made, now we're just concerned with checking that the correct argument is passed in).  A KWCaptureSpy is just an object that you can tell to capture specific arguments when a method is called on some other object.  In this case, we're going to tell it to watch the WAKWeatherService's maanger property and that when the GET:parameters:success:failure: is called on that manager property, to store whatever is passed as the first argument (i.e, the argument at index 0 or the argument passed to the GET: portion of the method call).  Then, in order to give the spy something to capture, we will call the getCurrentTemp method on the WAKWeatherService because this will cause the GET:parameters:success:failure: method to be called on its manager property.  We can then get the captured argument back from the spy and test whether it is what we want it to be.  Note that this new test goes in the same context as the previous test because this test is also testing the WAKWeatherService's behavior when its getCurrentTemp method is called.
            	
            	_WAKWeatherServiceSpec.m:_
            	
            	```
          		it(@"passes the proper url to the network request", ^{
          			weatherService.manager = [AFHTTPRequestOperationManager nullMock];
          			KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:0];
          			[weatherService getCurrentTemp];
          			NSString *urlPassedAsArgument = spy.argument;
          			NSString *expectedUrl = @"http://api.wunderground.com/api/____YOUR API KEY_____/conditions/q/MI/Detroit.json";
          			[[urlPassedAsArgument should] equal:expectedUrl];
          		});
            	```
            	
            	_*Make sure that you insert your API key into the appropriate point in the url string._
            	
            	Run this test.  It should fail, so let's make it pass.
            	
            	* Pass the proper url into the network call
            	
            		In order to make this test pass, all we need to do is to insert the url we have into the GET: portion of the GET:parameters:success:failure: method call.
            		
            		_WAKWeatherService.m:_
            
		            ```
		            - (void)getCurrentTemp {
		                [self.manager GET:@"http://api.wunderground.com/api/____YOUR API KEY_____/conditions/q/MI/Detroit.json" 
		                       parameters:nil 
		                          success:nil 
		                          failure:nil];
		            }
		            ```
		            
		            Rerun your test, and it should now pass.
		            
				* Refactor tests in the "when its getCurrentTemp method gets called" context
				
					Note that in both of the methods in this context we are declaring a mock for the weatherService.manager property.  Since all of our tests are currently green, this is a good time to refactor that duplicated code into a beforeEach block for this context (i.e., the code in that block will only be run before each test that is in this block).
					
					```
        			context(@"when its getCurrentTemp method is called", ^{
        
        				beforeEach(^{
        					weatherService.manager = [AFHTTPRequestOperationManager nullMock];
        				});
        
        				it(@"calls GET:parameters:success:failure: on its manager property", ^{
            				[[weatherService.manager should] receive:@selector(GET:parameters:success:failure:)];
            				[weatherService getCurrentTemp];
        				});
        
        				it(@"passes the proper url to the network request", ^{
            				KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:0];
            				[weatherService getCurrentTemp];
            				NSString *urlPassedAsArgument = spy.argument;
            				NSString *expectedUrl = @"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json";
            				[[urlPassedAsArgument should] equal:expectedUrl];
        				});
    				});
        			```
        			
        			All your tests should still pass and we've gotten rid of a little bit of duplicated code.
        
        * Check that the proper success block is sent to the manager.
        
        	At this point, we know that we are initiating a network request with the proper url, but we have no idea how we are going to be able to get any response back from that network request in our code.  We need to look a bit more closely about what the AFHTTPRequestOperationManager does when we send it the GET:parameters:success:failure: method.  If you go online and find [the documentation](http://cocoadocs.org/docsets/AFNetworking/2.2.3/Classes/AFHTTPRequestOperationManager.html#//api/name/GET:parameters:success:failure:) for this method.  According to that documentation (which I strongly urge you to read yourself), if the network request is successful the AFHTTPRequestOperationManager will execute the block that is passed as the success: parameter.  If the network request fails, the AFHTTPRequestOperationManager will execture teh block that is passed as the failure: parameter.  For purposes of this exercise, we're not going to worry about how our program handles a failed network request, so let's focus on what happens when the network request succeeds.
        	
        	First things first, what the hell is a block?  The very short version is that a block is like a method that can be passed around like any other object.  Like a method, a block contains code that will be executued when the block is called.  Also like a method, a block can accept various parameters that it will use when it executes.  For example, I could have a block that took a string parameter and logged that string twice to the console.  You could declare such a block and name it "aBlock" as follows:
        	
        	```
        	void(^aBlock)(NSString *) = ^(NSString *inputString) {
        		NSLog(@"Print once: %@ - and print a second time: %@", inputString, inputString);
        	};
        	```
        	
        	You cold execute that block as follows:
        	
        	```
        	aBlock(@"String that I am passing to be used in the block");
        	```
        	
        	Block syntax is ridiculously confusing.  Don't worry if you don't fully understanding it.  Instead, anytime you need to use blocks, just find a [useful website](http://fuckingblocksyntax.com/) to guide you through getting the syntax right.  The important thing to note about blocks is that they are a way for one object to bundle up a bunch of code and send it somewhere else to be executed later.
        	
        	In our project, the success block is a bundle of code that we are sending to the AFHTTPRequestOperationManager for it to execute if it makes a successful network call.  So the question we have to ask is what do we want to happen when the network request is successful.  Our end goal is for us to get the current temperature from the response.  Normally we could just have the getCurrentTemp method return a number that represented the current temperature.  We cannot do that here though because the current temperature is being returned from a network call which can take some time.  Therefore, we need a way to tell the WAKWeatherService class what we want it to do once it gets a result back.  This is something that blocks are perfect for.  So let's have our getCurrentTemp method accept a block argument that the WAKWeatherService will then execute if it successfully gets back the current temperature.
        	
        	Because we are trying to get the current temperature back from this method, it makes sense to pass in a block that has one parameter, an NSInteger that represents the current temperature.  We will have the WAKWeatherService class accept that block and, once it gets the current temperature back from the network call, it will run the block with the current temperature inserted as an argument.  That way the class that creates and passes that block to the WAKWeatherService can have the block do something useful with the current temperature like display it on the screen.  In short the basic steps our program will use are:
        	
        	1.	WAKViewController calls getCurrentTemp and passes a block that accepts a number representing the current temperature and updates the display to reflect that number.
        	
        	2.  WAKWeatherService accepts that block and attempts to obtain the current temperature from the WeatherUnderground API.
        	  
        	3.  If the WAKWeatherService successfully obtains the current temperature from the network call, it executes that block and passes the current temperature into the block as an argument.
        	
        	4.  The execution of the block causes the current temperature to be displayed on the screen due to the code the WAKViewController put in the block when it created the block.
        	
        	This is confusing, but it will become at least a bit more clear as we proceed.  The first thing that we need to do is to change the getCurrentTemp method so that it accepts a block as an argument.
        	
        	* Prepare other tests for us to change the getCurrentTemp method
        
	        	We already have some tests that use the getCurrentTemp method with no parameters, however, so we need to first put those tests to the side for the time being while we update our method to the new form that we will be using.  We do this because we're going to be writing a new test for our new method call and we want this new test to be the only failing test while we are updating the method call.  It would be confusing to say the least to write our new failing test, have that be the only failing test and then when we correctly updated the method call have that test pass but three other tests immediately break.  If we can make it so only a single test is breaking at a time, our lives will be a lot easier.  Once we have updated the method to its new form (with an appropriate test) we will bring back each test one by one and make sure that it uses the new form of the method and passes.  This is less complicated than it sounds, trust me.
        	
     		   	First thing, we have a test that says our WAKWeatherService has a getCurrentTemp method with no arguments (i.e., no colon).
        	
        		>_Note: a selector that accepts no arguments is referenced without a colon, @selector(getCurrentTemp).  A selector that accepts a single argument would have a single colon, @selector(getCurrentTemp:).  Likewise, a selector that accepts multiple arguments has multiple colons, for example the @selector(GET:parameters:success:failure:) selector that you have undoubtedly grown to love accepts four arguments)._
        	
       		 	 Since we're going to change this method to now accept an argument, this test will break.  So let's make it pending for the time being.  You make a test pending by adding an x before the it(@"... where the test is declared.  This will cause the test to throw a warning (letting you know that you are skipping the test and you need to come back and fix it later), but it will not record  as a failed test.
       
       			``` 	 
        		xit(@"has a getCurrentTemp method", ^{
        			[[weatherService should] respondToSelector:@selector(getCurrentTemp)];
    			});
    			```
        	
        		Likewise, both the tests in the "when its getCurrentTemp method is called" context rely on the getCurrentTemp method being called with no arguments, so they will break as well.  Let's make them pending for the time being as well.  We also need to comment out the lines that make the call to the getCurrentTemp method.  Otherwise, they will cause compile errors when we change the method to require an argument.  
        	
        		```
        		context(@"when its getCurrentTemp method is called", ^{
        
        			xit(@"calls GET:parameters:success:failure: on its manager property", ^{
            			weatherService.manager = [AFHTTPRequestOperationManager nullMock];
            			[[weatherService.manager should] receive:@selector(GET:parameters:success:failure:)];
            		//	[weatherService getCurrentTemp];
        			});
        
        			xit(@"passes the proper url to the network request", ^{
            			weatherService.manager = [AFHTTPRequestOperationManager nullMock];
            			KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:0];
            		//	[weatherService getCurrentTemp];
            			NSString *urlPassedAsArgument = spy.argument;
            			NSString *expectedUrl = @"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json";
            			[[urlPassedAsArgument should] equal:expectedUrl];
        			});
    			});
        		```
        	
        	Now rerun your tests, and they should all pass, but you should have three warnings about the three tests that are not being run.
        	
		* Test that getCurrentTemp method accepts a success block argument that is passed to the AFHTTPRequestOperationManager manager property in the GET:parameters:success:failure: method call.
			
			In short, what we want our code to do (and what we want this test to test) is that a block is passed into the getCurrentTemperature method, which is executed if there is a successful network request.  This block should accept a single current temperature argument because this is what will allow the block to do something useful (like update the screen) with the current temperature.  So let's start off our test by creating such a block.
			
			```
			it(@"accepts a success block that is executed after a successful network response", ^{
				void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) { /* empty */ };
			});
			```	
		
			We are going to want to test whether this block has been executed however, so let's add a boolean variable that will reflect whether the block has been run.
			
			```
			it(@"accepts a success block that is executed after a successful network response", ^{
				BOOL blockHasBeenExecuted = NO;
				void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
					blockHasBeenExecuted = YES;
				};
			});
			```	
		
			Now, the blockHasBeenExecuted variable will accurately reflect whether this block has been executed and we can test that boolean value.
		
			The next step for our test is that we want to simulate a successful network call without actually doing a network call.  All that the actual program will do when the network call is successful is run the block that is passed as the success argument in the GET:parameters:success:failure: method call.  Therefore, we can simulate a successful method call by using a spy to capture the block that is passed as the success argument in that method and just running it ourself.
		
		 	```
			it(@"accepts a success block that is executed after a successful network response", ^{
				__block BOOL blockHasBeenExecuted = NO;
				void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
					blockHasBeenExecuted = YES;
				};
				
				/* Set up spy to capture success block */
				KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
				
				/* Execute getCurrentTemp method, passing in the block we want 
				   executed on a successful network call. */
				[weatherService getCurrentTemp:blockThatUpdatesTheScreen];
				
				/* Get the block that the spy captured which will actually be executed
				   following a successful network call */
				   void(^blockThatWouldBeExecutedOnSuccessfulNetworkCall)(AFHTTPRequestOperation *, id) = spy.argument;
				   
				/* Execute the captured block to simulate a successful network call, passing in nil
				   arguments because they do not make a difference to this test. */
				blockThatWouldBeExecutedOnSuccessfulNetworkCall(nil, nil);
				
				/* Test to see if execution of the success block resulted in 
				   execution of our original screen updating block. Note that
				   because the blockHasBeenExecuted variable is a boolean, which
				   is not an object, Kiwi requires that we wrap it with
				   "theValue()" */
				[[theValue(blockHasBeenExecuted) should] beYes];
			});
			```
		
			You should not even be able to compile this test because an error is being thrown on the line where we call [weatherService getCurrentTemp:blcokThatUpdatesTheScreen] because our current getCurrentTemp method does not accept a block.  So let's fix that by changing the method in our WAKWeatherService .h and .m files in order to get rid of this error in our tests.
			
			_WAKWeatherService.h:_
			
			```
			- (void)getCurrentTemp:(void (^)(NSInteger))successBlock;
			```
			
			_WAKWeatherService.m:_
			
			```
			- (void)getCurrentTemp:(void (^)(NSInteger))successBlock {
    
    			[self.manager GET:@"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json" parameters:nil success:nil failure:nil];
			}
			```
			
			This test should now run, but fail.  The reason is because our actual code never actually executes the block that is passed in the getCurrentTemp: method.
			
			* Make the getCurrentTemp: method execute the passed success block if there is a successful network call
			
				The simplest thing would be to just pass the success block received in the getCurrentTemp method as the success block in the network calling GET:parameters:success:failure: method.  We can't do that however, because the success block that the GET:parameters:success:failure: method is expecting is a different kind of block than is being passed into our getCurrentTemp: method.  The reason that they are different is because the successBlock we are working with accepts a single NSInteger argument representing the current temperature.  As we saw earlier, however, the API request does not return a single temperature, but a large .json file which is returned as a "responseObject".  As a result, the success block that the GET:parameters:success:failure: method will execute after a successful network call has different arguments.
				
				
				
				, one is the responseObject we just talked about (it is an object of type id), and a AFHTTPRequestOperation object that we are not particularly concerned with here.  Checking [the documentation for the GET:parameters:success:failure: method] (http://cocoadocs.org/docsets/AFNetworking/2.2.3/Classes/AFHTTPRequestOperationManager.html#//api/name/GET:parameters:success:failure:) shows that it accepts a block with no (void) return value, and has two arguments (AFHTTPRequestOpertion *operation, which we are not particularly concerned about, and an id responseObject, which contains the weather data we're trying to get).
				
				The way we can get around this problem is by just creating a new block of the form that the GET:parameters:success:failure method expects, and have that block execute the block that is passed into our getCurrentTemp: method.  At this point we don't care about what argument is passed to our success block, so we will just pass 0 as an arbitrary value (we cannot pass nil because NSInteger is not an object).
				
				_WAKWeatherService.m:_
				
				```
				- (void)getCurrentTemp:(void (^)(NSInteger))successBlock {
				
					void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        			successBlock(0);
    			};
    
    				[self.manager GET:@"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json" parameters:nil success:newSuccessBlock failure:nil];
				}
				```
		
				You can now rerun your tests, and they should pass.
				
		* Clean up the pending tests
		
			* Fix the "has a getCurrentTemp method"
			
				First, let's remove the x from before the it so that this test is now active.  Running the test should fail.
				
				Second thing is that because the getCurrentTemp method now takes an argument, let's add a colon to the method name in the description so that it now reads "has a getCurrentTemp: method".  Likewise, also add a colon to the end of the method name where it is provided as a selector argument to the respondToSelector: method.
				
				```
				it(@"has a getCurrentTemp: method", ^{
       				[[weatherService should] respondToSelector:@selector(getCurrentTemp:)];
    			});
				```
				
				Rerun your tests and they should now all pass again.
				
			* Fix the tests in the "when its getCurrentTemp method is called" context
				
				As before, first fix the context description so that the reference to the getCurrentTemp includes a colon at the end to reflect the fact that the method now takes an argument.
				
				Then remove the x's from before the two "it" tests in the context.  Lastly, uncomment the lines in both methods where the getCurrentTemp method is called.  You also need to make sure and pass in an argument to that method on both these lines.  Since these two tests do not depend in any way upon what is being passed into the method, just pass in 'nil'.
				
				```
				it(@"calls GET:parameters:success:failure: on its manager property", ^{
            		[[weatherService.manager should] receive:@selector(GET:parameters:success:failure:)];
            		[weatherService getCurrentTemp:nil];
        		});
        
        		it(@"passes the proper url to the network request", ^{
            		KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:)
                                                                atIndex:0];
            		[weatherService getCurrentTemp:nil];
            		NSString *urlPassedAsArgument = spy.argument;
            		NSString *expectedUrl = @"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json";
            		[[urlPassedAsArgument should] equal:expectedUrl];
        });
				```  
				
				It is a good practice to use nil in place of any object that has no effect on the outcome of a test.  It makes tests easier to read because you can assume that anything that is not nil has some effect on the outcome of the test.
				
				Go ahead and rerun your tests.  They should all be running and passing now.
				
		* Enable the WAKWeatherService to provide the current temperature to the success block that it receives in the getCurrentTemp: method
		
			As of now, after a successful network call, the WAKWeatherService always passes a temperature of 0 into the success block it receives in the getCurrentTemp: method.  Obviously this is no good.  We need it to pass in the actual temperature that it gets from Weather Underground.  Of course we don't want to actually make a network call to test this.  Like we did in one of the earlier tests, we're going to simulate a successful network call by intercepting the success block that is passed into the GET:parameters:success:failure: method and executing it ourselves.  The only difference is that this time, we're going to create a fake Weather Underground responseObject and plug it into the success block when we run it.  This will allow us to know in advance what the resulting temperature should be and test that the correct temperature is actaully returned.
			
			The first step in doing this is to create a fake Weather Underground responseObject that is just like a real response with regards to how it stores the current temperature.  Earlier, we discussed how the json object that the Weather Underground API returned was like a nested dictionary.  In particular, we noted that it had an initial "current_observation" key that returned a dictionary.  That returned dictionary then had a "temp_f" key that returned the fehrenheit temperature that we want.
			
			This test is going to be very similar to the following test we have already done:
			
			_WAKWeatherServiceSpec.m:_
			
							
		 	```
			it(@"accepts a success block that is executed after a successful network response", ^{
				__block BOOL blockHasBeenExecuted = NO;
				void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
					blockHasBeenExecuted = YES;
				};
				
				/* Set up spy to capture success block */
				KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
				
				/* Execute getCurrentTemp method, passing in the block we want 
				   executed on a successful network call. */
				[weatherService getCurrentTemp:blockThatUpdatesTheScreen];
				
				/* Get the block that the spy captured which will actually be executed
				   following a successful network call */
				   void(^blockThatWouldBeExecutedOnSuccessfulNetworkCall)(AFHTTPRequestOperation *, id) = spy.argument;
				   
				/* Execute the captured block to simulate a successful network call, passing in nil
				   arguments because they do not make a difference to this test. */
				blockThatWouldBeExecutedOnSuccessfulNetworkCall(nil, nil);
				
				/* Test to see if execution of the success block resulted in 
				   execution of our original screen updating block. Note that
				   because the blockHasBeenExecuted variable is a boolean, which
				   is not an object, Kiwi requires that we wrap it with
				   "theValue()" */
				[[theValue(blockHasBeenExecuted) should] beYes];
			});
			```
		
			The only difference is that this time we're going to create a fake responseObject to pass as the second parameter when we run the "blockThatWouldBeExecutedOnSuccessfulNetworkCall".  Then, instead of just testing the the original block was executed, we're going to actually test that the original block received the correct temperature as a parameter.  In some senses, you could say that this second test renders the first test unnecessary, but in this case, both tests served useful purposes in driving the design of our program and in the case of a test failure, it will provide us additional information if only one of the tests fail as opposed to both of the tests failing.  Anyway, on to the second test.
			
					
		 	```
			it(@"passes the correct temperature to the received success block after a successful network call", ^{
				__block NSInteger temperaturePassedToBlockThatUpdatesScreen = 0;
				void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
					temperaturePassedToBlockThatUpdatesScreen = currentTemperature;
				};
				
				KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
				[weatherService getCurrentTemp:blockThatUpdatesTheScreen];
				
				void(^blockThatWouldBeExecutedOnSuccessfulNetworkCall)(AFHTTPRequestOperation *, id) = spy.argument;

				/* Create fake response object with the nested dictionary form of a 
				   real Weather Underground response object. */
				NSInteger currentTemp = 67;
				id fakeResponse = @{@"current_observation" : @{@"temp_f" : @(currentTemp)}};
								   
				/* Pass fake response to block as response object parameter (second parameter) */
				blockThatWouldBeExecutedOnSuccessfulNetworkCall(nil, fakeResponse);
				
				/* Test to see if successful network call results in the original success block
				   receiving the current temperature.  */
				[[theValue(temperaturePassedToBlockThatUpdatesScreen) should] equal:theValue(currentTemp)];
			});
			```
		 
		 	Running this test should fail.
		 	
		 	* Properly parse and pass the current temperature to the success block received in the getCurrentTemp: method
		 	
		 		Currently, our getCurrentTemp method creates a very simple block that just passes 0 to the originally received success block:
		 		
		 		```
		 		void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject) 
		 		{
        			successBlock(0);
   	 			};
		 		```
		 		
		 		We need to expand this method to parse a current temperature from the passed in responseObject and then to pass that temperature value into the successBlock.  Let's start by using a little bit of wishful thinking and pretend that we have a method that will parse the current temperature from the response object.  That makes finishing out this block very straightforward.
		 		
		 		_WAKWeatherService.m:_
			
		 		```
		 		void (^newSuccessBlock)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject) 
		 		{
        			/* Not (yet) existing method that parses temperature from responseObject */
        			NSInteger currentTemperature = [self parseCurrentTempFrom:responseObject];
        			successBlock(currentTemperature);
   	 			};
		 		```
		 
		 		Alright, now all we have to do is actually create the parseCurrentTempFrom: method.  This method can be implemented by just using the "current_observation" and "temp_f" keys we know should lead us to the fehrenheit temperature and applying them to the response object as if it were a dictionary (as discussed earlier, json response objects behave like arrays and dictionaries and the Weather Underground response in particular behaves like a dictionary).
			
				_WAKWeatherService.m:_
				
				
				```
				- (NSNumber *)parseFehrenheitTemp:(id)responseObject {
					return responseObject[@"current_observation"][@"temp_f"];
				}
				```
			
				Now if you run the tests, they should all pass.
				
				Congratulations, you have completed the implementation of a class that performs a network call using the Weather Underground API, parses the current temperature from the API's json response, and executes a passed block (using the current temperature as an argument) that was received from the object requesting the current temperature.  You're done with the hard part.  Now you just need to implement the WAKViewController to get that current temperature on the screen.  Although I'm going to walk you through that as well, this will involve much less discussion and more code since the basic implementation we're going to do is pretty straightforward.
			
## WAKViewController	
				
We're going to start by deviating a bit from true TDD because we need to do a bit of UI setup that does not fit well with TDD.  First thing is to create the WAKViewController class (extending UIViewController) with a xib file.  This class should have WeatherApiKata as its only target.  On the Xib file drag a UILabel onto the screen somewhere.  Feel free to give it some text like "Current Temperature" and center it if you want, but that is not important to this exercise.  Next, create an outlet for that label in the WAKViewController.h class.

```
@interface WAKViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@end
```

Make sure you connect the outlet to the label in the xib (you should have the little filled-in circle to the left of your outlet).

#### Creating an updateLabel: method


#### Getting the current temperature from the WAKWeatherService class
			

+ Create a WAKViewController that has a UILabel outlet for presenting the current temperature.

+ Have the View Controller get the current temperature from the Weather Service class we created and present it on the screen.

# ALL DONE!

