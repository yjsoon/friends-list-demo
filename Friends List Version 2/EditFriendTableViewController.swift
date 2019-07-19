//
//  EditFriendTableViewController.swift
//  Friends List Version 2
//
//  Created by Soon Yin Jie on 8/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit

class EditFriendTableViewController: UITableViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var schoolField: UITextField!
    @IBOutlet weak var imageFileNameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var websiteField: UITextField!
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var defenceSlider: UISlider!
    @IBOutlet weak var staminaSlider: UISlider!
    
    var friend: Friend!
    var needNewFriend = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if friend != nil { // we are in edit mode
            nameField.text = friend.name
            schoolField.text = friend.school
            imageFileNameField.text = friend.imageFileName
            ageField.text = "\(friend.age)"
            websiteField.text = friend.website
            attackSlider.value = friend.attack
            defenceSlider.value = friend.defence
            staminaSlider.value = friend.stamina
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSave" {
            
            let name = nameField.text ?? ""  // nil coalescing — give a default value
            let imageFileName = imageFileNameField.text ?? "hugface" // give a default value of hugface
            let school = schoolField.text ?? ""
            let website = websiteField.text ?? ""
            let age = Int(ageField.text ?? "") ?? 0
            let attack = attackSlider.value
            let defence = defenceSlider.value
            let stamina = staminaSlider.value
            
            if friend == nil {  // if we are adding, we make a new friend
                friend = Friend(name: name, school: school, imageFileName: imageFileName, age: age, website: website, attack: attack, defence: defence, stamina: stamina)
                needNewFriend = true
            } else { // if we are updating, we just change our existing friend's data
                friend.name = name
                friend.imageFileName = imageFileName
                friend.school = school
                friend.website = website
                friend.age = age
                friend.attack = attack
                friend.stamina = stamina
                friend.defence = defence
                needNewFriend = false
            }
            
        }
    }
    
}
