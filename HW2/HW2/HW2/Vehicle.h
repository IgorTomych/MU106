//
//  Vehicle.h
//  HW2
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "Transport.h"

@interface Vehicle : Transport

@property (strong, nonatomic) NSNumber* price;

+ (Vehicle *)vehicleWithName:(NSString*)name andPrice:(NSNumber *)price;

@end
