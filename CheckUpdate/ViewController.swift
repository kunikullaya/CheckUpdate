//
//  ViewController.swift
//  CheckUpdate
//
//  Created by Arvind on 1/18/17.
//  Copyright © 2017 Arvind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var engine = BusinessEngine()
    private var appID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkIfUpdateNeeded()
    }
    
    func checkIfUpdateNeeded(){
        if Bundle.main.bundleIdentifier != nil {
            let url = "https://itunes.apple.com/lookup?bundleId=com.yelp.yelpiphone"
            self.engine.checkIfUpdateIsNeeded(url: url){
                (success,appID) in
                if success {
                    self.appID = appID
                    self.showUpdateNowAlertMessage()
                    
                }
                return
            }
        }
        
    }
    
    func launchAppStore() {
        guard let appID = appID else {
            return
        }
        print("Opening App Store")
//        if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)"),
//            UIApplication.shared.canOpenURL(url){
//            UIApplication.shared.openURL(url)
//        }
    }
    
    func showUpdateNowAlertMessage(){
        let alert = UIAlertController(title: "Update is Available", message: "New Version of the app is available", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Next Time", style: .default, handler: {
            action in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {
            action in
            self.launchAppStore()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

