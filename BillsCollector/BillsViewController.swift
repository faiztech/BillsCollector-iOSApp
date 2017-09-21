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
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
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
        
        
        
        
        
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let bill = Bill(context:context)
        
        bill.title = textField.text
         bill.image = UIImagePNGRepresentation(imageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        //pop back
        navigationController!.popViewController(animated: true)
    }
    
}
