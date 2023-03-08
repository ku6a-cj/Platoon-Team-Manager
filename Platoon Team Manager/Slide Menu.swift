//
//  SideMenuView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 07/03/2023.
//

import SwiftUI

struct SideMenuView: View {

    var body: some View {
        VStack {
            
            Divider()
                .frame(width:200.0,height: 1)
                .background(.white)
                .blur(radius: 0.5)
                .padding(.top, 50.0)
                
           
                
            HStack {
                Image(systemName: "globe.europe.africa")
                    .foregroundColor(Color.white)
                
                        Text("PLACEHOLDER")
                    
                    .font(.title)
                .foregroundColor(.white)
            }
    
            
            
            HStack {
                Image(systemName: "figure.climbing")
                    .foregroundColor(Color.white)
                
                
                    Text("PLACEHOLDER")
                
                .font(.title)
            .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "chart.bar.xaxis")
                    .foregroundColor(Color.white)
                
                Text("PLACEHOLDER")
               
                .font(.title)
            .foregroundColor(.white)
            }
            
            
            HStack {
                Image(systemName: "newspaper")
                    .foregroundColor(Color.white)
               
                Text("PLACEHOLDER")
                
                .font(.title)
            .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "calendar.badge.exclamationmark")
                    .foregroundColor(Color.white)
           
                Text("PLACEHOLDER")
                
                .font(.title)
            .foregroundColor(.white)
            }
            
            
      
            
          
            Spacer()
        }
        .padding(16)
        .background(Color.gray)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

