//
//  KMModuleC.m
//  KMModuleA
//
//  Created by Ed on 2019/5/9.
//

#import "KMModuleC.h"
@import KMRouter;

typedef void(^CallBack)(id _Nonnull result,NSError *_Nonnull error);

@interface KMModuleC ()<KMRouterProtocol>

@end

@implementation KMModuleC
@synthesize callBack;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}
- (void)handleWithCompletion:(void (^)(id _Nonnull result, NSError * _Nonnull))completion {
    self.callBack = completion;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.callBack) {
//        NSError *error = NSError
        self.callBack(@"ssssssss",nil);
    }
    
    NSURL *url = [[NSURL alloc]initWithString:@"KMModuleD"];
    KMRouter *router = [[KMRouter alloc]init];
    [router push:url control:self completion:^(id _Nonnull result, NSError * _Nonnull error) {
        if (result) {
            NSLog(@"%@",result);
        }
        if (error) {
            NSLog(@"%@",error.description);
        }
    }];
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
