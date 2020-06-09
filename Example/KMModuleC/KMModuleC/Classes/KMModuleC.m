//
//  KMModuleC.m
//  KMModuleA
//
//  Created by Ed on 2019/5/9.
//

#import "KMModuleC.h"
@import KMRouter;

@interface KMModuleC ()

@end

@implementation KMModuleC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
//    [KMRouter push:[[KMConfigure getModuleDUrlStr] stringByAppendingString:@"?kmTitle=王五"] control:self completion:^(id _Nonnull result, NSError * _Nonnull error) {
//        if (result) {
//            NSLog(@"%@",result);
//        }
//        if (error) {
//            NSLog(@"%@",error.description);
//        }
//    }];
//    [KMRouters pathWithUrlStr:[[KMConfigure getModuleDUrlStr] stringByAppendingString:@"?kmTitle=王五"]
//                      control:self.navigationController
//                     callback:nil];
    [KMRouters pathWithUrlStr:[@"KMModuleD" stringByAppendingString:@"?kmTitle=王五"] isPush:true callback:nil];
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
