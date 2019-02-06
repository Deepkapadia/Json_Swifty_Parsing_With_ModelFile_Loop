//
//  Atricles_Model.swift
//  Daily_Feeds_News
//
//  Created by DeEp KapaDia on 22/12/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import Foundation


//Structure For Access Data From API
struct Articles_Model {
    
    //Declaration of variable As..
    var name: String = ""
    var name1 : String = ""
    var location:String = ""
    var location1: String = ""
    var email:String = ""
    init()
    {
        
    }
    
    //init Function to Access all variable into a API Keys
    init(json:JSON) {
        
        email = json["email"].stringValue
        name = json["name"]["first"].stringValue
        name1  = json["name"]["last"].stringValue
        
        location = json["location"]["coordinates"]["latitude"].stringValue
        location1 = json["location"]["coordinates"]["longitude"].stringValue
    }
    
    
}
