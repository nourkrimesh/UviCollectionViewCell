//
//  UviViewController.h
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UviViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *uviCollectionView;


@end

