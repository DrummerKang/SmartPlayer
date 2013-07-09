//
//  GameViewController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 5. 6..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "GameDetailViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

@synthesize peopleNumber;

- (void)dealloc{
    [peopleNumber release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    peopleNumber.delegate = self;
    
    [self textFiledTagNum];
}

#pragma mark -
#pragma mark TextField Method

- (void)textFiledTagNum{
    peopleNumber.delegate = self;
    peopleNumber.tag = 0;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	//buttonView.prevButton.enabled = YES;
	//buttonView.nextButton.enabled = YES;
    
    switch (textField.tag) {
        case 0:
            break;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //buttonView.prevButton.enabled = YES;
	//buttonView.nextButton.enabled = YES;
    
    switch (textField.tag) {
        case 0:
            break;
    }
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string { 
    NSLog(@"textField   string : %@", string);
    
    if(textField == peopleNumber){
        //return NO하면 입력이 취소됨
		//return YES하면 입력이 허락됨
		//textField 이용해서 어느 텍스트필드인지 구분 가능
		//최대길이
        int maxLength = 1;
        
        if([string isEqualToString:@""] == YES){
            return YES;
        }
        
        //숫자여부 점검
		//length가 0보다 클 경우만 체크
		//0인 경우는 백스페이스의 경우이므로 체크하지 않아야 한다
        if ([string length] > 0) {			
			if ([textField.text length] >= maxLength) {
				[peopleNumber resignFirstResponder];
				return NO;
			}
            
			if ( [textField.text length] == 1 ) {
				textField.text = [NSString stringWithFormat:@"%@%@", textField.text, string];
                NSLog(@"test : %@", textField.text);
				[peopleNumber resignFirstResponder];
				return NO;
                
			}else{
                GameDetailViewController *gameDetailViewController = [[GameDetailViewController alloc] initWithNibName:@"GameDetailViewController" bundle:nil];
                gameDetailViewController.peopleNumber = string;
                [self.navigationController pushViewController:gameDetailViewController animated:YES];
            }
			return YES;
		}
	}
	
	return YES;
}

#pragma mark -
#pragma mark 키보드 관련

-(void)InitkeybordObserver{    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
	[[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(keyboardDidlShow:) name:UIKeyboardDidShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)ReleaseKeybordObserver{
    for( UIWindow *keyboardWindow in [[UIApplication sharedApplication] windows] ){
        for( UIView *keyboard in [keyboardWindow subviews] ){
            NSString *desc = [keyboard description];
            if( /*[desc hasPrefix:@"<UIKeyboard"]==YES ||*/
               [desc hasPrefix:@"<UIPeripheralHostView"] == YES ||
               [desc hasPrefix:@"<UISnap"] == YES )
            {
                for(UIView *subview in [keyboard subviews])
                {
					if(subview.tag == 100 && subview.tag == 101 && subview.tag == 102)
						[subview removeFromSuperview];					
                }                
            }
        }
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)note {
    float keyboardHeight = 150;
    CGRect frame = self.view.frame;
    frame.origin.y -= keyboardHeight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    self.view.frame = frame;
    [UIView commitAnimations];  
}

- (void)keyboardDidlShow:(NSNotification *)note {  
    for( UIWindow *keyboardWindow in [[UIApplication sharedApplication] windows] ){
        for( UIView *keyboard in [keyboardWindow subviews] ){
            NSString *desc = [keyboard description];
            if( /*[desc hasPrefix:@"<UIKeyboard"]==YES ||*/
               [desc hasPrefix:@"<UIPeripheralHostView"] == YES ||
               [desc hasPrefix:@"<UISnap"] == YES )
            {
                for(UIView *subview in [keyboard subviews])
                {
					if(subview.tag == 100 && subview.tag == 101 && subview.tag == 102)
						[subview removeFromSuperview];					
                }                
            }
        }
    }
    
  	buttonView = [[[NSBundle mainBundle] loadNibNamed:@"KeybordTabView" owner:self options:nil] objectAtIndex:0]; 	
    
    buttonView.frame = CGRectMake(0, -27, 320, 27);
    [buttonView MaikeClose];
	buttonView.tag = 100;
    [buttonView.closeButton addTarget:self action:@selector(KeybordCloseBtn:) forControlEvents:UIControlEventValueChanged];
    
	UIWindow* tempWindow;
	
	for(int c = 0; c < (int)[[[UIApplication sharedApplication] windows] count]; c ++)
	{
		tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:c];
		for(int i = 0; i < (int)[tempWindow.subviews count]; i++)
		{
			UIView *keyboard = [tempWindow.subviews objectAtIndex:i];
			if([[keyboard description] hasPrefix:@"<UIPeripheralHostView"] == YES
			   || [[keyboard description] hasPrefix:@"<UISnap"] == YES){
				
				[keyboard addSubview:buttonView];
				
			}
		}
	}
}

- (void)keyboardWillHide:(NSNotification *)note {      
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3f];
    self.view.frame = frame;
    [UIView commitAnimations];   
    
    for( UIWindow *keyboardWindow in [[UIApplication sharedApplication] windows] ){
        for( UIView *keyboard in [keyboardWindow subviews] ){
            NSString *desc = [keyboard description];
            if( /*[desc hasPrefix:@"<UIKeyboard"]==YES ||*/
               [desc hasPrefix:@"<UIPeripheralHostView"] == YES ||
               [desc hasPrefix:@"<UISnap"] == YES )
            {
                for(UIView *subview in [keyboard subviews])
                {
					if(subview.tag == 100 && subview.tag == 101 && subview.tag == 102)
						[subview removeFromSuperview];					
                }                
            }
        }
    }
}

-(void)KeybordCloseBtn:(id)sender{
    [peopleNumber resignFirstResponder];    
}

-(void)viewWillAppear:(BOOL)animated{
    [self InitkeybordObserver];
    
    [self.peopleNumber resignFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self ReleaseKeybordObserver];
}

- (void)viewDidUnload{
    [self setPeopleNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
