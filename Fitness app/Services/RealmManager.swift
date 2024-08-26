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
    
    // load all data
    func getResultWorkoutModel() -> Results<WorkOutModel> {
        realm.objects(WorkOutModel.self)
    }
    
    // save
    func saveWorkoutModel(_ model: WorkOutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    //delete
    func deleteWorkoutModel(_ model: WorkOutModel) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    //update
    func updateSetsRepsWorkoutModel(model: WorkOutModel, sets: Int, reps: Int) {
        try! realm.write {
            model.workOutSets = sets
            model.workOutReps = reps
            
        }
    }
    
    func updateSetsTimerWorkoutModel(model: WorkOutModel, sets: Int, timer: Int) {
        try! realm.write {
            model.workOutSets = sets
            model.workOutTimer = timer
            
        }
    }
    
    //update Status
    func updateStatusWorkoutModel(model: WorkOutModel) {
        try! realm.write {
            model.workOutStatus = true
            
        }
    }
    
    // load all data
    func getResultUserModel() -> Results<UserModel> {
        realm.objects(UserModel.self)
    }
    
    // save
    func saveUserModel(_ model: UserModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    //update
    func updateUserModel(model: UserModel) {
        
        let users = realm.objects(UserModel.self)
        
        try! realm.write {
            users[0].userFirstName = model.userFirstName
            users[0].userSecondName = model.userSecondName
            users[0].userHeight = model.userHeight
            users[0].userWeight = model.userWeight
            users[0].userTarget = model.userTarget
            users[0].userImage = model.userImage

            
        }
    }
    
    
}



