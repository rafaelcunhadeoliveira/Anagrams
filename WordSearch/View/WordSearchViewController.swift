//
//  WordSearchViewController.swift
//  WordSearch
//
//  Created by Rafael Cunha de Oliveira on 2020-04-23.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class WordSearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    let assistant = WordAssistant("")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func search(_ sender: Any) {
        if let text = textField.text,
            text.onlyLetters {
            performSegue(withIdentifier: "showWords", sender: nil)
        } else {
            showAlert(title: "Error", message: "Only letters allowed")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AssociateWordsViewController,
            let text = textField.text{
            vc.assistant = self.assistant
            vc.word = text
        }
    }
}
