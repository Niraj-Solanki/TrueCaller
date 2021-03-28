//
//  DetailsViewController.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var trueCaller10CharacterTextView: UITextView!
    @IBOutlet weak var trueCallerEvery10CharacterTextView: UITextView!
    @IBOutlet weak var trueCallerWordCounterTextView: UITextView!
    
    @IBOutlet weak var trueCaller10thCharacterIndicator: UIActivityIndicatorView!
    @IBOutlet weak var trueCallerEvery10thCharacterIndicator: UIActivityIndicatorView!
    @IBOutlet weak var trueCallerWordCountIndicator: UIActivityIndicatorView!
    
    //MARK:- Objects
    var viewModel:DetailControllerViewModel?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeVariable()
    }
    
    // MARK: - Custom Methods
    func initializeVariable() {
        self.viewModel = DetailControllerViewModel()
        self.bindingWork()
        self.viewModel?.fetchData()
    }
    
    func bindingWork() {
        viewModel?.observerBlock = { [weak self] (observerType)in
            switch observerType {
            case .trueCaller10thCharacter(let updatedText):
                self?.trueCaller10thCharacterIndicator.stopAnimating()
                self?.trueCaller10CharacterTextView.text = updatedText
                
            case .trueCallerEvery10thCharacter(let updatedText):
                self?.trueCallerEvery10CharacterTextView.text = updatedText
                self?.trueCallerEvery10thCharacterIndicator.stopAnimating()
                
            case .trueCallerWordCounter(let updatedText):
                self?.trueCallerWordCounterTextView.text = updatedText
                self?.trueCallerWordCountIndicator.stopAnimating()
                
            case .trueCaller10thCharacterDataLoading:
                self?.trueCaller10thCharacterIndicator.startAnimating()
                
            case .trueCallerEvery10thCharacterDataLoading:
                self?.trueCallerEvery10thCharacterIndicator.startAnimating()
                
            case .trueCallerWordCounterDataLoading:
                self?.trueCallerWordCountIndicator.startAnimating()
            }
        }
    }
    
    // MARK: - Action Methods
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
