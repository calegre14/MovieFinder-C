//
//  CMAMovieCollection.h
//  MovieFinder-C
//
//  Created by Christopher Alegre on 10/11/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMAMovieCollection : NSObject

@property (nonatomic, copy, readonly)NSString *title;
@property (nonatomic, copy, readonly)NSString *overview;
@property (nonatomic, readonly)NSNumber *vote;

-(instancetype)initWithMovieTitle:(NSString *)title
                         overview:(NSString *)overview
                             vote:(NSNumber *)vote;

@end

@interface CMAMovieCollection (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
