//
//  WorkOutModel.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/10/24.
//

import Foundation
import RealmSwift

class WorkOutModel: Object {
    @Persisted var workOutDate: Date
    @Persisted var workOutNumberOfDay: Int = 0
    @Persisted var workOutName: String = "Unknown"
    @Persisted var workOutRepeat: Bool = true
    @Persisted var workOutSets: Int = 0
    @Persisted var workOutReps: Int = 0
    @Persisted var workOutTimer: Int = 0 // in seconds
    @Persisted var workOutImage: Data?
    @Persisted var workOutStatus: Bool = false
}
