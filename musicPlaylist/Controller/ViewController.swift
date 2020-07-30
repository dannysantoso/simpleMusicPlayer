//
//  ViewController.swift
//  musicPlaylist
//
//  Created by danny santoso on 08/05/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var musicPlayList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Music"
        
        musicPlayList.dataSource = self
        musicPlayList.delegate = self
            
        // Connect into Xib file
        musicPlayList.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicCell")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicCell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicTableViewCell
            
        musicCell.nameMusic.text = musics[indexPath.row].name
        musicCell.artistMusic.text = musics[indexPath.row].artistName
        musicCell.photoMusic.image = musics[indexPath.row].imageName
            
        musicCell.photoMusic.layer.cornerRadius = 10
        musicCell.photoMusic.clipsToBounds = true
        
        return musicCell
    }
    
    
}

extension ViewController: UITableViewDelegate{
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailMusic = DetailMusicViewController(nibName: "DetailMusicViewController", bundle: nil)
        
        detailMusic.music = musics
        detailMusic.position = indexPath.row
        
        
        self.navigationController?.pushViewController(detailMusic, animated: true)
    }
}

