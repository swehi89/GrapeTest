//
//  ViewController.swift
//  GrapeTest
//
//  Created by Alexander Posvanc on 21.08.18.
//  Copyright © 2018 grape. All rights reserved.
//

import UIKit

class AddUsersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UITableViewDataSource, UITableViewDelegate, DeleteButtonDelegate {
    
    @IBOutlet private weak var allUserTableView: UITableView!
    @IBOutlet private weak var addedUserCollectionView: UICollectionView!
    @IBOutlet private weak var addAllButton: UIButton!
    @IBOutlet private weak var addedUserCountLabel: UILabel!
    
    
    private var grapeUserList = [GrapeUser]()
    /*
     Array of users that are already added,
     since views only change when this array is updated
     didSet seems like an appropriate place to update the views
    */
    private var addedGrapeUserList = [GrapeUser]() {
        didSet{
            updateViewsOnDataUpdate()
        }
    }
    
    /*
     Mocking user array and setting up delegates and datasources
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        grapeUserList = MockDataStore.createUserList(count: 16)
        setUpViews()
    }
    
    private func setUpViews(){
        allUserTableView.delegate = self
        allUserTableView.dataSource = self
        addedUserCollectionView.delegate = self
        addedUserCollectionView.dataSource = self
    }
    
    /*
     Updating views for user count, tableview, collectionview and text for button
     I know hardcoding strings is not the way to go, but it being a prototype i felt its okay
    */
    private func updateViewsOnDataUpdate(){
        addedUserCountLabel.text = "Added users: \(addedGrapeUserList.count)"
        allUserTableView.reloadData()
        addedUserCollectionView.reloadData()
        addAllButton.setTitle(grapeUserList.count == addedGrapeUserList.count ? "All users added" : "Add all users", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return grapeUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GrapeUserTableViewCell")! as! GrapeUserTableViewCell
        
        //Setting up cell for all users
        cell.setUpCellWithUser(user: grapeUserList[indexPath.row], selected: addedGrapeUserList.contains(grapeUserList[indexPath.row]))

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    /*
     Adding and removing users in the Array for the added users,
     Tried multiple ways how to do that, this seemed like the most straight forward and simple solution
     to check if the array contains that user, if so it needs to be removed if not than it needs to be added
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(addedGrapeUserList.contains(grapeUserList[indexPath.row])){
            addedGrapeUserList.remove(at: addedGrapeUserList.index(of: grapeUserList[indexPath.row])!)
        }else{
            addedGrapeUserList.append(grapeUserList[indexPath.row])
        }
    }
    
    // MARK: CollectionView delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addedGrapeUserList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GrapeUserCollectionViewCell", for: indexPath) as! GrapeUserCollectionViewCell
        
        //Setting up cell for added users
        cell.setUpCellWithUser(user: addedGrapeUserList[indexPath.row], indexPath: indexPath, delegate: self)
        
        return cell
    }
    
    // MARK: UI Actions
    
    /*
     Delegate function for calling back from collection view item click
     We usually use protocols like this to call back from cell
     I am sure there are other ways to do it like closure but i chose this solution
    */
    func deleteButtonPressed(at index: IndexPath) {
        addedGrapeUserList.remove(at: index.row)
    }
    
    @IBAction private func addAllButtonPressed(_ sender: Any) {
        if grapeUserList.count != addedGrapeUserList.count {
            addedGrapeUserList = grapeUserList
        }
    }
}

