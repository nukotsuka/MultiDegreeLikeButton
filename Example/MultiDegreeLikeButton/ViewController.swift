//
//  ViewController.swift
//  MultiDegreeLikeButton
//
//  Created by RichGreenTea on 10/20/2018.
//  Copyright (c) 2018 RichGreenTea. All rights reserved.
//

import UIKit
import MultiDegreeLikeButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label to show like degree after MultiDegreeLikeButton is tapped
        let degreeLabel = UILabel()
        degreeLabel.font = .boldSystemFont(ofSize: 32)
        degreeLabel.text = "Like degree: -/-"
        view.addSubview(degreeLabel)
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        degreeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        
        // Sample buttno whoes properties are default
        let heartButton = MultiDegreeLikeButton(imageStyle: .heart)
        heartButton.completion = { degree in
            degreeLabel.text = "Like degree: \(degree)/\(heartButton.likeDegree)"
        }
        view.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        heartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Sample button whoes properties are customed
        let starButton = MultiDegreeLikeButton(imageStyle: .star, size: 48)
        starButton.likeDegree = 10
        starButton.durationLongPress = 5.0
        starButton.duration3DTouch = 0.5
        starButton.durationShrink = 0.5
        starButton.delayBeforeShrink = 0.1
        starButton.threshold3DTouch = 5.0
        starButton.completion = { degree in
            degreeLabel.text = "Like degree: \(degree)/\(starButton.likeDegree)"
        }
        view.addSubview(starButton)
        starButton.translatesAutoresizingMaskIntoConstraints = false
        starButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        starButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

