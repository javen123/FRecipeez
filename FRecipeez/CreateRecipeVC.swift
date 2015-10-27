//
//  CreateRecipeVC.swift
//  FRecipeez
//
//  Created by Jim Aven on 10/27/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitleLbl: UITextField!
    @IBOutlet weak var recipeIngredientsLBl: UITextField!
    @IBOutlet weak var recipeStepsLbl: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    
    var imgPicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imgPicker = UIImagePickerController()
        self.imgPicker.delegate = self
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imgPicker.dismissViewControllerAnimated(true, completion: nil)
        self.recipeImg.image = image
    }
    
    @IBAction func btnAddPic(sender: AnyObject) {
        
        self.presentViewController(self.imgPicker, animated: true, completion: nil)
        
    }
    @IBAction func btnCreateRecipe(sender: AnyObject) {
        
        if let title = self.recipeTitleLbl.text where title != "" && self.recipeImg.image != nil {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)
            let recipe = Recipe(entity:entity!, insertIntoManagedObjectContext: context)
            recipe.title = title
            recipe.ingredients = self.recipeIngredientsLBl.text
            recipe.steps = self.recipeStepsLbl.text
            recipe.setRecipeImg(self.recipeImg.image!)
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch {
                print("could not save")
            }
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            
            let alert = UIAlertController(title: "Oops", message: "Must have a title and an image", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            if touch.phase == .Began {
                self.view.endEditing(true)
            }
        }
        
    }

}
