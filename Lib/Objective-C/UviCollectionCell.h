//
//  UviCollectionCell.h
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UviCollectionCell : UICollectionViewCell<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;
@property (strong, nonatomic) IBOutlet UILabel *cellTitle;

@end
