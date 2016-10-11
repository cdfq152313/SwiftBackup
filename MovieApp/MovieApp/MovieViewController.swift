//
//  MovieViewController.swift
//  MovieApp
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UINavigationItem!
    
    var movieInfo:[String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieInit()
    }
    
    func movieInit(){
        self.title = movieInfo?["title"]!
        movieImage.image = UIImage( named: (movieInfo?["image"])! )
        movieDescription.text = movieInfo?["description"]!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
