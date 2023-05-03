//
//  HRmaxViewModel.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 07/10/2022.
//

import Foundation
import SwiftUI

 class HRmaxViewModel: ObservableObject{
        @Published var HRmaxList = [HRmax]()
     @Published var Gender = "Select your gender"
     @Published var weight = 90
     @Published var age = 22
     @Published var HRmaX = 197.02
        

     func addItem(){
         if(Gender == "male"){
             HRmaX = 210 - 0.5*Double(age)-0.022*Double(weight)+4
         }else{
             HRmaX = 210-0.5*Double(age)-0.022*Double(weight)
         }
         
         let newHRmax = HRmax(gender: Gender, weight: weight, age: age, HRmaX: HRmaX)
         
         withAnimation{
             HRmaxList.insert(newHRmax, at: 0)
         }
     }
     
     func deleteItem(){
         withAnimation{
             HRmaxList.remove(at: 0)
         }
     }
     
}
