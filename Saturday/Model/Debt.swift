//
//  Debt.swift
//  Saturday
//
//  Created by Titus Lowe on 7/7/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Debt: Identifiable, Decodable {
 
    @DocumentID var id: String?
    var transactionId: String
    let date: String 
    let creditorId: String
    let total: Double
    
}
