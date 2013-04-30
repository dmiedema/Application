//
//  DMColletionViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/27/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMCollectionViewController.h"
#import "DMCollectionViewCellViewController.h"
#import "DMCollectionViewHeaderViewController.h"
#import "DMBackground.h"
#import "DMButtonWithArgs.h"

@interface DMCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *skills;
@property (nonatomic, strong) NSDictionary *sqlSkills;
@property (nonatomic, strong) NSDictionary *webdevSkills;
@property (nonatomic, strong) NSDictionary *objcSkills;
@property (nonatomic, strong) NSDictionary *otherSkills;

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
    NSLog(@"CollectionView, viewDidLoad");
	// Do any additional setup after loading the view.
    /* Background stuff */
//    DMBackground *background = [[DMBackground alloc] init];
//    CAGradientLayer *bgLayer = [background greyGradient];
//    bgLayer.frame = self.view.bounds;
//    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

#define BUTTON_HEIGHT 54
#define LABEL_HEIGHT 54
#define LABEL_WIDTH 200


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    /* protentially set up using Autolayout*/
    NSLog(@"CollectionView - Setting up cells.");
    
    static NSString *reuseID = @"CollectionCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];

    NSDictionary *item = [[self contentsArray] objectAtIndex:[indexPath row]];

//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 240, 420)];
    
//    [scrollView setBackgroundColor:[UIColor clearColor]];
    //// alloc labels/button
    UILabel *titleLabel = [[UILabel alloc] init];
    UILabel *subTitlelabel = [[UILabel alloc] init];
    UILabel *descriptionLabel = [[UILabel alloc] init];
    UILabel *subDescriptionLabel = [[UILabel alloc] init];
    DMButtonWithArgs *linkButton = [[DMButtonWithArgs alloc] init];

    //// Set up label properties
    // title label
//    [[titleLabel layer] setShadowColor:[[UIColor blackColor] CGColor]];
//    [[titleLabel layer] setShadowRadius:1.0f];
//    [[titleLabel layer] setShadowOpacity:1];
//    [[titleLabel layer] setShadowOffset:CGSizeZero];
//    [[titleLabel layer] setMasksToBounds:NO];
    [titleLabel setFont:[UIFont fontWithName:@"Avenir" size:32.0]];
    [titleLabel setAdjustsFontSizeToFitWidth:YES];
    [titleLabel setMinimumScaleFactor:.1];
    [titleLabel setNumberOfLines:1];
    [titleLabel setAdjustsFontSizeToFitWidth:YES];
    [titleLabel setText:[item objectForKey:DICTIONARY_TITLE]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor darkGrayColor]];
    [titleLabel setText:[item objectForKey:DICTIONARY_TITLE]];
    // subtitle label
    [subTitlelabel setFont:[UIFont fontWithName:@"Avenir" size:28.0]];
    [subTitlelabel setLineBreakMode:NSLineBreakByWordWrapping];
    [subTitlelabel setNumberOfLines:0];
    [subTitlelabel setBackgroundColor:[UIColor clearColor]];
    [subTitlelabel setTextColor:[UIColor darkGrayColor]];
    NSString *subtitle = [item objectForKey:DICTIONARY_SUBTITLE];
    CGSize subtitleConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
    CGSize subtitleLabelSize = [subtitle sizeWithFont:[UIFont fontWithName:@"Avenir" size:28.0] constrainedToSize:subtitleConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
    [subTitlelabel setText:subtitle];
    // description label
    [descriptionLabel setFont:[UIFont fontWithName:@"Avenir" size:22.0]];
    [descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [descriptionLabel setNumberOfLines:0];
    [descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [descriptionLabel setTextColor:[UIColor darkGrayColor]];
    NSString *description = [item objectForKey:DICTIONARY_DESCRIPTION];
    CGSize descriptionConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
    CGSize descriptionLabelSize = [subtitle sizeWithFont:[UIFont fontWithName:@"Avenir" size:22.0] constrainedToSize:descriptionConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
    [descriptionLabel setText:description];
    // subdescription label
    [subDescriptionLabel setFont:[UIFont fontWithName:@"Avenir" size:22.0]];
    [subDescriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [subDescriptionLabel setNumberOfLines:0];
    [subDescriptionLabel setBackgroundColor:[UIColor clearColor]];
    [subDescriptionLabel setTextColor:[UIColor darkGrayColor]];
    NSString *subDescription = [item objectForKey:DICTIONARY_DESCRIPTION];
    CGSize subDescriptionConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
    CGSize subDescriptionLabelSize = [subtitle sizeWithFont:[UIFont fontWithName:@"Avenir" size:22.0] constrainedToSize:subDescriptionConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
    [subDescriptionLabel setText:subDescription];
    // link (if set)
    if ([item objectForKey:@"link"]) { // 220x74
        [linkButton setLink:[item objectForKey:@"link"]];
        [linkButton addTarget:self action:@selector(loadWebview:) forControlEvents:UIControlEventTouchUpInside];
        [linkButton setBackgroundImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
        [linkButton setBackgroundImage:[UIImage imageNamed:@"buttonHighlight"] forState:UIControlStateHighlighted];
    }
    int x = 20;
    int y = 0;
    
    [titleLabel setFrame:CGRectMake(x, y, LABEL_WIDTH, LABEL_HEIGHT)];
    y += LABEL_HEIGHT;
    [subTitlelabel setFrame:CGRectMake(x, y, subtitleLabelSize.width, subtitleLabelSize.height)];
    y += subtitleLabelSize.height;
    [descriptionLabel setFrame:CGRectMake(x, y, descriptionLabelSize.width, descriptionLabelSize.height)];
    y += descriptionLabelSize.height;
    [subDescriptionLabel setFrame:CGRectMake(x, y, subDescriptionLabelSize.width, subDescriptionLabelSize.height)];
    y += subDescriptionLabelSize.height;
    [linkButton setFrame:CGRectMake(x, y, 220, 74)];
    
//    [scrollView addSubview:titleLabel];
//    [scrollView addSubview:subTitlelabel];
//    [scrollView addSubview:descriptionLabel];
//    [scrollView addSubview:subDescriptionLabel];
//    
//    [cell addSubview:scrollView];
    [cell addSubview:titleLabel];
     /*UILabel *descriptionLabel = [[UILabel alloc] init];
      [descriptionLabel setFont:defaultFont];
      [descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
      [descriptionLabel setNumberOfLines:0];
      [descriptionLabel setBackgroundColor:[UIColor clearColor]];
      [descriptionLabel setTextColor:[UIColor darkGrayColor]];
      NSString *descrption = ([[self repo] objectForKey:@"description"] != NULL) ? [[self repo] objectForKey:@"description"] : @"" ;
      CGSize constraintSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
      CGSize labelSize = [descrption sizeWithFont:defaultFont constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
      [descriptionLabel setFrame:CGRectMake(x, y, labelSize.width, labelSize.height)];
      [descriptionLabel setText:descrption];
      //
      y += labelSize.height;
      NSLog(@"%f", y);*/
    
    
    
    
//    [cell addSubview:viewController];
    return cell;
}

- (void)loadWebview:(DMButtonWithArgs *)sender {
    
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView
            viewForSupplementaryElementOfKind:(NSString *)kind
                                  atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Not Implemented
    return [[self contentsArray] count];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Not Implemented
    return 1;
}

#pragma mark - UICollectionViewDelegate

- (BOOL) collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL) collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


@end
