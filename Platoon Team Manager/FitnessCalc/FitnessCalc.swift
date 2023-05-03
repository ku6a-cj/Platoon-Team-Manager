//
//  FitnessCalc.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 02/10/2022.
//

import SwiftUI

struct FitnessCalc: View {
    
    
    var body: some View {
        TabView {
                   HRmaxView()
                       .tabItem {
                           Label("HRmax", systemImage: "figure.run")
                       }

                   BmiCalc()
                       .tabItem {
                           Label("Bmi Calculator", systemImage: "figure.dance")
                       }
        }
    }
}

struct FitnessCalc_Previews: PreviewProvider {
    static var previews: some View {
        FitnessCalc()
        
    }
}
