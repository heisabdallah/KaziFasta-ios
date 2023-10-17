//
//  TextCapsule.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 07/10/2023.
//

import SwiftUI

struct TextCapsule: View {
    var text: String
    var body: some View {
        Text(text).font(.footnote).padding().foregroundStyle(Color.theme.primaryText).background(Color.theme.buttonColor).clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    TextCapsule(text: "Web Development")
}
