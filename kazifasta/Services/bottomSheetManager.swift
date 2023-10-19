//
//  bottomSheetManager.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 15/10/2023.
//

import Foundation

class BottomSheetManager: ObservableObject {
    @Published var showBottomSheet: Bool = false
    @Published var isLoaded: Bool = false
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoaded = true
        }
    }
    
    
    func toggleSheet(){
        showBottomSheet.toggle()
    }
    
}
