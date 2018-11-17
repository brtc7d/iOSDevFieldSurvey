//
//  SportsEventsViewController.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import UIKit

class ObservationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var observationsTableView: UITableView!
  
    let jsonFileName = "field_observations"
    var observations: Observations?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        observations = ObservationsLoader.load(jsonFileName: jsonFileName)
        
        if observations == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = observationsTableView.dequeueReusableCell(withIdentifier: "sportsEventCell", for: indexPath)
        
        if let cell = cell as? ObservationTableViewCell,
            let observation = observations?.observations[indexPath.row] {
            cell.titleLabel.text = observation.title
            cell.dateLabel.text = dateFormatter.string(from: observation.date)
            cell.classImageView.image = UIImage(named: observation.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
            let selectedIndexPath = observationsTableView.indexPathForSelectedRow {
            destination.observation = observations?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
