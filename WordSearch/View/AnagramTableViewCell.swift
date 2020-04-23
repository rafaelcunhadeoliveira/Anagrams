//
//  AnagramTableViewCell.swift
//  WordSearch
//
//  Created by Rafael Cunha de Oliveira on 2020-04-23.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class AnagramTableViewCell: UITableViewCell {

    @IBOutlet weak var anagramLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(anagram: String) {
        anagramLabel.text = anagram
    }
}
