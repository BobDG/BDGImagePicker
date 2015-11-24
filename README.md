BDGImagePicker
========

Great lightweight wrapper around UIImagePickerController all with 1 line and great completion blocks!

## Installation using Cocoapods
```
pod 'BDGImagePicker'
```

## Usage

//Import
#import <BDGImagePicker.h>

//Instance variable (currently creating a fix so you don't have to do this)
@property(nonatomic,strong) BDGImagePicker *imagePicker;

//Use it from anywhere
self.imagePicker = [BDGImagePicker new];
self.imagePicker.allowsEditing = TRUE;
self.imagePicker.title = NSLocalizedString(@"Photo", @"");
[self.imagePicker setImagePicked:^(UIImage *image) {
    //Do something with the image!
}];
[self.imagePicker pickImageFromViewController:self];