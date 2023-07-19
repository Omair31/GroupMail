//
//  GroupMailAppTests.swift
//  GroupMailAppTests
//
//  Created by Omeir on 19/07/2023.
//

import XCTest
@testable import GroupMailApp

final class GroupMailAppTests: XCTestCase {
    
    // MARK: - Empty GroupListViewModel Test
    func testEmptyGroupListViewModel_withNoData() {
        let service: GroupsService = ZeroGroupService()
        let viewModel = GroupListViewModel(groupService: service)
        XCTAssertEqual(viewModel.groups.count, 0, "Number of groups should be empty")
    }
    
    // MARK: - GroupListViewModel Test
    func testGroupListViewModel_withSomeData() {
        let service: GroupsService = DummyGroupService()
        let viewModel = GroupListViewModel(groupService: service)
        viewModel.getGroups()
        XCTAssertEqual(viewModel.groups.count, 3, "Number of groups should match")
    }
}

private class DummyGroupService: GroupsService {
    func loadGroups(completion: ([MailGroup]) -> Void) {
        completion([
            MailGroup(id: UUID().uuidString, name: "Group 1", emails: ["email1@example.com", "email2@example.com"]),
            MailGroup(id: UUID().uuidString, name: "Group 2", emails: ["email3@example.com"]),
            MailGroup(id: UUID().uuidString, name: "Group 3", emails: ["email4@example.com", "email5@example.com"])
        ])
    }
    
    func addGroup(_ group: MailGroup) {
        //
    }
    
    func editGroup(_ group: MailGroup) {
        //
    }
}

private class ZeroGroupService: GroupsService {
    func loadGroups(completion: ([MailGroup]) -> Void) {
        completion([])
    }
    
    func addGroup(_ group: MailGroup) {
        //
    }
    
    func editGroup(_ group: MailGroup) {
        //
    }
}
