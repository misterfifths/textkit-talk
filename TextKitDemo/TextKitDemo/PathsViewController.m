//
//  PathsViewController.m
//  TextKitDemo
//
//  Created by Tim Clem on 3/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "PathsViewController.h"


@interface PathsViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *circleView;

@end


@implementation PathsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.textView.scrollEnabled = NO;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    // Since the circle view isn't a subview of the text view, we need to get its coordinates into those of the
    // text view:
    CGRect frameOfCircleInTextViewCoordinates = [self.textView convertRect:self.circleView.bounds fromView:self.circleView];

    // Now we also need to account for the potential contentInsets in the textView. The textContainer doesn't know about
    // these, so it will throw off the path.
    frameOfCircleInTextViewCoordinates.origin.x += self.textView.contentInset.left;
    frameOfCircleInTextViewCoordinates.origin.y -= self.textView.contentInset.top;

    // Make it a touch bigger so we have good clearance all around
    CGRect finalExclusionRect = CGRectInset(frameOfCircleInTextViewCoordinates, -5, -5);

    UIBezierPath *exclusionCircle = [UIBezierPath bezierPathWithOvalInRect:finalExclusionRect];
    self.textView.textContainer.exclusionPaths = @[ exclusionCircle ];
}

@end
