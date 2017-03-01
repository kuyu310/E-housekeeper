
//
//  Common.swift
//  E-housekeeper
//
//  Created by limeng on 2017/1/4.
//  全局常量定义区

import UIKit
/// 归档路径
let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
let SELECTED_CHANNELS: String = "selectedChannels.archive" // 选择频道列表
let UNSELECTED_CHANNELS: String = "unselectedChannels.archive" // 未选择频道列表
let PAGE_TITLES: String = "pagetitles.archive" // 保存的pagetitles
let HOME_CHILDVCS: String = "childvcs" // 首页contentView中的子控制器
let DEFAULT_CHILDVCS: String = "default" // 首页初始化的子控制器
let ALL_GMES: String = "GameVC.archive"

/// notification
let NotifyUpdateCategory = NSNotification.Name(rawValue:"notifyUpdateCategory")
let KSelectedChannel: String = "selectedChannel"
/// 常用属性
let kItemMargin : CGFloat = 10
let kHeaderViewH : CGFloat = 50
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let NormalCellID = "NormalCellID"
let SearchCellID = "SearchCellID"
let HeaderViewID = "HeaderViewID"

let kStatusBarH: CGFloat = 20
let kNavigationBarH: CGFloat = 44
let kTabBarH: CGFloat = 49
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height


