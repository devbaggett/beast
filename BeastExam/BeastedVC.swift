//
//  BeastedVC.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit
import CoreData

class BeastedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Note] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 75
        
        fetchAllNotes()
        print(tableData)

    }
    
   override func viewDidAppear(_ animated: Bool) {
        fetchAllNotes()
        tableView.reloadData()
    }

    func fetchAllNotes() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        let myPredicate = NSPredicate(format: "beasted == true")
        request.predicate = myPredicate
        //        let noteRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            tableData = try context.fetch(request) as! [Note]
        } catch {
            print("There was an error. \(error)")
        }
    }
    
}


extension BeastedVC: UITableViewDataSource, UITableViewDelegate {
    
    // DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let note = tableData[indexPath.row]
            context.delete(note)
            tableData.remove(at: indexPath.row)
            saveContext()
            // more efficient than reloading tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastedCell", for: indexPath) as! BeastedCell
        
        cell.titleLabel.text = tableData[indexPath.row].title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        cell.detailLabel.text = dateFormatter.string(from: tableData[indexPath.row].date!)
       
        return cell
    }
    
}
