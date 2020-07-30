//
//  ProfileViewController.swift
//  musicPlaylist
//
//  Created by danny santoso on 09/05/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = #imageLiteral(resourceName: "danny")
        name.text = "Danny Santoso"
        email.text = "danny.sntoso@gmail.com"
    }
    

    @IBAction func btnEdit(_ sender: Any) {
        let alert = UIAlertController(title: "Edit Profile", message: "Masukan nama dan email dibawah ini", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Type name Here"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Type email Here"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let name = alert.textFields?[0].text else { return }
            guard let email = alert.textFields?[1].text else { return }
            self.name.text = name
            self.email.text = email
        }
        alert.addAction(cancel)
        alert.addAction(post)
        present(alert, animated: true, completion: nil)
    }
 
}
