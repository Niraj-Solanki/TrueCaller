//
//  DetailControllerViewModel.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

enum ObserverType {
    case trueCaller10thCharacter(String?)
    case trueCaller10thCharacterDataLoading
    case trueCallerEvery10thCharacter(String?)
    case trueCallerEvery10thCharacterDataLoading
    case trueCallerWordCounter(String?)
    case trueCallerWordCounterDataLoading
}

class DetailControllerViewModel
{
    private let detailApiManager = DetailsAPIManagerImpl()
    private var trueCaller10thCharacterModel:TrueCaller10thCharacterModel? {
        didSet{
            observerBlock?(.trueCaller10thCharacter("'\(trueCaller10thCharacterModel?.text ?? "")'"))
        }
    }
    
    private var trueCallerEvery10thCharacterModel:TrueCallerEvery10thCharacterModel? {
        didSet{
            observerBlock?(.trueCallerEvery10thCharacter(trueCallerEvery10thCharacterModel?.tokens
                                                            .joined(separator: "\n")))
        }
    }
    
    private var trueCallerWordCounterModel:TrueCallerWordCounterModel?{
        didSet{
            let text = trueCallerWordCounterModel?.wordsWithOccurances.map{ "\($0.key)\nOCCURANCES \($0.value)"}.joined(separator: "\n\n")
            observerBlock?(.trueCallerWordCounter(text))
        }
    }
    
    var observerBlock:((ObserverType)->Void)?
    
    init() {
    }
    
    func fetchData()  {
        trueCaller10thCharacterApiCall()
        trueCallerEvery10thCharacterApiCall()
        trueCallerWordCounterApiCall()
    }
    
    //MARK:- API Calls
    private func trueCaller10thCharacterApiCall() {
        observerBlock?(.trueCaller10thCharacterDataLoading)
        detailApiManager.trueCaller10thCharacter { [weak self] (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self?.trueCaller10thCharacterModel = model
                    break
                case .failure(let error):
                    self?.observerBlock?(.trueCaller10thCharacter(error.localizedDescription))
                    break
                }
            }
        }
    }
    
    private func trueCallerEvery10thCharacterApiCall() {
        observerBlock?(.trueCallerEvery10thCharacterDataLoading)
        detailApiManager.trueCallerEvery10thCharacter{ [weak self] (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self?.trueCallerEvery10thCharacterModel = model
                    break
                case .failure(let error):
                    self?.observerBlock?(.trueCallerEvery10thCharacter(error.localizedDescription))
                    break
                }
            }
        }
    }
    
    private func trueCallerWordCounterApiCall() {
        observerBlock?(.trueCallerWordCounterDataLoading)
        detailApiManager.trueCallerWordCounnter { [weak self] (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    self?.trueCallerWordCounterModel = model
                    break
                case .failure(let error):
                    self?.observerBlock?(.trueCallerWordCounter(error.localizedDescription))
                    break
                }
            }
        }
    }
    
}
