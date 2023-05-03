//
//  SideMenuView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 07/03/2023.
//

import SwiftUI

struct SideMenuView: View {

    var body: some View {
        VStack(alignment: .leading) {
            
            Divider()
                .frame(width:200.0,height: 1)
                .background(.white)
                .blur(radius: 0.5)
                .padding(.top, 50.0)
                
           
                
            HStack {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color.white)
                
                NavigationLink(destination: PointsDataBaseDisplay()){
                    Text("Points Database")
                }
                    .font(.title)
                .foregroundColor(.white)
            }
    
            
            
            HStack {
                Image(systemName: "figure.dance")
                    .foregroundColor(Color.white)
                
                
                NavigationLink(destination: FitnessCalc()){
                    Text("Fitness Calculator")
                }
                
                .font(.title)
            .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "shareplay")
                    .foregroundColor(Color.white)
                
                NavigationLink(destination: GitView()){
                    Text("Git")
                }
               
                .font(.title)
            .foregroundColor(.white)
            }
            
            
           
            
            
      
            
          
            Spacer()
        }
        .padding(16)
        .background(Color(UIColor.darkGray))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

