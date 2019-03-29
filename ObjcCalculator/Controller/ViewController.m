//
//  ViewController.m
//  ObjcCalculator
//
//  Created by Rey Matsunaga on 3/25/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    operatorPressed = FALSE;
    firstEntry = NULL;
    secondEntry = NULL;
}


- (IBAction)clearPressed:(id)sender {
    _labelOutput.text = NULL;
    firstEntry = NULL;
    secondEntry = NULL;
    operatorPressed = FALSE;
}

- (IBAction)divicePressed:(id)sender {
    op = '/';
    operatorPressed = TRUE;
}

- (IBAction)multiplyPressed:(id)sender {
    op = '*';
    operatorPressed = TRUE;
}

- (IBAction)addPressed:(id)sender {
    op = '+';
    operatorPressed = TRUE;
}

- (IBAction)subtractPressed:(id)sender {
    op = '-';
    operatorPressed = TRUE;
}

- (IBAction)equalsPressed:(id)sender {
    if (op == '-') {
        int outputNum = [firstEntry intValue] - [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i", outputNum];
    } else if (op == '+') {
        int outputNum = [firstEntry intValue] + [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i", outputNum];
        
    } else if (op == '*') {
        int outputNum = [firstEntry intValue] * [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i", outputNum];
    } else {
        int outputNum = [firstEntry intValue] / [secondEntry intValue];
        int remainder = [firstEntry intValue] % [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i %s %i ", outputNum, "R: ", remainder];
        
    }
    operatorPressed = FALSE;
    firstEntry = _labelOutput.text;
    secondEntry = NULL;
}

-(IBAction)numberPressed:(UIButton*)sender {
    int tag = sender.tag;
    
    if (operatorPressed == FALSE) {
        if (firstEntry == NULL) {
            firstEntry = [NSString stringWithFormat:@"%i", tag];
            _labelOutput.text = firstEntry;
        } else {
            firstEntry = [NSString stringWithFormat: @"%@%i", firstEntry, tag];
            _labelOutput.text = firstEntry;
        }
    } else {
        if (secondEntry == NULL) {
            secondEntry = [NSString stringWithFormat:@"%i", tag];
            _labelOutput.text = secondEntry;
        } else {
            secondEntry = [NSString stringWithFormat: @"%@%i", secondEntry, tag];
            _labelOutput.text = secondEntry;
        }
    }
}

@end
