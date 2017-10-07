//
//  Document.swift
//  VocalTextEdit
//
//  Created by Christopher Lee on 8/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    enum Error: Swift.Error {
        case UTF8Encoding
        case UTF8Decoding
        
        var failureReason: String {
            switch self {
            case .UTF8Encoding:
                return "File cannot be encoded in UTF-8"
            case .UTF8Decoding:
                return "File is not valid UTF-8"
            }
        }
    }
    
    var contents: String = ""
    
    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.textView.string ?? ""
        
        guard let data = contents.data(using: .utf8) else {
            throw Document.Error.UTF8Encoding
        }
        
        return data
    }

    override func read(from data: Data, ofType typeName: String) throws {
        guard let contents = String(data: data, encoding: .utf8) else {
            throw Document.Error.UTF8Decoding
        }
        
        self.contents = contents
    }


}

