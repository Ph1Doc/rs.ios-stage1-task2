#import "Blocks.h"

@interface Blocks ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation Blocks

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.blockA = ^(NSArray* num) {
            self.array = num;
        };

        self.blockB = ^(Class class) {
            NSMutableArray *objects = [[NSMutableArray alloc] init];

            for (NSObject *obj in self.array) {
                if ([obj isKindOfClass:class]) {
                    [objects addObject:obj];
                }
            }

            if ([class isEqual:[NSNumber class]]) {
                self.blockC([Blocks sum:objects]);
            } else if ([class isEqual:[NSString class]]) {
                self.blockC([objects componentsJoinedByString:@""]);
            } else if ([class isEqual:[NSDate class]]) {
                self.blockC([Blocks date:objects]);
            } else {
                self.blockC(objects);
            }
        };
    }

    return self;
}

+ (NSObject*)sum:(NSArray *)array {
    int sum = 0;
    for (int i = 0; i < [array count]; i++) {
        sum = sum + [array[i] intValue];
    }
    return [NSNumber numberWithInt:sum];
}

+ (NSObject*)date:(NSArray *)array {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.yyyy";

    NSDate *date = [array firstObject];

    for (NSDate *currentDate in array) {
        date = [currentDate laterDate:date];
    }
    
    return [formatter stringFromDate:date];
}

@end

