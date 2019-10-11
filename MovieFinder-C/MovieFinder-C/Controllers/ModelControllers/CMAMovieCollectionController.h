//
//  CMAMovieCollectionController.h
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMAMovieCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMAMovieCollectionController : NSObject

+(void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CMAMovieCollection *>* _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
