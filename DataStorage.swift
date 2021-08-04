//
//  ViewController.swift
//  TestProj
//
//  Created by LEONG YI MEI on 03/08/2021.
//

import UIKit

struct Character: Codable {
    var name: String = ""
    var level: Int = 0
}

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    var cloud = Character()

    var username: String = ""

    //Characterpath
    let characterFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("character.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadCharacter()

        username = UserDefaults.standard.object(forKey: "username") as? String ?? "-"
        usernameLabel.text = "Welcome, " + username
    }

    @IBAction func spawnButtonTapped(_ sender: Any) {
        cloud.name = "Cloud"
        cloud.level = 5

        nameLabel.text = cloud.name
        levelLabel.text = String(cloud.level)

        let xmlData = try? PropertyListEncoder().encode(cloud)

        if xmlData != nil {
            if FileManager.default.fileExists(atPath: characterFilePath.path) {
                //File exists
                try? xmlData!.write(to: characterFilePath)
            }
            else {
                FileManager.default.createFile(atPath: characterFilePath.path, contents: xmlData, attributes: nil)
            }
        }
    }

    func loadCharacter() {
        let xmlData = try? Data(contentsOf: characterFilePath)

        if xmlData != nil {
            let loadedCharacter = try? PropertyListDecoder().decode(Character.self, from: xmlData!)

            if loadedCharacter != nil {
                cloud = loadedCharacter!

                nameLabel.text = cloud.name
                levelLabel.text = String(cloud.level)
            }
        }
    }
    @IBAction func levelUpButtonTapped(_ sender: Any) {
        cloud.level += 1

        levelLabel.text = String(cloud.level)

        let xmlData = try? PropertyListEncoder().encode(cloud)

        if xmlData != nil {
            if FileManager.default.fileExists(atPath: characterFilePath.path) {
                try? xmlData!.write(to: characterFilePath)
            }
            else {
                FileManager.default.createFile(atPath: characterFilePath.path, contents: xmlData, attributes: nil)
            }
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        username = "John Appleseed"

        usernameLabel.text = "Welcome, " + username

        UserDefaults.standard.setValue(username, forKey: "username")
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        username = ""

        usernameLabel.text = "Welcome, " + username

        UserDefaults.standard.removeObject(forKey: "username")
    }
}
