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
@synthesize blueBorder = _blueBorder;
@synthesize redBorder = _redBorder;
@synthesize blueLayer = _blueLayer;
@synthesize redLayer = _redLayer;
@synthesize image = _image;
@synthesize blueImageLayer = _blueImageLayer;
@synthesize blueTitleLayer = _blueTitleLayer;
@synthesize redImageLayer = _redImageLayer;
@synthesize redTitleLayer = _redTitleLayer;

- (void)viewDidLoad
{
    self.image = [UIImage imageNamed:@"Mailbox.png"];
    self.blueImageLayer = [self returnButtonImageLayer];
    self.redImageLayer = [self returnButtonImageLayer];
    self.blueTitleLayer = [self returnButtonTitleLayer];
    self.redTitleLayer = [self returnButtonTitleLayer];
    self.blueBorder = [UIColor colorWithRed:0 green:0 blue:255 alpha:0.5];
    self.redBorder = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.5];
    [self.button setFrame:CGRectMake(100,100,114,114)];
    self.blueLayer = [self getBlueGradientLayer];
    self.redLayer = [self getRedGradientLayer];
    [self setBorderPropertiesOfButton:self.blueBorder];
    [self.blueLayer addSublayer:self.blueImageLayer];
    [self.blueLayer addSublayer:self.blueTitleLayer];
    [self.redLayer addSublayer:self.redImageLayer];
    [self.redLayer addSublayer:self.redTitleLayer];
    [self.button.layer addSublayer:self.blueLayer];
    [self.button setAdjustsImageWhenHighlighted:NO];
}
- (IBAction)buttonPressed:(UIButton *)sender
{
    [self setBorderPropertiesOfButton:self.redBorder];
    [self.blueLayer removeFromSuperlayer];
    [self.button.layer addSublayer:self.redLayer];

}
- (IBAction)buttonReleased:(UIButton *)sender
{
    [self setBorderPropertiesOfButton:self.blueBorder];
    [self.redLayer removeFromSuperlayer];
    [self.button.layer addSublayer:self.blueLayer];

}
- (CAGradientLayer *)getBlueGradientLayer
{    
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = self.button.layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.5].CGColor,
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.4].CGColor,
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.3].CGColor,
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.2].CGColor,
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.1].CGColor,
                         (id)[UIColor colorWithRed:0 green:0 blue:255 alpha:0.0].CGColor,
                         nil];
    return shineLayer;
}
- (CAGradientLayer *)getRedGradientLayer
{    
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = self.button.layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.5].CGColor,
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.4].CGColor,
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.3].CGColor,
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.2].CGColor,
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.1].CGColor,
                         (id)[UIColor colorWithRed:255 green:0 blue:0 alpha:0.0].CGColor,
                         nil];
    return shineLayer;
}
- (void)setBorderPropertiesOfButton:(UIColor *)color
{
    CALayer *layer = self.button.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = color.CGColor;
}
- (CALayer *)returnButtonImageLayer
{
    CALayer *imageLayer = [[CALayer alloc] init];
    imageLayer.frame = CGRectMake(32,25,48,48);
    imageLayer.affineTransform = CGAffineTransformMake(1.0,0.0,0.0,-1.0,0.0,0.0);
    [imageLayer setBackgroundColor:[[UIColor alloc] initWithPatternImage:self.image].CGColor];
    return imageLayer;
}
- (CATextLayer *)returnButtonTitleLayer
{
    CATextLayer *titleLayer = [[CATextLayer alloc] init];
    titleLayer.frame = CGRectMake(30,95,50,15);
    titleLayer.fontSize = 16;
    titleLayer.foregroundColor = [UIColor blackColor].CGColor;
    titleLayer.alignmentMode = kCAAlignmentCenter;
    titleLayer.string = @"Mail";
    return titleLayer;
}

@end
