//
//  ContentView.swift
//  StupidBowl
//
//  Created by Student on 4/6/22.
//
import UIKit
import SwiftUI

struct ContentView: View {
    
    var body: some View {
            
        NavigationView{
            VStack{
        Text("Welcome To Stupid Bowl!")
            
        NavigationLink( destination: GameScreen(), label: {
            ZStack {
            Image("banner")
                Text("Continue")
                .bold()
                
            }
        })
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
struct StupidQuestions: Identifiable {
    var id = UUID()
    var question = String()
    var answer = String()
}
*/
