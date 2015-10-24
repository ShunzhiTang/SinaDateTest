//
//  ViewController.swift
//  SinaDateTest

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date:NSDate = NSDate()
        print(date)
        demoDate()
        
         print(NSDate.sinaDate("Mon Oct 24 08:09:20 +0800 2015")?.dateDesctiption)
    }
    //建立一个实例进行测试

    func demoDate() {
        let string = "Mon Oct 22 3:12:00 +0800 2015"
        
        //转换成日期
        let df = NSDateFormatter()
        
        //指定时区
        df.locale = NSLocale(localeIdentifier: "en")
        
        //日期格式化字符串
        df.dateFormat = "EEEE MMM dd HH:mm:ss zzz yyyy"
        
        let date = df.dateFromString(string)
        print(date)
    }


}

