//
//  Extensions.swift
//  TrueCaller
//
//  Created by Neeraj Solanki on 27/03/21.
//

import UIKit
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
