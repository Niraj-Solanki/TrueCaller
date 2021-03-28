//
//  TrueCaller10thCharacterModel.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

protocol ResponseParser {
    func parseResponse(data:Data?)
}

class BaseModel: ResponseParser {
    func parseResponse(data: Data?) {
        
    }
}

class TrueCaller10thCharacterModel: BaseModel {
    var text:String?
    
    override func parseResponse(data: Data?) {
        guard let data = data else { return }
        if let plainText = String(data: data, encoding: .utf8), plainText.count > 9 {
            self.text = String.init(plainText[9])
        }
        else{
            self.text = "Invalid Data"
        }
    }
}
