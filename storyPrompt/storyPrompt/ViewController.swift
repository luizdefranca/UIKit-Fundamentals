//
//  ViewController.swift
//  storyPrompt
//
//  Created by Luiz on 3/13/21.
//

import UIKit
import PhotosUI

class ViewController: UIViewController{

    //MARK: - Outlets
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var storyPromptImageView: UIImageView!


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
        checkStoryPromptIsValid()
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

        //Setting the storyPromptImageView
        storyPromptImageView.isUserInteractionEnabled = true
        storyPromptImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                         action: #selector(changeImage)))
        dump(storyPrompt)
    }

    //MARK: - Functions
    func updateStoryPrompt(){
        storyPrompt.noun = nounTextField.text ?? ""
        storyPrompt.adjective = adjectiveTextField.text ?? ""
        storyPrompt.verb = verbTextField.text ?? ""
    }

    func checkStoryPromptIsValid(){
        if storyPrompt.isValid(){
            print("valid story prompt")
        } else {
            let alert = UIAlertController(title: "Invalid Story Prompt!",
                                          message: "Please, fill out all of the fields",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    @objc func changeImage(){
        var configurations = PHPickerConfiguration()
        configurations.filter = .images
        configurations.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configurations)
        controller.delegate = self
        present(controller, animated: true, completion: nil)

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

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self){
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                        picker.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }



}
