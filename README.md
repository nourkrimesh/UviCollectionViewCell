# UviCollectionViewCell

Easily create a custom UICollectionViewCell class with custom the animation while tap the UICollectionViewCell.
So, You don't need to add any specific method/action for the animation. 

##Features :

    1. Integrate with Storyboard.
    2. Custom animation while tap a cell.
    3. Demo Sample project.
    4. Screenshots.


####1. Integrate with Storyboard

    -   In storyboard - Add a UICollectionViewCell with cell identifier, UIImageView and UILabel.
    -   Assign both UIImageView and UILabel property to Storyboard cell.
    -   Import the 'UviCollectionCell.h' in your view controller.

```js

    - (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        
            UviCollectionCell *cell = (UviCollectionCell *)  [cv dequeueReusableCellWithReuseIdentifier:@"collection_cell" forIndexPath:indexPath];
            [cell.cellImageView setBackgroundColor: [UIColor randomColor]];
            // You can add your image here.
            cell.cellImageView.image = [UIImage imageNamed:[photoURLs objectAtIndex:indexPath.row]];
            [cell.cellTitle setText:[NSString stringWithFormat:@"S %ld - R %ld",(long)indexPath.section,(long)indexPath.row]];
            
            //cell.backgroundColor = [UIColor randomColor];
            return cell;
    } 

```

####2. Custom animation while tap a cell.

    Animation done using following UIViewAnimationOption options 
    -   UIViewAnimationOptionCurveEaseIn
    -   UIViewAnimationOptionCurveEaseOut
    -   UIViewAnimationOptionAllowUserInteraction

```js
    
    [UIView animateWithDuration:0.4 delay:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        NSLog(@"animation start");
        CALayer *layer = uviCollectionCell.layer;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 15.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
        layer.transform = rotationAndPerspectiveTransform;
    } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
                NSLog(@"animation end");
                CALayer *layer = uviCollectionCell.layer;
                CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
                rotationAndPerspectiveTransform.m24 = 0;
                rotationAndPerspectiveTransform =CATransform3DRotate(rotationAndPerspectiveTransform, 0.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
                layer.transform = rotationAndPerspectiveTransform;
            } completion:nil];
        }
];


```


####3. Demo Sample project

    Demo project is helpful to integrate the UviCollectionCell with your project.


####4. Screenshots    


![alt text][screenshot_1]

[screenshot_1]: https://github.com/vigneshuvi/UviCollectionViewCell/blob/master/Screenshots/screenshot_1.png


___

#### Do you like it?

Do you like this repo? Share it on Twitter, Facebook, Google+ or anywhere you like so that more of us can use it and help. Thanks!

Created by [Vignesh](http://vigneshuvi.github.io/) 

![alt text][logo]

[logo]: https://github.com/vigneshuvi/vigneshuvi.github.io/blob/master/favicon.ico/android-icon-48x48.png
