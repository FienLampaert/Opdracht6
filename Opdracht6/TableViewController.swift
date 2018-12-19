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
    var login: Login?
    
    var arrayArticles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        articleDAO.getAllArticles(listener: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        articleDAO.removeListeners()
        bodDAO.removeListeners()
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
    
    func bids(article: Article, bids: [Bod]) {
        let row = self.arrayArticles.firstIndex(where: { (art) -> Bool in
            return art.id == article.id
        })
        
        var hoogste: Float = 0
        for i in bids {
            arrayArticles[row ?? 0].addBid(bid: i)
            
            if( i.bid > hoogste) {
                hoogste = i.bid
                let indexPath = IndexPath(row: row ?? 0, section: 0)
                let indexPaths = [indexPath]
                // self.tableView.reloadData()
                self.tableView.reloadRows(at: indexPaths, with: UITableView.RowAnimation.left)
            }
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
            var hoogste: Float = 0
            for bid in arrayArticles[indexPath.row].getBids() {
                if(bid.getBid() > hoogste) {
                    hoogste = bid.getBid()
                }
            }
            cell.bidSubtitle.text = "\(hoogste)"
    
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // aanmaken viewcontroller met bijhorende view
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vcDetail") as! DetailArticleViewController
        
        // doorgeven van het geselecteerde artikel
        login = (self.navigationController?.viewControllers[0] as! ViewController).getLogin()
        vc.setContent(article: arrayArticles[indexPath.row], Login: login!)
        
        // navigeren naar het detailscherm
        self.navigationController?.pushViewController(vc, animated: true)
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
