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
- (IBAction)buttonPressed:(UIButton *)sender;
-(IBAction)buttonReleased:(UIButton *)sender;

@end
