#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    NSString *numberStr = [number stringValue];
    if ([[numberStr substringToIndex:1]  isEqual: @"-"]) {
        numberStr = [numberStr substringFromIndex:1];
    }
    NSInteger length = [numberStr length];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSUInteger i = 0;
    while (i < length) {
        NSRange range = [numberStr rangeOfComposedCharacterSequenceAtIndex:i];
        NSString *chStr = [numberStr substringWithRange:range];
        [arr addObject:chStr];
//        NSInteger intValue = [chStr integerValue];
//        NSNumber *nsNumber = [NSNumber numberWithInt:intValue];
//        [arr addObject:nsNumber];
        
        i += range.length;
    }
    
    return [[arr reverseObjectEnumerator] allObjects];
}

@end
