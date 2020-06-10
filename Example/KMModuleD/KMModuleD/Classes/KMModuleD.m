//
//  KMModuleD.m
//  KMModuleA
//
//  Created by Ed on 2019/5/9.
//

#import "KMModuleD.h"
@import KMRouter;
@interface KMModuleD ()

@end

@implementation KMModuleD

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = self.kmTitle;
    // Do any additional setup after loading the view.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    KMRouter *router = [[KMRouter alloc]init];
//    [KMRouter push:[KMConfigure getModuleAUrlStr]
//           control:self
//        completion:^(id _Nonnull result, NSError * _Nonnull error) {
//            if (result) {
//                NSLog(@"%@",result);
//            }
//            if (error) {
//                NSLog(@"%@",error.localizedDescription);
//            }
//        }];
//    [KMRouters pathWithUrlStr:[KMConfigure getModuleAUrlStr]
//                      control:self.navigationController
//                     callback:nil];
    [KMRouter pathWithUrlStr:@"KMModuleA" isPush:true callback:nil];
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
