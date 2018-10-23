    //
//  FeedViewController.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let cellIdentifier: String = "cellIdentifier"

    @IBOutlet var onGoingCollectionView: UICollectionView!

    var db: DatabaseUtils!
    var events: [Event] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        //self.onGoingCollectionView.register(UINib(nibName: "OnGoingCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        // Do any additional setup after loading the view.
        db = DatabaseUtils.sharedInstance
        db.reference(to: "events").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print("Error")
                return
            }
            self.events.removeAll()

            guard let snapshot = snapshot else { return }

            for document in snapshot.documents {
                if let dictionary = document.data() as? [String: Any] {
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

                    self.events.append(retrievedEvent)
                }
            }
            self.onGoingCollectionView.reloadData()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OnGoingCollectionViewCell

        //cell.configure(events[indexPath.row])
        let currentEvent = events[indexPath.row]

        cell.configure(currentEvent)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailView", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath, let destination = segue.destination as? DetailViewController {
            destination.eventId = events[indexPath.row].id
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
