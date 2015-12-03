//
//  iNDSEmulationProfile.m
//  iNDS
//
//  Created by Will Cobb on 12/2/15.
//  Copyright © 2015 iNDS. All rights reserved.
//

#import "iNDSEmulationProfile.h"


@interface iNDSEmulationProfile()
{
    CGRect mainScreenRect[8];
    CGRect touchScreenRect[8];
    CGRect leftTrigger[8];
    CGRect rightTrigger[8];
    CGRect directionalControl[8];
    CGRect buttonControl[8];
    CGRect startButton[8];
    CGRect selectButton[8];
    CGRect settingsButton[8];
}
@end

@implementation iNDSEmulationProfile

- (id)initWithProfileName:(NSString*) name
{
    if (self = [super init]) {
        for (int i = 0; i < 8; i++) { //initialize frames
            settingsButton[i] = CGRectMake(5, 5, 22, 22);
            startButton[i] = selectButton[i] = CGRectMake(0, 0, 48, 28);
            leftTrigger[i] = rightTrigger[i] = CGRectMake(0, 0, 67, 44);
            directionalControl[i] = buttonControl[i] = CGRectMake(0, 0, 120, 120);
        }
        // Setup the default screen profile
        //[UIScreen screens].count > 1
        _name = name;
        self.screenSize = [self currentScreenSize];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger currentView = 0; //0 Portait(1 screen, iPhone), 1 Landscape(1 screen, iPhone), 2 Portait(2 screen, iPhone), 3 Landscape(2 screen, iPhone)
                                   //4 Portait(1 screen, iPad),   5 Landscape(1 screen, iPad),   6 Portait(2 screen, iPad),   7 Landscape(2 screen, iPad)
        //0
        startButton[currentView].origin = CGPointMake(self.screenSize.width/2 - 48 - 7, self.screenSize.height - 28 - 7);
        selectButton[currentView].origin = CGPointMake(self.screenSize.width/2 + 7, self.screenSize.height + 7);
        directionalControl[currentView].origin = CGPointMake(10, self.screenSize.height - 130);
        directionalControl[currentView].origin = CGPointMake(self.screenSize.width - 120 - 10, self.screenSize.height - 130);
        mainScreenRect[currentView] = CGRectMake(0, (self.screenSize.height - (self.screenSize.width*1.5)) / 2, self.screenSize.width, self.screenSize.width * 0.75);
        touchScreenRect[currentView] = CGRectMake(0, (self.screenSize.height - (self.screenSize.width*1.5)) / 2, self.screenSize.width, self.screenSize.width * 0.75);
    }
}
        
