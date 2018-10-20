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
        // Do any additional setup after loading the view, typically from a nib.
        let multiDegreeLikeButton = MultiDegreeLikeButton()
        view.addSubview(multiDegreeLikeButton)
        multiDegreeLikeButton.translatesAutoresizingMaskIntoConstraints = false
        multiDegreeLikeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        multiDegreeLikeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        multiDegreeLikeButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        multiDegreeLikeButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

