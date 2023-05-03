//
//  BmiViewModel.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 07/10/2022.
//

import Foundation
import SwiftUI

class BMi: ObservableObject{
    @Published var BmiList = [Bmi]()
    @Published var weight = 90
    @Published var heigh = 187
    @Published var BmI = 25.73
    @Published var interpretation = "Interprtetation"
       

    func addItem(){
        
        BmI = (Double(weight)/Double(pow(Double(heigh),Double(2))))*10000
        BmI = Double(truncating: testNumberAsString(String(BmI)))
        interpretatorBMI(BMI: BmI)
        
        let newBmi = Bmi(weight: weight, height: heigh, BmI: BmI, Interpretation: interpretation)
        
        withAnimation{
            BmiList.insert(newBmi, at: 0)
        }
        
    }
    
    func interpretatorBMI(BMI: Double){
        switch BMI {
        case 0..<16.0:
            interpretation =  "starvation"
        case 16.0..<16.9:
            interpretation =  "emaciation"
        case 16.9..<18.5:
            interpretation = "underweight"
        case 18.5..<24.9:
            interpretation =  "correct weight"
        case 24.9..<29.9:
            interpretation = "overweight"
        case 29.9..<34.9:
            interpretation = "degree I obesity"
        case 34.9..<39.9:
            interpretation = "2nd degree obesity"
        default:
            interpretation =  "grade III obesity"
            break
            
        }}
    
    
    func testNumberAsString(_ numberAsString: String) -> NSDecimalNumber{
        let num = NSDecimalNumber.init(string: numberAsString)
        let behaviour = NSDecimalNumberHandler(roundingMode:.down, scale: 2, raiseOnExactness: false,  raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let numRounded = num.rounding(accordingToBehavior: behaviour)

        return numRounded
    }
    
    func deleteItem(){
        withAnimation{
            BmiList.remove(at: 0)
        }
    }
}
