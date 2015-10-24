//
//  NSDate+Extension.swift
//  Copyright © 2015年 Tsz. All rights reserved.
//

import Foundation

extension NSDate{
    
    class func sinaDate(string: String) -> NSDate?{
        
        //转换日期
        let df = NSDateFormatter()
        
        df.locale = NSLocale(localeIdentifier: "en")
        
        df.dateFormat = "EEE MMM dd HH:mm:ss zzz yyyy"
        
        //转换
        return df.dateFromString(string)
    }
    
    //根据判断  获取不同时间段的称呼
    var dateDesctiption: String {
        //1、使用日历类取出当前的日期
        let calendar = NSCalendar.currentCalendar()
        
        //判断
        if calendar.isDateInToday(self){
            //把获取的日期和现在的系统时进行比较，判断时间差
            
            let dateTime = Int(NSDate().timeIntervalSinceDate(self))
            
            if dateTime < 60 {
                return "🆔刚刚"
            }
            
            if dateTime < 3600 {
                return "🆔\(dateTime / 60)分钟前"
            }
            return "🆔\(dateTime / 3600)小时前"
        }
        
        //日格式字符串
        var fmtString = "HH:mm"
        
        if calendar.isDateInYesterday(self){
            fmtString = "昨天" + fmtString
        }else{
            
            fmtString = "MM-dd" + fmtString
            let coms = calendar.components(NSCalendarUnit.Year, fromDate: self, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
            if coms.year > 0{
                fmtString = "yyyy-" + fmtString
            }
        }
        let df = NSDateFormatter()
        df.locale = NSLocale(localeIdentifier: "en")
        df.dateFormat = fmtString
        
        return df.stringFromDate(self)
    }
}