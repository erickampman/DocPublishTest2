//
//  DocPublishTestDocument.swift
//  DocPublishTest
//
//  Created by Eric Kampman on 10/10/20.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

struct DocData: Codable {
	let name: String
	var value: Double
}

extension UTType {
	static let dpt = UTType(exportedAs: "com.unlikelyware.dpt")
}

class DocPublishTestDocument: FileDocument, ObservableObject {
	@Published var data: [DocData]
	var subscriber: AnyCancellable!

    init(text: String = "Hello, world!") {
		self.data = [ DocData(name: "data1", value: Double.pi) ]
		
		setupSink()
    }

	static var readableContentTypes: [UTType] { [.dpt] }
	static var writableContentTypes: [UTType] { [.dpt] }
	

	required init(configuration: ReadConfiguration) throws {
		guard let data = configuration.file.regularFileContents else {
			throw CocoaError(.fileReadCorruptFile)
		}
		do {
			let tdata = try JSONDecoder().decode([DocData].self, from: data)
			self.data = tdata
			
			setupSink()
		}
		catch {
			throw CocoaError(.fileReadCorruptFile)
		}
	}

	func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
		do {
			let edata = try JSONEncoder().encode(data)
			return FileWrapper(regularFileWithContents: edata)
		}
		catch {
			throw CocoaError(.fileWriteUnknown)
		}
	}
	
	func setupSink() {
		subscriber = $data.sink(receiveCompletion: { print("Completion: \($0)")},
				   receiveValue: { print("Data: \($0)")})
	}
}
