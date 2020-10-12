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
		VStack {
			ForEach(document.data.indices, id: \.self)  { index in
				Text(document.data[index].name)
				Slider(value: $document.data[index].value)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(DocPublishTestDocument()))
    }
}
