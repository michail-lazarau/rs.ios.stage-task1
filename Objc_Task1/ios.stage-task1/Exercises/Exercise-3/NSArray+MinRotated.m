#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    if (self.count == 0) {
        return nil;
    }
    if (self.count == 1) {
        return self[0];
    }
    if (self.count == 2) {
        return [self[0] intValue] < [self[1] intValue] ? self[0] : self[1];
    }
    
//    int left = 0;
//    int right = (int)self.count - 1;
    
    int l = 0;
    int r = self.count - 1;
    
    while(l < r) {
        int mid = (l + r)/2;
        if([self[mid] intValue] > [self[r] intValue]){
            l = mid+1;
        } else if([self[mid] intValue] < [self[r] intValue]) {
            r = mid;
        } else return self[r];
    }
    return self[l];
    //@[@(3995), @(4091), @(5286), @(9720), @(1418)];
    
//    while (self[left]>=self[right]){
//        int middle = (left+right)/2;
//        if (self[middle]<self[right]) {
//            right = middle;
//        } else {
//            left = middle + 1;
//        }
//    }
//    return self[left];
}
@end
