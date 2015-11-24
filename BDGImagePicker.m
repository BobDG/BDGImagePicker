//
//  BDGImagePicker.h
//
//  Created by Bob de Graaf on 05-04-15.
//  Copyright (c) 2015 GraafICT. All rights reserved.
//

#import "Constants.h"
#import "BDGImagePicker.h"

#define kLocalizedTableName         @"BGIP_Localizable"

@interface BDGImagePicker () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
}

@property(nonatomic) bool statusBarStyleSet;

@end

@implementation BDGImagePicker

#pragma mark Public methods

-(void)pickImageFromViewController:(UIViewController *)viewController
{
    [self pickImageFromViewController:viewController sourceRect:CGRectZero];
}

-(void)pickImageFromViewController:(UIViewController *)viewController sourceRect:(CGRect)sourceRect
{
    NSString *title = self.title ? self.title : @"";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"TakePicture", kLocalizedTableName, @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            UIImagePickerController * picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = self.allowsEditing;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [viewController presentViewController:picker animated:TRUE completion:^{
            }];
        }]];
    }
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"ChoosePicture", kLocalizedTableName, @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = self.allowsEditing;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [viewController presentViewController:picker animated:TRUE completion:^{
        }];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    if(!CGRectIsEmpty(sourceRect)) {
        alertController.popoverPresentationController.sourceView = viewController.view;
        alertController.popoverPresentationController.sourceRect = sourceRect;
    }
    [viewController presentViewController:alertController animated:TRUE completion:nil];
}

-(void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    
    self.statusBarStyleSet = TRUE;
}

#pragma mark UIImagePickerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage = nil;
    //Edited
    if(self.allowsEditing) {
        selectedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    //Original
    if(!selectedImage) {
        selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if(!self.imagePicked) {
        NSLog(@"CRASHING: You haven't set a imagePicked completion block yet....");
        //Will crash now because this is important :)
    }
    self.imagePicked(selectedImage);
    [picker dismissViewControllerAnimated:TRUE completion:^{
        if(self.pickerDismissed) {
            self.pickerDismissed();
        }
    }];
}

#pragma mark UINavigationController delegate methods

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //Necessary for UIImagePickerController
    if(self.statusBarHidden) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    else if(self.statusBarStyleSet) {
        [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle];
    }
}

@end
