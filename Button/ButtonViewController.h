//
//  ButtonViewController.h
//  Button
//
//  Created by PointerWare Laptop 4 on 12-03-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ButtonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) UIColor *blueBorder;
@property (strong, nonatomic) UIColor *redBorder;
@property (strong, nonatomic) CAGradientLayer *blueLayer;
@property (strong, nonatomic) CAGradientLayer *redLayer;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) CALayer *imageLayer;
@property (strong, nonatomic) CATextLayer *titleLayer;

- (IBAction)buttonPressed:(UIButton *)sender;
- (IBAction)buttonReleased:(UIButton *)sender;
- (CAGradientLayer *)getBlueGradientLayer;
- (CAGradientLayer *)getRedGradientLayer;
- (void)setBorderPropertiesOfButton:(UIColor *)color;
- (void)createButtonImageLayer;
- (void)createButtonTitleLayer;

@end
