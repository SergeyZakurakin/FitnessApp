//
//  UserModel.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/26/24.
//

import Foundation
import RealmSwift

class UserModel: Object {
    @Persisted var userFirstName: String = "Unknown"
    @Persisted var userSecondName: String = "Unknown"
    @Persisted var userHeight: Int = 0
    @Persisted var userWeight: Int = 0
    @Persisted var userTarget: Int = 0
    @Persisted var userImage: Data?
}
