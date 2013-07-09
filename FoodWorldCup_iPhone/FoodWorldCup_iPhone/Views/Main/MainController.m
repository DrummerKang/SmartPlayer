//
//  MainController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 2. 25..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"
#import "MainChooseController.h"

@implementation MainController

//@synthesize locationManager;

- (void)dealloc{
    [startBtn release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    /*
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    locationManager.distanceFilter = 0;
    [locationManager startUpdatingLocation];
    */
    
    //월드컵
    startBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startBtn.frame = CGRectMake(30, 350, 250, 70);
    startBtn.exclusiveTouch = YES;
    [startBtn addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    //백그라운드 이미지 설정
    [startBtn setBackgroundImage:[UIImage imageNamed:@"clean.png"] forState:UIControlStateNormal];   
    [self.view addSubview:startBtn];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 320, 480);
    [imageView setImage:[UIImage imageNamed:@"main.png"]];
    [self.view addSubview:imageView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(imageChanged) userInfo:nil repeats:NO];
}
/*
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSDate *eventData = newLocation.timestamp;
    NSTimeInterval howRecent = [eventData timeIntervalSinceNow];
    
    if(abs(howRecent) < 5.0){
        [locationManager stopUpdatingLocation];
        double m_latitude = newLocation.coordinate.latitude;
        double m_longitube = newLocation.coordinate.longitude;
        
        NSLog(@"latitude : %f", m_latitude);
        NSLog(@"longtitube : %f", m_longitube);
        
        myGeocoder = [[MKReverseGeocoder alloc] initWithCoordinate:[newLocation coordinate]];
        [myGeocoder setDelegate:self];
        [myGeocoder start];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error");
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
    NSString *p1 = placemark.subAdministrativeArea;
    NSString *p2 = placemark.administrativeArea;
    NSString *p3 = placemark.locality;
    NSString *p4 = placemark.subLocality;
    NSString *p5 = placemark.thoroughfare;
    NSString *p6 = placemark.subThoroughfare;
    NSString *p7 = placemark.postalCode;
    
    NSLog(@"p1 : %@", p1);
    NSLog(@"p2 : %@", p2);
    NSLog(@"p3 : %@", p3);
    NSLog(@"p4 : %@", p4);
    NSLog(@"p5 : %@", p5);
    NSLog(@"p6 : %@", p6);
    NSLog(@"p7 : %@", p7);
    
    [geocoder release];
}
*/

//깜빡이는 이미지
- (void)imageChanged{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                 [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MainText2" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clean" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 350, 250, 70)];
    [self.view addSubview:aniImage];
    //[self.view bringSubviewToFront:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

- (void)startAction{
    MainChooseController *mainChooseController = [[MainChooseController alloc] initWithNibName:@"MainChooseController" bundle:nil];
    [self.navigationController pushViewController:mainChooseController animated:YES];
}

@end
