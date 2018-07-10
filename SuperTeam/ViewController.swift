//
//  ViewController.swift
//  SuperTeam
//
//  Created by zein rezky chandra on 08/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ourTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI(){
        self.detectAdaptiveClass()
        self.title = "Us"
        ourTableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "mainCellIdentifier")
    }
    
    // Mark: Action Delegate
    
    @objc func anisa(){
        self.performSegue(withIdentifier: "anisaJourney", sender: self) // using basic segue
    }

    @objc func indah(){
        
    }

    @objc func rahma(){
        
    }

    @objc func victor(){
         self.performSegue(withIdentifier: "victorIdentifier", sender: self) // using basic segue
    }

    @objc func davidCornelius(){
        self.performSegue(withIdentifier: "davidSegue", sender: self) // using basic segue
    }

    @objc func novieDavid(){
    }

    @objc func zein(){
        self.performSegue(withIdentifier: "journeySegue", sender: self) // using basic segue
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCell = (tableView.dequeueReusableCell(withIdentifier: "mainCellIdentifier", for: indexPath) as? MainCell)!
        
        // Configure cell
        ourCell.btnAB.addTarget(self, action: #selector(anisa), for: .touchUpInside)
        ourCell.btnDC.addTarget(self, action: #selector(davidCornelius), for: .touchUpInside)
        ourCell.btnRH.addTarget(self, action: #selector(rahma), for: .touchUpInside)
        ourCell.btnDN.addTarget(self, action: #selector(novieDavid), for: .touchUpInside)
        ourCell.btnVC.addTarget(self, action: #selector(victor), for: .touchUpInside)
        ourCell.btnIND.addTarget(self, action: #selector(indah), for: .touchUpInside)
        ourCell.btnZC.addTarget(self, action: #selector(zein), for: .touchUpInside)
        
        return ourCell
    }
}
