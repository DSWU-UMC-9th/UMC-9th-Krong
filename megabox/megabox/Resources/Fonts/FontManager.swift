//
//  FontManager.swift
//  megabox
//
//  Created by 정서영 on 9/21/25.
//

import SwiftUI

extension Font {
    enum Pretendard {
        case ExtraBold
        case Bold
        case Semibold
        case Medium
        case Regular
        case Light
        
        var value: String {
            switch self {
            case .ExtraBold: return "Pretendard-ExtraBold"
            case .Bold: return "Pretendard-Bold"
            case .Semibold: return "Pretendard-Semibold"
            case .Medium: return "Pretendard-Medium"
            case .Regular: return "Pretendard-Regular"
            case .Light: return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var extraBold24: Font {
        return .pretend(type: .ExtraBold, size: 24)
    }
    
    static var bold18: Font {
        return .pretend(type: .Bold, size: 18)
    }
    
    static var bold22: Font {
        return .pretend(type: .Bold, size: 22)
    }
    
    static var bold24: Font {
        return .pretend(type: .Bold, size: 24)
    }
    
    static var semibold12: Font {
        return .pretend(type: .Semibold, size: 12)
    }
    
    static var semibold13: Font {
        return .pretend(type: .Semibold, size: 13)
    }
    
    static var semibold14: Font {
        return .pretend(type: .Semibold, size: 14)
    }
    
    static var semibold16: Font {
        return .pretend(type: .Semibold, size: 16)
    }
    
    static var semibold18: Font {
        return .pretend(type: .Semibold, size: 18)
    }
    
    static var semibold24: Font {
        return .pretend(type: .Semibold, size: 24)
    }
    
    static var semibold38: Font {
        return .pretend(type: .Semibold, size: 38)
    }
    
    static var regular09: Font {
        return .pretend(type: .Regular, size: 9)
    }
    
    static var regular12: Font {
        return .pretend(type: .Regular, size: 12)
    }
    
    static var regular13: Font {
        return .pretend(type: .Regular, size: 13)
    }
    
    static var regular18: Font {
        return .pretend(type: .Regular, size: 18)
    }
    
    static var regular20: Font {
        return .pretend(type: .Regular, size: 20)
    }
    
    static var medium8: Font {
        return .pretend(type: .Medium, size: 8)
    }
    
    static var medium10: Font {
        return .pretend(type: .Medium, size: 10)
    }
    
    static var medium13: Font {
        return .pretend(type: .Medium, size: 13)
    }
    
    static var medium14: Font {
        return .pretend(type: .Medium, size: 14)
    }
    
    static var medium16: Font {
        return .pretend(type: .Medium, size: 16)
    }
    
    static var medium18: Font {
        return .pretend(type: .Medium, size: 18)
    }
    
    static var light14: Font {
        return .pretend(type: .Light, size: 14)
    }
}

