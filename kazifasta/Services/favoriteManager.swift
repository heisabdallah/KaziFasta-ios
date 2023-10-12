//
//  favoriteManager.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 11/10/2023.
//

import Foundation

class FavoriteManager: ObservableObject {
    @Published private(set) var favorites: [User] = []
    
    func addToFavorites(user: User){
        let favoriteUser = favorites.first(where: { $0.id == user.id })
        if favoriteUser != nil {
                    // If a product with the same ID already exists, update its quantity
            favorites = favorites.filter{$0.id != user.id }
                } else{
                    // Otherwise, add the product to the cart
                    favorites.append(user)
                }
    }
}
