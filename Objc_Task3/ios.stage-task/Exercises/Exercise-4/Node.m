//
//  Node.m
//  ios.stage-task
//
//  Created by Mary Leshko on 3.11.24.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithValue:(NSNumber *)value {
    self = [super init];
    if (self) {
        _value = value;
        _left = nil;
        _right = nil;
    }
    return self;
}

@end
