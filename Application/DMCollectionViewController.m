//
//  DMColletionViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/27/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMCollectionViewController.h"

@interface DMCollectionViewController ()

@end









@implementation DMCollectionViewController

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
    NSArray *keys = [[NSArray alloc] initWithObjects:@"header", @"title", @"subtitle", @"description", @"subdescription", nil];
//    NSDictionary *projectsContents = [[NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:keys]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    /* protentially set up using Autolayout*/
    
    static NSString * reuseID = @"dropboxCollectionViewCell";
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView
            viewForSupplementaryElementOfKind:(NSString *)kind
                                  atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Not Implemented
    return 1;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Not Implemented
//    return [PAGE_CONTENTS count];
}

#pragma mark - UICollectionViewDelegate

- (BOOL) collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL) collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


@end
