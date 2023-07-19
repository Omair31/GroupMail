//
//  LocalGroupsService.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class LocalGroupsService: GroupsService {
    private let repository: GroupsRepository
    
    init(repository: GroupsRepository) {
        self.repository = repository
    }
    
    func loadGroups(completion: ([MailGroup]) -> Void) {
        completion(repository.getGroups())
    }
    
    func addGroup(_ group: MailGroup) {
        repository.addGroup(idValue: group.id, nameValue: group.name, emailValue: group.emails.map { $0 }.joined(separator: ", "))
    }
    
    func editGroup(_ group: MailGroup) {
        repository.updateGroup(idValue: group.id, nameValue: group.name, emailValue: group.emails.map { $0 }.joined(separator: ", "))
    }
}
