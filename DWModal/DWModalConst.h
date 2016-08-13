
#import <UIKit/UIKit.h>


UIKIT_EXTERN CGFloat DWModalDefaultShowDuration;
UIKIT_EXTERN CGFloat DWModalDefaultDismissDuration;
UIKIT_EXTERN NSString *const DWModalExceptionMethodNotImplemented;
UIKIT_EXTERN NSString *const DWModalExceptionPropertyIsNil;




typedef void (^DWCompletionHandler)();

typedef NS_ENUM(NSInteger, DWModelStyle) {

    DWModalBounce = 0,
    DWModalFade = 1
};

UIKIT_EXTERN DWModelStyle DWModelStyleValue;