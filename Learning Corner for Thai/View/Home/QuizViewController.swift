import UIKit
import KeychainSwift

class QuizViewController: UIViewController,  QuizViewDelegate, RewardViewControllerDelegate{
    
    //MARK: - Variables
    var quizzez: [QuizModel]? = nil
    var quizView: QuizView?
    var course : CourseModel2? = nil
    var updateScoreVM: UpdateScoreViewModel? = nil
    var updateUserVM : UpdateUserViewModel? = nil
    var getCurrentUserVM : GetUserByUserIdViewModel? = nil
    let keyChain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // Set the background color of the view controller
        setUpUI()
        setUpConstraints()
        
         
    }
    
    //            if let id = keyChain.get("userId") {

    //66f6c1ef2020385fb9a862fc
    
    
    //MARK: - Inject Data
    public func configure(quizzez : [QuizModel], course : CourseModel2) {
        self.quizzez = quizzez
        self.course = course
        self.updateScoreVM = UpdateScoreViewModel(point: 0, exp: course.exp ?? 0)//default values
    }
    
    
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        if let quizzez = quizzez, let exp = course?.exp, let updateScoreVM = updateScoreVM {
            
            quizView = QuizView(frame: .zero, updateScoreVM: updateScoreVM) // Pass the ViewModel
            
            
            quizView?.configure(quizzez: quizzez, courseExp: exp)
            if let quizView = quizView {
                view.addSubview(quizView)
                quizView.translatesAutoresizingMaskIntoConstraints = false
                quizView.delegate = self
            }
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
    
    func didFinishQuiz() {
        // call updateUser method for updating course
        
        updateUserCourseList()
        // Navigate to another screen, e.g., push a new view controller
        
        let rewardVC = RewardViewController() // Your destination view controller
        rewardVC.delegate = self
        if let exp = course?.exp, let finalScore = quizView?.finalScore {
            rewardVC.configure(exp: exp, points: finalScore)
            present(rewardVC, animated: true, completion: nil)
            
        }
        
        
    }
    
    func didDismissRewardViewController() {
        // This will be called when RewardViewController is dismissed
        navigationController?.popToRootViewController(animated: true)
    }
    func updateUserCourseList() {
        getCurrentUserVM = GetUserByUserIdViewModel()
        var user = getCurrentUserVM?.userDetail
        print("User func triggered")

        if let courseId = course?._id {
            
            // Safely unwrap optional values with default fallback
         
            updateUserVM = UpdateUserViewModel(coursesId: [courseId])
            print("User updated")
            if let id = keyChain.get("userId") {
                updateUserVM?.updateUser(userId: id)

            }
            
            
            
        }
    }
    
}

