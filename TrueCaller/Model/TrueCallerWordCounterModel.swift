//
//  TrueCallerWordCounterModel.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit
class TrueCallerWordCounterModel : BaseModel {
    
    var wordsWithOccurances:[String:Int] = [:]
    
    override func parseResponse(data: Data?) {
        guard let data = data else { return }
        
        if let plainText = String(data: data, encoding: .utf8) {
            let lines = plainText.components(separatedBy: "\n")
            for line in lines {
                let words = line.components(separatedBy: " ")
                for word in words {
                    
                    if let occurances = wordsWithOccurances[word.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()] {
                        wordsWithOccurances[word] = occurances + 1
                    }
                    else{
                        // does not contain key
                        wordsWithOccurances[word.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()] = 1
                    }
                }
            }
        }
        
        
    }
}
