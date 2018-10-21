//
//  MultiDegreeLikeButtonStyle.swift
//  MultiDegreeLikeButton
//
//  Created by nukotsuka on 2018/10/20.
//

import Foundation

public enum MultiDegreeLikeButtonImageStyle {
    case heart
    case star
    case custom(defaultImage: UIImage, tappedImage: UIImage)
    
    var defaultImage: UIImage {
        switch self {
        case .heart:
            return UIImage(named: "heart_default", in: .current, compatibleWith: nil) ?? undefined("heart image not found")
        case .star:
            return UIImage(named: "star_default", in: .current, compatibleWith: nil) ?? undefined("star image not found")
        case let .custom(defaultImage, _):
            return defaultImage
        }
    }
    
    var tappedImage: UIImage {
        switch self {
        case .heart:
            return UIImage(named: "heart_tapped", in: .current, compatibleWith: nil) ?? undefined("heart image not found")
        case .star:
            return UIImage(named: "star_tapped", in: .current, compatibleWith: nil) ?? undefined("star image not found")
        case let .custom(_, tappedImage):
            return tappedImage
        }
    }
}

extension Bundle {
    public static var current: Bundle {
        return Bundle(for: MultiDegreeLikeButton.self)
    }
}

public func undefined<T>(_ message: String) -> T {
    fatalError(message)
}
