//
//  ContactsTableViewController.swift
//  FunWorld
//
//  Created by Prachi Thakkar on 03/04/19.
//  Copyright © 2019 Prachi Thakkar. All rights reserved.
//

import UIKit
// the class ContactsTableViewController is a subclass of UITableViewController.
class ContactsTableViewController: UITableViewController {
    
    let contacts:[[String]] = [
        ["Elon Musk",       "+1-201-3141-5926"],
        ["Bill Gates",      "+1-202-5358-9793"],
        ["Tim Cook",        "+1-203-2384-6264"],
        ["Richard Branson", "+1-204-3383-2795"],
        ["Jeff Bezos",      "+1-205-0288-4197"],
        ["Warren Buffet",   "+1-206-1693-9937"],
        ["The Zuck",        "+1-207-5105-8209"],
        ["Carlos Slim",     "+1-208-7494-4592"],
        ["Bill Gates",      "+1-209-3078-1640"],
        ["Larry Page",      "+1-210-6286-2089"],
        ["Harold Finch",    "+1-211-9862-8034"],
        ["Sergey Brin",     "+1-212-8253-4211"],
        ["Jack Ma",         "+1-213-7067-9821"],
        ["Steve Ballmer",   "+1-214-4808-6513"],
        ["Phil Knight",     "+1-215-2823-0664"],
        ["Paul Allen",      "+1-216-7093-8446"],
        ["Woz",             "+1-217-0955-0582"]
    ];
    
    // Understand
    // Did you notice how these two functions have a parameter called tableView? That’s part of the Object-Oriented Programming principle. You can technically use a table view data source and delegate to power multiple table views. You’d use the tableView to identify which table view you are working with.

   // Imagine you have a Contacts app that can show phone numbers by name, or phone numbers organized by company. You could implement that in multiple ways, for instance by reusing your table view controllers. Or what if you want to reuse the layout of your Contacts app to display similar information, like restaurants, venues or Skype usernames? That’s where code re-use with OOP comes in!
    
    // Implementing “numberOfSections(in:)”, you could group contacts together alphabetically.
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    // Implementing “tableView(_:numberOfRowsInSection:)”
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contacts.count
    }
     // Implementing tableView(_:cellForRowAt:).
        // We’re overriding the default implementation, and substitute our own. That’s because UITableViewController has already implemented the table view delegate and data source for us.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // the function has one parameter tableView that we can use to identify the table view that this function is called on.
        // Another parameter is indexPath, with argument label cellForRowAt. The index path identifies the cell’s row and section indices. More on that later.
        // The function return type is UITableViewCell. Hey, that’s interesting. This function is called by the table view controller, every time we need to provide a table view cell!
        
        // cellForRowAt - Every time a table view cell needs to be shown on screen!
        
        
        // First, we dequeue a cell with an identifier. It’s exactly the same identifier we used before, when registering the cell. That way the table view knows what type of cell we want. The dequeued cell is assigned to the cell constant. Now we have a table view cell to work with. More on dequeuing later.
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        
        if cell == nil
        {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
        }
        
        // Then, we print out some information to the Console. This is so we can see when this function is called, when the app runs.
        print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
        
        // Then, we assign the name of the contact to the text label of this table view cell. The contacts[indexPath.row][0] contains the value of the name of the contact, which we get to by using indexPath.row. Every instance of UITableViewCell has a property textLabel of UILabel, and every label of that type has a property text. You use it to set the text on the label.
        cell!.textLabel?.text = contacts[indexPath.row][0]
        cell!.detailTextLabel?.text = contacts[indexPath.row][1]
        
        return cell!
        
    }
    
    // The app we’re building has just one section, and that one section has a number of items equal to the number of items in the contacts array. So, that’s contacts.count!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //super.viewDidLoad() line. As you probably know, the viewDidLoad() function is part of the view controller life-cycle, and belongs to the UIViewController class.
        
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
