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
    NSURL * baseUrl = [NSURL URLWithString:kBaseURL];
    NSURL * searchComponent = [baseUrl URLByAppendingPathComponent:kSearchComponent];
    NSURL * movieComponent = [searchComponent URLByAppendingPathComponent:kMovieComponent];
    
    NSURLQueryItem * apiKeyQuery = [[NSURLQueryItem alloc] initWithName:kApiKeyKey value:kApiKeyCode];
    NSURLQueryItem * searchQuery = [[NSURLQueryItem alloc] initWithName:kSearchByQueryQuery value:searchTerm];
    
    NSURLComponents * components = [NSURLComponents componentsWithURL:movieComponent resolvingAgainstBaseURL:true];
    components.queryItems = @[apiKeyQuery, searchQuery];
    
    NSURL * finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSArray * arrayOfMovies = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error][@"results"];
            if (!arrayOfMovies)
            {
                NSLog(@"Error parsing through JSON %@", error);
                completion(nil);
                return;
            }
            NSMutableArray * moviesArray = [[NSMutableArray alloc] init];
            for (NSDictionary * movieDictionary in arrayOfMovies)
            {
                CMAMovieCollection * movie = [[CMAMovieCollection alloc] initWithDictionary:movieDictionary];
                [moviesArray addObject:movie];
            }
            completion(moviesArray);
        }
    }]resume];
}

@end
