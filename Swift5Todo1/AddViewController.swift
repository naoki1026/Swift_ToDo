//
//  AddViewController.swift
//  Swift5Todo1
//
//  Created by Naoki Arakawa on 2019/02/21.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
    
    //ToDoを登録するための配列を準備する
    var array = [String]()
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delefgateを使うとここで宣言する（武器の使用を宣言する）
        textField.delegate = self

      
    }
    

    @IBAction func add(_ sender: Any) {
        
        //現在の配列を取り出す
        //ドキュメントの通り
        if (UserDefaults.standard.object(forKey: "todo") != nil) {
            
            array = UserDefaults.standard.object(forKey: "todo") as! [String]
            
        }
        
        //arrayの配列にtextFieldに書かれている文字を追加する
        array.append(textField.text!)
        
        //アプリ内にデータを保存する
        UserDefaults.standard.set(array, forKey: "todo")
        
        //最初の画面に戻る
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //textFieldが持つデリゲートメソッドで、デリゲートメソッドを描いた時から使用することができる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textFieldを閉じる
        textField.resignFirstResponder()
        return true
        
    }
    

}
