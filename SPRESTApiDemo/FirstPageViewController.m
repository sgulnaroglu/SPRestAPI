//
//  FirstPageViewController.m
//  SPRESTApiDemo
//
//  Created by James Love on 12/12/2012.
//  Copyright (c) 2012 James Love. All rights reserved.
//

#import "FirstPageViewController.h"
#import "AllListsViewController.h"
#import "SPClaimsHelper.h"
#import "SPAuthCookies.h"
#import "SPRESTQuery.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

@synthesize siteUrlField;
@synthesize usernameField;
@synthesize passwordField;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(IBAction)onLoginClick:(id)sender
{
    NSString *site = siteUrlField.text;
    NSString *username = usernameField.text;
    NSString *password = passwordField.text;
    
    SPClaimsHelper *spClaims = [[SPClaimsHelper alloc] initWithUsernamePasswordSite:username password:password site:site];
    [spClaims setDelegate:(id)self];
    [spClaims GetTokens];
}

- (void)tokenDelegate: (SPClaimsToken *)tokenClass didReceiveToken: (int)count
{
    NSLog(@"Tokens received");
    [self performSegueWithIdentifier:@"ShowAllLists" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setSiteUrl:siteUrlField.text];
}
@end
