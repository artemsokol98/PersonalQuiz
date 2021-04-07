//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var textResultLabel: UILabel!
    
    // MARK: - Public properties
    var answers: [Answer]!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = parseArray(array: answers)
        emojiLabel.text = "Вы - \(String(result?.rawValue ?? " "))"
        textResultLabel.text = result?.definition
        self.navigationItem.setHidesBackButton(true, animated: true);
        
    }

    // MARK: -  Private Methods
    private func parseArray(array: [Answer]) -> AnimalType? {
        let answersMapped = array.map { ($0.type, 1) }
        let countDuplicateAnswers = Dictionary(answersMapped, uniquingKeysWith: +)
        let sortedCounts = countDuplicateAnswers.sorted { $0.1 > $1.1 }
        
        let answer = sortedCounts.first?.key
        return answer
    }
}
