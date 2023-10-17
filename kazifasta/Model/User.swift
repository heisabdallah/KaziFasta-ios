//
//  User.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 06/10/2023.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    let email: String
}


//struct User: Identifiable, Codable {
//    var id: String
//    let phone: String?
//    let username: String?
//    let email: String
//    var profile: Profile?
//}


//var Users: [User] = [
//    User(
//        id: "1",
//        phone: "+255686724390",
//        username: "codewithdallah",
//        email: "abdallah@gmail.com",
//        profile: Profiles[0]
//    ),
//    ]
//    User(
//        phone: "+255712345678",
//        username: "khalfanabdallah",
//        email: "khalfan@gmail.com",
//        profile: Profiles[1]
//    ),
//    User(
//        phone: "+255658124335",
//        username: "mukrimkhalfan",
//        email: "mukrim@gmail.com",
//        profile: Profiles[2]
//    ),
//    User(
//        phone: "+255123456789",
//        username: "user3",
//        email: "user3@example.com",
//        profile: Profiles[3]
//    ),
//    User(
//        phone: "+255987654321",
//        username: "user4",
//        email: "user4@example.com",
//        profile: Profiles[4]
//    ),
//    // Add the remaining 20 users with unique profiles here...
//    User(
//        phone: "+255555555555",
//        username: "user5",
//        email: "user5@example.com",
//        profile: Profiles[5]
//    ),
//    User(
//        phone: "+255666666666",
//        username: "user6",
//        email: "user6@example.com",
//        profile: Profiles[6]
//    ),
//    User(
//        phone: "+255777777777",
//        username: "user7",
//        email: "user7@example.com",
//        profile: Profiles[7]
//    ),
//    User(
//        phone: "+255888888888",
//        username: "user8",
//        email: "user8@example.com",
//        profile: Profiles[8]
//    ),
//    User(
//        phone: "+255999999999",
//        username: "user9",
//        email: "user9@example.com",
//        profile: Profiles[9]
//    ),
//    User(
//        phone: "+255101010101",
//        username: "user10",
//        email: "user10@example.com",
//        profile: Profiles[10]
//    ),
//    User(
//        phone: "+255111111111",
//        username: "user11",
//        email: "user11@example.com",
//        profile: Profiles[11]
//    ),
//    User(
//        phone: "+255121212121",
//        username: "user12",
//        email: "user12@example.com",
//        profile: Profiles[12]
//    ),
//    User(
//        phone: "+255131313131",
//        username: "user13",
//        email: "user13@example.com",
//        profile: Profiles[13]
//    ),
//    User(
//        phone: "+255141414141",
//        username: "user14",
//        email: "user14@example.com",
//        profile: Profiles[14]
//    ),
//    User(
//        phone: "+255151515151",
//        username: "user15",
//        email: "user15@example.com",
//        profile: Profiles[15]
//    ),
//    User(
//        phone: "+255161616161",
//        username: "user16",
//        email: "user16@example.com",
//        profile: Profiles[16]
//    ),
//    User(
//        phone: "+255171717171",
//        username: "user17",
//        email: "user17@example.com",
//        profile: Profiles[17]
//    ),
//    User(
//        phone: "+255181818181",
//        username: "user18",
//        email: "user18@example.com",
//        profile: Profiles[18]
//    ),
//    User(
//        phone: "+255191919191",
//        username: "user19",
//        email: "user19@example.com",
//        profile: Profiles[19]
//    ),
//    User(
//        phone: "+255202020202",
//        username: "user20",
//        email: "user20@example.com",
//        profile: Profiles[20]
//    ),
//]

// Users array now contains 25 users with unique profiles
