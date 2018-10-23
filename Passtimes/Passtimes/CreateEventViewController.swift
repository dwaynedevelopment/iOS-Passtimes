//
//  CreateEventViewController.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/22/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import FSCalendar

class CreateEventViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, FSCalendarDelegate, FSCalendarDataSource {

    let cellIdentifier: String = "cellIdentifier"

    @IBOutlet weak var pickASportCollection: UICollectionView!
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var weeklyCalendar: FSCalendar!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!

    var db: DatabaseUtils!

    var sports: [Sport] = []
    var sportSelected: Bool = false
    var previousIndexPath: IndexPath = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        db = DatabaseUtils.sharedInstance
        db.reference(to: "sports").getDocuments { (snapshot, error) in
            if error != nil {
                return
            }

            guard let snapshot = snapshot else { return }

            for document in snapshot.documents {
                let dictionary = document.data()

                guard let id = dictionary["id"] as? String,
                    let category = dictionary["category"] as? String,
                    let idleIcon = dictionary["idle"] as? String,
                    let activeIcon = dictionary["active"] as? String
                    else { return }

                let sport = Sport(id: id, name: category, idleIconUrl: idleIcon, activeIconUrl: activeIcon)
                self.sports.append(sport)
            }
            
            self.pickASportCollection.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        // Show weekly calendar
        weeklyCalendar.setScope(.week, animated: false)
        // Get current day of the week as UInt
        weeklyCalendar.firstWeekday = UInt(Calendar.current.component(.weekday, from: Date()))
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PickASportCollectionViewCell

        let sport = sports[indexPath.row]

        cell.configure(sport)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Logic to toggle sports selection
        if(!sportSelected) {
            sportSelected = true
        }

        if(!previousIndexPath.isEmpty) {
            if let previousCell = pickASportCollection.cellForItem(at: previousIndexPath) as? PickASportCollectionViewCell {
                previousCell.configure(sports[previousIndexPath.row])
            }
        }

        let cell = pickASportCollection.cellForItem(at: indexPath) as! PickASportCollectionViewCell
        cell.selected(sports[indexPath.row])

        previousIndexPath = indexPath
    }

    @IBAction func createEvent(_ sender: Any) {
        if let eventTitle = eventTitle.text, !eventTitle.isEmpty,
            let location = location.text, !location.isEmpty,
            let startTime = startTime.text, !startTime.isEmpty,
            let endTime = endTime.text, !endTime.isEmpty,
            sportSelected {
            // TODO: Save to database
            let player = AuthUtils.getCurrentSignedUser()

            let event = Event(id: UUID.init().uuidString, hostId: player.getId, hostThumbnail: player.getThumbnail, sport: sports[previousIndexPath.row].name, title: eventTitle, latitude: 1.1, longitude: 1.1, location: location, startDate: 1540738856448, endDate: 1540738856448, maxPlayers: 5, attendingUsers: [])

            let dict: [String: Any] = ["id" : event.id,
                                       "hostId" : event.hostId,
                                       "hostThumbnail" : event.hostThumbnail,
                                       "sport" : event.sport,
                                       "title" : event.title,
                                       "latitude" : event.latitude,
                                       "longitude" : event.longitude,
                                       "location" : event.location,
                                       "startDate" : event.startDate,
                                       "endDate" : event.endDate,
                                       "maxPlayers" : event.maxPlayers,
                                       "attendingUsers" : event.attendingUsers]

            db.reference(to: "events").document(event.id).setData(dict) { (error) in
                if error != nil {
                    return
                }

                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelEventCreation(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
