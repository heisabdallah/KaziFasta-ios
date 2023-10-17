//
//  bottomSheetManager.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 15/10/2023.
//

import Foundation

class BottomSheetManager: ObservableObject {
    @Published var showBottomSheet: Bool = false
    
    func toggleSheet(){
        showBottomSheet.toggle()
    }
    
}
