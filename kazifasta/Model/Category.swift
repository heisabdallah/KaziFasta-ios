//
//  Category.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 08/10/2023.
//

import Foundation

struct Category: Identifiable{
    var id = UUID()
    var image: String?
    var name: String
}

var Categories = [
    Category(image: "photography", name: "Photography"),
    Category(image: "videography", name: "Videography"),
    Category(image: "dishrepair", name: "Dish Repair"),
    Category(image: "phonerepair", name: "Phone Repair"),
    Category(image: "makeupart", name: "Make Up"),
    Category(image: "graphicsdesign", name: "Graphics Design"),
    Category(image: "webdevelopment", name: "Web Development"),
    Category(image: "mobileappdev", name: "Mobile App Development"),
]

var popularCategories = [
    "Web Developer",
    "Photographer",
    "Videographer",
    "Graphics Designer",
]
