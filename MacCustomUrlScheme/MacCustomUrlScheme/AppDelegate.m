//
//  AppDelegate.m
//  MacCustomUrlScheme
//
//  Created by jiaweibai on 8/12/16.
//  Copyright © 2016 GarveyCalvin. All rights reserved.
//

/**
 *  如何通过Safari测试
 *  只需打开Safari，然后在网址栏中输入 com.gc.custom.url.scheme:// 即可测试
 */

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)handleURLEvent:(NSAppleEventDescriptor*)theEvent withReplyEvent:(NSAppleEventDescriptor*)replyEvent {
    // Process URL Request
    NSString* path = [[theEvent paramDescriptorForKeyword:keyDirectObject] stringValue];
    
    [[NSAlert alertWithMessageText:@"URL Request" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"%@", path] runModal];
}

@end
