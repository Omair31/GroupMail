//
//  NextViewModel.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class NextViewModel: ObservableObject {
    @Published var isActive = false
    
    func activate() {
        isActive = true
    }
    
    func deactivate() {
        isActive = false
    }
}
