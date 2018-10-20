//
//  MultiDegreeLikeButton.swift
//  FBSnapshotTestCase
//
//  Created by 中塚貴大 on 2018/10/20.
//

import Foundation

public class MultiDegreeLikeButton: UIView, UIGestureRecognizerDelegate {
    let defaultButtonImage = UIImage(
        named: "like_default",
        in: Bundle(for: MultiDegreeLikeButton.self),
        compatibleWith: nil
    )
    
    let tappedButtonImage = UIImage(
        named: "like_tapped",
        in: Bundle(for: MultiDegreeLikeButton.self),
        compatibleWith: nil
    )
    
    lazy var likeImageView = UIImageView(image: defaultButtonImage)
    
    var likeImageOriginalSize: CGSize
    
    var longPressStartTime: Date?
    
    var isTappped: Bool = false
    
    var isLongPressing: Bool = false

    public init(defaultSize: CGSize = CGSize(width: 24, height: 24)) {
        likeImageOriginalSize = defaultSize
        
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        setupGestures()
        
        addSubview(likeImageView)
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        likeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGestures() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapped(_:)))
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressed(_:)))
        
        tapGestureRecognizer.delegate = self
        longPressGestureRecognizer.delegate = self
        
        addGestureRecognizer(tapGestureRecognizer)
        addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func onTapped(_ sender: UITapGestureRecognizer) {
        if isLongPressing { return }
        isTappped.toggle()
        likeImageView.image = isTappped ? tappedButtonImage : defaultButtonImage
    }
    
    @objc func onLongPressed(_ sender: UITapGestureRecognizer) {
        let aimationDuration = 1.0
        let transformScale : CGFloat = 10
        if sender.state == .began {
            isLongPressing = true
            likeImageView.image = tappedButtonImage
            longPressStartTime = Date()
            UIView.animate(withDuration: aimationDuration) { [weak self] in
                self?.likeImageView.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
            }
        } else if sender.state == .ended {
            let durationRatio = CGFloat(-longPressStartTime!.timeIntervalSinceNow / aimationDuration)
            let currentScale = transformScale * durationRatio
            if currentScale < transformScale {
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.likeImageView.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
                }
            }
            likeImageView.layer.removeAllAnimations()
            UIView.animate(
                withDuration: 0.1,
                delay: 0.25,
                options: [],
                animations: { [weak self] in
                    self?.likeImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                },
                completion: { [weak self] _ in
                    self?.isTappped = true
                    self?.isLongPressing = false
                }
            )
        }
    }
}
