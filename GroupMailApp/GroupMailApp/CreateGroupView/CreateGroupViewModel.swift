//
//  CreateGroupViewModel.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class CreateGroupViewModel: ObservableObject {
    
    @Published var groupName: String = ""
    @Published var recipientViewModels: [RecipientViewModel] = []
    
    var onCreate: (([String], String) -> Void)?
    
    init(onCreate: @escaping (([String], String) -> Void))  {
        self.onCreate = onCreate
    }

    func addRecipient(id: String) {
        recipientViewModels.insert(RecipientViewModel(id: id, isSelected: true), at: 0)
    }
    
    func createGroup() {
        let selectedEmailIds = recipientViewModels.filter { $0.isSelected }.map { $0.id }
        guard !groupName.isEmpty && !selectedEmailIds.isEmpty else { return }
        let groupName = groupName
        onCreate?(selectedEmailIds, groupName)
    }
}
