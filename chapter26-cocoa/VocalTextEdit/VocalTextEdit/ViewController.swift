//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Christopher Lee on 8/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import Cocoa

//class ViewController: NSViewController {
//
//    let speechSynthesizer = NSSpeechSynthesizer()
//
//    // Need to specify the delegate to handle executing the functions when the conditions are met
//    weak var delegate: NSSpeechSynthesizerDelegate?
//
//    @IBOutlet weak var stopButton: NSButton!
//    @IBOutlet weak var speakButton: NSButton!
//    @IBOutlet weak var progressBar: NSProgressIndicator!
//
//    func configureButtonsWhileSpeaking() {
//        speakButton.isEnabled = false
//        stopButton.isEnabled = true
//        progressBar.isHidden = false
//    }
//
//    func configureButtonsWhileStopped() {
//        speakButton.isEnabled = true
//        stopButton.isEnabled = false
//        progressBar.isHidden = true
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureButtonsWhileStopped()
//        speechSynthesizer.delegate = self
//    }
//
//    func configureProgressBar(_ input: String) {
//        let contentsArray = input.components(separatedBy: " ")
//        let wordCount = contentsArray.count
//        progressBar.maxValue = Double(wordCount)
//    }
//
//    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
//        configureButtonsWhileSpeaking()
//        progressBar.increment(by: 1.0)
//    }
//
//    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
//        if finishedSpeaking {
//            configureButtonsWhileStopped()
//            progressBar.doubleValue = 0.0
//        }
//    }
//
//    @IBOutlet var textView: NSTextView!
//
//    // computed property
//    var contents: String? {
//        get {
//            return textView.string
//        }
//        set {
//            textView.string = newValue!
//        }
//    }
//
//    @IBAction func speakButtonClicked(_ sender: NSButton) {
//        if let contents = textView?.string, !contents.isEmpty {
//            configureProgressBar(contents)
//            speechSynthesizer.startSpeaking(contents)
//        } else {
//            let defaultString = "The document is empty."
//            configureProgressBar(defaultString)
//            speechSynthesizer.startSpeaking(defaultString)
//        }
//    }
//
//    @IBAction func stopButtonClicked(_ sender: NSButton) {
//        speechSynthesizer.stopSpeaking()
//        self.speechSynthesizer(speechSynthesizer, didFinishSpeaking: true)
//    }
//}
//

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var progressBar: NSProgressIndicator!
    
    func configureButtonsWhileSpeaking() {
        speakButton.isEnabled = false
        stopButton.isEnabled = true
        progressBar.isHidden = false
    }
    
    func configureButtonsWhileStopped() {
        speakButton.isEnabled = true
        stopButton.isEnabled = false
        progressBar.isHidden = true
    }
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonsWhileStopped()
        speechSynthesizer.delegate = self
    }
    
    func configureProgressBar(_ input: String) {
        let contentsArray = input.components(separatedBy: " ")
        let wordCount = contentsArray.count
        progressBar.maxValue = Double(wordCount)
        
    }
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        if let contents = textView?.string, !contents.isEmpty {
            configureProgressBar(contents)
            speechSynthesizer.startSpeaking(contents)
        } else {
            let defaultString = "The document is empty."
            configureProgressBar(defaultString)
            speechSynthesizer.startSpeaking(defaultString)
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
        speechSynthesizer.stopSpeaking()
        self.speechSynthesizer(speechSynthesizer, didFinishSpeaking: true)
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        configureButtonsWhileSpeaking()
        progressBar.increment(by: 1.0)
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        if finishedSpeaking {
            configureButtonsWhileStopped()
            progressBar.doubleValue = 0.0
        }
    }
}