-(CGSize)currentScreenSize
{ 
    CGRect screenBounds = [UIScreen mainScreen].bounds ;
    CGFloat width = CGRectGetWidth(screenBounds)  ;
    CGFloat height = CGRectGetHeight(screenBounds) ;

    if ([self isPortrait]){
        return CGSizeMake(width, height);
    }
    return CGSizeMake(height, width);
}
        
        
        
        
        
        
        
        
            /*//self.dismissButton.frame = CGRectMake((self.view.bounds.size.width + self.view.bounds.size.height/1.5)/2 + 8, 8, 28, 28);
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                self.controllerContainerView.frame = self.view.bounds;
                self.directionalControl.center = CGPointMake(self.directionalControl.frame.size.width/2 + 5, self.view.bounds.size.height/2);
                self.buttonControl.center = CGPointMake(self.view.bounds.size.width-self.directionalControl.frame.size.width/2 - 5, self.view.bounds.size.height/2);
                self.startButton.center = CGPointMake(self.view.bounds.size.width-102, self.view.bounds.size.height-48);
                self.selectButton.center = CGPointMake(self.view.bounds.size.width-102, self.view.bounds.size.height-16);
                self.controllerContainerView.alpha = self.dismissButton.alpha = 1.0;
                self.fpsLabel.frame = CGRectMake(70, 0, 70, 24);
            } else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
                self.controllerContainerView.frame = CGRectMake(0, (self.view.bounds.size.height/2)-150, self.view.bounds.size.width, 300);
                //Could be wrong
                self.directionalControl.center = CGPointMake(self.directionalControl.frame.size.width/2 + 5, self.controllerContainerView.frame.size.height/2);
                self.buttonControl.center = CGPointMake(self.view.bounds.size.width-self.directionalControl.frame.size.width/2 - 5, self.controllerContainerView.frame.size.height/2);
                self.startButton.center = CGPointMake(self.view.bounds.size.width-102, 278);
                self.selectButton.center = CGPointMake(self.view.bounds.size.width-102, 246);
                self.controllerContainerView.alpha = self.dismissButton.alpha = 1.0;
                self.fpsLabel.frame = CGRectMake(185, 5, 70, 24);
            }
            if ([UIScreen screens].count > 1) {
                self.controllerContainerView.alpha = MAX(0.1, [defaults floatForKey:@"controlOpacity"]);
                self.dismissButton.alpha = 1;
            }
            CGFloat glkWidth = [self rectForScreenView:1].size.width;
            self.cheatsButton.center = CGPointMake(self.view.frame.size.width/2 - glkWidth/2 - 70, 20);
            self.speedButton.center = CGPointMake(self.view.frame.size.width/2 + glkWidth/2 + 70, 20);
        } else {
            CGFloat screenOffset = (self.view.frame.size.height - (self.view.bounds.size.width*1.5)) / 2; //Black space at top
            
            CGFloat screenHeight = [self rectForScreenView:1].size.height / 2;
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                self.controllerContainerView.frame = CGRectMake(0, [defaults integerForKey:@"controlPosition"] == 0? screenOffset : screenOffset + screenHeight, self.view.bounds.size.width, self.view.frame.size.height - screenOffset - screenHeight);
                self.startButton.center = CGPointMake((self.view.bounds.size.width/2)-40, self.controllerContainerView.frame.size.height - 20);
                self.selectButton.center = CGPointMake((self.view.bounds.size.width/2)+40, self.controllerContainerView.frame.size.height - 20);
                self.dismissButton.frame = CGRectMake((self.view.bounds.size.width/2)-14, 0, 28, 28);
                self.directionalControl.center = CGPointMake(self.directionalControl.frame.size.width/2 + 5, self.controllerContainerView.frame.size.height - self.directionalControl.frame.size.height/2 - 20);
                self.buttonControl.center = CGPointMake(self.controllerContainerView.frame.size.width-self.directionalControl.frame.size.width/2 - 5, self.controllerContainerView.frame.size.height-self.buttonControl.frame.size.height/2 - 20);
            } else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
                self.controllerContainerView.frame = CGRectMake(0, [defaults integerForKey:@"controlPosition"] == 0? screenOffset : screenOffset + screenHeight, self.view.bounds.size.width, screenHeight);
                self.startButton.center = CGPointMake(25, screenHeight - 30);
                self.selectButton.center = CGPointMake(self.view.bounds.size.width-25, screenHeight - 30);
                self.dismissButton.frame = CGRectMake(self.view.bounds.size.width-35, 5, 28, 28);
                self.directionalControl.center = CGPointMake(self.directionalControl.frame.size.width/2 + 5, self.controllerContainerView.frame.size.height - self.directionalControl.frame.size.height/2 - 40);
                self.buttonControl.center = CGPointMake(self.controllerContainerView.frame.size.width-self.directionalControl.frame.size.width/2 - 5, self.controllerContainerView.frame.size.height-self.buttonControl.frame.size.height/2 - 40);
            }
            self.cheatsButton.center = CGPointMake(self.view.frame.size.width - 64, 20);
            self.speedButton.center = CGPointMake(self.view.frame.size.width - 122, 20);
            self.controllerContainerView.alpha = MAX(0.1, [defaults floatForKey:@"controlOpacity"]);
            self.dismissButton.alpha = 1;
            self.fpsLabel.frame = CGRectMake(6, 0, 70, 24);
            [self.directionalControl frameUpdated];
        }
        self.cheatsButton.alpha = self.speedButton.alpha = self.controllerContainerView.alpha;
        self.cheatsButton.alpha = 0; //Until implemented
        
    }*/


- (CGRect)rectForScreenView:(NSInteger)screen
{
    if (self.windows == 2 && screen == 1) return CGRectZero;
    CGRect rect = CGRectZero;
    BOOL isLandscape = self.view.bounds.size.width > self.view.bounds.size.height;
    if (isLandscape) {
        if (extWindow) {
            rect = CGRectMake(self.view.bounds.size.width - (self.view.bounds.size.width + self.view.bounds.size.height/0.75)/2,
                              0,
                              self.view.bounds.size.height/0.75,
                              self.view.bounds.size.height);
        } else {
            rect = CGRectMake(self.view.bounds.size.width - (self.view.bounds.size.width + self.view.bounds.size.height/1.5)/2,
                              0,
                              self.view.bounds.size.height/1.5,
                              self.view.bounds.size.height);
    } else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        rect = CGRectMake(self.view.bounds.size.width - (self.view.bounds.size.width + self.view.bounds.size.height/1.5)/2,
                          0,
                          self.view.bounds.size.height/1.5,
                          self.view.bounds.size.height);
        if (extWindow) rect.size.height /= 2;
    } else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        rect = CGRectMake(0,
                          (self.view.frame.size.height - (self.view.bounds.size.width*1.5)) / 2,
                          self.view.bounds.size.width,
                          self.view.bounds.size.width*1.5);
        if (extWindow) rect.size.height /= 2;
    }
    
    return rect;
}


-(BOOL) isPortrait
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation);
}





- (CGRect) mainScreenRect
{
    return mainScreenRect[[self isPortrait]];
}



@end
