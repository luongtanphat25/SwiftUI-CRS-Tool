//
//  ContentView.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-15.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var delegate: AppDelegate
    
    var body: some View {
        StartPage(delegate: self.delegate)
    }
}
