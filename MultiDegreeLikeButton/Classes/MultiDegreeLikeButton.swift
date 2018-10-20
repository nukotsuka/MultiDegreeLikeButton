//
//  MultiDegreeLikeButton.swift
//  FBSnapshotTestCase
//
//  Created by 中塚貴大 on 2018/10/20.
//

import Foundation

public class MultiDegreeLikeButton: UIView {
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapped(_:)))
    let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressed(_:)))
    
    @objc func onTapped(_ sender: UITapGestureRecognizer) {
        UIImage(named: "like")
    }
    
    @objc func onLongPressed(_ sender: UITapGestureRecognizer) {
        
    }
}
