//
//  MailGroupsViewFactory.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import SwiftUI

class MailGroupsViewFactory {
    // MARK: - Factory for instantiating views for our app
    
    // MARK: - View for editing a group
    static func createEditView(nextViewModel: NextViewModel, mailGroup: MailGroup, onEdit: @escaping (([String], String) -> Void)) -> some View {
        let nextView = NextView(nextViewModel: nextViewModel) {
            EditGroupView(
                viewModel: EditGroupViewModel(
                    mailGroup: mailGroup,
                    onEdit: onEdit
                )
            )
        }
        return nextView
    }
    
    // MARK: - View for creating a group
    static func createGroupView(onCreate: @escaping ([String], String) -> Void) -> some View {
        CreateGroupView(
            viewModel: CreateGroupViewModel(onCreate: onCreate)
        )
    }
    
    // MARK: - View for creating a groupList
    static func createGroupList(groupListViewModel: GroupListViewModel, onEdit: @escaping (MailGroup) -> Void,  onMail: @escaping (MailGroup) -> Void) -> some View {
        GroupListView(
            viewModel: groupListViewModel,
            onEdit: onEdit,
            onMail: onMail
        )
    }
}
