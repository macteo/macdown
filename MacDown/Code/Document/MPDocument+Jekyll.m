//
//  MPDocumentE.m
//  MacDown
//
//  Created by Matteo Gavagnin on 24/07/16.
//  Copyright © 2016 Tzu-ping Chung . All rights reserved.
//

#import "MPDocument+Jekyll.h"
#import "MPPreferences.h"
#import "NSString+Lookup.h"

@implementation MPDocument (Jekyll)

- (nullable NSString *)jekyllDocumentPath {
    return [NSString stringWithFormat:@"/%@/%@/%@.html",
            [self.frontmatterCategories componentsJoinedByString:@"/"],
            self.frontmatterDate,
            self.frontmatterTitle
            ];
}

- (nullable NSString *)frontmatterTitle {
    NSString *title = [[self.frontmatter objectForKey:@"title"] description];
    title = title.lowercaseString;
    title = [title stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    return title;
}

- (nullable NSString *)frontmatterDate {
    NSString *dateString = [[self.frontmatter objectForKey:@"date"] description];
    NSArray *dateComponents = [dateString componentsSeparatedByString:@" "];
    if (dateComponents.count > 1) {
        NSString *date = dateComponents.firstObject;
        date = [date stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
        return date;
    }
    return nil;
}

- (nullable NSArray *)frontmatterCategories {
    NSString *categoriesString = [[self.frontmatter objectForKey:@"categories"] description];
    NSArray *categories = [categoriesString componentsSeparatedByString:@" "];
    return categories;
}

- (nullable id)frontmatter {
    if (self.preferences.htmlDetectFrontMatter) {
        id frontmatter = [self.markdown frontMatter:NULL];
        return frontmatter;
    }
    return nil;
}

@end
