//
//  DMViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/26/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMViewController.h"
#import "DMButtonWithArgs.h"
#import "DMBackground.h"

@interface DMViewController ()

@end

@implementation DMViewController

#define BUTTON_HEIGHT 74
#define LABEL_HEIGHT 54
#define LABEL_WIDTH 280

- (void)viewDidLoad
{
    NSLog(@"DMViewController - viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // scroll view to hold it all
    // label to describe
    // button to view more (optional)
    DMBackground *background = [[DMBackground alloc] init];
    CAGradientLayer *bgLayer = [background greyGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
//    NSDictionary *item = [[self contentsArray] objectAtIndex:[indexPath row]];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    int x = 20;
    int y = 0;
    
    for (NSDictionary *item in [self contentsArray]) {
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
//        [titleLabel setText:[item objectForKey:DICTIONARY_TITLE]];
        // subtitle label
        [subTitlelabel setFont:[UIFont fontWithName:@"Avenir" size:28.0]];
        [subTitlelabel setLineBreakMode:NSLineBreakByWordWrapping];
        [subTitlelabel setNumberOfLines:0];
        [subTitlelabel setBackgroundColor:[UIColor clearColor]];
        [subTitlelabel setTextColor:[UIColor darkGrayColor]];
        [subTitlelabel setTextAlignment:NSTextAlignmentRight];
        NSString *subtitle = [item objectForKey:DICTIONARY_SUBTITLE];
        CGSize subtitleConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
        CGSize subtitleLabelSize = [subtitle sizeWithFont:[UIFont fontWithName:@"Avenir" size:28.0] constrainedToSize:subtitleConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
        [subTitlelabel setText:subtitle];
        // description label
        [descriptionLabel setFont:[UIFont fontWithName:@"Avenir" size:24.0]];
        [descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [descriptionLabel setNumberOfLines:0];
        [descriptionLabel setBackgroundColor:[UIColor clearColor]];
        [descriptionLabel setTextColor:[UIColor darkGrayColor]];
        NSString *description = [item objectForKey:DICTIONARY_DESCRIPTION];
        CGSize descriptionConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
        CGSize descriptionLabelSize = [description sizeWithFont:[UIFont fontWithName:@"Avenir" size:22.0] constrainedToSize:descriptionConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
        [descriptionLabel setText:description];
        // subdescription label
        [subDescriptionLabel setFont:[UIFont fontWithName:@"Avenir" size:20.0]];
        [subDescriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [subDescriptionLabel setNumberOfLines:0];
        [subDescriptionLabel setBackgroundColor:[UIColor clearColor]];
        [subDescriptionLabel setTextColor:[UIColor darkGrayColor]];
        [subDescriptionLabel setTextAlignment:NSTextAlignmentRight];
        NSString *subDescription = [item objectForKey:DICTIONARY_SUB_DESCRIPTION];
        CGSize subDescriptionConstrainSize = CGSizeMake(LABEL_WIDTH, MAXFLOAT);
        CGSize subDescriptionLabelSize = [subDescription sizeWithFont:[UIFont fontWithName:@"Avenir" size:22.0] constrainedToSize:subDescriptionConstrainSize lineBreakMode:NSLineBreakByWordWrapping];
        [subDescriptionLabel setText:subDescription];
        // link (if set)
        BOOL button = NO;
        if ([item objectForKey:@"link"] != NULL) { // 220x74
            [linkButton setLink:[item objectForKey:@"link"]];
            [linkButton addTarget:self action:@selector(loadWebview:) forControlEvents:UIControlEventTouchUpInside];
            [linkButton setBackgroundImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
            [linkButton setBackgroundImage:[UIImage imageNamed:@"buttonHighlight"] forState:UIControlStateHighlighted];
            [linkButton setFrame:CGRectMake(x, y, 220, 74)];
            button = YES;
        }
        
        
        [titleLabel setFrame:CGRectMake(x, y, LABEL_WIDTH, LABEL_HEIGHT)];
        y += LABEL_HEIGHT;
        [subTitlelabel setFrame:CGRectMake(x, y, subtitleLabelSize.width, subtitleLabelSize.height)];
        y += subtitleLabelSize.height;
        [descriptionLabel setFrame:CGRectMake(x, y, descriptionLabelSize.width, descriptionLabelSize.height)];
        y += descriptionLabelSize.height;
        [subDescriptionLabel setFrame:CGRectMake(x, y, subDescriptionLabelSize.width, subDescriptionLabelSize.height)];
        y += subDescriptionLabelSize.height;
        [linkButton setFrame:CGRectMake(x, y, 220, 74)];
        if (button) y += 74;
        
        [scrollView addSubview:titleLabel];
        [scrollView addSubview:subTitlelabel];
        [scrollView addSubview:descriptionLabel];
        [scrollView addSubview:subDescriptionLabel];
        if (button) [scrollView addSubview:linkButton];
        y += 44;
    }
    
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, y)];
    [[self view] addSubview:scrollView];

}
- (void)loadWebview:(DMButtonWithArgs *)sender {
    NSLog(@"WHOA LAOD IT");
    NSLog(@"Link %@", [sender link]);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[sender link]]];
    UIWebView *webview = [[UIWebView alloc] init];
    [webview loadRequest:request];
    [webview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [webview setScalesPageToFit:YES];
    UIViewController *viewController = [[UIViewController alloc] init];
    [viewController setView:webview];
    [[self navigationController] pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
