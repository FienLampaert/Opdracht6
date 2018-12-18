//
//  DetailArticleViewController.swift
//  Opdracht6
//
//  Created by student on 19/12/18.
//  Copyright © 2018 nielsbrackeva. All rights reserved.
//

import Foundation
import UIKit

class DetailArticleViewController: UIViewController, DetailProtocol, tableProtocol {
    func articles(articles: [Article]) {
        //
    }
    
    
    
    let memberDAO = MemberDAO()
    let bodDAO = BodDAO()
    var login: Login!
    var article: Article!
    
    @IBOutlet var lblWelkom: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblMinBod: UILabel!
    @IBOutlet var lblHoogsteBod: UILabel!
    @IBOutlet var lblBod: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperKlik(_ sender: UIStepper) {
        
        lblBod.text = String(sender.value)
    }
    @IBAction func btnBodPlaatsen(_ sender: UIStepper) {
        
        let bod = Bod(id: "", bid: Float(stepper!.value), date: Date.init(), member: login.getId())
        bodDAO.addBod(article: article, bod: bod)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // memberDAO.getMember(login: login, listener: self)
        self.fillValues()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setContent(article: Article, Login: Login) {
        self.login = Login
        self.article = article
    }
    
    func fillValues() {
        lblWelkom.text = "Welkom " + login.getEmail()
        lblDescription.text = article.getDescription()
        lblMinBod.text = "Minimum bod: " + "\(article.getMinBid())"
        // bodDAO.getHoogsteBod(article: article, listener: self)
        // var hoogste = article.getMinBid()
        
        bodDAO.getAllBidsForAticle(article: article, row: 0, listener: self)
        
        /*
        for i in article.bids {
            if( hoogste < i.getBid()) {
                hoogste = i.getBid()
                lblHoogsteBod.text = "Hoogste bod: " + "\(i.getBid())"
            }
        }
        
        lblBod.text = "\(hoogste + 20)"
        */
    }
    
    func bids(article: Article, bids: [Bod], row: Int) {
        var hoogste: Float = article.getMinBid()
        for i in article.bids {
            if( hoogste < i.getBid()) {
                hoogste = i.getBid()
                lblHoogsteBod.text = "Hoogste bod: " + "\(i.getBid())"
            }
        }
        
        stepper.minimumValue = Double(hoogste + 20)
        stepper.maximumValue = Double(article.getMinBid() * 100)
        
        
        if(hoogste == article.getMinBid()){
            stepper.value = Double(article.getMinBid()-20)
        }
        else {
            stepper.value = Double(hoogste)
        }
        
        lblBod.text = "\(stepper.value)"
        
        print(stepper.maximumValue)
        print(stepper.minimumValue)
    }
    
    func setHoogsteBod(bod: Float) {
        lblHoogsteBod.text = "Hoogste bod: " + "\(bod)"
        self.view.reloadInputViews()
    }
    
    
}
