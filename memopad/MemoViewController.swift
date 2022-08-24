//
//  MemoViewController.swift
//  memopad
//
//  Created by Maoko Furuya on 2022/08/24.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    var saveData: UserDefaults = UserDefaults.standard



    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.object(forKey:"title") as? String
        contentTextView.text = saveData.object(forKey:"content") as? String
        titleTextField.delegate = self

    }
    
    
    @IBAction func saveMemo(){
        saveData.set(titleTextField.text, forKey:"title")
        saveData.set(contentTextView.text, forKey:"content")
        
        let alert: UIAlertController = UIAlertController(title:"保存", message:"保存完了",preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                style: .default,
                handler:{ action in
            self.navigationController?.popViewController(animated: true)
                }
            )
        )
        present(alert, animated: true,completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



