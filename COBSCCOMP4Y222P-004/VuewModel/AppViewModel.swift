//
//  AppViewModel.swift
//  COBSCCOMP4Y222P-004
//
//  Created by NIBM-LAB04-PC03 on 2024-03-17.
//

import SwiftUI

class AppViewModel: View {
   
        @Published var currentTab: Tab = .home
        
        @Published var currentMenu: CustomMenuOptions = .all
        
        @Published var showDetailView: Bool = false
        
        @Published var currentActiveItem: Furniture?
    }
