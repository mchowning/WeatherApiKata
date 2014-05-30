#import "WAKViewController.h"

@implementation WAKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.weatherService = [[WAKWeatherService alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Create the success block we're going to pass into the getCurrentTemp: method
    void(^mySuccessBlock)(NSInteger) =
        ^(NSInteger currentTemperature) {
            NSString *stringTemp = [@(currentTemperature) stringValue];
            UILabel *tempLabel = self.currentTempLabel;
            [tempLabel setText:stringTemp];
       };
    
    // Call getCurrentTemp on the weather service and pass the success block
    [self.weatherService getCurrentTemp:mySuccessBlock];
}
@end
