//
//  ContentView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) private var openURL

    @State private var isPresented = false

    private let buttonSize: Double = 30

    var body: some View {
        NavigationStack {
            EventList()
                .toolbar {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: buttonSize, height: buttonSize)
                    }
                    .sheet(isPresented: $isPresented) {
                        WebView(url: URL(string: "https://zwiftinsider.com/schedule/")!)
                    }
                }
                .toolbarBackground(Color.zwiftBlue, for: .navigationBar)
                .background(Color.zwiftBlue)
                .foregroundColor(.appWhite)
        }
        .accentColor(.zwiftOrange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
