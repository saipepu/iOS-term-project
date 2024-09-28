//
//  DetailView.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import UIKit
import WebKit


class DetailView: UIView {

    //MARK: - Variables
    private var course : CourseModel2?
    public var scriptView : ReusableScriptView? = nil
    var webView: WKWebView!

  
  
    
    //MARK: UI components
    public let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    public let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var courseTitle: UILabel = {
        let label = UILabel()
//        label.text = "Course Name"
        label.applyHeadingFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var courseLevel: UILabel = {
        let label = UILabel()
//        label.text = "Some Level"
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Video player container
       private let courseImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(systemName: "questionmark")
           imageView.contentMode = .scaleAspectFit
           imageView.layer.shadowRadius = 3
           imageView.layer.shadowOpacity = 0.75
           imageView.layer.shadowColor = UIColor.gray.cgColor
           imageView.layer.cornerRadius = 6
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.backgroundColor = .gray
           return imageView
       }()

  
    
 
      // Play Button (using SF Symbols)
      private let playButton: UIButton = {
          let button = UIButton()
          let playImage = UIImage(systemName: "play.fill")
          button.setImage(playImage, for: .normal)
          button.translatesAutoresizingMaskIntoConstraints = false
          button.tintColor = .systemBlue
          button.frame.size = CGSize(width: 25, height: 25)
          return button
      }()
    

      // Progress Bar
//      private let audioProgressBar: UIProgressView = {
//          let progressView = UIProgressView(progressViewStyle: .default)
//          progressView.translatesAutoresizingMaskIntoConstraints = false
//          progressView.tintColor = .systemBlue
//          progressView.layer.cornerRadius = 15
//          progressView.tintColor = .systemBlue
//          progressView.trackTintColor = .red
//          return progressView
//      }()
    
//    private let audioProgressBar: UISlider = {
//           let slider = UISlider()
//           slider.translatesAutoresizingMaskIntoConstraints = false
//           slider.minimumValue = 0
//           slider.maximumValue = 1
//           slider.tintColor = .systemBlue
//           slider.value = 0
//           return slider
//       }()
    
    

   
    
    
    private let descriptionHeading: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    public let courseDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 100
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let scriptHeading : UILabel = {
       let label = UILabel()
        label.text = "Conversation"
        label.applyHeadingFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    public let allScriptStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        //padding
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return stack
    }()

    
    /*
     let course = coursesVM.courseData?[indexPath.row]
     let detailVC = DetailViewController()
     if let course = course {
         detailVC.configure(course: course)
         navigationController?.pushViewController(detailVC, animated: true)
     }
     */
    
   
    
    //MARK: -Inject Data
    public func passData(course : CourseModel2) {
        self.course = course
        self.courseTitle.text = course.title
        self.courseLevel.text = course.difficulty
        self.courseImageView.image = UIImage(named: "")
        self.courseDescription.text = course.description
        populateScripts()

    }
    
    
    //MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
//        scriptView = ReusableScriptView()
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(courseTitle)
        contentView.addSubview(courseLevel)
//        contentView.addSubview(courseImageView)
//        contentView.addSubview(playButton)
//        contentView.addSubview(audioProgressBar)
        contentView.addSubview(descriptionHeading)
        contentView.addSubview(courseDescription)
        contentView.addSubview(scriptHeading)
        contentView.addSubview(allScriptStack)
       
        webView = WKWebView()
        webView.backgroundColor = .blue
        webView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(webView)
        

    
        loadYouTubeVideo(youtubeLink: "https://www.youtube.com/watch?v=rFy-qQaDCY8")
        
      
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    func loadYouTubeVideo(youtubeLink: String) {
           // Create the YouTube embed URL
       
        
           if let url = URL(string: youtubeLink) {
               let request = URLRequest(url: url)
               webView.load(request)
           }
       }
    
    //MARK: - UI Set Up
   
    
    func extractVideoID(from url: String) -> String? {
        let pattern = "(?<=v=|/)([a-zA-Z0-9_-]{11})"
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        
        if let match = regex?.firstMatch(in: url, options: [], range: NSRange(location: 0, length: url.count)) {
            if let range = Range(match.range(at: 1), in: url) {
                return String(url[range])
            }
        }
        return nil
    }

//    private func addProgressObserver() {
//        playerObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main, using: { [weak self] time in
//            guard let self = self, let duration = self.playerItem?.duration else { return }
//
//            let currentTime = CMTimeGetSeconds(time)
//            let totalTime = CMTimeGetSeconds(duration)
//
//            // Update the slider's value based on the audio's current time
//            if totalTime > 0 {
//                // Make sure to use slider's value property
//                self.audioProgressBar.value = Float(currentTime / totalTime)
//            }
//        })
//    }


    
    
//    @objc private func sliderValueChanged(_ sender: UISlider) {
//          guard let player = player, let playerItem = playerItem else { return }
//
//          // Get the duration of the audio
//          let duration = CMTimeGetSeconds(playerItem.duration)
//          let newTime = duration * Double(sender.value)
//
//          // Seek to the corresponding time
//          let seekTime = CMTime(seconds: newTime, preferredTimescale: 1)
//          player.seek(to: seekTime)
//      }
//    
    
    
    fileprivate func populateScripts() {
        guard let courseScripts = course?.script else { return }

        courseScripts.forEach { script in
            let scriptView = ReusableScriptView()
            scriptView.translatesAutoresizingMaskIntoConstraints = false
            scriptView.passData(script: script)
//   

            // Add scriptView to allScriptStack
            allScriptStack.addArrangedSubview(scriptView)
//            allScriptStack.backgroundColor = .red
            // Set alignment based on the speaker
//            allScriptStack.alignment = .center
        }
    }

    
    
    
    //MARK: - Set Constaints
    fileprivate func setUpConstraints() {
//        guard let scriptView = scriptView else { return }

        NSLayoutConstraint.activate([
         
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            courseTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            courseTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseLevel.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 24),
            courseLevel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            
            webView.topAnchor.constraint(equalTo: courseLevel.bottomAnchor, constant: 24),
            webView.centerXAnchor.constraint(equalTo: centerXAnchor),
            webView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 24),
            webView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            webView.heightAnchor.constraint(equalToConstant: 220),
        

            descriptionHeading.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 24),
            descriptionHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseDescription.topAnchor.constraint(equalTo: descriptionHeading.bottomAnchor, constant: 12),
            courseDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24),
            
            scriptHeading.topAnchor.constraint(equalTo: courseDescription.bottomAnchor,constant: 24),
            scriptHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
      
            allScriptStack.topAnchor.constraint(equalTo: scriptHeading.bottomAnchor, constant: 24),
                
            allScriptStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            allScriptStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
//            allScriptStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
//            allScriptStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            allScriptStack.widthAnchor.constraint(equalTo: contentView.widthAnchor)
//            scriptView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -24)
            
            
//            
//            scriptView.topAnchor.constraint(equalTo: scriptHeading.bottomAnchor,constant: 24),
//            scriptView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            scriptView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:  24),
     
        ])
        
    }
}
