//
//  DMViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/26/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMViewController.h"

@interface DMViewController ()
@property (nonatomic, strong) IBOutlet UILabel *projectsLabel;
@property (nonatomic, strong) IBOutlet UILabel *aboutLabel;
@property (nonatomic, strong) IBOutlet UILabel *interestsLabel;
@property (nonatomic, strong) IBOutlet UILabel *educationLabel;
@property (nonatomic, strong) IBOutlet UILabel *professionalLabel;
@property (nonatomic, strong) IBOutlet UILabel *skillsLabel;


@property (nonatomic, strong) IBOutlet UILabel *contentLabel;

@end

@implementation DMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // scroll view to hold it all
    // label to describe
    // button to view more (optional)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
