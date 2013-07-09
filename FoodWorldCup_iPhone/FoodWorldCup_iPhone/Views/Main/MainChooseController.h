//
//  MainChooseController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MainChooseController : BaseViewController{
    
}

//음식선택
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *foodBtn;
- (IBAction)foodBtn:(id)sender;
//게임선택
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *gameBtn;
- (IBAction)gameBtn:(id)sender;

@end
