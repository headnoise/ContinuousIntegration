//
//  PhotoDetailViewController.swift
//  ContinuousIntegration
//
//  Created by Neo on 03/17/2019.
//  Copyright © 2019 Sonntag. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var imageUrl: String?
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .black
    }
    
    func setupViews() {
        addSubviews()
        loadImage()
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addSubviews() {
        view.addSubview(imageView)
    }
    
    func loadImage() {
        if let imageUrl = imageUrl {
            imageView.loadImageUsingCacheWith(imageUrl)
        }
    }

}
