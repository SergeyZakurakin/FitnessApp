//
//  RealmManager.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private init() {}
    
    
    let realm = try! Realm()
    
    func saveWorkoutModel(_ model: WorkOutModel) {
        try! realm.write {
            realm.add(model)
        }
    }   
}


