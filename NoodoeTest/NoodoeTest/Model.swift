//
//  Model.swift
//  NoodoeTest
//
//  Created by edisonlin on 2022/3/28.
//

import Foundation

// MARK: - Model
struct Model: Codable {
    let objectID, username: String?
    let code: CodeDataModel?
    let isVerifiedReportEmail: Bool?
    let reportEmail, createdAt, updatedAt: String?
    let timezone, parameter, number: Int?
    let phone, timeZone, timone: String?
    let acl: [String : [String : Bool]]?
    let sessionToken: String?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case objectID = "objectId"
        case username, code, isVerifiedReportEmail, reportEmail, createdAt, updatedAt, timezone, parameter, number, phone, timeZone, timone, error
        case acl = "ACL"
        case sessionToken
    }
}

enum CodeDataModel: Codable {
    case string(String)
    case int(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .int(x)
            return
        }
        throw DecodingError.typeMismatch(CodeDataModel.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CodeDataModel"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        }
    }
}


