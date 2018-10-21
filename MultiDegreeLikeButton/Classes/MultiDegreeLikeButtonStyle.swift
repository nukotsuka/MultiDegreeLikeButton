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
            return UIImage(named: "heart_default", in: Bundle(for: MultiDegreeLikeButton.self), compatibleWith: nil)!
        case .star:
            return UIImage(named: "star_default", in: Bundle(for: MultiDegreeLikeButton.self), compatibleWith: nil)!
        case let .custom(defaultImage, _):
            return defaultImage
        }
    }
    
    var tappedImage: UIImage {
        switch self {
        case .heart:
            return UIImage(named: "heart_tapped", in: Bundle(for: MultiDegreeLikeButton.self), compatibleWith: nil)!
        case .star:
            return UIImage(named: "star_tapped", in: Bundle(for: MultiDegreeLikeButton.self), compatibleWith: nil)!
        case let .custom(_, tappedImage):
            return tappedImage
        }
    }
}
