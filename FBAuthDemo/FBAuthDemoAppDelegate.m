//
//  FBAuthDemoAppDelegate.m
//  FBAuthDemo
//
//  Created by Kelvin Pompey on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FBAuthDemoAppDelegate.h"
#import "FBLoginController.h"

@implementation FBAuthDemoAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray *permissions = [NSArray arrayWithObjects:@"offline_access", nil];    
    FBLoginController *loginController = [[FBLoginController alloc] initWithAppId:@"294554283892164" andPermissions:permissions];
    [loginController setLoginDelegate:self];
    
      
    [loginController login];
}

-(void) didLoginToFacebookWithAccessToken: (NSString *) accessToken {
    NSLog(@"accessToken is %@", accessToken); 
}

@end
