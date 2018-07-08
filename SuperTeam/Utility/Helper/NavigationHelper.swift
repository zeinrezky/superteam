//
//  NavigationHelper.swift
//  SuperTeam
//
//  Created by zein rezky chandra on 08/07/18.
//  Copyright © 2018 Zein. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func detectAdaptiveClass (){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                self.navigationController?.navigationBar.prefersLargeTitles = true
                let attributes = [
                    NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Light", size: 17)!
                ]
                UINavigationBar.appearance().titleTextAttributes = attributes
            default:
                self.navigationController?.navigationBar.prefersLargeTitles = false
                let attributes = [
                    NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Light", size: 17)!
                ]
                UINavigationBar.appearance().titleTextAttributes = attributes
            }
        }
    }
}
