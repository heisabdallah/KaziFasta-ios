//
//  NetworkMonitor.swift
//  kazifasta
//
//  Created by Abdallah Khalfan on 17/10/2023.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private var monitor: NWPathMonitor
    private var checkTimer: Timer?
    
    @Published var isNetworkAvailable: Bool = true

    init() {
        monitor = NWPathMonitor()

        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isNetworkAvailable = path.status == .satisfied
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        
        // Create and start a timer to check network status every 2 seconds
        checkTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.checkNetworkStatus()
        }
    }
    
    func checkNetworkStatus() {
        monitor = NWPathMonitor()

        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isNetworkAvailable = path.status == .satisfied
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        // You can use this method to update the network status if needed
        // For example, you can check if a network request can be made here
    }
}

