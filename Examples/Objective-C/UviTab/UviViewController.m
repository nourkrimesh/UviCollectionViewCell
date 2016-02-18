//
//  UviViewController.m
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import "UviViewController.h"
#import "UviCollectionCell.h"


@interface UIColor (randomColor)

+ (UIColor *)randomColor;

@end

@implementation UIColor (randomColor)

+ (UIColor *)randomColor {
    
    CGFloat compinations[3];
    
    for (int i = 0; i < 3; i++) {
        NSUInteger r = arc4random_uniform(256);
        compinations[i] = (CGFloat)r/255.f;
    }
    
    return [UIColor colorWithRed:compinations[0] green:compinations[1] blue:compinations[2] alpha:1.0];
}

@end

@interface UviViewController ()

@end

@implementation UviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

// pass a param to describe the state change, an animated flag and a completion block matching UIView animations completion
- (void)setTabBarVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    
    // bail if the current state matches the desired state
    if ([self tabBarIsVisible] == visible) return completion(YES);
    
    // get a frame calculation ready
    CGFloat theight = self.tabBarController.tabBar.frame.size.height;
    CGFloat toffsetY = (visible)? -theight : theight;

    
    // zero duration means no animation
    CGFloat duration = (animated)? 0.3 : 0.0;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect tframe = self.tabBarController.tabBar.frame;
        self.tabBarController.tabBar.frame = CGRectOffset(tframe, 0, toffsetY);
    } completion:completion];
}

// know the current state
- (BOOL)tabBarIsVisible {
    return self.tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame);
}

// pass a param to describe the state change, an animated flag and a completion block matching UIView animations completion
- (void)setNavigationBarVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    
    // bail if the current state matches the desired state
    if ([self navigationBarIsVisible] == visible) return completion(YES);
    
    // get a frame calculation ready
    CGFloat nheight = self.navigationController.navigationBar.frame.size.height;
    CGFloat noffsetY = (visible)? -nheight : nheight;
    
    // zero duration means no animation
    CGFloat duration = (animated)? 0.3 : 0.0;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect nframe = self.navigationController.navigationBar.frame;
        self.navigationController.navigationBar.frame = CGRectOffset(nframe, 0, noffsetY);
    } completion:completion];
}

// know the current state
- (BOOL)navigationBarIsVisible {
    return self.navigationController.navigationBar.frame.origin.y < CGRectGetMinY(self.view.frame);
}

#pragma mark – UICollectionViewDelegateFlowLayout


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval = CGSizeMake(90, 90);
    return retval;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UviCollectionCell *cell = (UviCollectionCell *)  [cv dequeueReusableCellWithReuseIdentifier:@"collection_cell" forIndexPath:indexPath];
    [cell.cellImageView setBackgroundColor: [UIColor randomColor]];
    [cell.cellTitle setText:[NSString stringWithFormat:@"S %ld - R %ld",(long)indexPath.section,(long)indexPath.row]];
    
    //cell.backgroundColor = [UIColor randomColor];
    return cell;
}


#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 12;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    if (indexPath.row %2 == 0) {
            [self setTabBarVisible:![self tabBarIsVisible] animated:YES completion:^(BOOL finished) {
                NSLog(@"tab bar finished");
            }];
        
            [self setNavigationBarVisible:![self navigationBarIsVisible] animated:YES completion:^(BOOL finished) {
                NSLog(@"navigation bar finished");
            }];
    }
    
    UviCollectionCell *uviCollectionCell = (UviCollectionCell *) [collectionView cellForItemAtIndexPath:indexPath];    
    UIColor *radColor = uviCollectionCell.backgroundColor;
    
    // for background color
    [self.navigationController.navigationBar setBarTintColor:radColor];
    [[UINavigationBar appearance] setBarTintColor:radColor];
    [self.tabBarController.tabBar setBarTintColor:radColor]; 
    [[UITabBar appearance] setBarTintColor:radColor];
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
    

}


// illustration of a call to toggle current state
- (IBAction)pressedButton:(id)sender {
    [self setTabBarVisible:![self tabBarIsVisible] animated:YES completion:^(BOOL finished) {
        NSLog(@"tab bar finished");
    }];
    
    [self setNavigationBarVisible:![self navigationBarIsVisible] animated:YES completion:^(BOOL finished) {
        NSLog(@"navigation bar finished");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
