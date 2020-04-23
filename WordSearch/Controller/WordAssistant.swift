//
//  WordAssistant.swift
//  WordSearch
//
//  Created by Rafael Cunha de Oliveira on 2020-04-23.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class WordAssistant {

    var words: [String] = []
    var word = "" {
        didSet {
            anagrams = []
        }
    }
    var anagrams: [String] = []

    init(_ word: String) {
        self.word = word
        openFile()
    }

    func openFile() { // get Dictionary
        guard let path = Bundle.main.path(forResource: "word", ofType: "txt") else { return }
        do {
            let string = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            words = string.components(separatedBy: "\n")
        } catch {
            print(error.localizedDescription)
        }
    }

    func getAnagrams() { //Look for anagrams of the specified word on dictionary
        for w in words {
            if let anagram = verifyWord(word, w),
                !anagram.isEmpty {
                anagrams.append(anagram)
            }
        }
    }

    func verifyWord(_ principalString: String,_ secondaryString: String) -> String? {
        //Change both strings into array of dictionary with key and number of repetitions
        let principal = principalString.keyMap()
        let secondary = secondaryString.keyMap()
        var similarities = 0
        for p in principal {
            //Check if the dictionary word has all the letters and less repetitions then the master word
            if let sim = secondary.filter({ $0.key == p.key }).first,
                sim.value <= p.value {
                similarities += 1
            }
        }
        // check if all words are present
        if similarities == secondary.count {
            return secondaryString
        } else {
            return nil
        }
    }
}
