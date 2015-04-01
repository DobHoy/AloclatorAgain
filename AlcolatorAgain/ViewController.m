//
//  ViewController.m
//  AlcolatorAgain
//
//  Created by Srikanth Narayanamohan on 31/03/2015.
//  Copyright (c) 2015 Sri Mohan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)textFieldDidChange:(UITextField *)sender {
    
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderValueDidChange:(UISlider *)sender {
    
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    
}
- (IBAction)buttonPressed:(UIButton *)sender {
    
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlocholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlocholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    NSLog(@"res is %@",resultText);
    NSLog(@"label should be %@",self.resultLabel.text);
}
- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
