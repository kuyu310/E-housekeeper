
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


let NormalCellID = "NormalCellID"
let SearchCellID = "SearchCellID"
let HeaderViewID = "HeaderViewID"

let kStatusBarH: CGFloat = 20
let kNavigationBarH: CGFloat = 44
let kTabBarH: CGFloat = 49


let ENVIRONMENT = 0 //  0－开发/1－测试/2－正式
/**
 *  提醒消失时间
 */
let HUD_DismisTime = 0.5
/**
 *  透明度
 */
let kAlpha = 0.3
/**
 *  持久化 KEY 值
 */
/**
 *  当前网络状态
 */

/**
 *  请求提示文字
 */
let Loading = "请稍后..."
let Request_Failure = "失败"
let Request_Success = "成功"
let Request_NOMore = "已加载全部"
let Request_NoNetwork = "请检查网络链接"




