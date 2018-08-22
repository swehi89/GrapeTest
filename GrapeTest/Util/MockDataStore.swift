//
//  MockDataStore.swift
//  GrapeTest
//
//  Created by Alexander Posvanc on 21.08.18.
//  Copyright © 2018 grape. All rights reserved.
//

import Foundation
class MockDataStore{
    
    static let images = ["grape1.jpg","grape2.jpg","grape3.jpg","grape4.jpg","grape5.jpg","grape6.jpg"]
    static let names = ["Happy Grape", "Grape User", "Grape Girl", "Best Grape", "Some Grape", "Handsome Grape"]
    
    /* Mocking list of users with random properties for name and images, id should be unique */
    static func createUserList(count: Int) -> [GrapeUser]{
        var userList = [GrapeUser]()
        
        for i in 0 ... count {
            let user = GrapeUser(id: i, name: names[Int(arc4random_uniform(UInt32(names.count)))], image: images[Int(arc4random_uniform(UInt32(images.count)))])
            userList.append(user)
        }
    
        return userList
    }
}
