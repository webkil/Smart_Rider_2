//
//  Ajouter_moto_view.swift
//  Smart_Rider_2
//
//  Created by Macmini_Dagon on 07.05.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.

import UIKit
import CoreData


class Ajouter_moto_viewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var marqueTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var anneeTextField: UITextField!
    @IBOutlet var kilometrageTextField: UITextField!
    @IBOutlet var motoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "chooseImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        motoImageView.addGestureRecognizer(tapGestureRecognizer)
        motoImageView.userInteractionEnabled = true
        
        
    }
    
    
    func chooseImage(recognizer:UITapGestureRecognizer){
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        
        // small picture
        let smallPicture = scaleImageWith(pickedImage, newSize: CGSizeMake(100, 100))
        
        
        var sizeOfImageView:CGRect = motoImageView.frame
        sizeOfImageView.size = smallPicture.size
        motoImageView.frame = sizeOfImageView
        
        motoImageView.image = smallPicture
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func scaleImageWith(image:UIImage, newSize:CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @IBAction func addContact(sender: AnyObject) {
        let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
        
        var moto:Moto = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(Moto), managedObjectConect: moc) as! Moto
        
        moto.motoidentifier = "\(NSDate())"
        moto.motomarque = marqueTextField.text
        moto.motomodel = modelTextField.text
        moto.motoannee = anneeTextField.text
        moto.motokilometre = kilometrageTextField.text
        
        let motoImagedata:NSData = UIImagePNGRepresentation(motoImageView.image)
        
        moto.motoImage = motoImagedata
        
        
        SwiftCoreDataHelper.saveManagedObjectContext(moc)
        
        self.navigationController!.popViewControllerAnimated(true)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
