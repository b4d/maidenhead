//
//  Maidenhead.h
//  maidenhead
//
//  Created by Deni Bacic on 25. 01. 13.
//  Copyright (c) 2013 Deni Bacic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Maidenhead : NSObject

typedef struct {
	double lat;
	double lon;
} Coordinates;

+ (NSString *) toMaidenhead: (double) lat: (double) lon;
+ (Coordinates) fromMaidenhead: (NSString *) maidenhead;
@end

