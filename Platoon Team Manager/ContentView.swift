//
//  ContentView.swift
//  Platoon Team Manager
//
//  Created by Jakub Chodara on 07/03/2023.
//

import SwiftUI
import SwiftUI
import MapKit


struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct ContentView: View {
    @State private var showMenu: Bool = false
    
    init(){
        _ = UINavigationBarAppearance()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor.clear
        UINavigationBar.appearance().barTintColor=UIColor.clear
    }
    
    
    let places = [
        Place(name: "Position 1", latitude: 31.21, longitude: 120.50),
        Place(name: "Position 2", latitude: 31.210205, longitude: 120.52301),
        Place(name: "Position 3", latitude: 31.230006, longitude: 120.54002)
    ]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.21, longitude: 120.50),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        NavigationView{
            ZStack{
                HStack{
                    Map(coordinateRegion: $region, showsUserLocation: false,  annotationItems: places){ place in
                        MapMarker(coordinate: place.coordinate)}
                }
                GeometryReader{ geo in
                    
                    HStack {
                        SideMenuView()
                            .offset(x:showMenu ? 0 : UIScreen.main.bounds.width)
                    }
                }
                .background(Color.black.opacity(showMenu ? 0.5 : 0))
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button{
                        self.showMenu.toggle()
                    } label: {
                        if(showMenu){
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(Color(UIColor.black))
                            Text("Settings")
                                .font(.title)
                                .foregroundColor(Color(UIColor.white))

                        }else{
                            Image(systemName: "text.justify")
                                .font(.title)
                                .foregroundColor(Color(UIColor.black))
                        }
                        
                    }
                    .padding(.trailing)
                }
            }
        .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

