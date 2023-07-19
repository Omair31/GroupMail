//
//  GroupListViewModel.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import Foundation

class GroupListViewModel: ObservableObject {
    private let groupService: GroupsService
    @Published private(set) var groups: [MailGroup] = []
    
    init(groupService: GroupsService) {
        self.groupService = groupService
        self.getGroups()
    }
    
    func getGroups() {
        Task {
            let groups = await groupService.loadGroups()
            self.groups = groups
        }
    }
    
    func addNewGroup(group: MailGroup) {
        groups.append(group)
        groupService.addGroup(group)
    }
    
    func editGroup(group: MailGroup) {
        guard let index = groups.firstIndex(where: { $0.id == group.id }) else { return }
        groups[index] = group
        groupService.editGroup(group)
    }
}
