//
//  ViewController.swift
//  Athena
//
//  Created by b203u on 3/31/17.
//  Copyright © 2017 Mark Arias. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, AVSpeechSynthesizerDelegate
{

    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        synthesizer.delegate = self
    }

    
    @IBOutlet weak var utteranceLabel: UILabel!
    
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance)
    {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: characterRange)
        utteranceLabel.attributedText = mutableAttributedString
    }
    
    
    
    
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance)
    {
        utteranceLabel.attributedText = NSAttributedString(string: utterance.speechString)
    }

    
    @IBAction func stopSpeaking(_ sender: AnyObject)
    {
         synthesizer.pauseSpeaking(at: .word)
    }
    
    @IBAction func startSpeaking(_ sender: AnyObject)
    {
        let string = textView.text!
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language :"en-US")
        synthesizer.speak(utterance)
    }
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

