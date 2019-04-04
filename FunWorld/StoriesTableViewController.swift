//
//  StoriesTableViewController.swift
//  FunWorld
//
//  Created by Prachi Thakkar on 03/04/19.
//  Copyright © 2019 Prachi Thakkar. All rights reserved.

import UIKit

struct Headline {
    var id : Int
    var title : String
    var text : String
    var image : String
}

class StoriesTableViewController: UITableViewController {
    var headlines = [
        Headline(id: 1, title: "Apple", text: "Show Apple", image: "Apple"),
        Headline(id: 1, title: "Apricot", text: "Show Apricot", image: "Apricot"),
        Headline(id: 1, title: "Blueberry", text: "Show Blueberry", image: "Blueberry"),
        Headline(id: 2, title: "Banana", text: "Show Banana", image: "Banana"),
        Headline(id: 3, title: "Cantaloupe", text: "Show Cantaloupe", image: "Cantaloupe"),
        ]
    
    var fruitsDictionary = [String: [Headline]]()
    var friutSectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for car in headlines {
            let fruitKey = String(car.title.prefix(1))
            if var carValues = fruitsDictionary[fruitKey] {
                carValues.append(car)
                fruitsDictionary[fruitKey] = carValues
            } else {
                fruitsDictionary[fruitKey] = [car]
            }
        }
        friutSectionTitles = [String](fruitsDictionary.keys)
        friutSectionTitles = friutSectionTitles.sorted(by: { $0 < $1 })
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friutSectionTitles.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fruitKey = friutSectionTitles[section]
        if let carValues = fruitsDictionary[fruitKey] {
            return carValues.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friutSectionTitles[section]
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let fruitKey = friutSectionTitles[indexPath.section]
        if let fruitValues = fruitsDictionary[fruitKey] {
            cell.textLabel?.text = fruitValues[indexPath.row].title
            cell.detailTextLabel?.text = fruitValues[indexPath.row].text
            cell.imageView?.image = UIImage(named: fruitValues[indexPath.row].image)
        }
        return cell
    }
    
}

