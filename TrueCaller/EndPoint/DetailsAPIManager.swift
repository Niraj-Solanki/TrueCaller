//
//  DetailsAPIManager.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

enum ApiEndPoint {
    case trueCaller10thCharacter
    case trueCallerEvery10thCharacter
    case trueCallerWordCounnter
    
    var urlString:String {
        return "https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/"
    }
}

protocol DetailsAPIManager {
    func trueCaller10thCharacter( completion: ((Result<TrueCaller10thCharacterModel,Error>) -> Void)?)
    func trueCallerEvery10thCharacter( completion: ((Result<TrueCallerEvery10thCharacterModel,Error>) -> Void)?)
    func trueCallerWordCounnter( completion: ((Result<TrueCallerWordCounterModel,Error>) -> Void)?)
}


class DetailsAPIManagerImpl : DetailsAPIManager {
    
    func trueCaller10thCharacter(completion: ((Result<TrueCaller10thCharacterModel, Error>) -> Void)?) {
        if let url = URL.init(string: ApiEndPoint.trueCaller10thCharacter.urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        completion?(Result.failure(error))
                    }
                    else{
                        let model = TrueCaller10thCharacterModel()
                        model.parseResponse(data: data)
                        completion?(Result.success(model))
                    }
            }.resume()
        }
        else
        {
            completion?(Result.failure(NSError(domain: "Invalid Url", code: 0, userInfo: nil)))
        }
    }
    
    func trueCallerEvery10thCharacter(completion: ((Result<TrueCallerEvery10thCharacterModel, Error>) -> Void)?) {
        if let url = URL.init(string: ApiEndPoint.trueCaller10thCharacter.urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.global(qos: .background).async {
                    if let error = error {
                        completion?(Result.failure(error))
                    }
                    else{
                        let model = TrueCallerEvery10thCharacterModel()
                        model.parseResponse(data: data)
                        completion?(Result.success(model))
                    }
                }
            }.resume()
            
        }
        else
        {
            completion?(Result.failure(NSError(domain: "Invalid Url", code: 0, userInfo: nil)))
        }
    }
    
    func trueCallerWordCounnter(completion: ((Result<TrueCallerWordCounterModel, Error>) -> Void)?) {
        if let url = URL.init(string: ApiEndPoint.trueCaller10thCharacter.urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.global(qos: .background).async {
                    if let error = error {
                        completion?(Result.failure(error))
                    }
                    else{
                        let model = TrueCallerWordCounterModel()
                        model.parseResponse(data: data)
                        completion?(Result.success(model))
                    }
                }
            }.resume()
        }
        else
        {
            completion?(Result.failure(NSError(domain: "Invalid Url", code: 0, userInfo: nil)))
        }
    }
    
}
