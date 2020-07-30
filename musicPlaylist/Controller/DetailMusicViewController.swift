//
//  DetailMusicViewController.swift
//  musicPlaylist
//
//  Created by danny santoso on 09/05/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit
import AVFoundation

class DetailMusicViewController: UIViewController{
    
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var btnPlayPause: UIButton!
    
    var position: Int = 0
    var music: [Music] = []
    var playerSong: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicImage.image = music[position].imageName
        musicArtist.text = music[position].artistName
        musicName.text = music[position].name
        
        playSong()
    }
    
    func playSong() -> Void{
        
        //        btnPlayPause.setImage(UIImage(named: "pausebtn.png"), for: .normal)
        btnPlayPause.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        
        guard let urlSong = Bundle.main.url(forResource: music[position].songName, withExtension: "mp3") else { return }
        
        do {
            //            try AVAudioSession.sharedInstance().setMode(.default)
            //            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            //            guard let urlSong = urlSong else {
            //                return
            //            }
            
            playerSong = try AVAudioPlayer(contentsOf: urlSong, fileTypeHint: AVFileType.mp3.rawValue)
            //            playerSong = try AVAudioPlayer(contentsOf: URL(string: urlSong)!)
            
            guard let playerSong = playerSong else {
                return
            }
            
            playerSong.play()
        }
        catch {
            print("error occurred")
        }
    }
    
    @IBAction func btnPlayPause(_ sender: Any) {
        if playerSong?.isPlaying == true {
            // pause
            playerSong?.pause()
            btnPlayPause.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            // play
            playerSong?.play()
            btnPlayPause.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        if let playerSong = playerSong {
    //            playerSong.stop()
    //            btnPlayPause.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
    //        }
    //    }
}
