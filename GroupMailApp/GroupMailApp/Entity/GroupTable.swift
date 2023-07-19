//
//  GroupTable.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation
import SQLite

// MARK: - Table Struct for maintaining table for SQLite
struct GroupTable {
    static let table = Table("group")
    static let id = Expression<String>("id")
    static let name = Expression<String>("name")
    static let emails = Expression<String>("emails")
}
