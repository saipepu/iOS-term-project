import UIKit

class ReusableOptionRow: UIView {
    
    //MARK: - Variables
    private var option: OptionModel? = nil
    var isSelected: Bool = false {
           didSet {
               updateSelectionState()
           }
       }
    
    var isCorrect : Bool = false {
        didSet {
            updateSubmissionState()
        }
    }
    
    //MARK: - UI Components
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyLabelFont()
        label.applyPrimaryLabelColor()
        label.text = OptionMock.shared.optionA.content
        return label
    }()
    
    private let selectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: Constants.option)
        return imageView
    }()
    
    var onOptionSelected: ((ReusableOptionRow) -> Void)?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: Theme.optionRowBG)
        layer.cornerRadius = 15
        clipsToBounds = true
        setUpUI()
        setConstraints()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Gesture Handler
    // Handle tap gesture
       @objc private func handleTap() {
           onOptionSelected?(self) // Notify parent view (QuizView) of the selection
       }
    
    //MARK: - Update UI on Selection
    private func updateSelectionState() {
        backgroundColor = isSelected ? UIColor(named: Theme.lightTint) : UIColor(named: Theme.optionRowBG)
        optionLabel.textColor = isSelected ? UIColor(named: Theme.tint) : UIColor(named: Theme.secondaryLabel)
        selectionImageView.tintColor = isSelected ? UIColor(named: Theme.tint) : UIColor(named: Theme.secondaryLabel)
        selectionImageView.setSymbolImage(UIImage(systemName: isSelected ? Constants.selectedOption : Constants.option)!, contentTransition: .automatic)
    }
    
    
    //MARK: - Update UI on Submission
    private func updateSubmissionState() {
        backgroundColor = isCorrect ? UIColor(named: Theme.correctColor) : UIColor(named: Theme.redColor)
        optionLabel.textColor =  isCorrect ? UIColor.green : UIColor.red
        selectionImageView.tintColor = isCorrect ? UIColor.green : UIColor.red
        selectionImageView.setSymbolImage(UIImage(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")!, contentTransition: .automatic)
    }
    
    
    //MARK: - Data Receiver
    public func configure(option: OptionModel) {
        self.option = option
        optionLabel.text = option.content
        updateSelectionState()
    }
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        addSubview(optionLabel)
        addSubview(selectionImageView)
    }
    
    //MARK: - Constraints Set Up
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            optionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            optionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            selectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            selectionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

