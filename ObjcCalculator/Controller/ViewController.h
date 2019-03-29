//
//  ViewController.h
//  ObjcCalculator
//
//  Created by Rey Matsunaga on 3/25/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    bool operatorPressed;
    bool add;
    NSString *firstEntry;
    NSString *secondEntry;
}
@property (weak, nonatomic) IBOutlet UILabel *labelOutput;

- (IBAction)clearPressed:(id)sender;

- (IBAction)addPressed:(id)sender;

- (IBAction)subtractPressed:(id)sender;

- (IBAction)equalsPressed:(id)sender;

-(IBAction)numberPressed:(UIButton*)sender;





@end

