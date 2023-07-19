//
//  GroupListView.swift
//  GroupMailApp
//
//  Created by Omeir on 18/07/2023.
//

import SwiftUI

struct GroupListView: View {
    @ObservedObject private var viewModel: GroupListViewModel
    let onEdit: ((MailGroup) -> ())?
    let onMail: ((MailGroup) -> ())?
    
    init(viewModel: GroupListViewModel, onEdit: ((MailGroup) -> ())?, onMail: ((MailGroup) -> ())?) {
        self.viewModel = viewModel
        self.onEdit = onEdit
        self.onMail = onMail
    }
    
    var body: some View {
        List {
            ForEach(viewModel.groups, id: \.id) { group in
                Button {
                    onMail?(group)
                } label: {
                    GroupView(group: group)
                        .swipeActions {
                            Button {
                                onEdit?(group)
                            } label: {
                                Text(Constants.Localizable.edit)
                            }
                        }
                }
            }
        }
        .navigationBarTitle(Constants.Localizable.groups)
    }
}


