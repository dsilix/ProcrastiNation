//
//  GestureRecognizer.swift
//  ProcrastiNation
//
//  Created by Silvio Saturno on 19/11/21.
//

import Foundation
import UIKit

//hide keyboard on press outside
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
