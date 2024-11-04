#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count < 3) {
        return 0;
    }

    NSInteger potentialTeamsCount = 0;
    NSInteger playersCount = ratingArray.count;

    for (NSInteger firstIndex = 0; firstIndex < playersCount - 2; firstIndex++) {
        for (NSInteger secondIndex = firstIndex + 1; secondIndex < playersCount - 1; secondIndex++) {
            for (NSInteger thirdIndex = secondIndex + 1; thirdIndex < playersCount; thirdIndex++) {
                int firstRating = ratingArray[firstIndex].intValue;
                int secondRating = ratingArray[secondIndex].intValue;
                int thirdRating = ratingArray[thirdIndex].intValue;

                if ((firstRating < secondRating && secondRating < thirdRating)
                    || (firstRating > secondRating && secondRating > thirdRating)) {
                    potentialTeamsCount++;
                }
            }
        }
    }

    return potentialTeamsCount;
}

@end
