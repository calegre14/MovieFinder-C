//
//  CMAMovieCollection.m
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import "CMAMovieCollection.h"

@implementation CMAMovieCollection

static NSString * const titleKey = @"title";
static NSString * const overviewKey = @"overview";
static NSString * const voteKey = @"vote_average";

- (instancetype)initWithMovieTitle:(NSString *)title overview:(NSString *)overview vote:(NSNumber *)vote
{
    if (self = [super init])
    {
        _title = title;
        _overview = overview;
        _vote = vote;
    }
    return self;
}

@end

@implementation CMAMovieCollection (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * title = dictionary[titleKey];
    NSString * overview = dictionary[overviewKey];
    NSNumber * vote = dictionary[voteKey];
    
    return [self initWithMovieTitle:title overview:overview vote:vote];
}

@end
