//
//  WhiskeyViewController.m
//  AlcolatorAgain
//
//  Created by Srikanth Narayanamohan on 31/03/2015.
//  Copyright (c) 2015 Sri Mohan. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (void)buttonPressed:(UIButton *)sender {
    
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlocholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskyGlass = 1; //a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlocholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        whiskeyText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alochol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText,[self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
    NSLog(@"res is %@",resultText);
    NSLog(@"label should be %@",self.resultLabel.text);
}



@end
