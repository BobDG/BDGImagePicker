//
//  ViewController.m
//  Example
//
//  Created by Bob de Graaf on 10-11-16.
//  Copyright © 2016 GraafICT. All rights reserved.
//

#import "ViewController.h"
#import "BDGImagePicker.h"

@interface ViewController ()
{
    
}

@property(nonatomic,strong) BDGImagePicker *imagePicker;
@property(nonatomic,weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)pickImage:(id)sender
{
    if(!self.imagePicker) {
        self.imagePicker = [[BDGImagePicker alloc] initWithAllowsEditing:TRUE];
    }
    [self.imagePicker pickImageFromViewController:self sourceRect:self.imageView.bounds imagePicked:^(UIImage *image) {
        self.imageView.image = image;
    }];
}


@end
