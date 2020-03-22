#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {

    NSMutableString *date = [[NSMutableString alloc] init];

    int minutesInt = [minutes intValue];
    NSDictionary *hoursDict = @{ @"1": @"one",
                                 @"2": @"two",
                                 @"3": @"three",
                                 @"4": @"four",
                                 @"5": @"five",
                                 @"6": @"six",
                                 @"7": @"seven",
                                 @"8": @"eight",
                                 @"9": @"nine",
                                 @"10": @"ten",
                                 @"11": @"eleven",
                                 @"12": @"twelve",
    };

    NSDictionary *minutesDict = @{ @"1": @"one minute",
                                   @"2": @"two minutes",
                                   @"3": @"three minutes",
                                   @"4": @"four minutes",
                                   @"5": @"five minutes",
                                   @"6": @"six minutes",
                                   @"7": @"seven minutes",
                                   @"8": @"eight minutes",
                                   @"9": @"nine minutes",
                                   @"10": @"ten minutes",
                                   @"11": @"eleven minutes",
                                   @"12": @"twelve minutes",
                                   @"13": @"thirteen minutes",
                                   @"14": @"fourteen minutes",
                                   @"15": @"quarter",
                                   @"16": @"sixteen minutes",
                                   @"17": @"seventeen minutes",
                                   @"18": @"eighteen minutes",
                                   @"19": @"nineteen minutes",
                                   @"20": @"twenty minutes",
                                   @"21": @"twenty one minutes",
                                   @"22": @"twenty two minutes",
                                   @"23": @"twenty three minutes",
                                   @"24": @"twenty four minutes",
                                   @"25": @"twenty five minutes",
                                   @"26": @"twenty six minutes",
                                   @"27": @"twenty seven minutes",
                                   @"28": @"twenty eight minutes",
                                   @"29": @"twenty nine minutes",
                                   @"30": @"half",
    };

    for (NSString *key in hoursDict) {

        if ([hours isEqual:key]) {
            if (minutesInt >= 1 && minutesInt <= 30) {
                for (id keyMinutes in minutesDict) {
                    if (minutesInt == [keyMinutes intValue]) {
                        [date appendString:[minutesDict objectForKey:keyMinutes]];
                        [date appendString:@" past "];
                        [date appendString:[hoursDict objectForKey:key]];
                    }
                }

            } else if (minutesInt > 30 && minutesInt < 60) {
                for (id keyMinutes in minutesDict) {
                    if (minutesInt == 60 - [keyMinutes intValue]) {
                        [date appendString:[minutesDict objectForKey:keyMinutes]];
                        [date appendString:@" to "];
                        if (![key isEqual:@"12"]) {
                            [date appendString:[hoursDict objectForKey:[NSString stringWithFormat:@"%d", [key intValue]+1]]];
                        } else {
                            [date appendString:[hoursDict objectForKey:@"1"]];
                        }
                    }
                }

            } else if (minutesInt == 0) {
                [date appendString:[hoursDict objectForKey:key]];
                [date appendString:@" o' clock"];
            }
        }
    }
    
    return date;
}
@end
