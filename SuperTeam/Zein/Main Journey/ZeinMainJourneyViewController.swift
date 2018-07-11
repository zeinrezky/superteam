//
//  ZeinMainJourneyViewController.swift
//  SuperTeam
//
//  Created by zein rezky chandra on 10/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import UIKit

class ZeinMainJourneyViewController: UIViewController {

    @IBOutlet weak var zeinTable: UITableView!
    @IBOutlet weak var lessonUIKIT: UIButton!
    
    let myLessonJourney = ["UIKit", "Animation", "AutoLayout", "Custom TableView"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        self.detectAdaptiveClass()
        self.title = "Zein's Journey"
        zeinTable.register(UINib(nibName: "ZeinMainCell", bundle: nil), forCellReuseIdentifier: "zeinMainCell")
    }
    
}

extension ZeinMainJourneyViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLessonJourney.count
    }
}

extension ZeinMainJourneyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "zeinMainCell", for: indexPath) as? ZeinMainCell)!
        
        cell.lessonLearn.text = "\(indexPath.row + 1). \(myLessonJourney[indexPath.row])"

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "toUIKitLessonSegue", sender: self)
        }
    }
}
