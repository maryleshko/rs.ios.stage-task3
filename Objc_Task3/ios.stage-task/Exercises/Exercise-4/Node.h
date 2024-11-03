//
//  Node.h
//  ios.stage-task
//
//  Created by Mary Leshko on 3.11.24.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;

- (instancetype)initWithValue:(NSNumber *)value;

@end
