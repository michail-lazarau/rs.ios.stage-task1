#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    NSNumberFormatter *intFormatter = [[NSNumberFormatter alloc] init];
    NSNumber *rawNum = [intFormatter numberFromString:self];
    
    return rawNum != nil ? YES : NO;
}

@end
