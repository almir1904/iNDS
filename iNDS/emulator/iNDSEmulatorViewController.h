//
//  iNDSEmulatorViewController.h
//  iNDS
//
//  Created by iNDS on 6/11/13.
//  Copyright (c) 2014 iNDS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iNDSGame.h"

@interface iNDSEmulatorViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) iNDSGame *game;
@property (copy, nonatomic) NSString *saveState;

- (void)pauseEmulation;
- (void)resumeEmulation;
- (void)saveStateWithName:(NSString*)saveStateName;

@end
