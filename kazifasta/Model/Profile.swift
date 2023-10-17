//
//  Profile.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 06/10/2023.
//

import Foundation

struct Profile: Identifiable, Codable {
    var id: String
    var name: String
    var title: String?
//    var address: Address?
    var profilePic: String?
    var skills: [String]?
    var description: String?
}

//Address
struct Address: Codable {
    var street: String
    var city: String
    var country: String
}



//var Profiles = [
//    Profile(
//        name: "Abdallah Khalfan",  title: "Software Engineer", address: Address(street: "Ilala", city: "Dar es salaam", country: "Tanzania"), profilePic: "abdallah",
//        category: "Software Engineer",
//        skills: ["UI/UX Design", "Web Development", "Mobile App Development", "Videography"],
//        description: "I'm a software engineer with a passion for creating user-friendly web and mobile applications."
//    ),
//    ]
//    Profile(
//        name: "Alice Smith",
//        title: "Graphic Designer",
//        address: Address(street: "456 Elm St", city: "Anothercity", country: "USA"),
//        category: "Graphics Designer",
//        skills: ["Graphics Design", "Illustration", "Logo Design"],
//        description: "Experienced graphic designer specializing in creating visually stunning graphics and branding materials."
//    ),
//    Profile(
//        name: "Bob Johnson",
//        title: "Photographer",
//        address: Address(street: "789 Oak St", city: "Somewhere", country: "USA"),
//        category: "Photographer",
//        skills: ["Photography", "Photo Editing", "Portrait Photography"],
//        description: "Passionate photographer with a keen eye for capturing beautiful moments and stunning landscapes."
//    ),
//    Profile(
//        name: "Sarah Wilson",
//        title: "Graphics Designer",
//        address: Address(street: "321 Cedar St", city: "Everytown", country: "USA"),
//        category: "Graphics Designer",
//        skills: ["Phone Repair", "Dish Repair", "Python"],
//        description: "Experienced data scientist specializing in analyzing complex datasets and building machine learning models."
//    ),
//    Profile(
//        name: "Michael Brown",
//        title: "Marketing Specialist",
//        address: Address(street: "555 Pine St", city: "Nowhere", country: "USA"),
//        category: "Marketing Specialist",
//        skills: ["Digital Marketing", "SEO", "Content Strategy"],
//        description: "Marketing specialist with a track record of driving successful digital marketing campaigns and strategies."
//    ),
//    Profile(
//        name: "Emily Davis",
//        title: "UI/UX Designer",
//        address: Address(street: "777 Maple St", city: "Anyville", country: "USA"),
//        category: "UI/UX Designer",
//        skills: ["UI/UX Design", "Wireframing", "Prototyping"],
//        description: "Creative UI/UX designer passionate about creating intuitive and visually appealing user interfaces."
//    ),
//    Profile(
//        name: "Daniel White",
//        title: "Front-end Developer",
//        address: Address(street: "888 Oak St", city: "Somewheretown", country: "USA"),
//        
//        category: "Front-end Developer",
//        skills: ["HTML/CSS", "JavaScript", "React.js"],
//        description: "Front-end developer specializing in building responsive and interactive web applications."
//    ),
//    Profile(
//        name: "Olivia Lee",
//        title: "iOS Developer",
//        address: Address(street: "999 Birch St", city: "Anywhereville", country: "USA"),
//        
//        category: "iOS Developer",
//        skills: ["Mobile App Development", "Swift", "Core Data"],
//        description: "Experienced iOS developer passionate about creating high-quality and user-friendly mobile apps for iOS devices."
//    ),
//    Profile(
//        name: "William Adams",
//        title: "Dish Repair",
//        address: Address(street: "222 Cedar St", city: "Everywhere", country: "USA"),
//        
//        category: "Dish Repair",
//        skills: ["Dish Repa", "Java", "Kotlin"],
//        description: "Android developer with a strong background in developing feature-rich and efficient Android applications."
//    ),
//    Profile(
//        name: "Sophia Miller",
//        title: "Video Editor",
//        address: Address(street: "444 Elm St", city: "Nowheresville", country: "USA"),
//        
//        category: "Video Editor",
//        skills: ["Video Editing", "Videography", "After Effects"],
//        description: "Video editor with a knack for storytelling and creating visually engaging video content."
//    ),
//    Profile(
//        name: "Ethan Clark",
//        title: "Videographer",
//        address: Address(street: "666 Maple St", city: "Everytownville", country: "USA"),
//        
//        category: "Videographer",
//        skills: ["Videography", "Cinematography", "Drone Photography"],
//        description: "Talented videographer with a passion for capturing cinematic moments and breathtaking aerial shots."
//    ),
//    Profile(
//        name: "Ava Turner",
//        title: "Photographer",
//        address: Address(street: "111 Oak St", city: "Sometown", country: "USA"),
//        
//        category: "Photographer",
//        skills: ["Photography", "Photo Editing", "Portrait Photography"],
//        description: "Professional photographer dedicated to capturing beautiful moments and creating stunning portraits."
//    ),
//    Profile(
//        name: "Liam Hall",
//        title: "Graphic Designer",
//        address: Address(street: "333 Elm St", city: "Nowhereville", country: "USA"),
//        
//        category: "Graphic Designer",
//        skills: ["Graphics Design", "Illustration", "Logo Design"],
//        description: "Graphic designer with a creative flair for designing eye-catching graphics and logos."
//    ),
//    Profile(
//        name: "Mia Young",
//        title: "Web Developer",
//        address: Address(street: "555 Cedar St", city: "Somewheresville", country: "USA"),
//        
//        category: "Web Developer",
//        skills: ["Web Development", "Mobile App Development", "JavaScript"],
//        description: "Web developer passionate about building responsive and user-friendly websites."
//    ),
//    Profile(
//        name: "James Baker",
//        title: "Software Engineer",
//        address: Address(street: "777 Pine St", city: "Anyplace", country: "USA"),
//        
//        category: "Software Engineer",
//        skills: ["Software Development", "Mobile App Development", "Web Development"],
//        description: "Software engineer with expertise in developing robust and scalable software solutions."
//    ),
//    Profile(
//        name: "Aria Harris",
//        title: "Data Scientist",
//        address: Address(street: "999 Oak St", city: "Anytownville", country: "USA"),
//        
//        category: "Data Scientist",
//        skills: ["Data Analysis", "Machine Learning", "Statistics"],
//        description: "Data scientist with a passion for extracting insights from data and building predictive models."
//    ),
//    Profile(
//        name: "Matthew Green",
//        title: "Marketing Specialist",
//        address: Address(street: "222 Pine St", city: "Everyplace", country: "USA"),
//        
//        category: "Dish Repair",
//        skills: ["Dish Repair", "Phone Repair", "Social Media Marketing"],
//        description: "Marketing specialist focused on creating effective digital marketing strategies and campaigns."
//    ),
//    Profile(
//        name: "Sophie Turner",
//        title: "UI/UX Designer",
//        address: Address(street: "444 Oak St", city: "Sometownville", country: "USA"),
//        
//        category: "UI/UX Designer",
//        skills: ["UI/UX Design", "Web development", "Graphics Design"],
//        description: "UI/UX designer with a passion for creating intuitive and visually appealing user experiences."
//    ),
//    Profile(
//        name: "Jackson Adams",
//        title: "Phone Repair",
//        address: Address(street: "666 Cedar St", city: "Anyplaceville", country: "USA"),
//        
//        category: "Phone Repair",
//        skills: ["Dish repair", "Make up", "Phone repair"],
//        description: "Front-end developer specializing in building interactive and responsive web applications."
//    ),
//    Profile(
//        name: "Emma Wilson",
//        title: "iOS Developer",
//        address: Address(street: "888 Elm St", city: "Everywhereville", country: "USA"),
//        
//        category: "iOS Developer",
//        skills: ["Make up", "Photography", "Core Data"],
//        description: "iOS developer dedicated to creating seamless and user-friendly mobile apps for iOS devices."
//    ),
//    Profile(
//        name: "Noah Davis",
//        title: "Android Developer",
//        address: Address(street: "111 Pine St", city: "Somewheretownville", country: "USA"),
//        
//        category: "Make up",
//        skills: ["Make up", "Photographer", "Kotlin"],
//        description: "Android developer with a strong passion for building innovative and feature-rich Android applications."
//    ),
//]
//
//
