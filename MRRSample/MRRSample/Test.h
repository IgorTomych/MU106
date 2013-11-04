//
//  Test.h
//  MRRSample
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject {
    NSString* _weakString;
}


@property (assign, nonatomic) id<NSObject> delegate;

+(Test *)testWithString:(NSObject *)someString;


-(void)showRetainCount;
@end
