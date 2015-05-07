//
//  Menu_base.swift
//  Smart_Rider_2
//
//  Created by Macmini_Dagon on 07.05.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.
//


import UIKit
import CoreData


class MainPageViewController: UIViewController, UICollectionViewDelegate {
    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
   
    @IBOutlet var Marque_Label: UILabel!
    @IBOutlet var Model_Label: UILabel!
    @IBOutlet var Km_Label: UILabel!
    @IBOutlet var Annee_Label: UILabel!
    @IBOutlet var motoImage_view: UIImageView!
    
    
    
 var Motos:NSMutableArray = NSMutableArray()
   
    
    override func viewDidLoad() {
     //   super.viewDidLoad()
        
     
    }
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        loadData()
        
        if Motos.count == 0 {
            let nv = self.storyboard!.instantiateViewControllerWithIdentifier("AddMoto") as! Ajouter_moto_viewController
            
            self.navigationController!.pushViewController(nv, animated: true)
        }
        
   
        
    }
    
    
    func loadData(){
        Motos.removeAllObjects()
        recherchemoto()
  }
    
    func recherchemoto() {
        let entityDescription =
        NSEntityDescription.entityForName("Moto",
            inManagedObjectContext: managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        let pred = NSPredicate(format: "(motomarque = %@)", "YamahaR1")
        request.predicate = pred
        
        var error: NSError?
        
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error)
        
        if let results = objects {
            
            if results.count > 0 {
                let match = results[0] as! NSManagedObject
                
                Marque_Label.text = match.valueForKey("motomarque") as? String
                Model_Label.text = match.valueForKey("motomodel") as? String
                Km_Label.text = match.valueForKey("motokilometre") as? String
                Annee_Label.text = match.valueForKey("motoannee") as? String
                
                
            } else {
                ""
            }
        }
    }
    
    
    
    
    }
    
    
    
    



