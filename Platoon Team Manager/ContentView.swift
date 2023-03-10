//
//  ContentView.swift
//  Platoon Team Manager
//
//  Created by Jakub Chodara on 07/03/2023.
//

import SwiftUI
import SwiftUI
import MapKit
import Combine


struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

public var long = 21.02
public var lat = 53.02

struct ContentView: View {
    @State private var showMenu: Bool = false
    @StateObject var deviceLocationService = DeviceLocationService.shared
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    @State var enemyIndex = 1

    
    
    init(){
        _ = UINavigationBarAppearance()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor.clear
        UINavigationBar.appearance().barTintColor=UIColor.clear
    }
    
    
    @State var places = [
        Place(name: "Position 1", latitude: 31.21, longitude: 120.50),
//        Place(name: "Position 2", latitude: 31.210205, longitude: 120.52301),
//        Place(name: "Position 3", latitude: 31.230006, longitude: 120.54002)
    ]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: lat, longitude: long),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        NavigationView{
            ZStack{
                HStack{
                    Map(coordinateRegion: $region, showsUserLocation: false,  annotationItems: places){ place in
                        MapAnnotation(coordinate: place.coordinate) {
                            Button {
                                print("Location is", place.name)
                                if let i = places.firstIndex(where: { $0.name == place.name }) {
                                    places.remove(at: Int(i))
                                }
                                
                                
                
                            } label: {
                                if(place.name=="My Location"){
                                    Image(systemName: "paperplane.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .accentColor(.black)
                                }else{
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .accentColor(.red)
                                }
                               
                                
                            }
                        }
                        
                    }
                }.onAppear{
                    observeCoordinateUpdates()
                    observeDeniedLocationAccess()
                    deviceLocationService.requestLocationUpdates()
                }
                GeometryReader{ geo in
                    
                    HStack {
                        SideMenuView()
                            .offset(x:showMenu ? 0 : UIScreen.main.bounds.width)
                    }
                }
                .background(Color.black.opacity(showMenu ? 0.5 : 0))
                VStack(alignment: .trailing) {
                    HStack{
                        Button{
                            places.append(Place(name: String(enemyIndex), latitude: region.center.latitude, longitude: region.center.longitude))
                            print("button pressed")
                            enemyIndex=enemyIndex+1
                        }label: {
                            Image(systemName: "paperplane.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .accentColor(.black)
                        }
                    }
                    .padding([.top, .trailing], 20.0)
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                                .padding()
                            
                            Button{
                                region.span.latitudeDelta *= 0.9
                                region.span.longitudeDelta *= 0.9
                            }label: {
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .accentColor(.black)
                            }
                            
                            
                            
                            Button{
                                region.span.latitudeDelta /= 0.9
                                region.span.longitudeDelta /= 0.9
                            }label: {
                                Image(systemName: "minus.square")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .accentColor(.black)
                            }}
                        .padding(.trailing, 15.0)
                    }
                    .padding(.bottom, 26.0)
                }
                Text("+")

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
                }
            }
            .ignoresSafeArea()
        }.navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            
            lat = coordinates.lat
            long = coordinates.lon
            print(lat)
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat, longitude: long),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
            places.insert(Place(name: "My Location", latitude: lat, longitude: long), at: 0)
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {

                lat = coordinates.lat
                long = coordinates.lon
                print(lat)
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: lat, longitude: long),
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
                places.insert(Place(name: "My Location", latitude: lat, longitude: long), at: 0)
                //print("My location", lat, " ... ", long)
            })
            
            
            DispatchQueue.global(qos: .background).async {
                while(true){
                    sleep(5)
                    print("New location")
                    observeCoordinateUpdates()
                    observeDeniedLocationAccess()
                    deviceLocationService.requestLocationUpdates()
                    lat = coordinates.lat
                    long = coordinates.lon
                    print(lat)
                    places[0]  = (Place(name: "My Location", latitude: lat, longitude: long))
                }
                
            }
            
        
           
        }
    }
    
    
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }

    func observeDeniedLocationAccess() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Handle access denied event, possibly with an alert.")
            }
            .store(in: &tokens)
    }
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

