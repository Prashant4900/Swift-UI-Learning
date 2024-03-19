//
//  ContentView.swift
//  House Rental UI
//
//  Created by Prashant Nigam on 19/03/24.
//

import SwiftUI

enum PurchaseType {
    case rent
    case buy
}

struct ContentView: View {
    @State private var type = PurchaseType.rent
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    /// AppBar
                    HStack {
                        ZStack {
                            Color(.white)
                                .frame(width: 150, height: 50)
                                .cornerRadius(24)
                            
                            HStack {
                                
                                Image(systemName: "dpad.fill")
                                    .foregroundColor(Color("blue"))
                                
                                Text("Mai")
                                
                                Spacer()
                                    .frame(width: 3)
                                
                                Text("Home")
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                        Image(systemName: "ellipsis.message.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("grey"))
                        
                        Image(systemName: "bell.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("grey"))
                    }.padding(.horizontal)
                    
                    
                    /// Display Text
                    VStack {
                        HStack {
                            Text("I Want to")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                            
                            Toggle(isOn: Binding<Bool>(
                                get: { self.type == .rent },
                                set: { _ in self.type = .rent }
                            )) {
                                Text("rent")
                                    .font(.largeTitle)
                                    .foregroundColor(
                                        type == PurchaseType.rent ? Color("green") : .black
                                    )
                                    .fontWeight(
                                        type == PurchaseType.rent ? .semibold : .regular
                                    )
                            }.toggleStyle(RadioButtonStyle(
                                color: type == .rent
                                ? Color("green") : .black
                            ))
                            
                            Toggle(isOn: Binding<Bool>(
                                get: { self.type == .buy },
                                set: { _ in self.type = .buy }
                            )) {
                                Text("buy")
                                    .font(.largeTitle)
                                    .foregroundColor(
                                        type == .buy ? Color("green") : .black
                                    )
                                    .fontWeight(
                                        type == .buy ? .semibold : .regular
                                    )
                            }.toggleStyle(RadioButtonStyle(
                                color: type == .buy
                                ? Color("green") : .black
                            ))
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            Text("Apartment")
                                .font(.largeTitle)
                                .foregroundColor(Color("green"))
                                .fontWeight(.semibold)
                            
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .foregroundColor(Color("green"))
                            
                            Text("located")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            
                            Text("in")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                            
                            Text("New York")
                                .font(.largeTitle)
                                .foregroundColor(Color("green"))
                                .fontWeight(.semibold)
                            
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .foregroundColor(Color("green"))
                            
                            Text("for")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                            
                            Spacer()
                           
                        }
                        
                        HStack {
                            Text("$900")
                                .font(.largeTitle)
                                .foregroundColor(Color("green"))
                                .fontWeight(.semibold)
                            
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .foregroundColor(Color("green"))
                            Spacer()
                        }
                        
                    }.padding(.horizontal)
                    
                    /// Search Button
                    ZStack {
                        Color("blue")
                            .frame(height: 60)
                            .cornerRadius(24)
                        
                        HStack {
                            Image(systemName: "bubbles.and.sparkles.fill")
                                .foregroundColor(.white)
                            
                            Text("Search")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    ZStack {
                        Color(.white)
                            .cornerRadius(32)
                            .ignoresSafeArea()
                        
                        VStack {
                            HouseCard(
                                location: "Manhattan",
                                name: "Meinsur Home",
                                image: "house1"
                            )
                            
                            HouseCard(
                                location: "Brookline",
                                name: "Hansen House",
                                image: "house2"
                            )
                            
                            HouseCard(
                                location: "New York",
                                name: "Meinsue Home",
                                image: "house3"
                            )
                            
                            HouseCard(
                                location: "Manhattan",
                                name: "Meinsur Home",
                                image: "house4"
                            )
                            
                        }
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct RadioButtonStyle: ToggleStyle {
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(
                    systemName: configuration.isOn
                    ? "largecircle.fill.circle"
                    : "circle"
                )
                .font(.title2)
                .foregroundColor(color)
                configuration.label
            }
        }
    }
}


struct HouseCard<T>: View where T: StringProtocol {
    
    var location: T
    var name: T
    var image: T
    
    init(location: T, name: T, image: T) {
        self.location = location
        self.name = name
        self.image = image
    }
    
    var body: some View {
        ZStack {
            Image("\(image)")
                .resizable()
                .frame(height: 200)
                .cornerRadius(24)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(height: 200)
                    .cornerRadius(24)
                )
            
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .font(.footnote)
                        .foregroundColor(.white)
                    
                    Text(location)
                        .foregroundColor(.white)
                        .font(.footnote)
                    
                    Spacer()
                }
                HStack {
                    Text(name)
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                }
            }.padding()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    ZStack {
                        Color(.white)
                            .frame(width: 85, height: 55)
                            .cornerRadius(18)
                        
                        ZStack {
                            Color("blue")
                                .frame(width: 75, height: 45)
                                .cornerRadius(18)
                            
                            Image(systemName: "arrow.up.forward")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }.padding()
    }
}
