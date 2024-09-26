//
//  ReusableSearchBar.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//


import UIKit

class ReusableSearchBar: UIView {
    
    // MARK: - UI Components
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search the conversation..."
        textField.borderStyle = .none
        textField.returnKeyType = .search
        textField.clearButtonMode = .never
        return textField
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
        setupActions()
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        addSubview(searchIcon)
        addSubview(textField)
        addSubview(clearButton)
    }
    
    private func setupConstraints() {
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Search Icon Constraints
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            // Clear Button Constraints
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            clearButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 20),
            clearButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Text Field Constraints
            textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func setupActions() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action Methods
    
    @objc private func textFieldDidChange() {
        clearButton.isHidden = textField.text?.isEmpty ?? true
    }
    
    @objc private func clearButtonTapped() {
        textField.text = ""
        clearButton.isHidden = true
        textField.resignFirstResponder()
    }
    
    // Public Method to Get Text
    func getSearchText() -> String? {
        return textField.text
    }
}

