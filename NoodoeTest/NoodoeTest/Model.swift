//
//  Model.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

// MARK: - Model
struct Model: Codable {
    let objectID, username, code: String
    let isVerifiedReportEmail: Bool
    let reportEmail, createdAt, updatedAt: String
    let timezone, parameter, number: Int
    let phone, timeZone, timone: String
    let acl: ACL
    let sessionToken: String

    enum CodingKeys: String, CodingKey {
        case objectID = "objectId"
        case username, code, isVerifiedReportEmail, reportEmail, createdAt, updatedAt, timezone, parameter, number, phone, timeZone, timone
        case acl = "ACL"
        case sessionToken
    }
}

// MARK: - ACL
struct ACL: Codable {
    let wkuKfCAdGq: WkuKfCAdGq

    enum CodingKeys: String, CodingKey {
        case wkuKfCAdGq = "WkuKfCAdGq"
    }
}

// MARK: - WkuKfCAdGq
struct WkuKfCAdGq: Codable {
    let read, write: Bool
}
