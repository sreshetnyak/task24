//
//  TTViewController.m
//  Drawings
//
//  Created by sergey on 3/10/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTDrawStar.h"

@interface TTViewController ()

@end

@implementation TTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.star.userInteractionEnabled = NO;
	// Do any additional setup after loading the view, typically from a nib.
    
//    Ученик.
//    
//    1. Нарисуйте пятиконечную звезду :)
//    2. Добавьте окружности на концах звезды
//    3. Соедините окружности линиями
//    
//    Студент.
//    
//    4. Закрасте звезду любым цветом цветом оО
//    5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
//    
//    Мастер
//    
//    6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)
//    
//    Супермен
//    
//    7. Сделайте простую рисовалку - веду пальцем по экрану и рисую :)
    
    
}

- (IBAction)drawStar:(id)sender {
    self.star.canvas.image = nil;
    self.star.userInteractionEnabled = NO;
    [self.star drowStar];
}

- (IBAction)paintMode:(id)sender {
    self.star.canvas.image = nil;
    if (!self.star.userInteractionEnabled) {
        self.star.userInteractionEnabled = YES;
    }
}

- (IBAction)clearSpace:(id)sender {
    self.star.canvas.image = nil;
}

- (IBAction)randomRGB:(id)sender {
    [self.star randomRGBColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
