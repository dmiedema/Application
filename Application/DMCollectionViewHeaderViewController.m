//
//  DMCollectionViewHeaderViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/29/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMCollectionViewHeaderViewController.h"

@interface DMCollectionViewHeaderViewController ()

@end

@implementation DMCollectionViewHeaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *headerlabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 20, 44, 500)];
    [headerlabel setLineBreakMode:NSLineBreakByCharWrapping];
    [headerlabel setNumberOfLines:0];
    [headerlabel setFont:[UIFont fontWithName:@"Avenir" size:34.0f]];
    [headerlabel setText:[self header]];
    [[self view] addSubview:headerlabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
