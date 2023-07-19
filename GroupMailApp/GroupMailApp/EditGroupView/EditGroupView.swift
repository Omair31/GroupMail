//
//  EditGroupView.swift
//  GroupMailApp
//
//  Created by Omeir on 18/07/2023.
//

import SwiftUI

struct EditGroupView: View {
    @ObservedObject private var viewModel: EditGroupViewModel
    @State var newRecipient: String = ""
    
    init(viewModel: EditGroupViewModel) {
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
                Text(Constants.Localizable.selectEmailIDs)
            }
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.saveChanges()
                }) {
                    Text(Constants.Localizable.saveChanges)
                }
                Spacer()
            }
        }
        .navigationBarTitle(Constants.Localizable.editGroup)
    }
}
