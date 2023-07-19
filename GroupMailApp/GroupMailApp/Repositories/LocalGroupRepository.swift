//
//  LocalGroupRepository.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation
import SQLite

class LocalGroupRepository: GroupsRepository {
    // MARK: - This is the class which manages the SQLite CRUD operations on local data
    private var db: Connection!
    
    init() {
        do {
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            db = try Connection("\(path)/my_groups.sqlite3")
            try db?.run(GroupTable.table.create(ifNotExists: true) { table in
                table.column(GroupTable.id, primaryKey: true)
                table.column(GroupTable.name)
                table.column(GroupTable.emails)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addGroup(idValue: String, nameValue: String, emailValue: String) {
        do {
            try db.run(GroupTable.table.insert(GroupTable.id <- idValue, GroupTable.name <- nameValue, GroupTable.emails <- emailValue))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getGroups() -> [MailGroup] {
        var groupModels: [MailGroup] = []
        do {
            for group in try db.prepare(GroupTable.table) {
                let groupModel: MailGroup = MailGroup(id: group[GroupTable.id], name: group[GroupTable.name], emails: group[GroupTable.emails].toCSVArray())
                groupModels.append(groupModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return groupModels
    }
    
    func getGroup(idValue: String) -> MailGroup? {
        var groupModel: MailGroup?
        
        do {
            let group: AnySequence<Row> = try db.prepare(GroupTable.table.filter(GroupTable.id == idValue))
            try group.forEach({ (rowValue) in
                let idValue = try rowValue.get(GroupTable.id)
                let nameValue = try rowValue.get(GroupTable.name)
                let emailsValue = try rowValue.get(GroupTable.emails)
                groupModel = MailGroup(id: idValue, name: nameValue, emails: emailsValue.toCSVArray())
            })
        } catch {
            print(error.localizedDescription)
        }
        
        return groupModel
    }
    
    func updateGroup(idValue: String, nameValue: String, emailValue: String) {
        do {
            let group: Table = GroupTable.table.filter(GroupTable.id == idValue).limit(1)
            try db.run(group.update(GroupTable.name <- nameValue, GroupTable.emails <- emailValue))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteUser(idValue: String) {
        do {
            let user: Table = GroupTable.table.filter(GroupTable.id == idValue)
            try db.run(user.delete())
        } catch {
            print(error.localizedDescription)
        }
    }
}
