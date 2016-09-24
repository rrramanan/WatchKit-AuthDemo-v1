//
//  BreifController.m
//  logKCA
//
//  Created by Vinod Ramanathan on 24/09/16.
//  Copyright © 2016 Vinod Ramanathan. All rights reserved.
//

#import "BreifController.h"

@interface BreifController ()

@end

@implementation BreifController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [_breifLAbel setText:context];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



