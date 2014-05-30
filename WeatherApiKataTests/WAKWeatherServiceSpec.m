#import <Kiwi/Kiwi.h>
#import "WAKWeatherService.h"

SPEC_BEGIN(WAKWeatherServiceSpec)

describe(@"WAKWeatherService", ^{
    
    __block WAKWeatherService *weatherService;
    beforeEach(^{
        weatherService = [[WAKWeatherService alloc] init];
    });
    
    context(@"when its getCurrentTemp method is called", ^{
        
        beforeEach(^{
            weatherService.manager = [AFHTTPRequestOperationManager nullMock];
        });
        
        it(@"passes the proper url to the network request", ^{
            KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:)
                                                                atIndex:0];
            [weatherService getCurrentTemp:nil];
            NSString *urlPassedAsArgument = spy.argument;
            NSString *expectedUrl = @"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json";
            [[urlPassedAsArgument should] equal:expectedUrl];
        });
        
        it(@"accepts a success block that is executed after a successful network response", ^{
            __block BOOL blockHasBeenExecuted = NO;
            void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
                blockHasBeenExecuted = YES;
            };
            KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
            [weatherService getCurrentTemp:blockThatUpdatesTheScreen];
            void(^blockThatWouldBeExecutedOnSuccessfulNetworkCall)(AFHTTPRequestOperation *, id) = spy.argument;
            blockThatWouldBeExecutedOnSuccessfulNetworkCall(nil, nil);
            [[theValue(blockHasBeenExecuted) should] beYes];
        });
        
        it(@"passes the correct temperature to the received success block after a successful network call", ^{
            
            __block NSInteger temperaturePassedToBlockThatUpdatesScreen = 0;
            void (^blockThatUpdatesTheScreen)(NSInteger) = ^(NSInteger currentTemperature) {
                temperaturePassedToBlockThatUpdatesScreen = currentTemperature;
            };
            
            KWCaptureSpy *spy = [weatherService.manager captureArgument:@selector(GET:parameters:success:failure:) atIndex:2];
            [weatherService getCurrentTemp:blockThatUpdatesTheScreen];
            void(^blockThatWouldBeExecutedOnSuccessfulNetworkCall)(AFHTTPRequestOperation *, id) = spy.argument;
            
            NSInteger currentTemp = 67;
            id fakeResponse = @{@"current_observation" : @{@"temp_f" : @(currentTemp)}};
            blockThatWouldBeExecutedOnSuccessfulNetworkCall(nil, fakeResponse);
            
            [[theValue(temperaturePassedToBlockThatUpdatesScreen) should] equal:theValue(currentTemp)];
        });
    });
});
	
SPEC_END
