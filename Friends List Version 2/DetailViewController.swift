//
//  DetailViewController.swift
//  Friends List Version 2
//
//  Created by Soon Yin Jie on 6/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    var friend: Friend!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameSchoolAgeLabel: UILabel!
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var defenceSlider: UISlider!
    @IBOutlet weak var staminaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = friend.name
        profileImageView.image = UIImage(named: friend.imageFileName)
        nameSchoolAgeLabel.text = "\(friend.name), \(friend.school), \(friend.age)"
        attackSlider.value = friend.attack
        defenceSlider.value = friend.defence
        staminaSlider.value = friend.stamina
    }

    // This solution is from Stack Overflow
    // https://stackoverflow.com/questions/32864287/sfsafariviewcontroller-crash-the-specified-url-has-an-unsupported-scheme
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            // not a valid URL
            return
        }
        
        if ["http", "https"].contains(url.scheme?.lowercased() ?? "") {
            // Can open with SFSafariViewController
            let safariViewController = SFSafariViewController(url: url)
            self.present(safariViewController, animated: true, completion: nil)
        } else {
            // Scheme is not supported or no scheme is given, use openURL
            let alert = UIAlertController(title: "Invalid URL", message: "What you doing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sorry", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }

    @IBAction func websiteButtonPressed(_ sender: Any) {
        openURL(friend.website)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        switch sender {
        case attackSlider:
            friend.attack = sender.value
        case defenceSlider:
            friend.defence = sender.value
        case staminaSlider:
            friend.stamina = sender.value
        default:
            print("WTF")
        }
        
//        if sender == attackSlider {
//            print("Attack value is now \(sender.value)")
//        } else if sender == defenceSlider {
//            print("Defence value is now \(sender.value)")
//        } else if sender == staminaSlider {
//            print("Stamina value is now \(sender.value)")
//        } else {
//            print("WTF how did this happen") // should not happen lah
//        }
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editFriend",
           let navController = segue.destination as? UINavigationController,
           let destVC = navController.viewControllers.first as? EditFriendTableViewController
        {
            destVC.friend = friend
        }
    }
    
    
}

