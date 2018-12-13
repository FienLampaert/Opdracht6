//
//  TableViewController.swift
//  Opdracht6
//
//  Created by student on 6/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class TableViewController: UITableViewController, tableProtocol {
    
    
    let articleDAO = ArticleDAO()
    let bodDAO = BodDAO()
    
    var arrayArticles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleDAO.getAllArticles(listener: self)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func articles(articles: [Article]) {
        arrayArticles.removeAll()
        for i in articles {
            arrayArticles.append(i)
           
        }
         self.tableView.reloadData()
        
        for i in arrayArticles {
            bodDAO.getAllBidsForAticle(article: i, listener: self)
        }
    }
    
    func bids(bids: [Bod]) {
        for i in bids {
            arrayArticles[0].addBid(bid: i)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        
        //
        let x = arrayArticles[indexPath.row]
        cell.descriptionTitle.text = x.getDescription()
        if (x.getBids().count == 0) {
            cell.bidSubtitle.text = "\(x.getMinBid())"
        } else {
            cell.bidSubtitle.text = "\(x.getBids()[x.getBids().count])"
        }
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
