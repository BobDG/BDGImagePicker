//
//  BDGImagePicker.h
//
//  Created by Bob de Graaf on 05-04-15.
//  Copyright (c) 2015 GraafICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BDGImagePicker : NSObject
{
    
}

//Optional properties
@property(nonatomic) bool allowsEditing;
@property(nonatomic) bool statusBarHidden;
@property(nonatomic,strong) NSString *title;
@property(nonatomic) UIStatusBarStyle statusBarStyle;

//Completion blocks
@property(nonatomic, copy) void (^pickerDismissed)(void);
@property(nonatomic, copy) void (^imagePicked)(UIImage *image);

//Pick image method
-(void)pickImageFromViewController:(UIViewController *)viewController;
-(void)pickImageFromViewController:(UIViewController *)viewController sourceRect:(CGRect)sourceRect;

@end