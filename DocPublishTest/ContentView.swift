//
//  ContentView.swift
//  DocPublishTest
//
//  Created by Eric Kampman on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: DocPublishTestDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(DocPublishTestDocument()))
    }
}
