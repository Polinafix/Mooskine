//
//  Note+Extensions.swift
//  Mooskine
//
//  Created by Polina Fiksson on 08/03/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Note {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
