//
//  UIView+BLExt.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import UIKit

struct RunTimeViewKey {
    
    static let RunTimeViewID = UnsafeRawPointer.init(bitPattern: "RunTimeViewID".hashValue)
    static let RunTimeViewParam = UnsafeRawPointer.init(bitPattern: "RunTimeViewParam".hashValue)
}

extension UIView {
    
    /// viewId
    public var ViewID: String? {
        set {
            objc_setAssociatedObject(self, RunTimeViewKey.RunTimeViewID!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeViewKey.RunTimeViewID!) as? String
        }
    }
    
    ///ViewParam
    public var ViewParam: [String: Any]? {
        set {
            objc_setAssociatedObject(self, RunTimeViewKey.RunTimeViewParam!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeViewKey.RunTimeViewParam!) as? Dictionary
        }
    }
}

extension UIView {
    
    /// 宽
    public var W: CGFloat {
        return self.bounds.size.width
    }
    
    /// 高
    public var H: CGFloat {
        return self.bounds.size.height
    }
    
    /// X
    public var X: CGFloat {
        return self.frame.origin.x
    }
    
    /// Y
    public var Y: CGFloat {
        return self.frame.origin.y
    }
    
    /// bottom
    public var bottom: CGFloat {
        return Y + H
    }
    
    /// right
    public var right: CGFloat {
        return X + W
    }
    
    /// centerX
    public var centerX: CGFloat {
        return self.center.x
    }
    
    /// centerY
    public var centerY: CGFloat {
        return self.center.y
    }
}

// MARK: 添加方法
extension UIView {
    
    /// 移除所有子视图
    public func removeAllChildView() {
        _ = self.subviews.map {
            $0.removeFromSuperview()
        }
    }
    
    /// 设置圆角
    public func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    /// 设置边框
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    ///设置顶部边框
    public func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    
    /// 设置底部边框
    public func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    
    /// 设置左侧边框
    public func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// 设置右侧边框
    public func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// 设置CALayer
    fileprivate func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
    
    /// view截图为image
    public func toImage () -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
