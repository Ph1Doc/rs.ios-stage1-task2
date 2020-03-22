#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {

    NSString *stringFromString = [[NSString alloc] initWithFormat:@"%@-%@-%@", year, month, day];
    NSLog(@"%@", stringFromString);

    NSDateFormatter *formatterFromStringToDate = [[NSDateFormatter alloc] init];
    formatterFromStringToDate.dateFormat = @"yyyy-MM-dd";

    NSDate *dateFromString = [formatterFromStringToDate dateFromString:stringFromString];

    NSDateFormatter *formatterFromDateToString = [[NSDateFormatter alloc] init];
    formatterFromDateToString.dateFormat = @"dd MMMM, EEEE";
    formatterFromDateToString.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];

    NSString *dateString = [formatterFromDateToString stringFromDate:dateFromString];

    return dateString != nil ? dateString : @"Такого дня не существует";
}

@end
