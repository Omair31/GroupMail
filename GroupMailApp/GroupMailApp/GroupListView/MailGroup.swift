//
//  MailGroup.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class MailGroup: Identifiable {
    let id: String
    let name: String
    let emails: [String]
    
    init(id: String, name: String, emails: [String]) {
        self.id = id
        self.name = name
        self.emails = emails
    }
}
