//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "MapViewController.h"
#define kURL "http://www.bayareabikeshare.com/stations/json"


@interface StationsListViewController () <UITabBarDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSArray *divvyArray;

@end

@implementation StationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.bayareabikeshare.com/stations/json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (connectionError)
        {
            NSLog(@"Yo you have an error: %@", connectionError.localizedDescription);
        }
        else
        {
            NSDictionary *APIResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

            self.divvyArray = [APIResult objectForKey:@"stationBeanList"];
            [self.tableView reloadData];
            
        }

    }];


}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO:
    return self.divvyArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"forIndexPath:indexPath];
    // TODO:
    NSDictionary *metaDictionary = self.divvyArray[indexPath.row];


    NSString *str = [metaDictionary objectForKey:@"availableBikes"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Available bikes: %@", str];
    cell.textLabel.text = [metaDictionary objectForKey:@"stAddress1"];
//    cell.detailTextLabel.text = [metaDictionary objectForKey:@"availableBikes"];

    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *mapVC = segue.destinationViewController;
    mapVC.bikesArray = [self.divvyArray mutableCopy];

}

@end
