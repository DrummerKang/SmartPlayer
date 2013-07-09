//
//  WinViewController.h
//  FoodWorldCup_iPhone
//
//  Created by Kang on 12. 5. 10..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WinViewController : UIViewController {
    NSString* titleName;
    NSString* imageName;
}


@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *bgLogImage;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *titleImage;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *winFoodImage;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *winTextImage;

@property (nonatomic, copy) NSString* titleName;
@property (nonatomic, copy) NSString* imageName;

- (IBAction)goToMainBtn:(id)sender;

- (void)showWinFood;

@end


