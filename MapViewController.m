//
//  MapViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    CLLocationCoordinate2D center = location;
//    MKCoordinateSpan coordinateSpan;
//    coordinateSpan.latitudeDelta = .2;
//    coordinateSpan.longitudeDelta = .2;
//    MKCoordinateRegion region = MKCoordinateRegionMake(center, coordinateSpan);
//    [self.mapView setRegion:region animated:YES];
}

@end
