#import "DateHelper.h"

@implementation DateHelper

+ (NSDateFormatter *)longDateFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    });
    return formatter;
}

+ (NSDateFormatter *)dayDateFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE";
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    });
    return formatter;
}

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDictionary *months = @{
        @1: @"January",
        @2: @"February",
        @3: @"March",
        @4: @"April",
        @5: @"May",
        @6: @"June",
        @7: @"July",
        @8: @"August",
        @9: @"September",
        @10: @"October",
        @11: @"November",
        @12: @"December"
    };

    return [months objectForKey:@(monthNumber)];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *formatter = [DateHelper longDateFormatter];
    NSDate *convertedDate = [formatter dateFromString:date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:convertedDate];
    return components.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatter = [DateHelper dayDateFormatter];
    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];

    NSDate *currentDate = [NSDate now];

    NSDate *firstWeekDay;
    NSTimeInterval interval;

    [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&firstWeekDay interval:&interval forDate:currentDate];

    NSDate *lastWeekDay = [firstWeekDay dateByAddingTimeInterval:interval - 1];

    return ([date compare:firstWeekDay] != NSOrderedAscending && [date compare:lastWeekDay] != NSOrderedDescending);
}

@end
