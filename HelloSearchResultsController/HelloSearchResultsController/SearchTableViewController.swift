//
//  SearchTableViewController.swift
//  HelloSearchResultsController
//
//  Created by Denny on 2016/9/29.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    let appleProduct = ["iPhone", "iMac", "Macbook Pro", "Mac Mini", "iPad", "Apple Watch", "Apple TV", "Apple Pencil"]
    var searchController:UISearchController? // 用來執行搜尋工作的類別
    var resultController = UITableViewController() // 用來顯示搜尋結果
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController:resultController)
        self.tableView.tableHeaderView = searchController?.searchBar
        
        searchController?.searchResultsUpdater = self
        searchController?.dimsBackgroundDuringPresentation = false
        
        resultController.tableView.dataSource = self
        resultController.tableView.delegate = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchWord = searchController.searchBar.text{
            resultArray = appleProduct.filter{ $0.contains(searchWord) }
        }
        resultController.tableView.reloadData()
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
        if tableView == self.tableView{
            return appleProduct.count
        }
        else{
            return resultArray.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = appleProduct[indexPath.row]
            return cell
        }
        else{
            let cell = UITableViewCell()
            cell.textLabel?.text = resultArray[indexPath.row]
            return cell
        }
    }
    
    override func viewWillAppear(_ animated:Bool){
        self.tableView.contentInset = UIEdgeInsets(top:30.0, left:0.0, bottom:0.0, right:0.0)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
