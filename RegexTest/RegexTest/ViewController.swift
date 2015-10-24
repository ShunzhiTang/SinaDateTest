//
//  ViewController.swift
//  RegexTest
//
//  Created by Tsz on 15/10/23.
//  Copyright © 2015年 Tsz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        testDemo()
        
        let string = "<a href=\"http://weibo.com/\" 11v rel=\"n112ofollow\">微博 weibo.co1111m</a>"
        print(string.hrefLink())
        
    }
    
}

func testDemo(){
    let string = "hahah<a href=\"http://weibo.com/\" rel=\"nofollow\">微博 weibo.com</a>hrhrh"
    
    //匹配网址
    let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
    
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.DotMatchesLineSeparators)
    //开始匹配
    
    let result = regex.firstMatchInString(string, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, string.characters.count))
    
    print(result?.numberOfRanges)
    
    let r1 =  result!.rangeAtIndex(0)
    let r2 =  result!.rangeAtIndex(1)
    let r3 =  result!.rangeAtIndex(2)
    
    print((string as NSString).substringWithRange(r1))
    print((string as NSString).substringWithRange(r2))
    print((string as NSString).substringWithRange(r3))
}

