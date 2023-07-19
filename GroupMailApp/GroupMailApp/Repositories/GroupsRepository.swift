//
//  GroupsRepository.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

protocol GroupsRepository {
    func addGroup(idValue: String, nameValue: String, emailValue: String)
    func getGroups() -> [MailGroup]
    func updateGroup(idValue: String, nameValue: String, emailValue: String)
    func deleteUser(idValue: String)
}
