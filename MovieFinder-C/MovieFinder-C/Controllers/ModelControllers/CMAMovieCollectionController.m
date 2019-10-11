//
//  CMAMovieCollectionController.m
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMAMovieCollectionController.h"

static NSString * const kBaseURL = @"https://api.themoviedb.org/3";
static NSString * const kSearchComponent = @"search";
static NSString * const kMovieComponent = @"movie";
static NSString * const kApiKeyKey = @"api_key";
static NSString * const kApiKeyCode = @"4246555184407dbed832fa87d23397b2";
static NSString * const kSearchByQueryQuery = @"query";

@implementation CMAMovieCollectionController

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CMAMovieCollection *> * _Nullable))completion
{
    
}

@end
