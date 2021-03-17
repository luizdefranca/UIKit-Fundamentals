//
//  StoryPromptTableViewController.swift
//  storyPrompt
//
//  Created by Luiz on 3/15/21.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
//MARK: - Propities

    var storyPrompts = [StoryPromptEntry]()

//MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyPrompt1 = StoryPromptEntry()
        let storyPrompt2 = StoryPromptEntry()
        let storyPrompt3 = StoryPromptEntry()
        let storyPrompt4 = StoryPromptEntry()

        storyPrompt1.noun = "toaster"
        storyPrompt1.adjective = "smelly"
        storyPrompt1.verb = "attacks"
        storyPrompt1.number = 5


        storyPrompt2.noun = "toaster"
        storyPrompt2.adjective = "smelly"
        storyPrompt2.verb = "attacks"
        storyPrompt2.number = 5

        storyPrompt3.noun = "toaster"
        storyPrompt3.adjective = "smelly"
        storyPrompt3.verb = "attacks"
        storyPrompt3.number = 5

        storyPrompt4.noun = "toaster"
        storyPrompt4.adjective = "smelly"
        storyPrompt4.verb = "attacks"
        storyPrompt4.number = 5



        storyPrompts = [storyPrompt1, storyPrompt2, storyPrompt3, storyPrompt4]

    }

    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyPrompts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                                IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPrompt", for: indexPath)
        cell.textLabel?.text = "Promp \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
    }

}
