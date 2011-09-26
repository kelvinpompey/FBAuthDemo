//
//  FBLoginController.h
//  FBAuthDemo
//
//  Created by Kelvin Pompey on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h> 

@interface FBLoginController : NSWindowController

@property (nonatomic, assign) NSString *accessToken; 
@property (nonatomic, assign) IBOutlet WebView *webView;
@property (nonatomic, assign) IBOutlet NSString *appId; 
@property (nonatomic, assign) NSURL *loginURL; 
@property (nonatomic, assign) NSArray *permissions; 
@property (nonatomic, assign) id loginDelegate; 

- (id) initWithAppId: (NSString *) appId andPermissions: (NSArray *) permissions;
-(void) login;


@end
