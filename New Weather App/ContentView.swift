//
//  ContentView.swift
//  New Weather App
//
//  Created by Bharat Singh on 04/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            LinearGradient(colors: [.cyan, Color("Brand")], startPoint: .topLeading, endPoint: .center)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("11:30 am, Fri Jan 18")
                        Text("Sydney, NSW")
                            .bold()
                    }
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 30, height: 20)
                }
                .padding()
                Spacer()
                HStack {
                    HStack(alignment: .bottom) {
                        Text("16")
                            .font(.system(size: 80, weight: .heavy, design: .default))
                        Text("° C")
                            .font(.system(size: 40, weight: .light, design: .default))
                    }
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            Image(systemName: "arrow.up")
                            Text("18°C")
                                
                        }
                        HStack {
                            Image(systemName: "arrow.down")
                            Text("8°C")
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
                Divider()
                
                    
                
                Text("Heavy rain")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .padding([.horizontal, .bottom])
                    
                HStack(spacing: 3) {
                        ForEach(0 ..< 7) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("18 °")
                                    .bold()
                                    
                                Image(systemName: "cloud")
                                Text("11 am")
                            }
                        }
                    }
                .padding(.horizontal)
                
                
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
