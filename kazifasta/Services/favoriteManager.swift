//
//  favoriteManager.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 11/10/2023.
//

import Foundation

class FavoriteManager: ObservableObject {
    @Published private(set) var favorites: [Profile] = []
    
    func addToFavorites(profile: Profile){
        let favoriteUser = favorites.first(where: { $0.id == profile.id })
        if favoriteUser != nil {
                    // If a product with the same ID already exists, update its quantity
            favorites = favorites.filter{$0.id != profile.id }
                } else{
                    // Otherwise, add the product to the cart
                    favorites.append(profile)
                }
    }
}
