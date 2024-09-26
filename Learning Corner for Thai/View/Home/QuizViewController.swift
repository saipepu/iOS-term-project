import UIKit

class QuizViewController: UIViewController {

    //MARK: - Variables
    var quizzez: [QuizModel]? = nil
    var quizView: QuizView?
    var course : CourseModel2? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // Set the background color of the view controller
        setUpUI()
        setUpConstraints()
    }
    
    
    
    //MARK: - Inject Data
    public func configure(quizzez : [QuizModel], course : CourseModel2) {
        self.quizzez = quizzez
        self.course = course
    }
    
    
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        quizView = QuizView()
 
        if let quizView = quizView, let quizzez = quizzez, let exp = course?.exp {
            quizView.configure(quizzez: quizzez, courseExp: exp)
            
            view.addSubview(quizView)
            quizView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    //MARK: - Constraints Set Up
    fileprivate func setUpConstraints() {
        if let quizView = quizView {
            NSLayoutConstraint.activate([
                quizView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
                quizView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                quizView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//                quizView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
                
            ])
        }
    }
}

