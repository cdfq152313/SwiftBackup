//
//  TableViewController.swift
//  Ebook
//
//  Created by Denny on 2016/9/21.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ebookArray = [
        ["title":"Python+Spark 2.0+Hadoop機器學習與大數據分析實戰", "author":"林大貴", "price": "7.8折 $530", "content": "一般人可能會認為大數據需要很多台機器的環境才能學習，但是本書透過虛擬機器的方法，就能在自家電腦演練建立Hadoop叢集，並且建立Spark開發環境。\n以實機操作介紹Hadoop MapReduce與HDFS基本概念，以及Spark RDD與MapReduce基本觀念。\n以大數據分析實務案例：MoiveLens（電影喜好推薦引擎）、StumbleUpon（網頁二元分類）、CovType（林相土地演算）、Bike Sharing（Ubike類租賃預測分析。\n配合範例程式碼來介紹各種機器學習演算法，示範如何擷取資料、訓練資料、建立模型、預測結果，由淺而深介紹Spark機器學習。" ],
        ["title":"Swift 程式設計必學基礎", "author":"Boisy G. Pitre 著，蔡明志 譯", "price": "7.8 折 $312", "content": "學習新的程式語言是個艱鉅的任務，但Apple用Swift降低了開發iOS和OS X的進入門檻；Swift帶給Cocoa和Cocoa Touch開發者一個創新的程式語言。本書第二版內容已因應Swift語言迅速且不斷演變的功能全面更新。\n如果您是Swift新手，或是不曾接觸過C、C++或Objective-C，這本書將非常適合您。有了這本實用指南，您將能夠快速學會編寫Swift程式碼，並使用Playgrounds立即查看程式碼的結果。作者Boisy G. Pitre先對Swift的基本概念，如變數、常數、型態、陣列以及詞典加以介紹，接下來展示如何使用Swift創新的Xcode整合開發環境來建立iOS和OSX的app。" ],
        ["title":"資料智慧化：利用資料科學，將資訊化為創見", "author":"John W. Foreman 著，胡為君 譯", "price": "7.8 折 $374", "content": "本書把現代統計方法與演算法解釋得易懂易做。你再也不用被教科書與論文荼毒了！」—Patrick Crosby，StatHat創始人，OkCupid首任技術長\n「佛爾曼先生來我公司面談時，穿著『肯德基上校』式的西裝，鬼扯一堆烤肉、雷射和柳橙汁之類的無關話題。然後，他解釋了要怎樣解決我公司的『大數據』問題，只用了簡單的試算表。不用搞伺服器叢集、大型主機或Hadoop之類的昂貴軟體。只用了Excel。我馬上決定聘請他。讀完本書後，你也會學到如何用數學方法與基礎試算表公式改善你的業務，或者至少可以騙到某位高級主管聘請你當資料分析師。」— Ben Chestnut， MailChimp創始人兼執行長\n「約翰佛爾曼是分析團隊的必備成員，如果你搶不到他，乖乖讀本書也勉強可以啦。」— Patrick Lennon，可口可樂公司分析總監" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ebookArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        // Configure the cell...
        
        cell.bookimageView.image = UIImage(named: "bookImage")
        cell.titleLabelView.text = ebookArray[indexPath.row]["title"] as String!
        cell.authorLabelView.text = ebookArray[indexPath.row]["author"] as String!
        cell.priceLabelView.text = ebookArray[indexPath.row]["price"] as String!
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Get the destination view controller
        let destinationViewController  = segue.destination as! ViewController
        
        // Get user selected index path
        let userSelectedIndexPath : IndexPath = self.tableView.indexPathForSelectedRow!
        let content = ebookArray[userSelectedIndexPath.row]["content"] as String!
        
        // Put album name into next view controller property
        destinationViewController.myvar = content

    }
 

}
