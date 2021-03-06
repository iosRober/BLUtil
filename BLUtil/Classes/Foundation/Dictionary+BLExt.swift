//
//  BLExt.swift
//  SwiftTool
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

extension Dictionary {
    
    /// 拼接字典
    public mutating func addDictionary(_ para: Dictionary?) -> Dictionary {
        
        if let para = para {
            for (key, value) in para {
                self[key] = value
            }
        }
        return self
    }
    
    /// 判断是否存在
    public func has(key: Key) -> Bool {
        
        return index(forKey: key) != nil
    }
    
    /// 删除所有
    public mutating func removeAll(keys: [Key]) {
        
        keys.forEach({ removeValue(forKey: $0)})
    }
    
    /// Json字典转Json字符串
    public func jsonString(prettify: Bool = false) -> String? {
        
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
    
    /// Json字典转Data
    public func jsonData(prettify: Bool = false) -> Data? {
        
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
}
