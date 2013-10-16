//
//  ALEViewController.m
//  AutoLayoutTest
//
//  Created by alessandro on 16/10/13.
//  Copyright (c) 2013 al333z. All rights reserved.
//

#import "ALEViewController.h"

@interface ALEViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;

@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation ALEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    [self.view addSubview:self.containerView];

    // Calculating our width and height of the box using the screen bounds.
    CGFloat height = [[UIScreen mainScreen] bounds].size.height / 3;

    // Our views dictionary is just the containerView
    NSDictionary *views = NSDictionaryOfVariableBindings(_containerView);

    // The metrics dictionary is our values from line 50 & 51 wrapped in NSNumbers.
    NSDictionary *metrics = @{ @"containerViewHeight" : @(height),
                               @"margin": @(10)
                               };

    // positioning "container" view
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_containerView]-margin-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_containerView(==containerViewHeight)]" options:0 metrics:metrics views:views]];

    // adding other views
    [self.containerView addSubview:self.imageView];
    [self.containerView addSubview:self.titleLabel];
    [self.containerView addSubview:self.desLabel];
    [self.containerView addSubview:self.centerButton];
    [self.containerView addSubview:self.leftButton];
    [self.containerView addSubview:self.rightButton];

    views = NSDictionaryOfVariableBindings(_imageView, _titleLabel, _desLabel, _centerButton, _leftButton, _rightButton);

    // position imageView, titleLabel
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_imageView(==100)]-5-[_titleLabel]-margin-|" options:0 metrics:metrics views:views]];
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[_imageView(==100)]" options:0 metrics:metrics views:views]];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];

    // size desLabel
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_titleLabel(==25)]-5-[_desLabel(==_titleLabel)]" options:0 metrics:metrics views:views]];
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_desLabel(==_titleLabel)]" options:0 metrics:metrics views:views]];

    // align desLabel
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.desLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0]];

    // position center button
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_centerButton(==40)]-5-|" options:0 metrics:metrics views:views]];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.centerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[_leftButton(>=60)]-(5)-[_centerButton(==_leftButton)]-(5)-[_rightButton(==_leftButton)]-margin-|" options:0 metrics:metrics views:views]];

    // align left and right button
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0]];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0]];

    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0]];
    [self.containerView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0]];

}

#pragma mark Dynamic Accessor Methods
// +--------------------------------------------------------------------
// | Dynamic Accessor Methods
// +--------------------------------------------------------------------

- (UIView *)containerView
{
    if (_containerView == nil) {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _containerView.translatesAutoresizingMaskIntoConstraints = NO;
        _containerView.backgroundColor = [UIColor cyanColor];

    }
    return _containerView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.backgroundColor = [UIColor blueColor];

    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor redColor];

    }
    return _titleLabel;
}

- (UILabel *)desLabel
{
    if (_desLabel == nil) {
        _desLabel = [[UILabel alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _desLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _desLabel.backgroundColor = [UIColor orangeColor];

    }
    return _desLabel;
}

- (UIButton *)centerButton
{
    if (_centerButton == nil) {
        _centerButton = [[UIButton alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _centerButton.translatesAutoresizingMaskIntoConstraints = NO;
        _centerButton.backgroundColor = [UIColor purpleColor];

    }

    return _centerButton;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _leftButton.translatesAutoresizingMaskIntoConstraints = NO;
        _leftButton.backgroundColor = [UIColor greenColor];

    }

    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectZero];

        // This tells Auto Layout to handle all the layout stuff.
        _rightButton.translatesAutoresizingMaskIntoConstraints = NO;
        _rightButton.backgroundColor = [UIColor yellowColor];

    }

    return _rightButton;
}

@end
