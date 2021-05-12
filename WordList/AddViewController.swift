//
//  AddViewController.swift
//  WordList
//
//  Created by 柳澤琉貴 on 2021/05/13.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    var wordArray : [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "Word") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        var stringEnglishTextField: String = englishTextField.text!
        var stringJapaneseTextField: String = japaneseTextField.text!
        if stringEnglishTextField.isEmpty || stringJapaneseTextField.isEmpty {
            let alert = UIAlertController(
                title: "単語を入力してください",
                message: "空欄では登録できません",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                            title: "OK",
                                style: .default,
                                handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
            title:  "保存完了",
            message:  "単語の保存が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
