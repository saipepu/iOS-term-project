import UIKit



//MARK: - TDL
// 1. When Submit button clicked, checkAnswer function is called ( that accepts OptionModel )//have to pass down from parent with index
// 2. In that function, check selected Option isCorrect == OptionModel.isCorrect
// 3. After that if that function return true, chagne the bg color of option row to green,
// 4. if false, chagne the bg of selecteRow to red and the option with correct ans to be green
// 5. after that the button will change to next and increment the index






class QuizView: UIView {

    let optionRow : ReusableOptionRow? = nil
    
    var quizzez : [QuizModel]?
    var quizQuestionIndex = 0
    var quiz: QuizModel? = nil
    private var selectedOptionRow: ReusableOptionRow? // Track the selected row
    var correctAnswer : OptionModel? = nil
    private var selectedOption: OptionModel?
    private var correctOptionRow : ReusableOptionRow?
    
    //MARK: - UI Components
    private let question: UILabel = {
       let question = UILabel()
        question.applyHeadingFont()
        question.applyPrimaryLabelColor()
        question.numberOfLines = 5
        question.textAlignment = .left
        question.translatesAutoresizingMaskIntoConstraints = false
        return question
    }()
    
    private let progressBar: UIProgressView = {
          let progressView = UIProgressView(progressViewStyle: .default)
          progressView.translatesAutoresizingMaskIntoConstraints = false
          progressView.progressTintColor = UIColor.blue // Set color for the progress
          progressView.trackTintColor = UIColor.lightGray
          progressView.setProgress(0.0, animated: true) // Initial progress
          return progressView
      }()
    
    private let quizStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = CGFloat(Theme.defaultSpacing)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let submitButton : UIButton = {
       let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.blue, for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        return submitButton
    }()
    
    private let nextButton : UIButton = {
       let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.red, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        return nextButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        assignCurrentQuestion()
        setUpUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(quizzez: [QuizModel]) {
        self.quizzez = quizzez
        
        selectedOptionRow = nil
          correctAnswer = nil
        
        self.quiz = quizzez[quizQuestionIndex]
        // assign correct answer
        assignCorrectAns()
       
        
        
        question.text = quiz?.question
        populateOptionRow()
    }
    
    
    //MARK: - Assign correct ans
    fileprivate func assignCorrectAns() {
        quiz?.options?.forEach({ option in
            if let correctOption = option.isCorrect, correctOption {
                self.correctAnswer = option
            }
        })
    }
    
    
    fileprivate func assignCurrentQuestion(){
        self.quiz = quizzez?[quizQuestionIndex]
    }
    
    //MARK: - Injecting Data
       fileprivate func populateOptionRow() {
           guard let options = quiz?.options else { return }
           quizStack.arrangedSubviews.forEach { $0.removeFromSuperview() } // Clear previous rows
           
           options.forEach { option in
               let optionRow = ReusableOptionRow() // Create a new instance for each option
               optionRow.configure(option: option)
               
               if let correctOption = option.isCorrect, correctOption  {
                   //storer the correct row
                   correctOptionRow = optionRow
               }
               
               // Handle tap gesture and selection
               optionRow.onOptionSelected = { [weak self] selectedRow in
                   self?.handleOptionSelection(selectedRow: selectedRow)
                   
                   // store that current selected row and option Information of that row
                   self?.selectedOption = option
                   self?.selectedOptionRow = selectedRow
               }
             
               quizStack.addArrangedSubview(optionRow)
               
               //call answer handler
               if submitButton.isSelected {
                   checkAnswer(selectedRow: optionRow, option: option)
               }
               
           }
       }
    
    
    
  
    
    // Handle option selection
    private func handleOptionSelection(selectedRow: ReusableOptionRow) {
        // Deselect the previously selected row if it exists
        selectedOptionRow?.isSelected = false

        // Update the newly selected row
        selectedRow.isSelected = true
//        selectedOptionRow = selectedRow // Set the current selected row
//          
     
       
    }
    
    @objc func submitPressed() {
        guard let selectedRow = selectedOptionRow, let selectedOption = selectedOption else {
                print("No option selected.")
                return
            }
            checkAnswer(selectedRow: selectedRow, option: selectedOption)
        // Switch the buttons
            submitButton.isHidden = true
            nextButton.isHidden = false
        
    }
    
    @objc func nextPressed() {

        quizQuestionIndex += 1
        updateProgress()
        
        guard let quizzez = quizzez, quizQuestionIndex < quizzez.count else {
                print("No more questions.")
                return
            }
        print(quizQuestionIndex)


        let nextQuiz = quizzez[quizQuestionIndex]
//        configure(quiz: nextQuiz)
        configure(quizzez: quizzez)
        // Switch back the buttons
        nextButton.isHidden = true
        submitButton.isHidden = false
    }
    
    /*
     if quizQuestionIndex < totalQuestions - 1 {
                 quizQuestionIndex += 1
                 updateProgress()
             } else {
                 print("Quiz completed!")
             }
     */
    private func checkAnswer(selectedRow: ReusableOptionRow,option : OptionModel) {
        guard let correctAnswer = correctAnswer else { return }
        print("You choose \(option.content) and correctAnswer is \(correctAnswer.content)")
        if correctAnswer._id == option._id {
            selectedRow.isCorrect = true
       
        } else { // correctAnswer.content != option.content
            selectedRow.isCorrect = false
            correctOptionRow?.isCorrect = true
        }
        
        quizStack.arrangedSubviews.forEach { view in
               if let optionRow = view as? ReusableOptionRow {
                   optionRow.isUserInteractionEnabled = false // Disable user interaction after submission
               }
           }
    }
    
    private func updateProgress() {
        let progress = Float(quizQuestionIndex) / Float(quizzez?.count ?? 0)
          progressBar.setProgress(progress, animated: true)
      }
 
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        backgroundColor = .white
        addSubview(question)
        addSubview(quizStack)
        addSubview(submitButton)
        addSubview(nextButton)
        addSubview(progressBar)
        nextButton.isHidden = true
    }
    
    //MARK: - Constraints Set Up
    fileprivate func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            
            progressBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                       
            
            
            question.topAnchor.constraint(equalTo: progressBar.topAnchor, constant: 24),
            question.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            question.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            quizStack.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 24),
            quizStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            quizStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
//            quizStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24), // Added bottom constraint
            
            submitButton.topAnchor.constraint(equalTo: quizStack.bottomAnchor, constant: 24),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nextButton.topAnchor.constraint(equalTo: quizStack.bottomAnchor, constant: 24),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

