//
//  ButtonViewController.m
//  Button
//
//  Created by PointerWare Laptop 4 on 12-03-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ButtonViewController.h"

@implementation ButtonViewController
@synthesize button = _button;

- (void)viewDidLoad
{
    UIImage *image = [UIImage imageNamed:@"ximage.png"];
    //UIImage *strechableImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [[self.button layer] setCornerRadius:5.0f];
    //[[self.button layer] setMasksToBounds:YES];
    [[self.button layer] setBorderWidth:3.0f];
    [self.button setFrame:CGRectMake(50,50,114,114)];
    [self.button setBackgroundColor:[UIColor blueColor]];
    [self.button setAdjustsImageWhenHighlighted:NO];
    [self.button setImage:image forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.button setTitle:@"Mail" forState:UIControlStateNormal];
    [self.button setTitleEdgeInsets:UIEdgeInsetsMake(80,0,0,30)];
    [self.button setImageEdgeInsets:UIEdgeInsetsMake(0,35,10,0)];
}
- (IBAction)buttonPressed:(UIButton *)sender
{
    [sender setBackgroundColor:[UIColor brownColor]];
}
- (IBAction)buttonReleased:(UIButton *)sender
{
    [sender setBackgroundColor:[UIColor blueColor]];
}
@end
