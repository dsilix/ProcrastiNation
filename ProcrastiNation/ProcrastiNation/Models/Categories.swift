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
    ItemCategory(category: "High", color: Color.red),
    ItemCategory(category: "Medium", color: Color.yellow),
    ItemCategory(category: "Low", color: Color.green)
]
