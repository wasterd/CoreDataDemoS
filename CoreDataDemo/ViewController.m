//
//  ViewController.m
//  CoreDataDemo
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 liuyl. All rights reserved.
//

#import "ViewController.h"
#import "Auther.h"
#import "AppDelegate.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    AppDelegate *app;
    NSMutableArray *_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArray=[[NSMutableArray alloc]init ];
    self.title=@"Core Data基本操作";
    app=[UIApplication sharedApplication].delegate;
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)createUI{
    
    NSArray *array=[NSArray arrayWithObjects:@"增",@"查",@"改",@"删", nil];
    for (int i=0; i<4; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(30+80*i, 66, 60, 30);
        button.backgroundColor=[UIColor lightGrayColor];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i+1000;
        [self.view addSubview:button];
    }
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.bounds.size.height-100) style:UITableViewStylePlain ];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}


-(void)buttonClicked:(UIButton *)sender{
    NSInteger num=sender.tag-1000;
    switch (num) {
        case 0://增
            [self addSource];
            break;
        case 1://查
            [self selectSource];
            break;
        case 2://改
            [self updateSource];
            
            break;
        case 3://删
            [self deleteSource];
            break;
        default:
            break;
    }

}
//增
-(void)addSource{

    Auther *a=[NSEntityDescription insertNewObjectForEntityForName:@"Auther" inManagedObjectContext:app.managedObjectContext];
    a.age=[NSNumber numberWithInt:24];
    a.name=@"王军";
    [app .managedObjectContext save:nil];
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Auther" inManagedObjectContext:app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request=[[NSFetchRequest alloc]init ];
    //建立请求的是哪一类
    [request setEntity:entity];
    //遍历Auther所有信息，存在array里
    NSArray *array=[app.managedObjectContext executeFetchRequest:request error:nil];
    [_dataArray removeAllObjects];
    for (Auther *auther in array) {
        [_dataArray addObject:auther];
    }
    [_tableView reloadData];

}
//查
-(void)selectSource{
    
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Auther" inManagedObjectContext:app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request=[[NSFetchRequest alloc]init ];
    //建立请求的是哪一类
    [request setEntity:entity];
    //遍历Auther所有信息，存在array里
    NSArray *array=[app.managedObjectContext executeFetchRequest:request error:nil];
        [_dataArray removeAllObjects];
        for (Auther *auther in array) {
            [_dataArray addObject:auther];
        }
 
  
    [_tableView reloadData];


}
//改
-(void)updateSource{
 
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Auther" inManagedObjectContext:app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request=[[NSFetchRequest alloc]init ];
    //建立请求的是哪一类
    [request setEntity:entity];
    //遍历Auther所有信息，存在array里
    NSArray *array=[app.managedObjectContext executeFetchRequest:request error:nil];
    for (Auther *auther in array) {
      auther.name=@"刘海";
    }
    [app.managedObjectContext save:nil];
    [_tableView reloadData];

}

//删
-(void)deleteSource{

    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Auther" inManagedObjectContext:app.managedObjectContext];
    
    //建立请求
    NSFetchRequest *request=[[NSFetchRequest alloc]init ];
    //建立请求的是哪一类
    [request setEntity:entity];
    //遍历Auther所有信息，存在array里
    NSArray *array=[app.managedObjectContext executeFetchRequest:request error:nil];
    [_dataArray removeAllObjects];
    for (Auther *auther in array) {
        [app.managedObjectContext deleteObject:auther];
    }
    
    
    [_tableView reloadData];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static NSString *cellIde=@"cell";

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell  == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde ];
    }
    Auther *auther=_dataArray[indexPath.row];
    cell.textLabel.text=auther.name;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
