//
//  ViewController.m
//  Adjust
//
//  Created by Sathiyamoorthy on 19/11/21.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "NetworkService.h"
#import "JsonResponseModelParser.h"

@interface ViewController ()

@property (nonatomic, strong) ViewModel * viewModel;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[ViewModel alloc] initWithClient:[[NetworkService alloc] init]
                                                    parser:[[JsonResponseModelParser alloc] init]
                          ];
    }
    return self;
}

- (IBAction)onTapLogActionButton:(id)sender {
    [self.viewModel onTapExtractDataButton];
}

@end

