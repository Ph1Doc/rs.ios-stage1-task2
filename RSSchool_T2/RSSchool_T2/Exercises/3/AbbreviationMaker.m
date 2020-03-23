#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {

    if (a.length < 1 || b.length < 1 || a.length > 1000 || b.length > 1000) {
        return @"NO";
    }

    NSMutableString *upercaseA = [[NSMutableString alloc] initWithString:[a uppercaseString]];
    NSMutableString *upercaseB = [[NSMutableString alloc] initWithString:[b uppercaseString]];

    NSUInteger elementInB = [b length];
    for (int i = 0; i < [upercaseB length]; i++) {
         for (int j = 0; j < [upercaseA length]; j++) {
             if ([upercaseB substringWithRange:NSMakeRange(i, 1)] == [upercaseA substringWithRange:NSMakeRange(j, 1)]) {
                 upercaseA = [[upercaseA substringWithRange:NSMakeRange(j, upercaseA.length - j)] mutableCopy];
                 elementInB = elementInB - 1;
             }
         }
    }

    if (elementInB == 0) {
        return @"YES";
    } else {
        return @"NO";
    }
}
@end
