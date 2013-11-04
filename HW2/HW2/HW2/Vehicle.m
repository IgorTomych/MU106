//
//  Vehicle.m
//  HW2
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

+ (Vehicle *)vehicleWithName:(NSString*)name andPrice:(NSNumber *)price {
    
    Vehicle* result = [[Vehicle alloc] init];
    
    result.name = name;
    result.price = price;
    
    return result;
}
@end
