//
//  String+Extension.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

extension String {
    func toCSVArray() -> [String] {
        return components(separatedBy: ",")
    }
}
