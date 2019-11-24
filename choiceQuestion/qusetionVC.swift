//
//  ViewController.swift
//  choiceQuestion
//
//  Created by 張哲禎 on 2019/11/21.
//  Copyright © 2019 張哲禎. All rights reserved.
//

import UIKit

class qusetionVC: UIViewController {
    @IBOutlet weak var btq1: UIButton!
    @IBOutlet weak var btq2: UIButton!
    @IBOutlet weak var btq3: UIButton!
    @IBOutlet weak var btq4: UIButton!
    @IBOutlet weak var question: UILabel!
    var qaArray:[[String]]?
    var lineArray:[String]?
    var ranLineArray:[String]?
    var questionArray = [String]()
    var choiceArray = [String]()
    var answerArray = [String]()
    var grade = 0
    var number = 0
    var content : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let asset = try? NSDataAsset(name: "question"){
            let data = asset.data
            if  let sentence = String(data: data, encoding: String.Encoding.utf16){
                content = sentence
                processData(content:content!)
            }
        }
        showQA(number: number)
    }

    @IBAction func clickA1(_ sender: UIButton) {
        if number < 10{
            if sender.currentTitle == answerArray[number]{
                grade += 10
            }
        }
        if number < 9 {
            number += 1
            showQA(number: number)
        }else{
            number += 1
        }
        showQA(number: number)
    }
    
    @IBAction func clickA2(_ sender: UIButton) {
        if number < 10{
            if sender.currentTitle == answerArray[number]{
                grade += 10
            }
        }
        if number < 9 {
            number += 1
            showQA(number: number)
        }else{
            number += 1
        }
        showQA(number: number)
        }
    
    @IBAction func clickA3(_ sender: UIButton) {
      if number < 10{
          if sender.currentTitle == answerArray[number]{
              grade += 10
          }
      }
      if number < 9 {
          number += 1
          showQA(number: number)
      }else{
          number += 1
      }
      showQA(number: number)
        }
    
    @IBAction func clickA4(_ sender: UIButton) {
      if number < 10{
          if sender.currentTitle == answerArray[number]{
              grade += 10
          }
      }
      if number < 9 {
          number += 1
          showQA(number: number)
      }else{
          number += 1
      }
      showQA(number: number)
        }
    
    func showQA(number:Int){
        var qaNumber = 0
        if number == 0 {
            qaNumber = 0
        } else {
            qaNumber = (number * 4)
        }
        
        if (number<10){
            question.text = questionArray[number]
            
            let randonQusetion = [choiceArray[qaNumber],choiceArray[qaNumber+1],choiceArray[qaNumber+2],choiceArray[qaNumber+3]]
            
            let randonChoice = randonQusetion.shuffled()
            btq1.setTitle(randonChoice[0], for: .normal)
            btq2.setTitle(randonChoice[1], for: .normal)
            btq3.setTitle(randonChoice[2], for: .normal)
            btq4.setTitle(randonChoice[3], for: .normal)
            
        }else {
            let controller = UIAlertController(title: "問答結束", message: "你獲得\(grade)分", preferredStyle: .alert)
            let yes = UIAlertAction(title: "紀錄", style: .default) { (alert) in
                self.renew()
            }
            let no = UIAlertAction(title: "取消", style: .cancel) { (alert) in
                self.renew()
            }
            controller.addAction(yes)
            controller.addAction(no)
            present(controller,animated: true)
        }
    }
    func processData(content:String){
        lineArray = content.components(separatedBy: "\n")
        ranLineArray = lineArray?.shuffled()
        //                隨機將array做亂數
        questionArray = [String]()
        answerArray = [String]()
        choiceArray = [String]()
        for i in 0...9 {
            let line = ranLineArray![i]
            let linePart = line.components(separatedBy: "\t")
            for j in 0...5 {
                if j == 0 {
                    questionArray.append(linePart[0])
                
                } else if j == 5 {
                    answerArray.append(linePart[5])
                } else {
                    choiceArray.append(linePart[j])
                }
            }
        }
        
        print(questionArray)
        print(choiceArray)
    }
    
    func renew() {
        number = 0
        grade = 0
        processData(content: content!)
        showQA(number: number)
    }
}

