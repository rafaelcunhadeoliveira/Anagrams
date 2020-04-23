//
//  AssociateWordsViewController.swift
//  WordSearch
//
//  Created by Rafael Cunha de Oliveira on 2020-04-23.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

protocol reloadTableView {
    func reloadView()
}

class AssociateWordsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var word = ""
    var assistant: WordAssistant?

    override func viewDidLoad() {
        super.viewDidLoad()
        assistant?.word = word
        assistant?.getAnagrams()
    }
}

extension AssociateWordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assistant?.anagrams.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as? AnagramTableViewCell else {
            return UITableViewCell()
        }
        cell.setUp(anagram: assistant?.anagrams[indexPath.row] ?? "")
        return cell
    }
}
