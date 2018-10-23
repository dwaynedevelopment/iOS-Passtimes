//
//  DetailViewController.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/22/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var hostImage: UIImageView!
    @IBOutlet var month: UILabel!
    @IBOutlet var day: UILabel!
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var location: UILabel!

    var eventId: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let eventId = eventId {
            // TODO: Download event from eventId and populate the view
            print(eventId)
            let db = DatabaseUtils.sharedInstance
            db.reference(to: "events").document(eventId).getDocument { (snapshot, error) in
                if error != nil {
                    return
                }

                if let dictionary = snapshot?.data() as? [String: Any] {
                    guard let id = dictionary["id"] as? String,
                        let hostId = dictionary["hostId"] as? String,
                        let hostThumbnail = dictionary["hostThumbnail"] as? String,
                        let sport = dictionary["sport"] as? String,
                        let title = dictionary["title"] as? String,
                        let latitude = dictionary["latitude"] as? Double,
                        let longitude = dictionary["longitude"] as? Double,
                        let location = dictionary["location"] as? String,
                        let startDate = dictionary["startDate"] as? Int,
                        let endDate = dictionary["endDate"] as? Int,
                        let maxPlayers = dictionary["maxPlayers"] as? Int
                        else { return }

                    let retrievedEvent = Event(id: id, hostId: hostId, hostThumbnail: hostThumbnail, sport: sport, title: title, latitude: latitude, longitude: longitude, location: location, startDate: startDate, endDate: endDate, maxPlayers: maxPlayers)

                    let url = URL(string: retrievedEvent.hostThumbnail)
                    self.hostImage.layer.masksToBounds = false
                    self.hostImage.layer.cornerRadius = self.hostImage.frame.size.width / 2
                    self.hostImage.clipsToBounds = true
                    self.hostImage.kf.setImage(with: url)

                    self.month.text = CalendarUtils.getMonthFromDate(retrievedEvent.startDate)
                    self.day.text = CalendarUtils.getDayFromDate(retrievedEvent.startDate)
                    self.eventTitle.text = retrievedEvent.title
                    self.time.text = CalendarUtils.getStartEndTimefromDate(startTime: retrievedEvent.startDate, endTime: retrievedEvent.endDate)
                    self.location.text = retrievedEvent.location
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
