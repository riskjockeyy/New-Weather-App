//
//  ContentView.swift
//  New Weather App
//
//  Created by Bharat Singh on 04/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model : ContentModel
       
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
                        if let weather = model.response {
                                    
                            Text(String(format: "%1.f", (weather.main.temp) - 273.15))
                                .font(.system(size: 80, weight: .heavy, design: .default))
                        }
                            
                        Text("° C")
                            .font(.system(size: 40, weight: .light, design: .default))
                    }
                    
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            Image(systemName: "arrow.up")
                           
                            if let weather = model.response {
                                        
                                Text(String(format: "%1.f ° C", (weather.main.temp_max) - 273.15))
                                   
                            }
                                
                        }
                        HStack {
                            Image(systemName: "arrow.down")
                         
                                
                                if let weather = model.response {
                                            
                                    Text(String(format: "%1.f ° C", (weather.main.temp) - 273.15))
                                        
                                }
                            
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
                Divider()
                
                    
                
                if let weather = model.response {
                    VStack(alignment: .leading) {
                        ForEach(weather.weather) { data in
                            Text(data.description)
                                .font(.system(size: 30, weight: .semibold, design: .default))
                                .padding([.horizontal, .bottom])
                            
                            Text(String(format: "feels like %1.f ° C", (weather.main.feels_like) - 273.15))
                                .padding(.leading)
                        }
                    }
                    
                }
                    
                    
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
