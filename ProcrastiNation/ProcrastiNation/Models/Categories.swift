//
//  Categories.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//

import Foundation
import SwiftUI

struct ItemCategory: Identifiable, Hashable {
    let id = UUID()
    
    var category: String
    var color: Color
}

let categories = [
    ItemCategory(category: "Business", color: Color.cyan),
    ItemCategory(category: "Personal", color: Color.indigo),
    ItemCategory(category: "Other", color: Color.mint)
]
