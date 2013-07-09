//
//  GameDetailViewController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 5. 6..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "GameDetailViewController.h"
#import "MainChooseController.h"
#import "GameViewController.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController

@synthesize homeBtn;
@synthesize reActionBtn;
@synthesize peopleNumber;

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

    imageArr = [[NSMutableArray alloc] init];
    
    people = [peopleNumber intValue];
    
    cardNum = 0;
    
    [self gameStart];
    [self ScrambleInit];
}

//카드 뒤집기 화면
- (void)gameStart{
    for(int i=0; i<9; i++){        
        cardNum = i + 1;
        
        //뒤집은 카드
        okRoom[i].view = [[UIImageView alloc] initWithFrame:CGRectMake(14+(i%3)*100, 20+(i/3)*130, 94, 120)];
        
        okRoom[i].view.exclusiveTouch = YES;
        okRoom[i].view.multipleTouchEnabled = NO;
        
        if(cardNum >= people+1){
            NSString *fName = [NSString stringWithFormat:@"x"];
            NSString *fNameB = [[NSBundle mainBundle] pathForResource:fName ofType:@"png"];	
            chooseImage[i] = [[UIImage alloc] initWithContentsOfFile:fNameB];	
            
        }else if(cardNum < people+1){
            NSString *fName2 = [NSString stringWithFormat:@"ok" ];
            NSString *fNameB2 = [[NSBundle mainBundle] pathForResource:fName2 ofType:@"png"];	
            chooseImage[i] = [[UIImage alloc] initWithContentsOfFile:fNameB2];	
        }
        
        okRoom[i].view.backgroundColor = [UIColor clearColor];	
        okRoom[i].view.hidden =NO;			
        okRoom[i].view.tag=i+1;			
        okRoom[i].view.userInteractionEnabled = YES;
        
        [self.view addSubview:okRoom[i].view];
        
        shuffledIndex[i] = i;
        
        //뒤집기 전 카드
        cardImage[i] = [[UIImageView alloc] initWithFrame:CGRectMake(14+(i%3)*100, 20+(i/3)*130, 94, 120)];
        
        cardImage[i].exclusiveTouch = YES;
		cardImage[i].multipleTouchEnabled = NO;
        
        cardImage[i].image = [UIImage imageNamed:@"cardImage"];
        cardImage[i].backgroundColor = [UIColor clearColor];	
        cardImage[i].hidden = NO;			
        cardImage[i].tag=i+1;			
        cardImage[i].userInteractionEnabled = YES;		//터치
        [self.view addSubview:cardImage[i]];	
    }
}

-(void)ScrambleInit{
	[self arrayRandom:okRoom size:9 range:9];
	
	for(int i=0; i<9; i++){
		okRoom[i].state =1;
		okRoom[i].view.image = chooseImage[okRoom[i].imgIndex-1];
	}
}

-(void)arrayRandom:(Canvas*)sel size:(int)size range:(int)range{	
	int beforeRan, afterRan, dataInt, realTempIndex;
	
	for(int i=0; i<size; i++){
		sel[i].imgIndex =i+1;
	}
	
	for(int i=0; i<size; i++){		
		beforeRan =(rand()%size);
		afterRan =(rand()%size);
		
		dataInt = sel[beforeRan].imgIndex;
		sel[beforeRan].imgIndex = sel[afterRan].imgIndex;
		sel[afterRan].imgIndex  = dataInt;
        
        realTempIndex = shuffledIndex[beforeRan];
        shuffledIndex[beforeRan] = shuffledIndex[afterRan];
        shuffledIndex[afterRan] = realTempIndex;
    }
}

- (void)viewDidUnload
{
    [self setHomeBtn:nil];
    [self setReActionBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Touch Event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];	
	CGPoint pt = [touch locationInView:self.view];	
	
	for (int i = 0; i < 9; i++) {
		
		if (pt.x > cardImage[i].frame.origin.x && pt.x < cardImage[i].frame.origin.x + cardImage[i].frame.size.width &&
			pt.y > cardImage[i].frame.origin.y && pt.y < cardImage[i].frame.origin.y + cardImage[i].frame.size.height && cardImage[i].hidden == NO) {
            
        			
			cardImage[i].hidden = YES;
			
            switch (touchCount) {
                case 0:
                    touched_first = cardImage[i].tag;
                    touched_index[0] = i;
                    break;
                case 1:
    
                    touched_index[1] = i;
                    break;
                default:
                    break;
            }
			touchCount++;
            NSLog(@"터치카운트 %d",touchCount);
		}		 
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (touchCount==2) {
        if (touched_first==touched_second) {
            NSLog(@"정답");
            for (int i =0; i <2; i++) {           				
                
            }
            
        }else{
            NSLog(@"오답");

            for (int i =0; i <2; i++) {                
        
            }
        }
        touchCount=0;
    }
}

- (void)dealloc {
    [homeBtn release];
    [reActionBtn release];
    [super dealloc];
}

#pragma mark -
#pragma mark Button Action

- (IBAction)homeBtn:(id)sender {
    MainChooseController *mainChooseController = [[MainChooseController alloc] initWithNibName:@"MainChooseController" bundle:nil];
    [self.navigationController pushViewController:mainChooseController animated:NO];
}

- (IBAction)reActionBtn:(id)sender {
    GameViewController *gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self.navigationController pushViewController:gameViewController animated:NO];
}

@end
