//
//  SSTViewController.m
//  DrawingRoundedCorners
//
//  Created by Brennan Stehling on 6/24/14.
//  Copyright (c) 2014 SmallSharpTools. All rights reserved.
//

#import "SSTViewController.h"

#define kDEBUG 1

@interface SSTViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SSTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (UIImage *)drawSquare:(CGSize)size {
    CGFloat borderRadius = 25;
    CGFloat strokeWidth = 3;
    
    CGFloat left = strokeWidth;
    CGFloat right = size.width - strokeWidth;
    CGFloat top = strokeWidth;
    CGFloat bottom = size.height - strokeWidth;
    
    CGPoint pointA = CGPointMake(left, top + borderRadius);
    CGPoint pointB = CGPointMake(left + borderRadius, top);
    CGPoint pointC = CGPointMake(right - borderRadius, top);
    CGPoint pointD = CGPointMake(right, top + borderRadius);
    CGPoint pointE = CGPointMake(right, bottom - borderRadius);
    CGPoint pointF = CGPointMake(right - borderRadius, bottom);
    CGPoint pointG = CGPointMake(left + borderRadius, bottom);
    CGPoint pointH = CGPointMake(left, bottom - borderRadius);
    
#ifdef kDEBUG
    [self logPoint:pointA withLabel:@"A"];
    [self logPoint:pointB withLabel:@"B"];
    [self logPoint:pointC withLabel:@"C"];
    [self logPoint:pointD withLabel:@"D"];
    [self logPoint:pointE withLabel:@"E"];
    [self logPoint:pointF withLabel:@"F"];
    [self logPoint:pointG withLabel:@"G"];
    [self logPoint:pointH withLabel:@"H"];
#endif
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextBeginPath(context);
    
//    square
    CGContextMoveToPoint(context, strokeWidth, strokeWidth);
    CGContextAddLineToPoint(context, size.width - strokeWidth, strokeWidth);
    CGContextAddLineToPoint(context, size.width - strokeWidth, size.height - strokeWidth);
    CGContextAddLineToPoint(context, strokeWidth, size.height - strokeWidth);
    CGContextAddLineToPoint(context, strokeWidth, strokeWidth);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)drawOctogon:(CGSize)size {
    CGFloat borderRadius = 25;
    CGFloat strokeWidth = 3;
    
    CGFloat left = strokeWidth;
    CGFloat right = size.width - strokeWidth;
    CGFloat top = strokeWidth;
    CGFloat bottom = size.height - strokeWidth;
    
    CGPoint pointA = CGPointMake(left, top + borderRadius);
    CGPoint pointB = CGPointMake(left + borderRadius, top);
    CGPoint pointC = CGPointMake(right - borderRadius, top);
    CGPoint pointD = CGPointMake(right, top + borderRadius);
    CGPoint pointE = CGPointMake(right, bottom - borderRadius);
    CGPoint pointF = CGPointMake(right - borderRadius, bottom);
    CGPoint pointG = CGPointMake(left + borderRadius, bottom);
    CGPoint pointH = CGPointMake(left, bottom - borderRadius);
    
#ifdef kDEBUG
    [self logPoint:pointA withLabel:@"A"];
    [self logPoint:pointB withLabel:@"B"];
    [self logPoint:pointC withLabel:@"C"];
    [self logPoint:pointD withLabel:@"D"];
    [self logPoint:pointE withLabel:@"E"];
    [self logPoint:pointF withLabel:@"F"];
    [self logPoint:pointG withLabel:@"G"];
    [self logPoint:pointH withLabel:@"H"];
#endif
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextBeginPath(context);
    
//    octogon
    CGContextMoveToPoint(context, pointA.x, pointA.y);
    CGContextAddLineToPoint(context, pointB.x, pointB.y);
    CGContextAddLineToPoint(context, pointC.x, pointC.y);
    CGContextAddLineToPoint(context, pointD.x, pointD.y);
    CGContextAddLineToPoint(context, pointE.x, pointE.y);
    CGContextAddLineToPoint(context, pointF.x, pointF.y);
    CGContextAddLineToPoint(context, pointG.x, pointG.y);
    CGContextAddLineToPoint(context, pointH.x, pointH.y);
    CGContextAddLineToPoint(context, pointA.x, pointA.y);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)drawRoundedCorners:(CGSize)size position:(CGFloat)position {
    CGFloat borderRadius = 5;
    CGFloat strokeWidth = 3;

    return [self drawRoundedCorners:size position:position borderRadius:borderRadius strokeWidth:strokeWidth];
}

