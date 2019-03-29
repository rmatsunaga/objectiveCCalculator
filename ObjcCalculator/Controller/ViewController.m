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

- (IBAction)addPressed:(id)sender {
    add = TRUE;
    operatorPressed = TRUE;
}

- (IBAction)subtractPressed:(id)sender {
    add = FALSE;
    operatorPressed = TRUE;
}

- (IBAction)equalsPressed:(id)sender {
    if (add == FALSE) {
        int outputNum = [firstEntry intValue] - [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i", outputNum];
    } else {
        int outputNum = [firstEntry intValue] + [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat: @"%i", outputNum];
        
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
