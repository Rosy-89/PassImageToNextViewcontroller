//
//  SecondViewController.swift
//  PassImageToNextViewcontroller
//
//  Created by Alok Kumar Naik on 16/02/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondUILabel: UILabel!
    
    @IBOutlet weak var secondUIImageView: UIImageView!
    
    var selectedIndex: Int?
    var selectedIndexItem: Int?
    let Images = ["Aeroplaneimage","AeroplaneImage2"]
    let pickerData: [String] = ["Item1", "Item2", "Item3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //secondUILabel.text = String(selectedIndex!)
        //secondUILabel.text = pickerData[selectedIndex!]
        secondUILabel.text = pickerData[selectedIndexItem!]
        secondUIImageView.image = UIImage(named: Images[selectedIndex!])

    }
}
