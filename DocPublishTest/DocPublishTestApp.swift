//
//  DocPublishTestApp.swift
//  DocPublishTest
//
//  Created by Eric Kampman on 10/10/20.
//

import SwiftUI

@main
struct DocPublishTestApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DocPublishTestDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
