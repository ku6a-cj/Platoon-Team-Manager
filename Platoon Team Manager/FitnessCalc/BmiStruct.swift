//
//  BmiStruct.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 07/10/2022.
//

import Foundation


struct Bmi: Identifiable, Codable{
    var id = UUID()
    var weight: Int
    var height: Int
    var BmI: Double
    var Interpretation: String
    
    static var exampleBmi = Bmi(weight: 90, height: 187, BmI: 25.73, Interpretation: "interpretation")
}
