//
//  CrazinessViewController.m
//  TextKitDemo
//
//  Created by Tim Clem on 3/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "CrazinessViewController.h"


@interface CrazinessViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;

@end


@implementation CrazinessViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    // Rewire textView1's layoutManager to also use textView2's textContainer
    [self.textView1.layoutManager addTextContainer:self.textView2.textContainer];
}

@end
