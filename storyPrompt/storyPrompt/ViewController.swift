//
//  ViewController.swift
//  storyPrompt
//
//  Created by Luiz on 3/13/21.
//

import UIKit

class ViewController: UIViewController{

    //MARK: - Outlets
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!


    //MARK: - Actions
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

    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        dump(storyPrompt)
    }


    //MARK: - Proprieties
    let storyPrompt = StoryPromptEntry()

    //MARK: - Overrrided Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5

        storyPrompt.noun = "toaster"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burps"
        storyPrompt.number = 10

        //Setting the textField delegates
        nounTextField.delegate = self
        verbTextField.delegate = self
        adjectiveTextField.delegate = self
        
        dump(storyPrompt)
    }

    //MARK: - Functions
    func updateStoryPrompt(){
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }
}

//MARK: - Extensions
extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
}
