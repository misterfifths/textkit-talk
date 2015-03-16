//
//  BasicsViewController.m
//  TextKitDemo
//
//  Created by Tim Clem on 3/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "BasicsViewController.h"


@interface BasicsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dummyLabel;

@end


@implementation BasicsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    NSDictionary *normalAttributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:32],
                                        NSForegroundColorAttributeName: [UIColor brownColor] };

    NSString *rawString = @"O brave new world, that has such people in't!";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:rawString
                                                                               attributes:normalAttributes];


    [string addAttribute:NSFontAttributeName
                   value:[UIFont italicSystemFontOfSize:32]
                   range:NSMakeRange(2, 5)];  // "brave"

    [string addAttribute:NSForegroundColorAttributeName
                   value:[UIColor redColor]
                   range:NSMakeRange(8, 9)];  // "new world"


    NSShadow *handsomeShadow = [[NSShadow alloc] init];
    handsomeShadow.shadowOffset = CGSizeZero;
    handsomeShadow.shadowBlurRadius = 5;

    NSDictionary *suchPeopleAttributes = @{ NSForegroundColorAttributeName: [UIColor redColor],
                                            NSShadowAttributeName: handsomeShadow };

    [string addAttributes:suchPeopleAttributes
                    range:NSMakeRange(28, 11)];  // "such people"

    self.dummyLabel.attributedText = string;
}

@end
