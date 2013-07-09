//
//  KeybordTabView.m
//  OllehSmarZone_iphone
//
//  Created by seo junghoon on 11. 11. 16..
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KeybordTabView.h"

@implementation KeybordTabView

@synthesize prevButton;
@synthesize nextButton;
@synthesize closeButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)MaikePrev{
    self.prevButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:NSLocalizedString(@"Prev", @"")]];	
	prevButton.frame = CGRectMake(5, 1.0f, 50.0f, 25.0f);
	prevButton.segmentedControlStyle = UISegmentedControlStyleBar;
	prevButton.tintColor = [UIColor blackColor];
	[self addSubview:prevButton];
}

-(void)MaikeNext{
    self.nextButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:NSLocalizedString(@"Next", @"")]];	
	nextButton.frame = CGRectMake(60, 1.0f, 50.0f, 25.0f);
	nextButton.segmentedControlStyle = UISegmentedControlStyleBar;
	nextButton.tintColor = [UIColor blackColor];
	[self addSubview:nextButton];
}

-(void)MaikeClose{
    self.closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:NSLocalizedString(@"CLOSE", @"")]];	
	closeButton.frame = CGRectMake(260, 1.0f, 50.0f, 25.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor blackColor];
	[self addSubview:closeButton];
}

- (void)setEnabledPrev{
    [prevButton setEnabled:NO];
    [nextButton setEnabled:YES];
}

- (void)setEnabledNext{
    [prevButton setEnabled:YES];
    [nextButton setEnabled:NO];
}

@end
