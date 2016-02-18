//
//  UviCollectionCell.m
//  UviTab
//
//  Created by Vignesh on 2/18/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

#import "UviCollectionCell.h"

@implementation UviCollectionCell

// Initialize the collectiion cell based on the frame and add the tap gesture recognizer for custom animation
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    // Custom animation while tap the CollectionCell view.
    UITapGestureRecognizer *tapReconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedCellAnimation)];
    [tapReconizer setNumberOfTouchesRequired : 1];
    [tapReconizer setDelegate:self];
    [self addGestureRecognizer:tapReconizer];
    
    return self;
}

// Initialize the collection cell based on the nscoder and add the tap gesture recognizer for custom animation
-(id) initWithCoder:(NSCoder *)aDecoder {
     self = [super initWithCoder:aDecoder];
    // Custom animation while tap the CollectionCell view.
    UITapGestureRecognizer *tapReconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedCellAnimation)];
    [tapReconizer setNumberOfTouchesRequired : 1];
    [tapReconizer setDelegate:self];
    [self addGestureRecognizer:tapReconizer];
    
     return self;
}

// Initialize the collectiion cell and add the tap gesture recognizer for custom animation
-(id) init {
    self = [super init];
    
    // Custom animation while tap the CollectionCell view.
    UITapGestureRecognizer *tapReconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedCellAnimation)];
    [tapReconizer setNumberOfTouchesRequired : 1];
    [tapReconizer setDelegate:self];
    [self addGestureRecognizer:tapReconizer];
    
    return self;
}

// Customize the animation while tap the UICollectionViewCell with custom animation duration.
- (void)selectedCellAnimation {
    [UIView animateWithDuration:0.4 delay:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        CALayer *layer = self.layer;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 25.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
        layer.transform = rotationAndPerspectiveTransform;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            CALayer *layer = self.layer;
            CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
            rotationAndPerspectiveTransform.m24 = 0;
            rotationAndPerspectiveTransform =CATransform3DRotate(rotationAndPerspectiveTransform, 0.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
            layer.transform = rotationAndPerspectiveTransform;
        } completion:nil];
    }];
}

@end
