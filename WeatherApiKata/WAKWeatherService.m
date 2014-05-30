#import "WAKWeatherService.h"

@implementation WAKWeatherService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPRequestOperationManager alloc] init];
    }
    return self;
}

- (void)getCurrentTemp:(void (^)(NSInteger))successBlockFromViewController {
    
    void (^successBlockForNetworkCall)(AFHTTPRequestOperation *, id) =
            ^(AFHTTPRequestOperation *operation, id responseObject)
        {
            NSNumber *currentTempObject = (NSNumber *)responseObject[@"current_observation"][@"temp_f"];
            NSInteger currentTemperature = [currentTempObject integerValue];
            successBlockFromViewController(currentTemperature);
        };
    
    [self.manager GET:@"http://api.wunderground.com/api/ee4ed185d47c8af2/conditions/q/MI/Detroit.json"
           parameters:nil
              success:successBlockForNetworkCall
              failure:nil];
}

@end
