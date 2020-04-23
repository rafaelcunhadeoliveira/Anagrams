//
//  String+Extension.swift
//  WordSearch
//
//  Created by Rafael Cunha de Oliveira on 2020-04-23.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import Foundation

extension String {
    var onlyLetters: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }

    func keyMap() -> [String: Int] {
        var result = [String: Int]()
        for c in self {
            if let count = result[String(c)] {
                result[String(c)] = count + 1
            } else {
                result[String(c)] = 1
            }
        }
        return result
    }
}
