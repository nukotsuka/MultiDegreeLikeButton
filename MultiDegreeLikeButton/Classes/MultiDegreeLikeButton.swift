//
//  MultiDegreeLikeButton.swift
//  MultiDegreeLikeButton
//
//  Created by nukotsuka on 2018/10/20.
//

import UIKit

open class MultiDegreeLikeButton: UIView {
    private let likeImageView = UIImageView()
    
    private let imageStyle: MultiDegreeLikeButtonImageStyle
    
    private var size: CGSize
    
    private var tappedImage: UIImage?
    
    private var is3DTouched: Bool = false
    
    private var tapStartedTime: Date?
    
    /// if this value is false, completion is not called, but animation works. Default is true.
    open var isEnabled: Bool = true
    
    /// the degree of like, and this value is used for expanding scale of the button. Default is 5.0 .
    open var likeDegree: Int = 5
    
    /// the duration of expanding animation while tapping the button. Default is 2.0 .
    open var durationLongPress: Double = 2.0
    
    /// the duration of expanding animation while 3D touching the button. Default is 0.1 .
    open var duration3DTouch: Double = 0.1
    
    /// the duration of shrinking animation after end of tap. Default is 0.1 .
    open var durationShrink: Double = 0.1
    
    /// the delay from the end of tap until shrinking starts. Default is 0.3 .
    open var delayBeforeShrink: Double = 0.3

    /// the threshold at which 3D touch starts. Default is 4.0 .
    open var threshold3DTouch: CGFloat = 4.0
    
    /// the callback function called after tap finishes.
    /// Int argument indicates the degree of like based on the time the user was tapping.
    /// And the range is from 1 to likeDegree.
    open var completionWithLikeDegree: ((MultiDegreeLikeButton, Int) -> Void)?
    
    public init(
        imageStyle: MultiDegreeLikeButtonImageStyle,
        size: CGSize = CGSize(width: 24, height: 24)
    ) {
        self.imageStyle = imageStyle
        self.size = size
        
        super.init(frame: .zero)
        
        setupView()
        setupImage()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(likeImageView)
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        likeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setupImage() {
        let resizedDefaultImage = resizeImage(image: imageStyle.defaultImage, size: size)
        let resizedTappedImage = resizeImage(image: imageStyle.tappedImage, size: size)
        likeImageView.image = resizedDefaultImage
        tappedImage = resizedTappedImage
    }
    
    private func resizeImage(image: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return (resizedImage ?? undefined("resizedImage is not exist")).withRenderingMode(image.renderingMode)
    }
    
    override open var intrinsicContentSize: CGSize {
        return size
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        likeImageView.image = tappedImage
        tapStartedTime = Date()
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if traitCollection.forceTouchCapability == .available {
            guard let touchFource = touches.first?.force else { return }
            if touchFource > threshold3DTouch {
                if is3DTouched == false {
                    let durationRatio = CGFloat(-(tapStartedTime ?? undefined("tapStartedTime is not exist")).timeIntervalSinceNow / durationLongPress)
                    let currentScale = min(max(CGFloat(likeDegree) * durationRatio, 1), CGFloat(likeDegree))
                    likeImageView.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
                    likeImageView.layer.removeAllAnimations()
                }
                is3DTouched = true
                UIView.animate(withDuration: duration3DTouch, animations: { [weak self] in
                    guard let `self` = self else { return }
                    self.likeImageView.transform = CGAffineTransform(scaleX: CGFloat(self.likeDegree), y: CGFloat(self.likeDegree))
                })
            } else {
                UIView.animate(withDuration: durationLongPress, animations: { [weak self] in
                    guard let `self` = self else { return }
                    self.likeImageView.transform = CGAffineTransform(scaleX: CGFloat(self.likeDegree), y: CGFloat(self.likeDegree))
                })
            }
        } else {
            UIView.animate(withDuration: durationLongPress, animations: { [weak self] in
                guard let `self` = self else { return }
                self.likeImageView.transform = CGAffineTransform(scaleX: CGFloat(self.likeDegree), y: CGFloat(self.likeDegree))
            })
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchDegree: Int
        
        if is3DTouched == false {
            let durationRatio = CGFloat(-(tapStartedTime ?? undefined("tapStartedTime is not exist")).timeIntervalSinceNow / durationLongPress)
            let currentScale = min(max(CGFloat(likeDegree) * durationRatio, 1), CGFloat(likeDegree))
            likeImageView.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
            likeImageView.layer.removeAllAnimations()
            touchDegree = Int(round(currentScale))
        } else {
            touchDegree = likeDegree
        }
        UIView.animate(
            withDuration: durationShrink,
            delay: delayBeforeShrink,
            options: [],
            animations: { [weak self] in
                guard let `self` = self else { return }
                self.likeImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            },
            completion: { [weak self] _ in
                guard let `self` = self else { return }
                self.is3DTouched = false
                if let completion = self.completionWithLikeDegree, self.isEnabled {
                    completion(self, touchDegree)
                }
            }
        )
    }
}
