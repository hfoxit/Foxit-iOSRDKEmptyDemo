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
#import "testView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString* sn = @"ktoB0rBpK74y1CxIIa27WoLSBJEaSeR85eNAmzAk3UO+tLcp30i2Rw==";
    NSString* unlock = @"ezKXjt3HtGhz9LvoL0WQjY537790VFfbykNCI0MicbT/nvzzLizkxROx+Qmgegu7fShWS6YDidw1+E87HZS9r6q4CfW0c5gwfCSQnzSBxfmvppgJ0zikaOXIOadxmE4JNny4oSkFRJ7zBxpXmOx1jL4zlaU/DIcJtrc0HspXwmrCsIFMhfTg5ZHdYHitxrhRdRsiHoVY8TYDE5hFpgO7GvHHEpGGCELwwM4x50Q/3416zJZOp8QMsriH+61WGuvthdHTk6B3YKB6djPM8USsoQR4RHmUC7bUCtOSB+zNyEhDq/kQurqLaQTjfjtW/5iBeQ2EdqUFokN8LGd805B/tgT9yABMK7U6z3HMfd3ytXVqddJLZEmaMNcDu3Z3bqK/T856kSwXcCLJqn10u9lfdmzR78OUSdfz4l2gyiSSJLcySxth/E0UZExXO3TmaTAnl0nxTp3dVwlBCI0CcEWs5q7RLOL75AEFnpJXBHFtEPHRL8rAF1weErmF8d4TCgbncfCO5bj2E3R6IsBzd3JvdrXGGkDvuZ3E3EdVdFeer1iv147XCx/x8PNcgctXwnQji88lFUypkP+YWtGQ1lBwLX2DrzsDe91L8Lp+4NIoc6nGoDuWasAGa6VbYpmxrYtvM+5b0eHotgnqrA7DcgCRI72lUHEzZCM/W0tKtQkspvGsu4XSgzHmbt0RqhKyGpBGS2poxR8Q0Kyj1C/ITz8Xswp2bxwf8HPL++skvZ3uxFyUevOLuTD+t5Jah81Nylefa/2vAA9zTn+FYNuJpv0W4uu4TPGg3qvEKWNR5fJpD2LhLsliaxg3S4HwX1NzmGeta91CgZdhKwO99HyZR/MzdJ2DbHXTeWr50jHWr5xSvcR30Uqg396JLbepvtXsEYtsJFymBJnmBwalykfmBWPAIAnWS95AUhOeu9OdoqllO84NLrlATHnhxf9mBP3eLsbKuQEPsQImHwCgOjkiR96Q3gmPqmupWo+O9XoFw7+aqprXNdjopR0j6kF43u839xWUKdb0Svz7/Hl/t2+bINuWu+vuseV7xvRKpe6oKFl/KS6WWapqU5s6WvIi6/3x2ZXFNW6PBn5jNn3reHFn4zqWu5k6MGTul8iMZII0QWRIzQb0sbkSnwncf6siZV45UUbiIpL3NMgMkjoNtWVhlO0Cu/UYTbbmpMjzIacfwcI+yuC/xUJwGq+jKh3ri0oV7q9Wz91P6Q==";
    enum FS_ERRORCODE eret = [FSLibrary init:sn key:unlock];
    
    if(eret!=e_errSuccess)
    {
        return;
    }
    NSString* docPath = [[NSBundle mainBundle]pathForResource:@"FoxitText" ofType:@"pdf"];
    FSPDFDoc* doc = [FSPDFDoc createFromFilePath:docPath];
    [doc load:nil];
    
    [self.testViewCtrl registerDocEventListener:self];
    
    [self.testViewCtrl setDoc:doc];
    
    [self.view addSubview:self.testViewCtrl];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
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

-(void)onDocOpened:(FSPDFDoc *)document error:(int)error
{
    
    [self.testViewCtrl setPageLayoutMode: PDF_LAYOUT_MODE_CONTINUOUS];
    
    CGRect subViewRect = self.view.frame;
    
    NSLog(@"subViewRect: %f %f %f %f", subViewRect.origin.x, subViewRect.origin.y, subViewRect.size.width, subViewRect.size.height);
    
    TestView* subView = [[TestView alloc]initWithFrame:subViewRect];
    
    subView.backgroundColor = [UIColor blueColor];
    
    UIView* blackBlock = [[UIView alloc]initWithFrame:CGRectMake(subViewRect.size.width/4, subViewRect.size.height/4, subViewRect.size.width/2, subViewRect.size.height/2)];
    
    blackBlock.backgroundColor = [UIColor blackColor];
    
    [subView addSubview:blackBlock];
    
    UISwitch* uiSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(subViewRect.size.width/8, subViewRect.size.width/8, subViewRect.size.width/4, subViewRect.size.width/4)];
    
    [subView addSubview:uiSwitch];
    
    [self.testViewCtrl appendPageView:subView];
    
    [self.testViewCtrl registerGestureEventListener:(id<IGestureEventListener>)subView];
    
}

@end
