//
//  EditGroupViewModel.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class EditGroupViewModel: ObservableObject {
    @Published var groupName: String = ""
    @Published var recipientViewModels = [RecipientViewModel]()
    
    var onEdit: (([String], String) -> Void)?
    
    let mailGroup: MailGroup
    
    init(mailGroup: MailGroup, onEdit: @escaping (([String], String) -> Void)) {
        self.mailGroup = mailGroup
        self.onEdit = onEdit
        self.groupName = mailGroup.name
        self.recipientViewModels = mailGroup.emails.map { RecipientViewModel(id: $0, isSelected: true) }
    }
    
    func addRecipient(id: String) {
        recipientViewModels.insert(RecipientViewModel(id: id, isSelected: true), at: 0)
    }
    
    func saveChanges() {
        let selectedEmailIds = recipientViewModels.filter { $0.isSelected }.map { $0.id }
        let groupName = groupName
        onEdit?(selectedEmailIds, groupName)
    }
}
