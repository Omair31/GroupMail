//
//  NextView.swift
//  GroupMailApp
//
//  Created by Omeir on 19/07/2023.
//

import SwiftUI

struct NextView<Content: View>: View {
    @ObservedObject var nextViewModel = NextViewModel()
    let content: () -> Content
    var body: some View {
        NavigationLink(isActive: $nextViewModel.isActive) {
            content()
        } label: {
            EmptyView()
        }
    }
}
