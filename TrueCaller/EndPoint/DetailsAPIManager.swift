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
    
    func model(data:Data?) -> BaseModel {
        switch self {
        case .trueCaller10thCharacter:
            let model = TrueCaller10thCharacterModel()
            model.parseResponse(data: data)
            return model
        case .trueCallerEvery10thCharacter:
            let model = TrueCallerEvery10thCharacterModel()
            model.parseResponse(data: data)
            return model
        case .trueCallerWordCounnter:
            let model = TrueCallerWordCounterModel()
            model.parseResponse(data: data)
            return model
        }
    }
    
}

protocol DetailsAPIManager {
    func request(endPoint:ApiEndPoint,completion: ((Result<BaseModel, Error>) -> Void)?)
}

class DetailsAPIManagerImpl : DetailsAPIManager {
    func request(endPoint: ApiEndPoint,completion: ((Result<BaseModel, Error>) -> Void)?) {
        if let url = URL.init(string: endPoint.urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.global().async {
                    if let error = error {
                        completion?(Result.failure(error))
                    }
                    else{
                        completion?(Result.success(endPoint.model(data: data)))
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
