//
//  GroupView.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import SwiftUI

struct GroupView: View {
    let group: MailGroup
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(group.name)
                .font(.headline)
            Text(group.emails.map { $0 }.joined(separator: ", "))
                .font(.subheadline)
        }
    }
}
