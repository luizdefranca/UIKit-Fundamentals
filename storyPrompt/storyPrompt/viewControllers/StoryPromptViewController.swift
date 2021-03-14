//
//  StoryPromptViewController.swift
//  storyPrompt
//
//  Created by Luiz on 3/14/21.
//

import UIKit

class StoryPromptViewController: UIViewController {


    @IBOutlet weak var storyPromptTextView: UITextView!


    var storyPrompt = StoryPromptEntry()

    override func viewDidLoad() {
        super.viewDidLoad()

        //set inital values to storyPrompt
        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "swims"
        storyPrompt.number = 7

        //set the description to storyPromptTextView
        storyPromptTextView.text = storyPrompt.description

        
    }


}
