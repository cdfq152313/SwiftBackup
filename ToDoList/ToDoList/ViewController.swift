//
//  ViewController.swift
//  ToDoList
//
//  Created by denny on 10/12/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDoArray = ["apple", "banana", "mango"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        askInfoWithDefault(nil) {
            (success, toDo) in
            if success == true{
                if let okToDo = toDo{
                    self.toDoArray.append(okToDo)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func askInfoWithDefault(_ defaultToDo:String?, withCompletionHandler completion:@escaping (Bool, String?)->()){
        let myAlert = UIAlertController(title: "Add New Task", message: nil, preferredStyle: .alert)
        myAlert.addTextField {
            (textfield:UITextField) in
            textfield.placeholder = "Add New Task'"
            textfield.text = defaultToDo
        }
        
        let ok = UIAlertAction(title: "OK", style: .default){
            (action) in
            let inputText = myAlert.textFields?[0].text
            if inputText != nil && inputText != "" {
                completion(true, inputText)
            }
            else{
                completion(false, nil)
            }
        }
        
        let cancel = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        
        myAlert.addAction(ok)
        myAlert.addAction(cancel)
        
        present(myAlert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!;
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

