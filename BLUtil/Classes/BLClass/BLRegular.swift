//
//  JHRegularHelp.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

import Foundation

fileprivate enum ValidatedType {
    case Email
    case PhoneNumber
    case Number
    case SpecificNumbers
    case Chinese
    case IllegalCharacter
    case URL
    case BlankLines
    case QQ
    case ID
    case MAC
    case IdCard
    case DateInformation
    case AccountLegal
    case Password
    case StrongPassword
    case ThereIsNo
}

fileprivate func ValidateText(validatedType type: ValidatedType, validateString: String) -> Bool {
    
    do {
        let pattern: String
        
        switch type {
            
        case ValidatedType.Email:
            pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            
        case ValidatedType.PhoneNumber:
            pattern = "^1[0-9]{10}$"
            
        case ValidatedType.Number:
            pattern = "^[0-9]*$"
            
        case ValidatedType.SpecificNumbers:
            pattern = "^\\d{8}$"
            
        case ValidatedType.Chinese:
            pattern = "^[\\u4e00-\\u9fa5]{0,}$"
            
        case ValidatedType.IllegalCharacter:
            pattern = "[%&',;=?$\\\\^]+"
            
        case ValidatedType.URL:
            pattern = "^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"
            
        case ValidatedType.BlankLines:
            pattern = "^s*|s*$"
            
        case ValidatedType.QQ:
            pattern = "[1-9][0-9]{4,}"
            
        case ValidatedType.ID:
            pattern = "([1-9]{1,3}\\.){3}[1-9]"
            
        case ValidatedType.MAC:
            pattern = "([A-Fa-f0-9]{2}\\:){5}[A-Fa-f0-9]"
            
        case ValidatedType.IdCard:
            pattern = "\\d{14}[[0-9],0-9xX]"
            
        case ValidatedType.DateInformation:
            pattern = "^\\d{4}-\\d{1,2}-\\d{1,2}"
            
        case ValidatedType.AccountLegal:
            pattern = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$"
            
        case ValidatedType.Password:
            pattern = "^[a-zA-Z]\\w{5,15}$"
            
        case ValidatedType.StrongPassword:
            pattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,16}$"
            
        default:
            pattern = ""
        }
        
        let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        let matches = regex.matches(in: validateString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, validateString.count))
        return matches.count > 0
    } catch {
        return false
    }
}

/// 验证邮箱
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func EmailIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.Email, validateString: vStr)
}

/// 验证手机号
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func PhoneNumberIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.PhoneNumber, validateString: vStr)
}

/// 验证数字
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func NumberIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.Number, validateString: vStr)
}

/// 验证8数字 里面的8换成你想要的数字
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func SpecificNumbersIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.SpecificNumbers, validateString: vStr)
}

/// 验证是否是中文
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func ChineseIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.Chinese, validateString: vStr)
}

/// 验证是否含有^%&',;=?$\"等字符
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func IllegalCharacterIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.IllegalCharacter, validateString: vStr)
}

/// 验证URL
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func URLIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.URL, validateString: vStr)
}

/// 验证首尾空白行 这个现在有问题
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func BlankLinesIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.BlankLines, validateString: vStr)
}

/// 验证QQ号
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func QQIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.QQ, validateString: vStr)
}

/// 验证ID地址 需要自定义
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func IDIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.ID, validateString: vStr)
}

/// 验证MAC地址
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func MACIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.MAC, validateString: vStr)
}

/// 验证身份证
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func IdCardIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.IdCard, validateString: vStr)
}

/// 验证年月日    例子 2013-04-12
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func DateInformationIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.DateInformation, validateString: vStr)
}

/// 验证帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func AccountLegalIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.AccountLegal, validateString: vStr)
}

/// 验证密码(以字母开头，长度在6~16之间，只能包含字母、数字和下划线)
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func PasswordIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.Password, validateString: vStr)
}

/// 验证强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在6-16之间)
///
/// - Parameter vStr: 字符串入参
/// - Returns: 是否OK
func StrongPasswordIsValidated(vStr: String) -> Bool {
    
    return ValidateText(validatedType: ValidatedType.StrongPassword, validateString: vStr)
}