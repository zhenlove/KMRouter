//
//  KMModuleD.m
//  KMModuleA
//
//  Created by Ed on 2019/5/9.
//

#import "KMModuleD.h"
@import KMRouter;
@import KMConfigure;
@interface KMModuleD ()<KMRouterProtocol>

@end

@implementation KMModuleD
@synthesize callBack;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = self.kmTitle;
    // Do any additional setup after loading the view.
}
- (void)handleWithCompletion:(void (^)(id _Nonnull result, NSError * _Nonnull))completion {
    self.callBack = completion;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    KMRouter *router = [[KMRouter alloc]init];
    [KMRouter push:[KMConfigure getModuleAUrlStr]
           control:self
        completion:^(id _Nonnull result, NSError * _Nonnull error) {
            if (result) {
                NSLog(@"%@",result);
            }
            if (error) {
                NSLog(@"%@",error.localizedDescription);
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
