#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
//    NSArray *rankedArray = @[@(100), @(80), @(80), @(50), @(20)];
//    NSArray *playerArray = @[@(10), @(25), @(70), @(80), @(105)];
//    NSArray *expectedResults = @[@(5), @(4), @(3), @(2), @(1)];
    
    NSMutableArray *mutableResult = [[NSMutableArray alloc] initWithCapacity:playerArray.count];

    rankedArray = [rankedArray valueForKeyPath:[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", @"self"]];
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    rankedArray = [rankedArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    
    int plCount = (int)[playerArray count];
    int rnkCount = (int)[rankedArray count];
    
    for(int i = 0; i < plCount; i++){
       [mutableResult insertObject:[NSNumber numberWithInteger:rankedArray.count+1] atIndex:i];
        int a = [[playerArray objectAtIndex:i] intValue];
        for (int j = 0; j < rnkCount; j++) {
            int b = [[rankedArray objectAtIndex:j] intValue];
            if(a >= b) {
                [mutableResult replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:j+1]];
                break;
            }
        }
    }
    NSArray <NSNumber *> *actualResult = [[NSArray alloc] initWithArray:mutableResult];
    return actualResult;
}

@end
