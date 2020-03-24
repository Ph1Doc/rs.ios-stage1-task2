#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {

    NSArray *arrayVowels = [[NSArray alloc] initWithObjects:@"a", @"e", @"i", @"o", @"u", @"y", nil];
    NSArray *arrayConsonant = [[NSArray alloc] initWithObjects:@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"r", @"s", @"q", @"t", @"v", @"w", @"x", @"z", nil];
    NSMutableArray *allCharecters = [[NSMutableArray alloc] initWithArray:arrayVowels];
    [allCharecters addObjectsFromArray:arrayConsonant];
    NSMutableCharacterSet *allCharectersSet = [[NSMutableCharacterSet alloc] init];

    for (NSString *element in allCharecters) {
        [allCharectersSet addCharactersInString:element];
    }

    NSMutableArray *array = [[NSMutableArray alloc] init];

    int indexLast = 0;

    for (int i = 0; i < [self length]; i++) {
        if ([[self substringWithRange:NSMakeRange(i, 1)] isEqual:@" "]) {

            NSString *addElement = [[self substringWithRange:NSMakeRange(indexLast, i - indexLast)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            if (![addElement isEqual:@""]) {
                [array addObject:addElement];
                indexLast = i;
            }
        } else if (i == [self length] - 1) {
            [array addObject: [[self substringWithRange:NSMakeRange(indexLast, i - indexLast + 1)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        }
    }

    NSMutableArray *new = [[NSMutableArray alloc] init];
    if ([[NSMutableCharacterSet characterSetWithCharactersInString:[self lowercaseString]] isSupersetOfSet:allCharectersSet]) {
        for (NSString *str in array) {
            int numberOfVowels = 0;
            NSMutableString *newString = [[NSMutableString alloc] init];

            for (int i = 0; i < [str length]; i++) {
                BOOL up = NO;
                for (NSString *vowels in arrayVowels) {
                    if ([[[str substringWithRange:NSMakeRange(i, 1)] lowercaseString]isEqual:vowels]) {
                        numberOfVowels = numberOfVowels + 1;
                        up = YES;
                    }
                }
                if (up) {
                     [newString appendString:[[str substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                } else {
                    [newString appendString:[str substringWithRange:NSMakeRange(i, 1)]];
                }

            }

            NSString *newElement = [NSString stringWithFormat:@"%d%@", numberOfVowels, newString];
             [new addObject:newElement];
        }
    } else {
        for (NSString *str in array) {
            int numberOfConsonants = 0;
            NSMutableString *newString = [[NSMutableString alloc] init];

            for (int i = 0; i < [str length]; i++) {
                BOOL up = NO;
                for (NSString *consonant in arrayConsonant) {
                    if ([[[str substringWithRange:NSMakeRange(i, 1)] lowercaseString] isEqual:consonant]) {
                        numberOfConsonants = numberOfConsonants + 1;
                        up = YES;
                    }
                }
                if (up) {
                     [newString appendString:[[str substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                } else {
                    [newString appendString:[str substringWithRange:NSMakeRange(i, 1)]];
                }

            }

            NSString *newElement = [NSString stringWithFormat:@"%d%@", numberOfConsonants, newString];
             [new addObject:newElement];
        }
    }

    NSArray *sortedArray = [new sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {

        if ([[obj1 substringWithRange:NSMakeRange(0, 1)]intValue] == [[obj2 substringWithRange:NSMakeRange(0, 1)]intValue])
            return NSOrderedSame;

        else if ([[obj1 substringWithRange:NSMakeRange(0, 1)]intValue] < [[obj2 substringWithRange:NSMakeRange(0, 1)]intValue])
            return NSOrderedAscending;

        else
            return NSOrderedDescending;

    }];

    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSString *elm in sortedArray) {
        if ([sortedArray lastObject] == elm) {
            [result appendString:[NSString stringWithFormat:@"%@", elm]];
        } else {
            [result appendString:[NSString stringWithFormat:@"%@ ", elm]];
        }

    }

    return result;
}

@end
