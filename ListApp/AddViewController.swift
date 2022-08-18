//
//  AddViewController.swift
//  ListApp
//
//  Created by 山崎颯汰 on 2022/07/07.
//

import UIKit
import Eureka

class AddViewController: FormViewController {
    
    var TodoTitle: String?
    var TodoDetail: String?
    var TodoGenre: String = "選択なし"
    
    let userDefaults = UserDefaults.standard
    
    let i: Int = 0
    let j: Int = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.backgroundColor =  UIColor(red: 76/255, green: 132/255, blue: 188/255, alpha: 1)
        
        
        form
        // ここからセクション1
        +++ Section("内容")
        <<< TextRow { row in
            row.title = "タイトル"
            row.placeholder = "12文字まで"
            row.add(rule: RuleMaxLength(maxLength: 12))
        }.onChange{ row in
            self.TodoTitle = row.value ?? "IdeaTitle"//変数に格納
        }
        <<< TextAreaRow { row in
            row.placeholder = "詳細を入力(4行まで)"
        }.onChange{ row in
            self.TodoDetail = row.value ?? "IdeaDetail"//変数に格納
        }
        
        // ここからセクション2
        +++ Section("分類")
        
        <<< AlertRow<String>("") {
            $0.title = "ジャンル"
            $0.selectorTitle = "ジャンルを選択"
            $0.options = ["アプリ","日用品","その他"]
            $0.value = "選択してください"    // 初期選択項目
        }.onChange{[unowned self] row in
            self.TodoGenre = row.value ?? "選択なし"
        }
        
        // ここからセクション3
        +++ Section("情報")
        
        <<< LabelRow("LabelRow"){ row in
            row.title = "日付"
            row.value = "　年　月　日"
        }
        
        
    }
    
    
    
    
    @IBAction func toukouButton(){
        
        
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

