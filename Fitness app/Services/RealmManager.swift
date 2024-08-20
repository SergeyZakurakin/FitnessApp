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
    
    //update Status
    func updateStatusWorkoutModel(model: WorkOutModel) {
        try! realm.write {
            model.workOutStatus = true
            
        }
    }
}
