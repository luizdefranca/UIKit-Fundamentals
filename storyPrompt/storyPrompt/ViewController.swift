//
//  ViewController.swift
//  storyPrompt
//
//  Created by Luiz on 3/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }

    @IBAction func chanteStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
    }

    //Proprieties
    let storyPrompt = StoryPromptEntry()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSlider.value = 7.5

        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = 10
        dump(storyPrompt)
    }


}

