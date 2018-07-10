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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//
//extension ZeinMainJourneyViewController: UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//}
//
//extension ZeinMainJourneyViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = (tableView.dequeueReusableCell(withIdentifier: "zeinMainCell", for: indexPath) as? ZeinMainCell)!
//
//        return cell
//    }
//}
