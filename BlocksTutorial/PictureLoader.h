//
//  PictureLoader.h
//  BlocksTutorial
//
//  Created by aybek can kaya on 6/15/14.
//  Copyright (c) 2014 aybek can kaya. All rights reserved.
//

#import <Foundation/Foundation.h>


// url , image , dataLength
typedef void (^ PictureGlobalBlock)(NSString *, UIImage *, NSUInteger);


@interface PictureLoader : NSObject
{
    
}

-(id)init;

/*
   @ gloabal block kullanarak resmi yukler. Resim yuklendiginde block cagirilir.
 */
-(void)loadImageWithURL:(NSString *) imageURL GlobalBlock:(PictureGlobalBlock) block;

/*
    @ block kullanilarak resim yuklenir. Resim yuklemesi tamamlandiginda success block, eger hata varsa failure block cagirilir.  Failure durumunu gostermek icin bu fonksiyon su an sadece jpg turunde resimleri yukleyecek. Aslinda her tur resim formati yuklenebilir. 
 */
-(void) loadImageWithURL:(NSString *)url success:(void (^)(UIImage *img , NSString *url))success failure:(void (^)(NSString *url , NSError *error))failure ;

@end
