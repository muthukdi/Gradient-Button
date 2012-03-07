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
@synthesize imageLayer = _imageLayer;
@synthesize titleLayer = _titleLayer;

- (void)viewDidLoad
{
    self.image = [UIImage imageNamed:@"Mailbox.png"];
    [self createButtonImageLayer];
    [self createButtonTitleLayer];
    self.blueBorder = [UIColor colorWithRed:0 green:0 blue:255 alpha:0.5];
    self.redBorder = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.5];
    [self.button setFrame:CGRectMake(100,100,114,114)];
    self.blueLayer = [self getBlueGradientLayer];
    self.redLayer = [self getRedGradientLayer];
    [self setBorderPropertiesOfButton:self.blueBorder];
    [self.button.layer addSublayer:self.blueLayer];
    [self.blueLayer addSublayer:self.imageLayer];
    [self.blueLayer addSublayer:self.titleLayer];
    [self.button setAdjustsImageWhenHighlighted:NO];
}
- (IBAction)buttonPressed:(UIButton *)sender
{
    [self setBorderPropertiesOfButton:self.redBorder];
    [self.imageLayer removeFromSuperlayer];
    [self.titleLayer removeFromSuperlayer];
    [self.blueLayer removeFromSuperlayer];
    [self.button.layer addSublayer:self.redLayer];
    [self.redLayer addSublayer:self.imageLayer];
    [self.redLayer addSublayer:self.titleLayer];

}
- (IBAction)buttonReleased:(UIButton *)sender
{
    [self setBorderPropertiesOfButton:self.blueBorder];
    [self.imageLayer removeFromSuperlayer];
    [self.titleLayer removeFromSuperlayer];
    [self.redLayer removeFromSuperlayer];
    [self.button.layer addSublayer:self.blueLayer];
    [self.blueLayer addSublayer:self.imageLayer];
    [self.blueLayer addSublayer:self.titleLayer];

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
- (void)createButtonImageLayer
{
    self.imageLayer = [[CALayer alloc] init];
    self.imageLayer.frame = CGRectMake(32,25,48,48);
    self.imageLayer.affineTransform = CGAffineTransformMake(1.0,0.0,0.0,-1.0,0.0,0.0);
    [self.imageLayer setBackgroundColor:[[UIColor alloc] initWithPatternImage:self.image].CGColor];
}
- (void)createButtonTitleLayer
{
    self.titleLayer = [[CATextLayer alloc] init];
    self.titleLayer.frame = CGRectMake(30,95,50,15);
    self.titleLayer.fontSize = 16;
    self.titleLayer.foregroundColor = [UIColor blackColor].CGColor;
    self.titleLayer.alignmentMode = kCAAlignmentCenter;
    self.titleLayer.string = @"Mail";
}

@end
