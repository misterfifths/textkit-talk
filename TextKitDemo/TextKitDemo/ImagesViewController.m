//
//  ImagesViewController.m
//  TextKitDemo
//
//  Created by Tim Clem on 3/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "ImagesViewController.h"


@interface ImagesViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation ImagesViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.textView.delegate = self;


    NSString *loremIpsum = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";

    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:32] };

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:loremIpsum
                                                                               attributes:attributes];

    // And now we insert our image attachment

    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"bananadog"];
    imageAttachment.bounds = CGRectMake(0, 0, 300, 223); // In reality, we'd probably do some calculation here to make the image the full width of the text view and keep the height at aspect ratio.

    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:imageAttachment];

    [string insertAttributedString:attachmentString atIndex:50];  // totally arbitrary location

    self.textView.attributedText = string;
}


-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    // Same sort of hook as with -textView:shouldInteractWithURL:inRange:, except that
    // there isn't really a default behavior.

    return YES;
}

@end
