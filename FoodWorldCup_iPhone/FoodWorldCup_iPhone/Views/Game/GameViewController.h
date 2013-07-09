//
//  GameViewController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 5. 6..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "KeybordTabView.h"

@interface GameViewController : BaseViewController<UITextFieldDelegate>{
    KeybordTabView *buttonView;
}

//벌칙 인원 선택수
@property (retain, nonatomic) IBOutlet UITextField *peopleNumber;

- (void)InitkeybordObserver;
- (void)ReleaseKeybordObserver;

@end
