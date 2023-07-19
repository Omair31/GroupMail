//
//  RecipientViewModel.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class RecipientViewModel: ObservableObject {
    let id: String
    @Published var isSelected: Bool
    
    init(id: String, isSelected: Bool) {
        self.id = id
        self.isSelected = isSelected
    }
}
