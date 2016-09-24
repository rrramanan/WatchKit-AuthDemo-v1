//
//  InterfaceController.m
//  logKCA WatchKit Extension
//
//  Created by Vinod Ramanathan on 24/09/16.
//  Copyright © 2016 Vinod Ramanathan. All rights reserved.
//

#import "InterfaceController.h"
#import "rowController.h"
#import "KeychainItemWrapper.h"
@interface InterfaceController()

@end


@implementation InterfaceController
NSString *mail;
NSString *pass;
NSMutableArray *loadItem;
BOOL state;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    state = FALSE;
    
    loadItem = [[NSMutableArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
    
    [_Table setNumberOfRows:[loadItem count] withRowType:@"rowID"];
    
    for (int i=0; i < [loadItem count]; i++) {
        
        NSString *get = [loadItem objectAtIndex:i];
        
        rowController *rvc = [_Table rowControllerAtIndex:i];
        
        [rvc.tabLabel setText:get];
        
    }
    
    [_Table setHidden:TRUE];
    
    
    
    KeychainItemWrapper *kw = [[KeychainItemWrapper alloc]initWithIdentifier:@"kcaID" accessGroup:nil];
    NSString *getUname = [kw objectForKey:(id)kSecAttrAccount];
    NSString *getPass = [[NSString alloc]initWithData:[kw objectForKey:(id)kSecValueData] encoding:NSUTF8StringEncoding];
    NSLog(@"Uname start %@",getUname);
    NSLog(@"Pass start %@",getPass);
    
    
    if ((![getUname isEqual:@""]) &&(![getPass isEqual:@""])) {
        
        NSLog(@"got Inputs");
        [_label setText:getUname]; [_label1 setText:@"*****"];
        mail = getUname; pass = getPass;
        
    }else{
        NSLog(@"no inputs");
        [_label setText:@"Mail ID"]; [_label1 setText:@"Password"];
        
    }
    
    
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    self.switchHit.on = ([[standardDefaults stringForKey:@"switchState"]
                             
                             isEqualToString:@"ON"]) ? (YES) : (NO);
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)mail {
    
    NSArray *arr = [NSArray arrayWithObjects:@"test@mail.com",@"arm@mail.com",@"Ive@air.pod", nil];
    
    
    [self presentTextInputControllerWithSuggestions:arr allowedInputMode:WKTextInputModePlain completion:^(NSArray *array){
        
        if (array != nil) {
            
            for (int i=0; i<[array count]; i++) {
                
                mail = [array objectAtIndex:0];
                
               //  [keyChainWrap setObject:mail forKey:(id)kSecAttrAccount];
                
                [_label setText:mail];
            }
            
        }
        
    }];
    
    
    
}

- (IBAction)password {
    
    NSArray *arr = [NSArray arrayWithObjects:@"123",@"OS#3beta",@"456", nil];
    
    
    [self presentTextInputControllerWithSuggestions:arr allowedInputMode:WKTextInputModePlain completion:^(NSArray *array){
        
        if (array != nil) {
            
            for (int i=0; i<[array count]; i++) {
                
                pass = [array objectAtIndex:0];
                
               //   [keyChainWrap setObject:pass forKey:(id)kSecValueData];
                
                [_label1 setText:@"*****"];
            }
            
        }
        
    }];
    
    
}

- (IBAction)LogIn {
    
    
    if ([mail isEqualToString:@"test@mail.com"] && [pass isEqualToString:@"123"]) {
        
       // mail= nil;  pass= nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
        
        WKAlertAction *act = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
            
            state = TRUE;
            [_Table setHidden:FALSE];
            [_log_group setHidden:TRUE];
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            
            if ([[standardDefaults stringForKey:@"switchState"] isEqual: @"ON"]) {
                
                NSLog(@"log In 1 ON");
                
                 [self key];
            }
            
            else {
                
                NSLog(@"log in 1 OFF");
              
                KeychainItemWrapper *kw = [[KeychainItemWrapper alloc]initWithIdentifier:@"kcaID" accessGroup:nil];
                [kw resetKeychainItem];
                mail= nil;  pass= nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
            }
           
            [self didAppear];
            
        }];
        
        [self presentAlertControllerWithTitle:@"Welcome" message:@"Verifed-Log1" preferredStyle:WKAlertControllerStyleAlert actions:@[act]];
        
    }else if([mail isEqualToString:@"Ive@air.pod"] && [pass isEqualToString:@"456"]){
        
        WKAlertAction *action = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
            
            state = TRUE;
            [_Table setHidden:FALSE];
            [_log_group setHidden:TRUE];
            
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            
            if ([[standardDefaults stringForKey:@"switchState"] isEqual: @"ON"]) {
                
                NSLog(@"log In 2 ON");
                 [self key];
            }
            
            else {
                
                NSLog(@"log in 2 OFF");
                KeychainItemWrapper *kw = [[KeychainItemWrapper alloc]initWithIdentifier:@"kcaID" accessGroup:nil];
                [kw resetKeychainItem];
                mail= nil;  pass= nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
            }

           
            [self didAppear];
            
        }];
        
        
        [self presentAlertControllerWithTitle:@"Welcome" message:@"Verifed-Log2" preferredStyle:WKAlertControllerStyleAlert actions:@[action]];
        
    }
    
    else{
        
        mail=nil;  pass=nil;  [_label setText:@"Mail ID"];  [_label1 setText:@"Password"];
        
        WKAlertAction *act = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
        }];
        
        [self presentAlertControllerWithTitle:@"Wrong" message:@"Unverifed" preferredStyle:WKAlertControllerStyleAlert actions:@[act]];
        
    }
    
    
    
}


-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex{
    
    if ([segueIdentifier isEqualToString:@"viewTwo"]) {
        
        return loadItem[rowIndex];
        
    }
    return nil;
}


- (IBAction)logout {
    
    
    [_Table setHidden:TRUE];
    [_log_group setHidden:FALSE];
    state = FALSE;
    [self didAppear];
    
}


-(void)didAppear{
    [super didAppear];
    
    if (state == FALSE) {
        
        [self setTitle:@"Login"];
        
    }
    else{
        
        [self setTitle:@"Home"];
        
    }
    
}

-(void)key{
    
    KeychainItemWrapper  *kw = [[KeychainItemWrapper alloc]initWithIdentifier:@"kcaID" accessGroup:nil];
    
    NSLog(@"str ret mail - %@",mail);  NSLog(@"str ret pass - %@",pass);
    
    [kw setObject:mail forKey:(id)kSecAttrAccount];
    
    NSData* data =[pass dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"pass insert %@",data);
    NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"pass converted %@",newStr);
    
    [kw setObject:data forKey:(id)kSecValueData];
    
    
    //retrieve check
    
    NSLog(@"ret mail %@",[kw objectForKey:(id)kSecAttrAccount]);
    
 
     NSString *getPass = [[NSString alloc]initWithData:[kw objectForKey:(id)kSecValueData] encoding:NSUTF8StringEncoding];
    NSLog(@"ret pass %@",getPass);
    
    
}

- (IBAction)switchAction:(BOOL)value {
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
   
    if (value == true) {
        
         value = false;  NSLog(@"ON");
        
         [standardDefaults setObject:@"ON" forKey:@"switchState"];
       
        
    }
    else if(value == false){
        
         value = true;NSLog(@"OFF");
    
         [standardDefaults setObject:@"OFF" forKey:@"switchState"];

    }
    
     [[NSUserDefaults standardUserDefaults] synchronize];
    
}
@end



