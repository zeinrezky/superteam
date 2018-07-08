//
//  MainCell.swift
//  SuperTeam
//
//  Created by zein rezky chandra on 08/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var viewAB: UIView!
    @IBOutlet weak var viewDC: UIView!
    @IBOutlet weak var viewIND: UIView!
    @IBOutlet weak var viewDN: UIView!
    @IBOutlet weak var viewRH: UIView!
    @IBOutlet weak var viewVC: UIView!
    @IBOutlet weak var viewZC: UIView!
    @IBOutlet weak var btnAB: UIButton!
    @IBOutlet weak var btnDC: UIButton!
    @IBOutlet weak var btnIND: UIButton!
    @IBOutlet weak var btnDN: UIButton!
    @IBOutlet weak var btnRH: UIButton!
    @IBOutlet weak var btnVC: UIButton!
    @IBOutlet weak var btnZC: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
