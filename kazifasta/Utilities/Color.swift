//
//  Color.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 11/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme{
    
    let accent = Color("AccentColor")
    let buttonColor = Color("ButtonColor")
    let primaryColor = Color("PrimaryColor")
    let secondaryColor = Color("SecondaryColor")
    let primaryText = Color("PrimaryTextColor")
    let secondaryText = Color("SecondaryTextColor")
    let tertiaryText = Color("TertiaryTextColor")

}
