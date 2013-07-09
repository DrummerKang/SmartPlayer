//
//  PopupViewController.m
//  ToeicSpeaking
//
//  Created by Joseph Kang on 11. 7. 8..
//  Copyright 2011 confitech. All rights reserved.
//

#import "PopupViewController.h"

//뷰를 올리자!
@implementation PopupViewController

- (id)init{
	self = [super init];
	if(self){
		self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
		
		self.view.frame = CGRectMake(0, 0, 320, 480);
	}
	return self;
}
@end
