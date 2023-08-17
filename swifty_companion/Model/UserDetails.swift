//
//  User.swift
//  swifty_companion
//
//  Created by Heidi Merianne on 5/12/23.
//  Copyright © 2023 Heidi Merianne. All rights reserved.
//

import UIKit

struct UserDetails: Codable {
    let id: Int
    let email: String
    let login: String
    let image: Image?
    let poolYear: String
    let displayName: String
    let wallet: Int
    let cursusUsers: [CursusUser]
    let projectsUsers: [ProjectsUser]
    let active: Bool
    
    enum CodingKeys: String, CodingKey {

        case id
        case email
        case login
        case image
        case poolYear = "pool_year"
        case displayName = "displayname"
        case wallet
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
        case active = "active?"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        email = try values.decode(String.self, forKey: .email)
//        login = try values.decode(String.self, forKey: .login)
//    }
    
}

struct Image: Codable {
    let link: String?
//    let versions : Versions?

//    enum CodingKeys: String, CodingKey {
//
//        case link = "link"
//        case versions = "versions"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        link = try values.decodeIfPresent(String.self, forKey: .link)
//        versions = try values.decodeIfPresent(Versions.self, forKey: .versions)
//    }

}

struct CursusUser: Codable {
    let grade: String?
    let level: Double
    let skills: [Skill]
    let cursus: Cursus
}

struct Cursus: Codable {
    let name: String
}

struct Skill: Codable {
    let id: Int
    let name: String
    let level: Double
}

struct ProjectsUser: Codable {
    let id: Int
    let finalMark: Int?
    let status: ProjectStatus
    let project: Project
//    let validated: String
    
    enum CodingKeys: String, CodingKey {

        case id
        case finalMark = "final_mark"
        case status
        case project
//        case validated = "validated?"
    }
}

struct Project: Codable {
    let id: Int
    let name: String
    let parentId: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case parentId = "parent_id"
    }
}

enum ProjectStatus: String, Codable {
    case searchingAGroup
    case finished
    case unknown
    
    init?(rawValue: String) {
        switch rawValue {
        case "searching_a_group":
            self = .searchingAGroup
        case "finished":
            self = .finished
        default:
            self = .unknown
        }
    }
}
