//
//  GroupsService.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

protocol GroupsService {
    func loadGroups(completion: ([MailGroup]) -> Void)
    func addGroup(_ group: MailGroup)
    func editGroup(_ group: MailGroup)
}
