#import "LevelOrderTraversal.h"
#import "Node.h"

Node *buildTreeFromArray(NSArray *array, NSInteger *index);
NSArray *LevelOrderTraversalForTree(NSArray *tree);

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    if (tree.count == 0) {
        return @[];
    }

    NSInteger index = 0;
    Node *rootNode = buildTreeFromArray(tree, &index);

    if (!rootNode) {
        return @[];
    }

    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *queue = [NSMutableArray arrayWithObject:rootNode];

    while (queue.count > 0) {
        NSMutableArray *elementsOfCurrentLevel = [NSMutableArray new];

        for (Node *node in [queue copy]) {
            [queue removeObjectAtIndex:0];

            [elementsOfCurrentLevel addObject:node.value];

            if (node.left) {
                [queue addObject:node.left];
            }
            if (node.right) {
                [queue addObject:node.right];
            }
        }

        [result addObject:[elementsOfCurrentLevel copy]];
    }

    return [result copy];
}

Node *buildTreeFromArray(NSArray *array, NSInteger *index) {
    if (*index >= array.count) {
        return nil;
    }

    if (array[*index] == [NSNull null]) {
        (*index)++;
        return nil;
    }

    Node *node = [[Node alloc] initWithValue:array[*index]];
    (*index)++;
    node.left = buildTreeFromArray(array, index);
    node.right = buildTreeFromArray(array, index);

    return node;
}
