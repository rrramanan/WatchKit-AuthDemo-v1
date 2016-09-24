//
//  InterfaceController.h
//  logKCA WatchKit Extension
//
//  Created by Vinod Ramanathan on 24/09/16.
//  Copyright © 2016 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *label1;
- (IBAction)mail;
- (IBAction)password;
- (IBAction)LogIn;
@property (strong, nonatomic) IBOutlet WKInterfaceGroup *log_group;
@property (strong, nonatomic) IBOutlet WKInterfaceTable *Table;
- (IBAction)logout;
@property (strong, nonatomic) IBOutlet WKInterfaceSwitch *switchHit;
- (IBAction)switchAction:(BOOL)value;
@end
