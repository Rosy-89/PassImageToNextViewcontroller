//
//  ViewController.swift
//  PassImageToNextViewcontroller
//
//  Created by Alok Kumar Naik on 16/02/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var myButton: UIButton!
    
    var pickerData: [String] = [String]()
    
    let Images = ["Aeroplaneimage","AeroplaneImage2"]
    
    var indexSelected: Int? //for collection view elements
    var itemindexSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["Item1", "Item2", "Item3"]
        
        self.myPickerView.dataSource = self
        self.myPickerView.delegate = self
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
    }
    
    //MARK:- PickerView Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        itemindexSelected = row
        myLabel.text = pickerData[row]
        return pickerData[row]
    }
    
    //MARK:- CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell
        
        //cell!.myImageView.image = UIImage(named: "Aeroplaneimage.jpeg")
        
        cell!.myImageView.image = UIImage(named: Images[indexPath.row])
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: 180, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell \(indexPath.row)")
        indexSelected = indexPath.row
        
        //performSegue(withIdentifier: "show second", sender: self)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //MARK:- Action Method
    
    @IBAction func myButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "show second", sender: SecondViewController.self)
        
    }
    
    //MARK:- Prepare for segue method
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "show second"{
            
            if let destination = segue.destination as? SecondViewController{
                
                destination.selectedIndex = self.indexSelected
                //destination.selectedIndexItem = self.indexSelected
                destination.selectedIndexItem = self.itemindexSelected
            }
        }
    }
}

