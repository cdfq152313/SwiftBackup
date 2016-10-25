//
//  ViewController.swift
//  HelloJson
//
//  Created by denny on 10/14/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    lazy var session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    func loadData(){
        guard let url = URL(string: "https://randomuser.me/api/") else{
            print("No such url")
            return
        }
        let downloadTask = session.dataTask(with: url, completionHandler: downloadEnd)
        downloadTask.resume()
    }
    
    func downloadEnd(data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print("Download data error")
            return
        }
        else{
            guard let okData = data else{
                return
            }
            do{
                if let jsonData = try JSONSerialization.jsonObject(with: okData, options: []) as?[String:Any] {
                    print("\(jsonData)")
                    readjson(jsonData)
                }
            }catch{
                print("Serialize json data failed")
            }
        }
    }
    
    func readjson(_ jsonData: [String:Any]){
        if let results = jsonData["results"] as? [Any]{
            if let person1 = results[0] as? [String:Any]{
                guard let email = person1["email"] as? String else{
                    print("No email")
                    return
                }
                guard let phone = person1["phone"] as? String else {
                    print("No phone")
                    return
                }
                guard let nameInfo = person1["name"] as? [String:String] else{
                    print("No name")
                    return
                }
                guard let firstName = nameInfo["first"], let lastName = nameInfo["last"] else{
                    print("No firstname or lastname")
                    return
                }
                guard let imageInfo = person1["picture"] as? [String:String] else{
                    print("No image")
                    return
                }
                guard let image = imageInfo["large"] else{
                    print("No large image")
                    return
                }
                print("email: \(email)")
                print("phone:\(phone)")
                print("image link: \(image)")
                let name = firstName + " " + lastName
                print("name: \(name)" )
                let p = Person(name: name, email: email, number: phone, image: image)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let somePerson = Person(name: "David", email: "abc@yahoo.com", number: "123-456-789", image: "http://jjj.jpg")
        setInfo(person: somePerson)
        checkNetwork()
        loadData()
    }
    func checkNetwork(){
        let reachability = Reachability.init()
        let status =  reachability.currentReachabilityStatus()
        switch status{
            
        }
    }
    
    func setInfo(person:Person){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

