//
//  ViewController.h
//  AlcolatorAgain
//
//  Created by Srikanth Narayanamohan on 31/03/2015.
//  Copyright (c) 2015 Sri Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;

-(void)buttonPressed:(UIButton *)sender;

@end

