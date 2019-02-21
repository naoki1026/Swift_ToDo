//
//  ViewController.swift
//  Swift5Todo1
//
//  Created by Naoki Arakawa on 2019/02/20.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    
    var resultArray = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //これは必須である
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //保存されたものを取り出す
        if UserDefaults.standard.object(forKey: "todo") != nil {
            
            resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
            
            
        }
        
        tableView.reloadData()
        
        
    }
    
    //セクションの中のセルの数で、配列の分だけセルを返すためresultArray.countを返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return resultArray.count
        
    }
    
    //ここがセクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルを生成して返却するメソッドで、セルの数だけ呼び出される。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //セルの数だけ配列を出してあげる必要がある
        cell.textLabel?.text = resultArray[indexPath.row]
        
        //ここでセルを返してあげる
        return cell

    }
    
    //高さを設定する
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //edigingStyleがdeleteだった場合
        if editingStyle == .delete {
            
            // スライドされた番号を削除する
            //スライドされた番号が、at: indexPath.rowの中で認識される
            resultArray.remove(at: indexPath.row)
            
            //新しい配列に保存する
             UserDefaults.standard.set(resultArray, forKey: "todo")
            
            //tableViewを更新する
            tableView.reloadData()
            
        }
        
    }

}

