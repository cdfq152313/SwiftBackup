//
//  MovieTableViewController.swift
//  MovieApp
//
//  Created by denny on 10/7/16.
//  Copyright © 2016 denny. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movieArray:[ [String:String] ]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        movieArrayInit()
    }
    
    func movieArrayInit(){
        movieArray = [
            ["title":"How to train your dragon", "date":"2010/3/26", "image":"howToTrainYourDragon.jpg", "description": "Zootopia (released as Zootropolis in some countries) is a 2016 American 3D computer-animated buddy comedy adventure film[7] produced by Walt Disney Animation Studios and released by Walt Disney Pictures. It is the 55th Disney animated feature film. The film is directed by Byron Howard and Rich Moore, co-directed by Jared Bush, and starring the voices of Ginnifer Goodwin, Jason Bateman, Idris Elba, Jenny Slate, Nate Torrence, Bonnie Hunt, Don Lake, Tommy Chong, J. K. Simmons, Octavia Spencer, Alan Tudyk and Shakira. The film details the unlikely partnership between a rabbit police officer and a red fox con artist as they uncover a conspiracy that involves the disappearance of predator inhabitants of a mammalian metropolis.\nZootopia premiered at the Brussels Animation Film Festival in Belgium on February 13, 2016,[8] and went into general theatrical release in conventional 2D, Disney Digital 3D, RealD 3D and IMAX 3D formats in the United States on March 4, 2016.[9][10] The film was praised for its story, animation, voice cast, humor and themes about discrimination and social stereotypes.[11][12][13] It opened to record-breaking box office success in several countries and has earned a worldwide gross of over $1 billion, making it the second highest-grossing film of 2016 and the 24th highest-grossing film of all time."],
            ["title":"Zootopia", "date":"2016/3/4", "image":"zootopia.jpg", "description":"How to Train Your Dragon is a 2010 American 3D computer-animated action-fantasy film produced by DreamWorks Animation and distributed by Paramount Pictures.1 Loosely based on the British book series of the same name by Cressida Cowell, the film was directed by Chris Sanders and Dean DeBlois, the duo who directed Disney's Lilo & Stitch. It stars the voices of Jay Baruchel, Gerard Butler, Craig Ferguson, America Ferrera, Jonah Hill, T.J. Miller, Kristen Wiig, and Christopher Mintz-Plasse.\nThe story takes place in a mythical Viking world where a young Viking teenager named Hiccup aspires to follow his tribe's tradition of becoming a dragon slayer. After finally capturing his first dragon, and with his chance at last of gaining the tribe's acceptance, he finds that he no longer wants to kill it and instead befriends it.\nThe film was released March 26, 2010, and was a critical and commercial success, earning acclaim from film critics and audiences and earning nearly $500 million worldwide. It was nominated for the Academy Award for Best Animated Feature and Best Original Score at the 83rd Academy Awards, but lost to Toy Story 3 and The Social Network, respectively. The movie also won ten Annie Awards, including Best Animated Feature.\nA sequel, How to Train Your Dragon 2, was written and directed by Dean DeBlois and released on June 13, 2014, and was also universally acclaimed and a box office success. A second sequel, How to Train Your Dragon 3 is to be released on May 18, 2018. The film's success has also inspired other merchandise, including a video game and a TV series."]
        ]
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
        if (movieArray != nil){
            return movieArray!.count
        }
        else{
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        guard let cell = myCell as? MovieCell else{
            return myCell
        }
        
        let data = movieArray?[indexPath.row]
        cell.title.text = data?["title"]!
        cell.date.text = "上映日期: " + (data?["date"])!
        cell.imageView?.image = UIImage( named: (data?["image"])! )
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
        if let indexPath = tableView.indexPathForSelectedRow{
            let controller = segue.destination as! MovieViewController
            controller.movieInfo = movieArray?[indexPath.row]
        }
    }
 
}
