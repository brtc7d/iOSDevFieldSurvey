//
//  SportsEventDetailViewController.swift
//  Sports Events
//
//  Created by Dale Musser on 11/7/18.
//  Copyright © 2018 Tech Innovator. All rights reserved.
//

import UIKit

class ObservationDetailViewController: UIViewController {
    @IBOutlet weak var classImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    let dateFormatter = DateFormatter()
    
    var observation: Observation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        if let observation = observation {
            titleLabel.text = observation.title
            dateLabel.text = dateFormatter.string(from: observation.date)
            classImageView.image = UIImage(named: observation.classification.rawValue)
            descriptionTextView.text = observation.description
        }
    }
}
