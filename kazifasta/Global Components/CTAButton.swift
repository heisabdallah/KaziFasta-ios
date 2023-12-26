//
//  CTAButton.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 12/10/2023.
//

import SwiftUI

struct CTAButton: View {
    var label: String
    var action: () -> Void
    var condition: Bool
    
    var body: some View {
        Button(action: action,
            label: {
            Text(label).foregroundStyle(.white)
                .frame(maxWidth: .infinity).padding().background(condition ? .gray : .black).clipShape(.rect(cornerRadius: 12)).padding(.horizontal)
        }).disabled(condition ? true : false)
    }
}

#Preview {
    CTAButton(label: "Button", action: {}, condition: false)
}
