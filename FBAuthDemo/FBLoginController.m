//
//  FBLoginController.m
//  FBAuthDemo
//
//  Created by Kelvin Pompey on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FBLoginController.h"
#import <WebKit/WebKit.h> 

@implementation FBLoginController

@synthesize accessToken; 
@synthesize webView; 
@synthesize appId; 
@synthesize loginURL;
@synthesize permissions; 
@synthesize loginDelegate; 


- (id) initWithAppId: (NSString *) appId andPermissions: (NSArray *) permissions {
    self = [super init]; 
    
    if(self) {
        self.appId = appId; 
        self.permissions = permissions; 
        NSString *loginString = [NSString stringWithFormat:@"https://www.facebook.com/dialog/oauth?client_id=%@&redirect_uri=https://www.facebook.com/connect/login_success.html&scope=%@&response_type=token", self.appId,
                                 [self.permissions componentsJoinedByString:@","]];
        self.loginURL = [NSURL URLWithString:loginString];         
        NSLog(@"loginString: %@", loginString); 
    }
    
    [NSBundle loadNibNamed:@"FBLoginController" owner:self];
    NSLog(@"window %@", self.window); 
    
    return self; 
}

-(void) login {
    
    [self.webView.mainFrame loadRequest:[NSURLRequest requestWithURL:self.loginURL]]; 
    
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    NSString *requestString = frame.dataSource.request.URL.absoluteString; 
    NSRange range = [requestString rangeOfString:@"#access_token="]; 
    if(range.location != NSNotFound) {
        self.accessToken = [[requestString componentsSeparatedByString:@"#access_token="] lastObject];
        if (loginDelegate && [loginDelegate respondsToSelector:@selector(didLoginToFacebookWithAccessToken:)]) {
            [loginDelegate didLoginToFacebookWithAccessToken: self.accessToken]; 
        }
    }
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSLog(@"window did load %@", self.window); 
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
