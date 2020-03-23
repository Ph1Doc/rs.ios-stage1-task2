#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {

    int index = 2;
    NSMutableArray *fibonacci = [[NSMutableArray alloc] init];
    [fibonacci addObject:@0];
    [fibonacci addObject:@1];
    [fibonacci addObject:@1];

    if (number == 0) {
        return @[@0, @1, @0];
    } else if ([number intValue] == 1) {
        return @[@1, @1, @1];
    } else {
        while ([number intValue] > [[fibonacci lastObject] intValue]) {
            int nextFibonacci = [fibonacci[index] intValue] + [fibonacci[index - 1] intValue];
            [fibonacci addObject:[NSNumber numberWithInt:nextFibonacci]];
            index = index + 1;
            if ([fibonacci[index] intValue] * [fibonacci[index - 1] intValue] == [number intValue]) {
                return @[fibonacci[index - 1], fibonacci[index], @1];
            } else if ([fibonacci[index] intValue] * [fibonacci[index - 1] intValue] > [number intValue]) {
                return @[fibonacci[index - 1], fibonacci[index], @0];
            }
        }
    }
    return @[];
}

@end
