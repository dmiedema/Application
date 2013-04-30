//
//  DMTableViewController.m
//  Application
//
//  Created by Daniel Miedema on 4/28/13.
//  Copyright (c) 2013 Daniel Miedema. All rights reserved.
//

#import "DMTableViewController.h"
#import "DMViewController.h"

@interface DMTableViewController ()


// projects
@property (nonatomic, strong) NSMutableArray *projects;
@property (nonatomic, strong) NSMutableDictionary *aGHCProject;
@property (nonatomic, strong) NSMutableDictionary *dropboxCollectionProject;
@property (nonatomic, strong) NSMutableDictionary *counterProject;
@property (nonatomic, strong) NSMutableDictionary *placeToCrashProject;

// about me
@property (nonatomic, strong) NSMutableArray *aboutme_array;
@property (nonatomic, strong) NSMutableDictionary *aboutme;

// skills
@property (nonatomic, strong) NSMutableArray *skills;
@property (nonatomic, strong) NSMutableDictionary *sqlSkills;
@property (nonatomic, strong) NSMutableDictionary *webdevSkills;
@property (nonatomic, strong) NSMutableDictionary *objcSkills;
@property (nonatomic, strong) NSMutableDictionary *otherSkills;

// education
@property (nonatomic, strong) NSMutableArray *education_array;
@property (nonatomic, strong) NSMutableDictionary *education;

// professional background
@property (nonatomic, strong) NSMutableArray *proBackground;
@property (nonatomic, strong) NSMutableDictionary *internshipsProBackground;
@property (nonatomic, strong) NSMutableDictionary *otherProBackground;

// interests
@property (nonatomic, strong) NSMutableArray *interests;
@property (nonatomic, strong) NSMutableDictionary *musicInterests;
@property (nonatomic, strong) NSMutableDictionary *AIInterests;
@property (nonatomic, strong) NSMutableDictionary *UXInterests;

@end

#define PAGE_CONTENTS @[@"Projects", @"About Me", @"Interests", @"Education", @"Professional Background", @"Skills"]

