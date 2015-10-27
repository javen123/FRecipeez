//
//  Recipe.swift
//  FRecipeez
//
//  Created by Jim Aven on 10/27/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject {


    func setRecipeImg(img:UIImage) {
        
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image!)
        return img!
    }

}
