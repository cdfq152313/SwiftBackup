//
//  TableViewController.swift
//  PictureTest
//
//  Created by denny on 10/24/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imgArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadImageArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func addImage(_ sender: AnyObject) {
        //        let imagePicker = UIImagePickerController()
        //        imagePicker.sourceType = .camera
        //        imagePicker.delegate = self
        //        self.present(imagePicker, animated: true, completion: nil)
        loadImageArray()
        // fakeAddImage()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        // let image = info[UIImagePickerControllerOriginalImage]
        // self.imageView.image = image as? UIImage
        // self.dismiss(animated:true, completion: nil)
    }
    
    func fakeAddImage(){
        let imageName = String(format:"%f", Date.timeIntervalSinceReferenceDate) + ".jpg"
        var imagePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        imagePath.appendPathComponent(imageName)
        let text = "test"
        do {
            try text.write(to: imagePath, atomically: true, encoding: .utf8)
            recordSaveImage(imgName: imageName)
        }
        catch{
            print("Error")
        }
    }
    
    func recordSaveImage(imgName:String){
        let recordFile = "myRecord.txt"
        var fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL.appendPathComponent(recordFile)
        
        if var loadArray = NSArray(contentsOf: fileURL) as? [String]{
            loadArray.append(imgName)
            let arrayToSave = NSArray(array: loadArray)
            arrayToSave.write(to: fileURL, atomically: true)
            print(arrayToSave)
        }
        else{
            let array = [imgName]
            let arrayToSave = NSArray(array: array)
            arrayToSave.write(to: fileURL, atomically: true)
            print(arrayToSave)
        }
    }
    
    func loadImageArray(){
        
        let recordFile = "myRecord.txt"
        let dirURl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = dirURl.appendingPathComponent(recordFile)

        if let loadArray = NSArray(contentsOf: fileURL) as? [String]{
            imgArray = loadArray
            print(imgArray)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imgArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = imgArray[indexPath.row]

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