- (UIImage *)drawRoundedCorners:(CGSize)size position:(CGFloat)position borderRadius:(CGFloat)borderRadius strokeWidth:(CGFloat)strokeWidth {
    CGSize arrowSize = CGSizeMake(20, 15);
    
    CGFloat left = strokeWidth;
    CGFloat right = size.width - strokeWidth;
    CGFloat top = strokeWidth;
    CGFloat bottom = size.height - strokeWidth - arrowSize.height;
    
    CGPoint point1 = CGPointMake(left, top);
    CGPoint point2 = CGPointMake(right, top);
    CGPoint point3 = CGPointMake(right, bottom);
    CGPoint point4 = CGPointMake(left, bottom);
    
    CGPoint pointA = CGPointMake(left, top + borderRadius);
    CGPoint pointB = CGPointMake(left + borderRadius, top);
    CGPoint pointC = CGPointMake(right - borderRadius, top);
    CGPoint pointD = CGPointMake(right, top + borderRadius);
    CGPoint pointE = CGPointMake(right, bottom - borderRadius);
    CGPoint pointF = CGPointMake(right - borderRadius, bottom);
    CGPoint pointG = CGPointMake(left + borderRadius, bottom);
    CGPoint pointH = CGPointMake(left, bottom - borderRadius);
    
    CGFloat arrowMiddle = size.width * position;
    CGPoint arrowLeftBase = CGPointMake(arrowMiddle - (arrowSize.width/2), bottom);
    CGPoint arrowRightBase = CGPointMake(arrowMiddle + (arrowSize.width/2), bottom);
    CGPoint arrowPoint = CGPointMake(arrowMiddle, bottom + arrowSize.height);
    
#ifdef kDEBUG
    [self logPoint:point1 withLabel:@"1"];
    [self logPoint:point2 withLabel:@"2"];
    [self logPoint:point3 withLabel:@"3"];
    [self logPoint:point4 withLabel:@"4"];
    
    [self logPoint:pointA withLabel:@"A"];
    [self logPoint:pointB withLabel:@"B"];
    [self logPoint:pointC withLabel:@"C"];
    [self logPoint:pointD withLabel:@"D"];
    [self logPoint:pointE withLabel:@"E"];
    [self logPoint:pointF withLabel:@"F"];
    [self logPoint:pointG withLabel:@"G"];
    [self logPoint:pointH withLabel:@"H"];
    
    NSLog(@"arrow middle: %f", arrowMiddle);
    [self logPoint:arrowLeftBase withLabel:@"arrow left base"];
    [self logPoint:arrowRightBase withLabel:@"arrow right base"];
    [self logPoint:arrowPoint withLabel:@"arrow point"];
#endif
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, strokeWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, pointB.x, pointB.y);
    
    // CGContextAddArcToPoint
    // Note: the first point is where the hard corner would be without corner radius and the 2nd point is where the line ends
    
    CGContextAddArcToPoint(context, point2.x, point2.y, pointD.x, pointD.y, borderRadius);
    CGContextAddArcToPoint(context, point3.x, point3.y, pointF.x, pointF.y, borderRadius);
    
    if (position > 0) {
    
        // line from F to right arrow base
        CGContextAddLineToPoint(context, arrowRightBase.x, arrowRightBase.y);
        // line from right arrow base to arrow point
        CGContextAddLineToPoint(context, arrowPoint.x, arrowPoint.y);
        // line from arrow point to left arrow base
        CGContextAddLineToPoint(context, arrowLeftBase.x, arrowLeftBase.y);
        // line from left arrow base to G
        CGContextAddLineToPoint(context, pointG.x, pointG.y);
        
    }
    
    CGContextAddArcToPoint(context, point4.x, point4.y, pointH.x, pointH.y, borderRadius);
    CGContextAddArcToPoint(context, point1.x, point1.y, pointB.x, pointB.y, borderRadius);
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)logPoint:(CGPoint)point withLabel:(NSString *)label {
#ifdef kDEBUG
    NSLog(@"%@: %f, %f", label, point.x, point.y);
#endif
}

#pragma mark - UICollectionViewDataSource
#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DrawingCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    CGSize size = CGSizeMake(100, 100);
    
    switch (indexPath.item) {
        case 0:
            imageView.image = [self drawSquare:size];
            break;
            
        case 1:
            imageView.image = [self drawOctogon:size];
            break;
            
        case 2:
            imageView.image = [self drawRoundedCorners:size position:0.0];
            break;
            
        case 3:
            imageView.image = [self drawRoundedCorners:size position:0.3];
            break;
            
        case 4:
            imageView.image = [self drawRoundedCorners:size position:0.5];
            break;
            
        case 5:
            imageView.image = [self drawRoundedCorners:size position:0.7];
            break;
            
        case 6:
            imageView.image = [self drawRoundedCorners:size position:0.2];
            break;
            
        case 7:
            imageView.image = [self drawRoundedCorners:size position:0.8];
            break;
            
        case 8:
            imageView.image = [self drawRoundedCorners:size position:0.4 borderRadius:5 strokeWidth:2];
            break;
            
        case 9:
            imageView.image = [self drawRoundedCorners:size position:0.5 borderRadius:9 strokeWidth:2];
            break;
            
        case 10:
            imageView.image = [self drawRoundedCorners:size position:0.6 borderRadius:6 strokeWidth:3];
            break;
            
        case 11:
            imageView.image = [self drawRoundedCorners:size position:0.7 borderRadius:3 strokeWidth:1];
            break;
            
        default:
            imageView.image = nil;
            break;
    }
    
    
//     [self drawRoundedCorners:size position:position borderRadius:borderRadius strokeWidth:strokeWidth];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
#pragma mark -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
