//
//  DipatchBarrierDemo.swift
//  empujar
//
//  Created by Harsh Chauhan on 10/12/25.
//

import Foundation
import UIKit

class DipatchBarrierDemoVM {
    var availableTickets: Int = 5
    
    private let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
    
    var tickets = [
        Ticket(number: 2, name: "Aman"),
        Ticket(number: 3, name: "Baman"),
        Ticket(number: 2, name: "Chaman"),
        Ticket(number: 4, name: "Daman")
    ]
    
    func buyTickets() {
        for ticket in tickets {
            concurrentQueue.async(flags: .barrier, execute: { // avoid race condition
                self.book(ticket: ticket)
            })
        }
    }
    
    func book(ticket: Ticket) {
        print("Ticket booking started \(ticket.name)")
        sleep(1)
        if availableTickets >= ticket.number {
            availableTickets = availableTickets - ticket.number
            print("Ticket success \(ticket.name)")
        } else {
            print("Ticket failure \(ticket.name)")
        }
    }
}

struct Ticket {
    var number: Int
    var name: String
}