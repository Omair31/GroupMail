//
//  CreateGroupView.swift
//  GroupMailApp
//
//  Created by Omeir on 18/07/2023.
//

import SwiftUI
import Combine

struct CreateGroupView: View {
    @ObservedObject private var viewModel: CreateGroupViewModel
    @State private var newRecipient: String = ""
    
    init(viewModel: CreateGroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            Section {
                TextField(Constants.Localizable.enterGroupName, text: $viewModel.groupName)
            } header: {
                Text(Constants.Localizable.groupName)
            }
            Section {
                HStack {
                    TextField(Constants.Localizable.enterEmail, text: $newRecipient)
                    Button {
                        viewModel.addRecipient(id: newRecipient)
                        newRecipient = ""
                    } label: {
                        Text(Constants.Localizable.add)
                            .disabled(newRecipient.isEmpty)
                    }
                }
                ForEach(viewModel.recipientViewModels, id: \.id) { receipientVM in
                    ToggleView(recipientViewModel: receipientVM)
                }
            } header: {
                HStack {
                    Text(Constants.Localizable.selectEmailIDs)
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    viewModel.createGroup()
                }) {
                    Text(Constants.Localizable.createGroup)
                }
                Spacer()
            }
        }
        .navigationBarTitle(Constants.Localizable.createGroup)
    }
}
