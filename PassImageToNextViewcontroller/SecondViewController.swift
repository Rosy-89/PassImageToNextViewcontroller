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
    
    var selectedImage: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondUILabel.text = selectedImage?.description
        print("\(secondUILabel.text)")
        

        //secondUIImageView.image = UIImage(named: "Aeroplaneimage.jpeg")
    }
    


}
