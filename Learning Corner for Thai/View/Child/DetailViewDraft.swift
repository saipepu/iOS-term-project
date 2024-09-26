//
//  DetailView.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import UIKit
import AVFoundation

class DetailView: UIView {

    //MARK: - Variables
    private var course : CourseModel2?
  
    // video player varaibles
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    var playerObserver: Any?
    
    
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
    
    private let audioProgressBar: UISlider = {
           let slider = UISlider()
           slider.translatesAutoresizingMaskIntoConstraints = false
           slider.minimumValue = 0
           slider.maximumValue = 1
           slider.tintColor = .systemBlue
           slider.value = 0
           return slider
       }()
    
    
   
    
    
    private let descriptionHeading: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    public let courseDescription: UILabel = {
        let label = UILabel()
//        label.text = "This lesson includes day to day greeting phrases in Thai which can be used by both male and female. The glossary is provided below. After learning the phrase, you can proceed to the quiz section to test out your knowledge.\nThis lesson includes day to day greeting phrases in Thai which can be used by both male and female. The glossary is provided below. After learning the phrase, you can proceed to the quiz section to test out your knowledge.\nThis lesson includes day to day greeting phrases in Thai which can be used by both male and female. The glossary is provided below. After learning the phrase, you can proceed to the quiz section to test out your knowledge.\nThis lesson includes day to day greeting phrases in Thai which can be used by both male and female. The glossary is provided below. After learning the phrase, you can proceed to the quiz section to test out your knowledge.\nThis lesson includes day to day greeting phrases in Thai which can be used by both male and female. The glossary is provided below. After learning the phrase, you can proceed to the quiz section to test out your knowledge. "
        label.textAlignment = .justified
        label.numberOfLines = 100
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }
    
    
    //MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(courseTitle)
        contentView.addSubview(courseLevel)
        contentView.addSubview(courseImageView)
        contentView.addSubview(playButton)
        contentView.addSubview(audioProgressBar)
        contentView.addSubview(descriptionHeading)
        contentView.addSubview(courseDescription)
     

        // Position the button (for example, center it)
      
        setupAudioPlayer(audioURL: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")

              // Add action for the play button
        playButton.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        audioProgressBar.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)

    
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
    //MARK: - UI Set Up
   
    
    private func setupAudioPlayer(audioURL : String) {
            // Create an AVPlayerItem and AVPlayer
            guard let audioURL = URL(string: audioURL) else { return }
            playerItem = AVPlayerItem(url: audioURL)
            player = AVPlayer(playerItem: playerItem)

            // Observe the audio duration and progress
            addProgressObserver()
        }

    private func addProgressObserver() {
        playerObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main, using: { [weak self] time in
            guard let self = self, let duration = self.playerItem?.duration else { return }

            let currentTime = CMTimeGetSeconds(time)
            let totalTime = CMTimeGetSeconds(duration)

            // Update the slider's value based on the audio's current time
            if totalTime > 0 {
                // Make sure to use slider's value property
                self.audioProgressBar.value = Float(currentTime / totalTime)
            }
        })
    }


        @objc private func togglePlayPause() {
            if player?.timeControlStatus == .paused {
                player?.play()
                playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal) // Change to pause icon
            } else {
                player?.pause()
                playButton.setImage(UIImage(systemName: "play.fill"), for: .normal) // Change back to play icon
            }
        }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
          guard let player = player, let playerItem = playerItem else { return }

          // Get the duration of the audio
          let duration = CMTimeGetSeconds(playerItem.duration)
          let newTime = duration * Double(sender.value)

          // Seek to the corresponding time
          let seekTime = CMTime(seconds: newTime, preferredTimescale: 1)
          player.seek(to: seekTime)
      }
    
    
    
    
    //MARK: - Set Constaints
    fileprivate func setUpConstraints() {
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
            contentView.trailingAnchor.constraint(equalTo:
                scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            courseTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            courseTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseLevel.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 24),
            courseLevel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            
            courseImageView.topAnchor.constraint(equalTo: courseLevel.bottomAnchor, constant: 24),
            courseImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            courseImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 24),
            courseImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            courseImageView.heightAnchor.constraint(equalToConstant: 220),
        
            
            playButton.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 24),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            audioProgressBar.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 26),
            audioProgressBar.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),
            audioProgressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            audioProgressBar.heightAnchor.constraint(equalToConstant: 18),
            
            
            
            descriptionHeading.topAnchor.constraint(equalTo: audioProgressBar.bottomAnchor, constant: 24),
            descriptionHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseDescription.topAnchor.constraint(equalTo: descriptionHeading.bottomAnchor, constant: 12),
            courseDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 24),
            
            courseDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -24),
            
            
            courseDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            
            
           
        ])
        
    }
}
