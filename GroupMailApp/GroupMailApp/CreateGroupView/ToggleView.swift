//
//  ToggleView.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import SwiftUI

struct ToggleView: View {
    @ObservedObject var recipientViewModel: RecipientViewModel
    
    var body: some View {
        Button(action: {
            recipientViewModel.isSelected.toggle()
        }, label: {
            HStack {
                Text(recipientViewModel.id)
                Spacer()
                Image(systemName: recipientViewModel.isSelected ? Constants.Image.checkmarkCircle : Constants.Image.circle)
            }
        })
    }
}
