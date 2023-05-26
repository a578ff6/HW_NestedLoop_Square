//
//  ViewController.swift
//  HW_NestedLoop
//
//  Created by 曹家瑋 on 2023/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    // 圖片切換
    @IBOutlet weak var patternSegmentedControl: UISegmentedControl!
    // 展示的 emoji 的 Label
    @IBOutlet weak var displayEmojiLabel: UILabel!
    // 當前行數
    @IBOutlet weak var countValueLabel: UILabel!
    // slider的數值
    @IBOutlet weak var emojiSliderControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // 圖型變化Slider (當i 為 1 or 3 or 5 時，將使用 "🐦" 作為內容；否則，將使用 "🐤" 作為內容。）
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // 將滑桿的值進行四捨五入取整
        let roundedValue = round(sender.value)
        // 設定滑桿的值為取整後的值
        sender.value = roundedValue
        
        if patternSegmentedControl.selectedSegmentIndex == 0 {
            emojiSliderControl.maximumValue = 7
            // 第一行變化
            firstRowPattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 1 {
            emojiSliderControl.maximumValue = 7
            // 間隔行變化
            spacingPattern()

        } else if patternSegmentedControl.selectedSegmentIndex == 2 {
            emojiSliderControl.maximumValue = 7
            // 對角線ㄧ
            diagonalPattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 3 {
            emojiSliderControl.maximumValue = 7
            // 對角線二
            antiDiagonalPattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 4 {
            emojiSliderControl.maximumValue = 9
            // X 形狀
            xShapePattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 5 {
            emojiSliderControl.maximumValue = 9
            // 十字
            crossPatteern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 6 {
            emojiSliderControl.maximumValue = 9
            // X 中央特殊圖案
            xCenterSharpPattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 7 {
            emojiSliderControl.maximumValue = 9
            // 邊框
            squarePattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 8 {
            emojiSliderControl.maximumValue = 9
            // 梅花坐
            alternatePattern()
                
        } else if patternSegmentedControl.selectedSegmentIndex == 9 {
            emojiSliderControl.maximumValue = 8
            // 每行不同
            differentRowPattern()
            
        }

    }
    
    // segmented 選項
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // 將滑桿的值設定為 1
        emojiSliderControl.value = 1.0
        // 根據選取的 segmentedControl 索引執行相對應的函式
        sliderValueChanged(emojiSliderControl)

    }
    
    
    // 第一行：第一行"🐦"，其他行"🐤"
    func firstRowPattern() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        for i in 1...count {                             // 遍歷行數
            
            for _ in 1...count {                         // 遍歷列數
                
                if i == 1 {                              // 判斷是否在第一行
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                              // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 間隔行：每隔一行交互產生： 🐦行 以及 🐤行。
    func spacingPattern() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        for i in 1...count {                             // 遍歷行數
        
            for _ in 1...count {                         // 遍歷列數
                
                if i % 2 == 1 {                          // 檢查當前的行數 i 是否為奇數。
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                              // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 對角一:行數位置加一，列數位置也會加一（行數=列數）
    func diagonalPattern() {
        
        let count = Int(emojiSliderControl.value)        // 轉整數
        countValueLabel.text = "\(count)"                // 當前數值顯示
        var content = ""                                 // 添加的內容
        
        for i in 1...count {                             // 遍歷行數
            
            for j in 1...count {                         // 遍歷列數
                
                if i == j {                              // 行數與列數相等時
                    content += "🐦"
                } else {                                 // 當行數與列數不相等時
                    content += "🐤"
                }
            }
            content += "\n"                              // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 對角二：反斜線
    func antiDiagonalPattern() {
        
        let count = Int(emojiSliderControl.value)        // 轉整數
        countValueLabel.text = "\(count)"                // 將 count 的值顯示在畫面上
        var content = ""                                 // 添加的內容
        
        for i in 1...count {                             // 遍歷行數
            
            for j in 1...count {                         // 遍歷列數
                
                if (i+j) == count + 1  {                     // 判斷是否在反對角線上
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                             // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // X 形狀 (count只能是奇數）
    func xShapePattern() {
        
        let count = Int(emojiSliderControl.value)         // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                 // 將 count 的值顯示在畫面上
        var content = ""                                  // 用於存儲生成的圖案內容
        
        for i in 1...count {                              // 遍歷行數
            
            for j in 1...count {                          // 遍歷列數
                
                if i == j || (i+j) == count + 1 {         // 判斷是否位於 X 形狀的交叉部分
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                             // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 十字 (奇數）
    func crossPatteern() {
        
        let count = Int(emojiSliderControl.value)           // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                   // 將 count 的值顯示在畫面上
        var content = ""                                    // 用於存儲生成的圖案內容
        
        let crossCenter = (count + 1) / 2                   // 計算出十字形狀中心所在的行數和列數。
        
        for i in 1...count {                                // 遍歷行數
            
            for j in 1...count {                            // 遍歷列數
                
                if i == crossCenter || j == crossCenter {   // 當行數等於十字形狀中心的行數，或者列數等於十字形狀中心的列數時
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                                  // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 畫 X，count 只能是奇數，交叉的地方顯示特別的魚
    func xCenterSharpPattern() {
        
        let count = Int(emojiSliderControl.value)            // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                    // 將 count 的值顯示在畫面上
        var content = ""                                     // 用於存儲生成的圖案內容
        
        let crossCenter = (count + 1) / 2                    // 計算出十字形狀中心所在的行數和列數。
        
        for i in 1...count {
            
            for j in 1...count {
                
                if i == crossCenter, j == crossCenter {      // 當行數和列數都等於十字形狀的中心點時
                    content += "🐣"
                } else if i == j || i + j == count + 1  {    // 當行數等於列數 或 行數和列數之和等於矩陣邊長加1時
                    content += "🐦"
                } else {
                    content += "🐤"
                }
            }
            content += "\n"                                   // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 畫框框
    func squarePattern() {
        
        let count = Int(emojiSliderControl.value)                         // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                                 // 將 count 的值顯示在畫面上
        var content = ""                                                  // 用於存儲生成的圖案內容
        
        for i in 1...count {
            
            for j in 1...count {
                
                if i == 1 || i == count || j == 1 || j == count {         // 方框的邊界位置
                    content += "🐦"
                } else {                                                 // 方框的內部位置
                    content += "🐤"
                }
            }
            content += "\n"                                              // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 梅花坐：奇數行（奇數列變化🐦），偶數行（偶數列變化🐦）（行數與列數的和為偶數）
    func alternatePattern() {

        let count = Int(emojiSliderControl.value)        // 轉整數
        countValueLabel.text = "\(count)"                // 當前數值顯示
        var content = ""                                 // 添加的內容

        for i in 1...count {                             // 遍歷行數

            for j in 1...count {                         // 遍歷列數

                if (i+j) % 2 == 0 {                      // 判斷行數與列數的和是否為偶數
                    content += "🐦"                      // 當行數與列數的和為偶數時，將 "🐦" 加入內容中
                } else {
                    content += "🐤"                      // 當行數與列數的和為奇數時，將 "🐤" 加入內容中
                }

            }
            content += "\n"                             // 在每一行的結尾加入換行符號，用來分隔行數
        }

        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 每行顯示不同圖案
    func differentRowPattern() {
        let count = Int(emojiSliderControl.value)        // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                // 將 count 的值顯示在畫面上
        var content = ""                                 // 添加的內容
        
        let emojis = ["🐦", "🐧", "🐔", "🐤"]            // 用於顯示的圖案陣列
        
        for row in 0..<count {
            let emojiIndex = row % emojis.count          // 計算出目前 row 所使用的圖案索引，以達到循環選取的效果
            let emoji = emojis[emojiIndex]               // 根據索引從圖案陣列中取得對應的圖案
            
            for _ in 0..<count {
                content += emoji                         // 在目前 row 中重複添加對應的圖案
            }
            content += "\n"                              // 在每一行的結尾加入換行符號，用來分隔行數
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }

    
}




//// 奇數行（奇數列變化🐦），偶數行（偶數列變化🐦）（梅花做另一個寫法）
//func alternatePattern() {
//
//    let count = Int(emojiSliderControl.value)        // 取得滑桿的值並轉換為整數
//    countValueLabel.text = "\(count)"                // 顯示目前的數值在畫面上
//    var content = ""                                 // 添加的內容
//
//    for i in 1...count {                             // 遍歷行數
//
//        for j in 1...count {                         // 遍歷列數
//
//            if i % 2 == 1 && j % 2 == 1 {             // 奇數行（奇數列變化🐦）
//                content += "🐦"
//            } else if i % 2 == 0 && j % 2 == 0 {      // 偶數行（偶數列變化🐦）
//                content += "🐦"
//            } else {
//                content += "🐤"
//            }
//        }
//        content += "\n"                              // 在每一行的結尾加入換行符號，用來分隔行數
//    }
//
//    // 將內容加到 Label 中顯示
//    displayEmojiLabel.text = content
//}
