//
//  Notebook+Extensions.swift
//  Mooskine
//
//  Created by Polina Fiksson on 08/03/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

//17. This code will set the creationDate on Notebook initialization - and it's cleaner doing this during initialization than after

import Foundation
import CoreData

extension Notebook {
    public override func awakeFromInsert() {
        //we dont't want to override we just want to add!
        super.awakeFromInsert()
        creationDate = Date()
    }
}
