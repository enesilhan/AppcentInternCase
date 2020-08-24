//
//  FullScreenViewController.swift
//  AppcentCaseProject
//
//  Created by Enes ILHAN on 24.08.2020.
//  Copyright © 2020 Enes ILHAN. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    var imageURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageURL = imageURL {
            detailImageView.downloaded(from: imageURL)
        }
    }
}
