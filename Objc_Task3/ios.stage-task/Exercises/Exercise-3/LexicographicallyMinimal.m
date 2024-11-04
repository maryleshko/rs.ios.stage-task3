#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSInteger firstIndex = 0;
    NSInteger secondIndex = 0;
    NSInteger firstLength = string1.length;
    NSInteger secondLength = string2.length;

    NSMutableString *resultString = [NSMutableString string];

    while (firstIndex < firstLength && secondIndex < secondLength) {
        NSString *firstSubstring = [string1 substringWithRange:NSMakeRange(firstIndex, 1)];
        NSString *secondSubstring = [string2 substringWithRange:NSMakeRange(secondIndex, 1)];

        NSComparisonResult result = [firstSubstring compare:secondSubstring];

        if (result == NSOrderedAscending || result == NSOrderedSame) {
            [resultString appendString:firstSubstring];
            firstIndex++;
        } else {
            [resultString appendString:secondSubstring];
            secondIndex++;
        }
    }

    if (firstIndex < firstLength) {
        [resultString appendString:[string1 substringFromIndex:firstIndex]];
    } else if (secondIndex < secondLength) {
        [resultString appendString:[string2 substringFromIndex:secondIndex]];
    }

    return resultString;
}

@end
