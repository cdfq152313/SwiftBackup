//
//  ViewController.swift
//  MailTest
//
//  Created by denny on 11/2/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func sendAction(_ sender: AnyObject) {
        
    }
    func sendMessage(){
        let controller = MFMessageComposeViewController()
        controller.body = "hello"
        controller.recipients = ["Penny", "0911222333", "apppeterpan@gmail.com"]
        self.present(controller, animated: true, completion: nil)
    }
    func sendEmail(){
        if MFMailComposeViewController.canSendMail(){
            
            let mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = self
            
            mailController.setSubject("swift程式設計入門")
            mailController.setToRecipients(["cdfq152313@gmail.com"])
            mailController.setMessageBody("Hello Moto", isHTML: true)
            
            self.present(mailController, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Cannot send mail", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func addImages(mailController:MFMailComposeViewController){
        var image = UIImage(named: "book1")
        var data = UIImageJPEGRepresentation(image!, 0.9)
        mailController.addAttachmentData(data!, mimeType:"image/jpg", fileName: "book1.jpg")
        
        image = UIImage(named: "book2")
        data = UIImageJPEGRepresentation(image!, 0.9)
        mailController.addAttachmentData(data!, mimeType: "image/jpg", fileName: "book2.jpg")
    }
    
    func setHTMLBody(mailController:MFMailComposeViewController){
        let buyLink = "http://www.books.com.tw/products/0010668967"
        let content = "一定要買喔"
        let imageURL = "http://cft.findbook.tw/image/book/9789572243909/large"
        let findOutMoreURL = "https://www.facebook.com/iphone.peterpan"
        let emailSubject = "Swift程式設計入門"
        
        let emailBody = "<br /> <a href = '\(findOutMoreURL)'> <img src='\(imageURL)' align=left style='margin:5px' /> </a> <b>\(emailSubject)</b> <br /> <br />\(content) <br /><br />Sent using <a href = '\(buyLink)'>立馬購買</a> for the iPhone.</p>"
        
        mailController.setMessageBody(emailBody, isHTML:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }

}

