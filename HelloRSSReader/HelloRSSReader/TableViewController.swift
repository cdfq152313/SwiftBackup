//
//  TableViewController.swift
//  HelloRSSReader
//
//  Created by denny on 10/25/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var newsList:[NewsItem] = [NewsItem]()
    let reachability = Reachability(hostName: "www.apple.com")
    var session:URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add tableview item
        newsList.append(NewsItem(title: "News 1", pubDate: "12", link: "www.abc/1") )
        newsList.append(NewsItem(title: "News 2", pubDate: "12", link: "www.abc/2") )
        newsList.append(NewsItem(title: "News 3", pubDate: "12", link: "www.abc/3"))
        
        NotificationCenter.default.addObserver(self, selector: #selector(TableViewController.networkChange(notif:)), name: NSNotification.Name.reachabilityChanged, object: nil)
        reachability?.startNotifier()
        
        if isConnect(){
            downloadRSS()
        }
    }
    
    func networkChange(notif:Notification){
        print("=== Network Change ===")
        if isConnect(){
            return
        }
        else{
            return
        }
    }
    
    func isConnect()->Bool{
        let status = reachability?.currentReachabilityStatus()
        if status?.rawValue == 0{
            print("No Network")
            return false
        }
        else{
            print("Connected")
            return true
        }
    }
    
    func downloadRSS(){
        if let url = URL(string: "https://tw.news.yahoo.com/rss/entertainment"){
            let task = session.dataTask(with: url, completionHandler: finishDownload)
            task.resume()
        }
    }
    
    func finishDownload(data:Data?, response:URLResponse?, error:Error?){
        guard error == nil else{
            print("Download RSS Error")
            return
        }
        
        if let okData = data{
            let xmlString = NSString(data: okData, encoding:String.Encoding.utf8.rawValue)
            print(xmlString)
            parseXML(data: okData)
        }
    }
    func parseXML(data:Data){
        let parser = XMLParser(data: data)
        let parseDelegate = RSSParserDelegate()
        parser.delegate = parseDelegate
        if parser.parse() == true{
            print("*** parse ok ***")
            self.newsList = parseDelegate.getResult()
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        else{
            print("*** parse fail")
        }
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
        return newsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = newsList[indexPath.row].title
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
