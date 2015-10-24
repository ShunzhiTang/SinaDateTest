//
//  NSString+Regex.swift
//  RegexTest
//
//  Created by Tsz on 15/10/23.
//  Copyright © 2015年 Tsz. All rights reserved.
//

import Foundation

extension String{
    
    //一般匹配网址需要多个返回值 ，想到的就是元组
    func hrefLink() ->(link: String? , text: String?) {
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        
        let regex = try!NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.DotMatchesLineSeparators)
        //开始匹配
        
        if let result = regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)){
            
            let r1 = result.rangeAtIndex(1)
            let r2 = result.rangeAtIndex(2)
            
            let link = (self as NSString).substringWithRange(r1)
            
            let text = (self as NSString).substringWithRange(r2)
            
            return (link , text)
            
        }
        return(nil ,nil)
    }
}