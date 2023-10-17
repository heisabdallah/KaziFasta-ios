//
//  SplashView.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 14/10/2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            
            ZStack {
                Image("splash").resizable().scaledToFill()
                Text("Hi, there! 👀").font(.title2).foregroundStyle(Color.theme.primaryText)
            }
        }.background(Color.theme.primaryColor)
    }
}

#Preview {
    SplashView()
}
