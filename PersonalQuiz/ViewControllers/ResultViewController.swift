//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var userAnimalLabel: UILabel!
    @IBOutlet var animalDescription: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        identifyAnimalUser()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func identifyAnimalUser() {
        guard let answers = answersChosen else {
            return
        }
        
        var answerCounter: [Animal : Int] = [:]
        
        for answer in answers {
            answerCounter[answer.animal] = 0
        }
        
        for answer in answers {
            switch answer.animal {
            case .dog: answerCounter[.dog]! += 1
            case .cat: answerCounter[.cat]! += 1
            case .rabbit: answerCounter[.rabbit]! += 1
            case .turtle: answerCounter[.turtle]! += 1
            }
        }
        
        let maxValueAnswerCounter = answerCounter.max { $0.value < $1.value }
        
        for answer in answers {
            if answer.animal == maxValueAnswerCounter?.key {
                userAnimalLabel.text = "Вы - \(answer.animal.rawValue)!"
                animalDescription.text = answer.animal.definition
            }
        }
    }
}
