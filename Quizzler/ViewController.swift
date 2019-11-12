//  Created by Mohammadreza Sadeghi on 05/08/2019.
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestions = QuestionBank()
    var pickedAnswer :Bool = false
    var questionNumber : Int = 0
    var score :Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
       // let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
         
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
        
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: " + String (score)
        progressLabel.text =  "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width)/13 * CGFloat (questionNumber + 1)
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
        questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
    }else{
            let alert = UIAlertController(title: "Great!", message: "You have done all questions, would you like to go again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
    }
        
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
             ProgressHUD.showSuccess("Correct!")
                      score += 10
            
         
        }else {
            print("Wrong")
            
                     ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
       nextQuestion()
    }
    

    
}
