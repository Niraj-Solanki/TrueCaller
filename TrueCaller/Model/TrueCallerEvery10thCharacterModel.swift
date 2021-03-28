//
//  TrueCallerEvery10thCharacterModel.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit

class TrueCallerEvery10thCharacterModel: BaseModel {
    var tokens:[String] = []
    
    override func parseResponse(data: Data?) {
        guard let data = data else { return }
        
            if let plainText = String(data: data, encoding: .utf8) {
                for index in stride(from: 9, to: plainText.count, by: 10){
                    self.tokens.append("Character At Index \(index + 1) : \(String(plainText[index]))")
                }
            }
            else{
                self.tokens = ["Invalid Data"]
            }
        
    }
}
