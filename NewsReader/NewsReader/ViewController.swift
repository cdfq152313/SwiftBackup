//
//  ViewController.swift
//  NewsReader
//
//  Created by Denny on 2016/9/14.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newsTitleLabel: UILabel!

    @IBOutlet weak var newSourceLabel: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var newsContentLabel: UILabel!
    
    @IBOutlet weak var sourceFromButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newsContent = ["title": "風強雨大　台南百貨公司緊急停止營業",
                            "source" : "蘋果即時",
                            "dateTime": "2016年09月14日14:44",
            "content": "莫蘭蒂颱風來襲，台南市百貨公司原本規劃下午營業，但中午過後出現瞬間陣風，新光三越台南中山店、西門店、南紡購物中心都緊急宣布今天停止營業。至於相關影城也暫停營業一天。\n台南市各大型百貨公司、電影院跟著放颱風假，包括新光三越台南西門店、中山店，大遠百、及南紡購物中心等都暫停營業。\n台南大遠百威秀、南紡購物中心威秀、新光影城、國賓影城從今天下午起暫停營業，明天才恢復正常。（辛啟松／台南報導）\n莫蘭蒂颱風來襲，台南市百貨公司原本規劃下午營業，但中午過後出現瞬間陣風，新光三越台南中山店、西門店、南紡購物中心都緊急宣布今天停止營業。至於相關影城也暫停營業一天。\n台南市各大型百貨公司、電影院跟著放颱風假，包括新光三越台南西門店、中山店，大遠百、及南紡購物中心等都暫停營業。\n台南大遠百威秀、南紡購物中心威秀、新光影城、國賓影城從今天下午起暫停營業，明天才恢復正常。（辛啟松／台南報導）\n莫蘭蒂颱風來襲，台南市百貨公司原本規劃下午營業，但中午過後出現瞬間陣風，新光三越台南中山店、西門店、南紡購物中心都緊急宣布今天停止營業。至於相關影城也暫停營業一天。\n台南市各大型百貨公司、電影院跟著放颱風假，包括新光三越台南西門店、中山店，大遠百、及南紡購物中心等都暫停營業。\n台南大遠百威秀、南紡購物中心威秀、新光影城、國賓影城從今天下午起暫停營業，明天才恢復正常。（辛啟松／台南報導）\n莫蘭蒂颱風來襲，台南市百貨公司原本規劃下午營業，但中午過後出現瞬間陣風，新光三越台南中山店、西門店、南紡購物中心都緊急宣布今天停止營業。至於相關影城也暫停營業一天。\n台南市各大型百貨公司、電影院跟著放颱風假，包括新光三越台南西門店、中山店，大遠百、及南紡購物中心等都暫停營業。\n台南大遠百威秀、南紡購物中心威秀、新光影城、國賓影城從今天下午起暫停營業，明天才恢復正常。（辛啟松／台南報導）\n",
                            "sourceUrl": "http://www.appledaily.com.tw/realtimenews/article/life/20160914/948794/風強雨大%E3%80%80台南百貨公司緊急停止營業"]
        self.newsTitleLabel.text = newsContent["title"]
        self.newsContentLabel.text = newsContent["content"]
        self.newSourceLabel.text = newsContent["source"]
        self.newsTitleLabel.text = newsContent["dateTime"]
        
        self.sourceFromButton.setTitle("前往查看更多", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

