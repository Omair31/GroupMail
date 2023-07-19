//
//  GroupMailAppApp.swift
//  GroupMailApp
//
//  Created by Omeir on 18/07/2023.
//

import SwiftUI
import Combine
import MessageUI

@main
struct GroupMailAppApp: App {
    // MARK: - Wrapper to handle navigation separately from view
    let nextViewModel = NextViewModel()
    
    // MARK: - To maintain the state of an edited group
    @State private var editedGroup: MailGroup = MailGroup(id: "", name: "", emails: [])
    
    // MARK: - To have a reference of results for later use
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    // MARK: - ViewModel for GroupListing
    let groupViewModel = GroupListViewModel(groupService: LocalGroupsService(repository: LocalGroupRepository()))
    
    // MARK: - Model to provide recipients for Mail Composition
    @State var mailViewModel = MailComposeViewModel(recipients: [])
    
    // MARK: - To maintain state of showing create group view
    @State private var showCreateGroup = false
    
    // MARK: - To maintain state of showing MFMailComposeViewController
    @State var isShowingMailView = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    MailGroupsViewFactory.createGroupList(groupListViewModel: groupViewModel) { group in
                        editedGroup = group
                        nextViewModel.activate()
                    } onMail: { group in
                        #if !targetEnvironment(simulator)
                        self.mailViewModel = MailViewModel(recipients: group.emails)
                        self.isShowingMailView.toggle()
                        #endif
                    }
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(isActive: $showCreateGroup) {
                                MailGroupsViewFactory.createGroupView { [weak groupViewModel] ids, groupName in
                                    groupViewModel?.addNewGroup(group: MailGroup(id: UUID().uuidString, name: groupName, emails: ids))
                                    showCreateGroup.toggle()
                                }
                            } label: {
                                Text(Constants.Localizable.createGroup)
                            }
                        }
                    })
                    .sheet(isPresented: $isShowingMailView) {
                        MailComposeView(result: self.$result, mailViewModel: mailViewModel)
                    }
                    MailGroupsViewFactory.createEditView(nextViewModel: nextViewModel, mailGroup: editedGroup) { [weak groupViewModel] (ids, groupName) in
                        groupViewModel?.editGroup(group: MailGroup(id: editedGroup.id, name: groupName, emails: ids))
                        nextViewModel.deactivate()
                    }
                }
            }
        }
    }
}
