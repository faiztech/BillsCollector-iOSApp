//
//  BillsViewController.swift
//  BillsCollector
//
//  Created by Mohammed Faizuddin on 9/21/17.
//  Copyright © 2017 Faiz Tech. All rights reserved.
//

import UIKit

class BillsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var bill : Bill? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if bill != nil
        {
            imageView.image  = UIImage(data: bill!.image as Data!)
            textField.text = bill!.title
            
            addUpdateButton.setTitle("UPDATE", for: .normal)
        }
        else
        {
            deleteButton.isHidden = true
        }
    }

    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        if bill != nil
        {
            bill!.title = textField.text
            bill!.image = UIImagePNGRepresentation(imageView.image!)
        }
        else{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let bill = Bill(context:context)
            
            bill.title = textField.text
            bill.image = UIImagePNGRepresentation(imageView.image!)
        }
        //saving
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //pop back
        navigationController!.popViewController(animated: true)
    }
    
 
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
context.delete(bill!)
        //saving
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //pop back
        navigationController!.popViewController(animated: true)
    }
    
    
}
