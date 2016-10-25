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
    
    let imgDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let recordPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myRecord.txt")
    
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
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
        // fakeAddImage()
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("info \(info)")
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        // self.imageView.image = image as? UIImage
        if image != nil{
            saveImage(image: image!)
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    func saveImage(image:UIImage){
        let imageName = "\(Date.timeIntervalSinceReferenceDate).jpg"
        let imagePath = imgDir.appendingPathComponent(imageName)
        
        if let dataToSave = UIImageJPEGRepresentation(image, 1.0){
            do {
                try dataToSave.write(to: imagePath)
                recordSaveImage(imgName: imageName)
            }
            catch{
                print("Save data Error")
            }
        }
    }
    
    func fakeAddImage(){
        let imageName = String(format:"%f", Date.timeIntervalSinceReferenceDate) + ".jpg"
        let imagePath = imgDir.appendingPathComponent(imageName)
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
        
        if var loadArray = NSArray(contentsOf: recordPath) as? [String]{
            loadArray.append(imgName)
            let arrayToSave = NSArray(array: loadArray)
            arrayToSave.write(to: recordPath, atomically: true)
            print(arrayToSave)
        }
        else{
            let array = [imgName]
            let arrayToSave = NSArray(array: array)
            arrayToSave.write(to: recordPath, atomically: true)
            print(arrayToSave)
        }
    }
    
    func loadImageArray(){
        if let loadArray = NSArray(contentsOf: recordPath) as? [String]{
            imgArray = loadArray
            print(imgArray)
            self.tableView.reloadData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow{
            let controller = segue.destination as! ViewController
            controller.imgURL = imgDir.appendingPathComponent(imgArray[indexPath.row])
        }
    }
 

}
