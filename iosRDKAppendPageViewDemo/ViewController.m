//
//  ViewController.m
//  iosRDKAppendPageViewDemo
//
//  Created by foxit on 12/5/16.
//  Copyright © 2016 Foxit. All rights reserved.
//


#import <FoxitRDK/FSPDFObjC.h>
#import <FoxitRDK/FSPDFViewControl.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString* sn = @"Ds7h4xbdyC7URaWYsG/U/ZkNsvlvb02Z75zCFQwqiis/6T44jOug2g==";
    NSString* unlock = @"ezJvj1/GvGh39zvoP2Xsb3n67x+ioyBWyhPMX8fzwi7Vgp16b2iSxqyvDHj1MB8Bf5h2En/S6fAq6pdnppK2jzBd2LlYs5CyfUScGoZZWPDhQxWxx/jGaeOghBXv2i2uqxOq7rDnqj7+nlO2tdt+p/sfXzh4pXheC0dspG/EWzBULyuul8f88a7vFx8PoRRDRAHYpw4w3lXcSEjKpxh+0VCXbeUUakO6BG3/ftKeiDSsO7nhRyiheUDb7GqWfCbNYnITf/GzSXsR36M1i5ilQG07Te0k6OSlUKM5u8zzN1J6CN0YhIkkbw78osbdccC7SJBqowVerBMJBxdVzVFH6m9VnLvxSuBksAwMJFaahLkwA4QTaliDiH1KLM+GO9KsBF8CrSzPR2iLQi2DRqM+DqBNvlvH+RSSITzLlWkr1ZTR9NIsku7J0NlYYeV2/gJNNXjtSFvh2tYF4c+jiQB0grBMz7e0g7TPOeSUFOASua1iF0OnGWd+Q3Sg9kU3fQnG9f3X4L4yMOE3zEp944TBsjnenjCq4qaQDhnv0QcoETNkbR096YldWpEVLur6CKyc9efvjY1mm4ELtNQAqUZQrsRItipF+wMbPQY4htvBri03lwOyJtXXKahDYk2aiQ+wSJ9aL8dSVUfaNC0QRgt2owXWjiRfWwHnLhVAO6xU7QOO/7QfaneySeNlV1FAVdn8KLRiX45QAkwVHvY41vCR0k7x7yI6Bgej5eVL8Iwfz515gtfV0pIJCTTymHaAZNMbgqmWZzlibHPzeR7BAGom4Zs24Idgn6beTpqjCoG1vM66Rp4ayGiLJfCESiV8u0IFdkPyTVphmCFhcUPFpc5IM+lHVmgnsnmErsIg6Gy2eCX6LU0uEL3mrT8JlDdpEVU7C6E91FUnTt9PAnab3fMsxdhKgu6Ng0NwdxWuEOoGm23zCOjw20tgQ+oO6+aycuMJHqlrQkVjKBVN/kOic5akgOgkw4//TaKtl8WdHRxuC+4/dHZi71tJj4r8A+qgB6dyOHr2gUiMZd5vzadOGW+UpGp4LPfAmCCYH+PnExsSKh7VGHlPwFyYFr1SVRQOm15qD3yeTA/HlC4y0SGaYPuVOUI5E884UoL7junEgRl6m+Jyh95cpat+iBRyao7+R8GqRJQfEFk0RRzUZH5Ny67sm/9au8r+rSfx6f/2KIK17AXJ0bcduAIW5crpNcAPP44ockdOG03dqEs=";
    enum FS_ERRORCODE eret = [FSLibrary init:sn key:unlock];
    
    if(eret!=e_errSuccess)
    {
        return;
    }
    NSString* docPath = [[NSBundle mainBundle]pathForResource:@"developer_guide_ios" ofType:@"pdf"];
    FSPDFDoc* doc = [FSPDFDoc createFromFilePath:docPath];
    [doc load:nil];
    
    [self.testViewCtrl setDoc:doc];
    
    [self.view addSubview:self.testViewCtrl];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    CGRect subViewRect = self.view.frame;
    
    subViewRect.origin.y = subViewRect.size.width/2;
    
    NSLog(@"subViewRect: %f %f %f %f", subViewRect.origin.x, subViewRect.origin.y, subViewRect.size.width, subViewRect.size.height);
    
    UIView* subView = [[UIView alloc]initWithFrame:subViewRect];
    
    subView.backgroundColor = [UIColor blueColor];
    
    [self.testViewCtrl appendPageView:subView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(FSPDFViewCtrl *)testViewCtrl
{
    if(!_testViewCtrl)
    {
        _testViewCtrl = [[FSPDFViewCtrl alloc]initWithFrame:[self.view bounds]];
    }
    
    return _testViewCtrl;
}

@end
