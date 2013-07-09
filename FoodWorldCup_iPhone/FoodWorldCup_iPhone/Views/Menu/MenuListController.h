//
//  MenuListController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 7..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MenuListController : BaseViewController{
    NSUserDefaults *defaults;
    NSInteger manCount;
    NSInteger ladyCount;
}

//한식
- (IBAction)koreaFoodBtn:(id)sender;
//중식
- (IBAction)chinaFoodBtn:(id)sender;
//일식
- (IBAction)japanFoodBtn:(id)sender;
//분식
- (IBAction)basedFoodBtn:(id)sender;
//패스트푸드
- (IBAction)fastFoodBtn:(id)sender;

- (void)dataSave;

@end