@implementation DMTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // projects
    self.projects = [NSMutableArray array];
    self.aGHCProject = [[NSMutableDictionary alloc] init];
    self.dropboxCollectionProject = [[NSMutableDictionary alloc] init];
    self.counterProject = [[NSMutableDictionary alloc] init];
    self.placeToCrashProject = [[NSMutableDictionary alloc] init];
    // about me
    self.aboutme_array = [NSMutableArray array];
    self.aboutme = [[NSMutableDictionary alloc] init];
    // interets
    self.interests = [NSMutableArray array];
    self.musicInterests = [[NSMutableDictionary alloc] init];
    self.AIInterests = [[NSMutableDictionary alloc] init];
    self.UXInterests = [[NSMutableDictionary alloc] init];
    // education
    self.education_array = [NSMutableArray array];
    self.education = [[NSMutableDictionary alloc] init];
    // pro background
    self.proBackground = [NSMutableArray array];
    self.internshipsProBackground = [[NSMutableDictionary alloc] init];
    self.otherProBackground = [[NSMutableDictionary alloc] init];
    // skills
    self.skills = [NSMutableArray array];
    self.sqlSkills = [[NSMutableDictionary alloc] init];
    self.objcSkills = [[NSMutableDictionary alloc] init];
    self.webdevSkills = [[NSMutableDictionary alloc] init];
    self.otherSkills = [[NSMutableDictionary alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // set dictionary and array values;
    // Projects;
    [[self aGHCProject] setValue:@"aGHC" forKey:DICTIONARY_TITLE];
    [[self aGHCProject] setValue:@"aGitHubClient" forKey:DICTIONARY_SUBTITLE];
    [[self aGHCProject] setValue:@"A fully featured github client for iPhone, at least in concept" forKey:DICTIONARY_DESCRIPTION];
    [[self aGHCProject] setValue:@"Currently this one is a work in progress but development has been going well. Check it out on github!" forKey:DICTIONARY_SUB_DESCRIPTION];
    [[self aGHCProject] setValue:@"https://github.com/dmiedema/aGHC" forKey:@"link"];
    
    [[self dropboxCollectionProject] setValue:@"DropboxCollection" forKey:DICTIONARY_TITLE];
    [[self dropboxCollectionProject] setValue:@"Built at CocoaCamp 2012" forKey:DICTIONARY_SUBTITLE];
    [[self dropboxCollectionProject] setValue:@"Reimplementation of Finder's column view for Dropbox on iPad" forKey:DICTIONARY_DESCRIPTION];
    [[self dropboxCollectionProject] setValue:@"It's actually really awesome." forKey:DICTIONARY_SUB_DESCRIPTION];
    [[self dropboxCollectionProject] setValue:@"https://github.com/dmiedema/dropboxcollection" forKey:@"link"];
    
    [[self counterProject] setValue:@"Counter" forKey:DICTIONARY_TITLE];
    [[self counterProject] setValue:@"hypehypehype" forKey:DICTIONARY_SUBTITLE];
    [[self counterProject] setValue:@"A hype countdown application" forKey:DICTIONARY_DESCRIPTION];
    [[self counterProject] setValue:@"Somes I worry because I can't take anything seriously" forKey:DICTIONARY_SUB_DESCRIPTION];
    [[self counterProject] setValue:@"https://github.com/dmiedema/counter" forKey:@"link"];
    
    [[self placeToCrashProject] setValue:@"PlaceToCrash" forKey:DICTIONARY_TITLE];
    [[self placeToCrashProject] setValue:@"Built with C# and MSSQL" forKey:DICTIONARY_SUBTITLE];
    [[self placeToCrashProject] setValue:@"A property swapping enabling web application" forKey:DICTIONARY_DESCRIPTION];
    [[self placeToCrashProject] setValue:@"Senior group project" forKey:DICTIONARY_SUB_DESCRIPTION];
    [[self placeToCrashProject] setValue:@"http://199.193.232.17/PlaceToCrash" forKey:@"link"];
    
    [[self projects] addObject:[self aGHCProject]];
    [[self projects] addObject:[self dropboxCollectionProject]];
    [[self projects] addObject:[self counterProject]];
    [[self projects] addObject:[self placeToCrashProject]];
    
    // About me;
    [[self aboutme] setValue:@"Daniel Miedema" forKey:DICTIONARY_TITLE];
    [[self aboutme] setValue:@"And why I'm Awesome" forKey:DICTIONARY_SUBTITLE];
    [[self aboutme] setValue:@"I'm currently a senior at Western Oregon University" forKey:DICTIONARY_DESCRIPTION];
    [[self aboutme] setValue:@"Majoring in Computer Science with a minor in Psychology" forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self aboutme_array] addObject:[self aboutme]];
    
    // Interetsts;
    [[self musicInterests] setValue:@"Guitar/Electronic" forKey:DICTIONARY_TITLE];
    [[self musicInterests] setValue:@"My current obsessions" forKey:DICTIONARY_SUBTITLE];
    [[self musicInterests] setValue:@"With school I don't get nearly as much time as I'd like to put towards these endeavours, I try my best to play guitar on a regular basis as it is a passion of mine. I've also recently found that electronic music is fantastic for my concentration when working on projects." forKey:DICTIONARY_DESCRIPTION];
    [[self musicInterests] setValue:@"" forKey:DICTIONARY_SUB_DESCRIPTION];

    [[self AIInterests] setValue:@"Artificial Intelligence" forKey:DICTIONARY_TITLE];
    [[self AIInterests] setValue:@"Computers thinking for themselves" forKey:DICTIONARY_SUBTITLE];
    [[self AIInterests] setValue:@"Artificial intelligence has always intrigued me immensely whether it be a computer being able to solve a problem on its own or being able to understand natural language, I've always loved the idea of artificial intelligence becoming real." forKey:DICTIONARY_DESCRIPTION];
    [[self AIInterests] setValue:@"Through studying artificial intelligence I've found functional programming, which is freakin' sweet. I really have enjoyed the different functional programming languages and aspects of functional programming I've learned." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self UXInterests] setValue:@"User Experience" forKey:DICTIONARY_TITLE];
    [[self UXInterests] setValue:@"Why I like what I like" forKey:DICTIONARY_SUBTITLE];
    [[self UXInterests] setValue:@"User Experience is hard, and I'm not very good at manipulating pixels in photoshop. However usability for the end user is something I try to always be thinking about when I'm designing and building a product." forKey:DICTIONARY_DESCRIPTION];
    [[self UXInterests] setValue:@"A great user experience, at least for me, is almost always harder for me to create than just a usable experience but in the end I feel that is what separates good or decent apps from great and fantastic apps." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self interests] addObject:[self musicInterests]];
    [[self interests] addObject:[self AIInterests]];
    [[self interests] addObject:[self UXInterests]];
    
    // Education;
    [[self education] setValue:@"What I've learned" forKey:DICTIONARY_TITLE];
    [[self education] setValue:@"From a institution at least." forKey:DICTIONARY_SUBTITLE];
    [[self education] setValue:@"Currently I am a senior at Western Oregon University studying Computer Science. Officially Iv'e taken classes on Relational Databases/SQL, Theory of Programming languages, Haskell, Human Machine Interfaces, Theory of Computation, as well as a lot more." forKey:DICTIONARY_DESCRIPTION];
    [[self education] setValue:@"I've also taken a few pretty awesome classes for my minor like cognitive psychology. But I tend to find my computer science courses much more interesting." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self education_array] addObject:[self education]];
    
    // Professional Background;
    [[self internshipsProBackground] setValue:@"Internship" forKey:DICTIONARY_TITLE];
    [[self internshipsProBackground] setValue:@"State Of Oregon" forKey:DICTIONARY_SUBTITLE];
    [[self internshipsProBackground] setValue:@"I am currently, and have been since October 1st, working for the State of Oregon doing software development mostly web applications. I am on what was originally called the 'Business Solutions' team." forKey:DICTIONARY_DESCRIPTION];
    [[self internshipsProBackground] setValue:@"It's been a lot of fun and I've had to learn countless things along the way. I've learned PHP and a whole lot more about javascript. As well as what it's like to use a Linux Workstation primarily for your development environment. I found it's awesome." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self otherProBackground] setValue:@"Other Background" forKey:DICTIONARY_TITLE];
    [[self otherProBackground] setValue:@"This stuff is just as cool." forKey:DICTIONARY_SUBTITLE];
    [[self otherProBackground] setValue:@"In the summer of 2012 I was invited to attend Cocoa Camp where I learned and developed a pretty awesome application with another attendee called DropboxCollection." forKey:DICTIONARY_DESCRIPTION];
    [[self otherProBackground] setValue:@"I've also worked in a helpdesk/computer support style role learning a lot from the average user as to what they see and how they interpret different aspects of applications. That might have contributed to my slight obsession with User Experience." forKey:DICTIONARY_SUB_DESCRIPTION];
    [[self otherProBackground] setValue:@"https://github.com/dmeidema/DropboxCollection" forKey:@"link"];
    
    [[self proBackground] addObject:[self internshipsProBackground]];
    [[self proBackground] addObject:[self otherProBackground]];
    
    // Skills;
    [[self sqlSkills] setValue:@"SQL" forKey:DICTIONARY_TITLE];
    [[self sqlSkills] setValue:@"It's Relational" forKey:DICTIONARY_SUBTITLE];
    [[self sqlSkills] setValue:@"I've utilized MSSQL as well as MySQL quite a bit and have come to, at least I hope, feel like I understand how relational databases work well and how they can be utilized." forKey:DICTIONARY_DESCRIPTION];
    [[self sqlSkills] setValue:@"They are not the most fun thing to set up but once they are, you can do some pretty cool stuff with them." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self webdevSkills] setValue:@"WebDev" forKey:DICTIONARY_TITLE];
    [[self webdevSkills] setValue:@"Bending the Interwebs" forKey:DICTIONARY_SUBTITLE];
    [[self webdevSkills] setValue:@"Most of the things I've built lately has been something for the web if it's not an application for iOS. I've grown to feel much more competent with JavaScript, jQuery, CSS and HTML than I ever was before. I actually prefer to write my websites myself as apposed to frameworks building them for me. I like the creative control that offers." forKey:DICTIONARY_DESCRIPTION];
    [[self webdevSkills] setValue:@"I've also done a decent amount of programming from Drupal 7, most of the programming I was doing for that was server side though, but I was using PHP (since that's all drupal uses pretty much) to build web forms." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self objcSkills] setValue:@"Objective-C" forKey:DICTIONARY_TITLE];
    [[self objcSkills] setValue:@"[self whyItsAwesome];" forKey:DICTIONARY_SUBTITLE];
    [[self objcSkills] setValue:@"After going to cocoa camp and being able to dedicate much more time to Objective-C, especially since my senior project is an iPhone applicaiton, I've really grown to like Objective-C and have begun to feel much more comfortable and at home with the language" forKey:DICTIONARY_DESCRIPTION];
    [[self objcSkills] setValue:@"Also, once I (finally) figured out blocks and Grand Central Dispatch, you can do some really awesome stuff with it." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self otherSkills] setValue:@"Other Skills" forKey:DICTIONARY_TITLE];
    [[self otherSkills] setValue:@"I can do other stuff..." forKey:DICTIONARY_SUBTITLE];
    [[self otherSkills] setValue:@"I've found that is I really like building things and I really like trying new tools and utilities to do so. Such as learning Haskell to solve a challenge from Dropbox (I don't believe it's posted anymore)' And also learning Lisp. While I have my qualms with PHP, I've found it to be pretty good and useful for somethings." forKey:DICTIONARY_DESCRIPTION];
    [[self otherSkills] setValue:@"I'm relatively comfortable with looking at a problem and being willing to learn a new skill set to accomplish what I want to accomplish. I don't know if that counts as a skill or not, but I sure count it as one." forKey:DICTIONARY_SUB_DESCRIPTION];
    
    [[self skills] addObject:[self sqlSkills]];
    [[self skills] addObject:[self webdevSkills]];
    [[self skills] addObject:[self objcSkills]];
    [[self skills] addObject:[self otherSkills]];
    
    NSLog(@"Arrays\n");
    NSLog(@"-----\nProjects %@\n-----", [self projects]);
    NSLog(@"-----\nInterests %@\n-----", [self interests]);
    NSLog(@"-----\nEducation %@\n-----", [self education_array]);
    NSLog(@"-----\nPro %@\n-----", [self proBackground]);
    NSLog(@"-----\nSkills %@\n-----", [self skills]);
} // end viewDidLoad

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [PAGE_CONTENTS count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 73)];
    [label setFont:[UIFont fontWithName:@"Avenir" size:24.0f]];
    [label setText:[PAGE_CONTENTS objectAtIndex:[indexPath row]]];
    [cell addSubview:label];
//    [cell setTag:[indexPath row]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
//#define PAGE_CONTENTS @[@"Projects", @"About Me", @"Interests", @"Education", @"Professional Background", @"Skills"]
    NSLog(@"Selected Item :  %@",[PAGE_CONTENTS objectAtIndex:[indexPath row]]);
    NSString *selectedItem = [PAGE_CONTENTS objectAtIndex:[indexPath row]];
    DMViewController *viewController =[[DMViewController alloc] init];
    if ([selectedItem isEqualToString:@"Projects"]) [viewController setContentsArray:[self projects]];
    else if ([selectedItem isEqualToString:@"About Me"]) [viewController setContentsArray:[self aboutme_array]];
    else if ([selectedItem isEqualToString:@"Interests"]) [viewController setContentsArray:[self interests]];
    else if ([selectedItem isEqualToString:@"Education"]) [viewController setContentsArray:[self education_array]];
    else if ([selectedItem isEqualToString:@"Professional Background"]) [viewController setContentsArray:[self proBackground]];
    else if ([selectedItem isEqualToString:@"Skills"]) [viewController setContentsArray:[self skills]];
    else [viewController setContentsArray:[self aboutme_array]];
    [[self navigationController] pushViewController:viewController animated:YES];
    
}


@end
