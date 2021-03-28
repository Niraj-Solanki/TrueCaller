//
//  HomeViewController.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Action Methods
    @IBAction func DetailTapAction(_ sender: UIButton) {
        let detailsController = DetailsViewController()
        detailsController.modalPresentationStyle = .fullScreen
        self.present(detailsController, animated: true, completion: nil)
    }
}

