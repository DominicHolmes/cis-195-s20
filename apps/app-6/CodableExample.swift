//
//  ViewController.swift
//  codable-api-demo
//
//  Created by Dominic Holmes on 10/17/19.
//  Copyright © 2019 Dominic Holmes. All rights reserved.
//

import UIKit


// MARK: - Codable Structs
struct DiningResponse: Codable {
    let document: DiningDocument
    
    struct DiningDocument: Codable {
        let venue: [Venue]
    }
}

struct Venue: Codable {
    let name: String
    let dailyMenuURL: String
    let dateHours: [DateHours]
    
    // You can nest these structs, if you choose. The type for this is then Venue.DateHours
    struct DateHours: Codable {
        let date: String
        let meal: [Meal]
    }
}

struct Meal: Codable {
    let open: String
    let close: String
    let type: String
}


// MARK: - View Controller
class DiningVC: UITableViewController {
    
    var halls = [Venue]()
    let endpoint: String = "https://api.pennlabs.org/dining/venues"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeAPIRequest()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return halls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiningCell")!
        
        cell.textLabel?.text = halls[indexPath.row].name
        
        return cell
    }
    
    private func makeAPIRequest() {
        
        // URLSession code
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("Error: API request failed...")
                return
            }
            
            // Debug Codable problems by using a "try!"
            //let test = try! JSONDecoder().decode(DiningResponse.self, from: data)
            
            
            // Decode a DiningResponse object from the data
            if let diningResponse = try? JSONDecoder().decode(DiningResponse.self, from: data) {
                // Update the UI
                DispatchQueue.main.async {
                    self.halls = diningResponse.document.venue
                    self.tableView.reloadData()
                }
            }
            
        }
        
        // Actually run the URLSession
        task.resume()
    }
}

