//
//  LinksViewController.m
//  TextKitDemo
//
//  Created by Tim Clem on 3/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "LinksViewController.h"


@interface LinksViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation LinksViewController

-(void)viewDidLoad
{
    [super viewDidLoad];


    self.textView.delegate = self;


    NSDictionary *googleAttributes = @{ NSLinkAttributeName: [NSURL URLWithString:@"http://google.com"] };
    NSAttributedString *googleLinkString = [[NSAttributedString alloc] initWithString:@"Google"
                                                                           attributes:googleAttributes];

    NSDictionary *fakeURLAttributes = @{ NSLinkAttributeName: [NSURL URLWithString:@"my-fake-protocol://embiggen"] };
    NSAttributedString *embiggenString = [[NSAttributedString alloc] initWithString:@"Too small?"
                                                                         attributes:fakeURLAttributes];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Have you heard of this search engine? "];

    [string appendAttributedString:googleLinkString];

    NSAttributedString *joiningString = [[NSAttributedString alloc] initWithString:@"\n\nWhat's that? "];
    [string appendAttributedString:joiningString];

    [string appendAttributedString:embiggenString];


    // Now put a default font on the whole shebang
    NSRange wholeTextRange = NSMakeRange(0, string.length);
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:wholeTextRange];


    self.textView.attributedText = string;
}


-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    if([[URL scheme] isEqualToString:@"http"]) {
        return YES;  // Do the default thing with HTTP URLs
    }

    // Otherwise, we're hitting our fake URL...

    // Grab the current font of the text
    UIFont *currentFont = [self.textView.attributedText attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];

    // Make it bigger
    UIFont *newFont = [currentFont fontWithSize:currentFont.pointSize + 5];

    // And put it back on the text
    NSMutableAttributedString *mutableString = [self.textView.attributedText mutableCopy];
    NSRange wholeTextRange = NSMakeRange(0, self.textView.attributedText.length);
    [mutableString addAttribute:NSFontAttributeName value:newFont range:wholeTextRange];

    self.textView.attributedText = mutableString;

    return NO;  // Don't try to open Safari for this url
}

@end
