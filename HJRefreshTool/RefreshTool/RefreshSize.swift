//
//  RefreshSize.swift
//  HJRefreshTool
//
//  Created by Haijun Si on 2020/8/4.
//  Copyright © 2020 chenganrt. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

/// 根据百分比获取屏幕宽度 例如： GET_SCREEN_WIDTH（20）获取20%的屏幕宽度
///
/// - Parameter percentage: 百分比 0-100
/// - Returns: 所需要的宽度
public func GET_SCREEN_WIDTH(_ percentage:CGFloat) -> CGFloat{
    return UIScreen.main.bounds.width*(percentage/100)
}

/// 根据百分比获取屏幕高度 例如： GET_SCREEN_HEIGHT（20）获取20%的屏幕高度
///
/// - Parameter percentage: 百分比 0-100
/// - Returns: 所需要的高度
public func GET_SCREEN_HEIGHT(_ percentage:CGFloat) -> CGFloat{
    return UIScreen.main.bounds.height*(percentage/100)
}
