//
//  ViewController.swift
//  BeastExam
//
//  Created by Devin Baggett on 5/18/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit
import CoreData

class ListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Note] = []
    var beastedData: [Beasted] = []
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemSegue" {
            let nav = segue.destination as! UINavigationController
            let dest = nav.topViewController as! ItemVC
            
            dest.delegate = self
            
            if let indexPath = sender as? IndexPath {
                let note = tableData[indexPath.row]
                dest.note = note
                dest.indexPath = indexPath
            }
            
        }
        
    }
    
    func fetchAllNotes() {
        let noteRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            tableData = try context.fetch(noteRequest)
        } catch {
            print("There was an error. \(error)")
        }
    }
    
   
    
}


extension ListVC: ItemVCDelegate {
    func donePressed(title: String, indexPath: IndexPath?) {
        let newNote: Note
        if let ip = indexPath {
            newNote = tableData[ip.row]
        } else {
            newNote = Note(context: context)
            tableData.append(newNote)
        }
        
        newNote.title = title
        saveContext()
        
        if let ip = indexPath {
            tableView.reloadRows(at: [ip], with: .automatic)
        } else {
            let indexPath = IndexPath(row: tableData.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        dismiss(animated: true, completion: nil)
    }
}


extension ListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastCell", for: indexPath) as! BeastCell
        cell.titleLabel.text = tableData[indexPath.row].title
//        cell.indexPath = indexPath
        
        return cell
    }
    
    
    // DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            //            print("delete")
            let note = tableData[indexPath.row]
            context.delete(note)
            tableData.remove(at: indexPath.row)
            saveContext()
            // more efficient than reloading tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemSegue", sender: indexPath)
    }
    
    
}
