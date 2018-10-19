    //
//  FeedViewController.swift
//  Passtimes
//
//  Created by Giorgio Doganiero on 10/19/18.
//  Copyright © 2018 passtimes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let cellIdentifier: String = "cellIdentifier"
    @IBOutlet var onGoingCollectionView: UICollectionView!

    var db: DatabaseUtils!
    var events: [Event] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        self.onGoingCollectionView.register(UINib(nibName: "OnGoingCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        // Do any additional setup after loading the view.

        db = DatabaseUtils.sharedInstance
        db.reference().child("events").observe(.value, with: {(snapshot) in
            self.events.removeAll()

            for event in snapshot.children.allObjects as! [DataSnapshot] {
                if let dictionary = event.value as? [String: Any] {
                    print(dictionary)
                    //let e = Event()

                    //e.setValuesForKeys(dictionary)
                    //print(e)
                    //self.events.append(retrievedEvent)
                }
            }

            self.onGoingCollectionView.reloadData()
        })
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OnGoingCollectionViewCell

        cell.configure(events[indexPath.row])

        return cell
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
