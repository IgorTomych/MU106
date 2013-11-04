//
//  Test.m
//  MRRSample
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "Test.h"

@implementation Test



+(Test *)testWithString:(NSString *)someString {
    
    Test* testObject = [[Test alloc] init];
    
    
    
    NSObject* myString = [[NSObject alloc] init];
    
//    testObject.weakString = myString;
    
    [myString release];
//    [myString release];
    
    
    return [testObject autorelease];
}


//-(void)setWeakString:(NSString *)weakString {
//    _weakString = weakString;
//    [_weakString release];
//}
//
//-(NSString *)weakString {
//    return _weakString;
//}


-(void)showRetainCount {
    NSLog(@"%@ %d", self, self.retainCount);
}
@end
