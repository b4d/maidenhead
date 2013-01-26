//
//  Maidenhead.m
//  maidenhead
//
//  Created by Deni Bacic on 25. 01. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import "Maidenhead.h"
//#import "Coordinates.h"

@implementation Maidenhead



+ (NSString *) toMaidenhead: (double) lat: (double) lon {
    
    lon = lon + 180;
    lat = lat + 90;
    
    int a1,a2,a3,a4,a5,a6;
    
    
    a1 = (int)'A' + (int) (lon / 20);
    a2 = (int)'A' + (int) (lat / 10);
    a3 = (int)'0' + (int) (((int) lon % 20) / 2);
    a4 = (int)'0' + (int) (((int) lat % 10) / 1);
    a5 = (int)'a' + (int) ((lon - (int)((lon / 2) * 2)) / 0.0833333333);
    a6 = (int)'a' + (int) ((lat - (int)((lat / 1) * 1)) / 0.0416666667);
    
    return [NSString stringWithFormat:@"%c%c%c%c%c%c", a1,a2,a3,a4,a5,a6];
}


+ (Coordinates) fromMaidenhead: (NSString *) maidenhead {
    
    Coordinates coordinates;

    coordinates.lon = (((int)[maidenhead characterAtIndex:0] - (int)'A') * 20) - 180;
    coordinates.lat = (((int)[maidenhead characterAtIndex:1] - (int)'A') * 10) - 90;
    coordinates.lon += ((int)[maidenhead characterAtIndex:2] - (int)'0') * 2;
    coordinates.lat += ((int)[maidenhead characterAtIndex:3] - (int)'0') * 1;
    
    if ([maidenhead length] >= 5) {
        coordinates.lon += ((int)[maidenhead characterAtIndex:4] - (int)'a') * 0.0833333333;
        coordinates.lat += ((int)[maidenhead characterAtIndex:5] - (int)'a') * 0.0416666667;
        
        coordinates.lon += 0.0416666667;
        coordinates.lat += 0.0208333333;
        
    } else {
        coordinates.lon += 1;
        coordinates.lat += 0.5;
    }
    
    
    return coordinates;
}

@end









