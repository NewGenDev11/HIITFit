//
//  DateExtension.swift
//  HIITFit
//
//  Created by Curtis Fisher on 1/25/25.
//

import Foundation


func formatted(as format: String) -> String {
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = format
return dateFormatter.string(from: self)
}
