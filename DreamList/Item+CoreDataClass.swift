//
//  Item+CoreDataClass.swift
//  DreamList
//
//  Created by Andre Rosa on 18/07/17.
//  Copyright © 2017 Andre Rosa. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
