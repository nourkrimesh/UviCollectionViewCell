//
//  UviTabBarController.h
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UviTabBar.h"

@interface UviTabBarController : UITabBarController<UITabBarControllerDelegate,UITabBarDelegate
>
@property (strong, nonatomic) IBOutlet UITabBar *uviTabBar;


@end
