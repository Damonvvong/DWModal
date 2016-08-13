
#import <UIKit/UIKit.h>


UIKIT_EXTERN CGFloat DWModalDefaultAnimationDuration;
UIKIT_EXTERN NSString *const DWModalExceptionMethodNotImplemented;
UIKIT_EXTERN NSString *const DWModalExceptionPropertyIsNil;


typedef void (^DWCompletionHandler)();

typedef NS_ENUM(NSInteger, DWModelStyle) {

    DWModalBounce = 0,
};