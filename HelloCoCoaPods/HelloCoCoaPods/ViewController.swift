//
//  ViewController.swift
//  HelloCoCoaPods
//
//  Created by denny on 10/17/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FBSDKLoginKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBAction func fbsaveAction(_ sender: AnyObject) {
        guard let current = FBSDKAccessToken.current() else{
            print("get access token error")
            return
        }
        
        let accessToken = current.tokenString
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken!)
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user,error) in
            let rootRef = FIRDatabase.database().reference()
            let userRef = rootRef.child("users")
            let userFBTom = ["name":"Tom", "age":"15"]
            let tomRef = userRef.child( user!.uid )
            tomRef.setValue(userFBTom)
        })
    }
    
    @IBAction func facebookAction(_ sender: AnyObject) {
        guard let current = FBSDKAccessToken.current() else{
            print("get access token error")
            return
        }
        let accessToken = current.tokenString
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken!)
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user,error) in
            print("Error: \(error?.localizedDescription)")
            print("Uid: \(user?.uid)")
            print("Display name: \(user?.displayName)")
        })
    }

    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func loadAction(_ sender: AnyObject) {
        loadImage()
        loadData()
    }
    @IBAction func saveAction(_ sender: AnyObject) {
        saveData()
        saveImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = FBSDKLoginButton.init()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }
    
    func saveData(){
        let rootRef = FIRDatabase.database().reference()
        let userTom = ["name": "Tom", "age": 15] as [String:Any]
        let userMary = ["name": "Mary", "age": 13] as [String:Any]
        
        let userRef = rootRef.child("users")
        userRef.setValue([userTom,userMary])
    }
    func loadData(){
        let rootRef = FIRDatabase.database().reference()
        let usersRef = rootRef.child("users")
        usersRef.observe(.childAdded, with: {
            (snapshot) in
            print("snapshot: \(snapshot)")
        })
    }
    
    func saveImage(){
        let rootRef = FIRDatabase.database().reference()
        let imageRef = rootRef.child("myImage")
        guard let imageData = UIImagePNGRepresentation(#imageLiteral(resourceName: "Tails")) else{
            print("Read image error")
            return
        }
        let imageStr = imageData.base64EncodedString()
        imageRef.setValue(imageStr)
    }
    
    func loadImage(){
        let rootRef = FIRDatabase.database().reference()
        let imageRef = rootRef.child("myImage")
        imageRef.observe(.value, with: {
            (snapshot) in
            let imageString = snapshot.value as! String
            let imageData = Data(base64Encoded: imageString)
            let image = UIImage(data: imageData!)
            self.myImage.image = image
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

