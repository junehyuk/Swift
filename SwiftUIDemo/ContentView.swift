//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by june on 2021/07/17.
//

import SwiftUI

struct ContentView: View {
    
    var colors : [Color] = [.black,.red,.green,.blue]
    var colornames = ["Black","Red","Green","Blue"]

    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI!"
    
    var body: some View {
        VStack {
            VStack() {
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                    .rotationEffect(.degrees(   self.rotation))
                    .animation(.easeInOut(duration:5))
                Spacer()
                Divider()
                
                Slider(value: $rotation, in: 0...360, step:0.1)
                    .padding()
                
                TextField("Enter Text Here",text:$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Colors").padding()
                    Picker(selection:$colorIndex, label: Text("Color")) {
                        ForEach(0..<colornames.count) {
                            Text(self.colornames[$0]).foregroundColor(self.colors[$0])
                        }
                        
                    }
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
                .environment(\.colorScheme, .dark)
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
                .padding()
        }
    }
}
