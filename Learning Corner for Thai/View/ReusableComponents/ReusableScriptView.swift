//
//  ReusableScriptView.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 27/09/2024.
//

import Foundation
import UIKit
import AVFoundation

class ReusableScriptView : UIView,AVAudioPlayerDelegate {
    
    
    //MARK: -Variables
    private var script : ScriptModel? = nil
    var scriptStack : UIStackView!
    // video player varaibles
    var audioPlayer : AVAudioPlayer?
    var isPlaying = false


    //MARK: - UI Components
    
    private let speakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:"speaker_profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 30, height: 30)

        return imageView
    }()
    
    
    private var speakerLabel : UILabel = {
        let label = UILabel()
        label.text = "Speaker 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyLabelFont()
        return label
    }()
    
    
    
    private let playButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
        let playImage = UIImage(systemName: "play.circle",withConfiguration: largeConfig)
        button.setImage(playImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        button.frame.size = CGSize(width: 30, height: 30)
        button.addTarget(self, action: #selector(playLocalAudio), for: .touchUpInside)

        return button
    }()
    
    
    
    private var romanLabel : UILabel = {
        let label = UILabel()
        label.text = "Roman"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyLabelFont()
        return label
    }()

    
    private var thaiLabel : UILabel = {
        let label = UILabel()
        label.text = "Thai"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyLabelFont()
        return label
    }()

    
    private var englishLabel : UILabel = {
        let label = UILabel()
        label.text = "English"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyLabelFont()
        return label
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
      

              // Add action for the play button
//        playButton.addTarget(self, action: #selector(playLocalAudio), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //pass data
    public func passData(script : ScriptModel){
        self.script = script
        self.speakerLabel.text = script.speaker
        self.romanLabel.text = script.content.Roman
        self.englishLabel.text = script.content.English
        self.thaiLabel.text = script.content.Thai
        self.scriptStack.alignment = script.speaker == "speaker1" ? .leading : .trailing

    }
    
    
    fileprivate func setUpUI(){
       
        //Speaker Stack
        let speakerStackView = UIStackView(arrangedSubviews: script?.speaker == "speaker1" ? [speakerImageView,speakerLabel] : [speakerLabel,speakerImageView])
        speakerStackView.translatesAutoresizingMaskIntoConstraints = false
        speakerStackView.axis = .horizontal
        speakerStackView.distribution = .equalCentering
        speakerStackView.alignment = .center
        speakerStackView.backgroundColor = UIColor(named: Theme.lightTint)
        speakerStackView.isLayoutMarginsRelativeArrangement = true
        speakerStackView.layoutMargins = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        speakerStackView.layer.cornerRadius = 10
//        addSubview(speakerStackView)
        
        
        let speakerAudioStack = UIStackView(arrangedSubviews: script?.speaker == "speaker1"
                                            ? [speakerStackView,playButton] : [playButton,speakerStackView])
        speakerAudioStack.translatesAutoresizingMaskIntoConstraints = false
        speakerAudioStack.axis = .horizontal
        speakerAudioStack.distribution = .equalCentering
        speakerAudioStack.spacing = 10
        speakerAudioStack.alignment = .center
        
        
        // entire stack
        scriptStack = UIStackView(arrangedSubviews: [speakerAudioStack,romanLabel,thaiLabel,englishLabel])
        scriptStack.axis = .vertical
        scriptStack.distribution = .fill
        scriptStack.translatesAutoresizingMaskIntoConstraints = false
        scriptStack.spacing = 8 
//        scriptStack.backgroundColor = .blue
//        scriptStack.alignment  = .leading
        addSubview(scriptStack)

    }
    
//    
//    private func setupAudioPlayer(audioURL : String) {
//            // Create an AVPlayerItem and AVPlayer
//            guard let audioURL = URL(string: audioURL) else { return }
//            playerItem = AVPlayerItem(url: audioURL)
//            player = AVPlayer(playerItem: playerItem)
//        }
//    
    
 

       @objc func playLocalAudio() {
           if isPlaying {
               // Pause the audio if currently playing
               audioPlayer?.pause()
               togglePlayPauseButton(isPlaying: false)
               isPlaying = false
           } else {
               // Start playing the audio
               do {
                   if let audioFilePath = Bundle.main.path(forResource: script?.audioFile, ofType: "m4a") {
                       let audioFileUrl = URL(fileURLWithPath: audioFilePath)
                       audioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl)
                       audioPlayer?.delegate = self // Set delegate to detect when audio finishes
                       audioPlayer?.prepareToPlay()
                       audioPlayer?.play()
                       
                       togglePlayPauseButton(isPlaying: true)
                       isPlaying = true
                   }
               } catch {
                   print("Error initializing audio player: \(error.localizedDescription)")
               }
           }
       }

       // This method toggles the play/pause button image
       func togglePlayPauseButton(isPlaying: Bool) {
           let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
           let newImage = isPlaying ?
               UIImage(systemName: "pause.circle", withConfiguration: largeConfig) :
               UIImage(systemName: "play.circle", withConfiguration: largeConfig)
           playButton.setImage(newImage, for: .normal)
       }

       // This delegate method is called when the audio finishes playing
       func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
           // Reset to play icon when audio finishes
           togglePlayPauseButton(isPlaying: false)
           isPlaying = false
       }
    
 
    fileprivate func setUpConstraints() {
        NSLayoutConstraint.activate([
        
         
            
            speakerImageView.widthAnchor.constraint(equalToConstant: 30),
            speakerImageView.heightAnchor.constraint(equalToConstant: 30),
            
            scriptStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            scriptStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            scriptStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scriptStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            scriptStack.widthAnchor.constraint(equalTo: widthAnchor)
            
        ])
    }
    
}

/*
 optionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
 optionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
 
 selectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
 selectionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
 
 heightAnchor.constraint(equalToConstant: 60)
 */
