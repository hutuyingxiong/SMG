//
//  NEDataNode.m
//  SMG_NothingIsAll
//
//  Created by 贾  on 2017/9/29.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "NEDataNode.h"
#import "AINetStore.h"

@implementation NEDataNode

-(void) refreshNet{
    if (![[AINetStore sharedInstance] containsNodeWithEId:self.eId]) {
        //1. 存node
        AIDataNode *node = [[AIDataNode alloc] init];
        BOOL success = [[AINetStore sharedInstance] setObjectWithNetNode:node];
        
        //2. 建立node.pointer & eId映射
        if (success) {
            [[AINetStore sharedInstance] setMapWithNodePointer:node.pointer withEId:self.eId];
        }
    }
}

@end
