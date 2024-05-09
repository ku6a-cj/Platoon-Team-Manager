//
//  DataBaseView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 04/10/2022.
//

import SwiftUI

struct DataBaseView: View {
    @State var isSelected = false
    @State var ID = "0.0"
    @State var Latitude = "0.0"
    @State var Longitude = "0.0"
    @State var `MType` = "def"

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "touchid")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("ID: \(ID)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                            
                        }
                        HStack {
                            Image(systemName: "person.crop.circle.badge.questionmark.fill")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("Type: \(MType)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                        }
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("Latitude: \(Latitude)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                        }
                        HStack {
                            Image(systemName: "arrow.up")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("Longitude: \(Longitude)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                        }
                    }
                }
            }.onAppear{

            }
            
//            VStack{
//                Image(systemName: "chart.bar.xaxis")
//                    .resizable()
//                    .resizable()
//                    .frame(width: 70, height: 70)
//                    .foregroundColor(isSelected ? .white : .black)
//
//
//            }
            
        }
        .padding()
        .background(Color(isSelected ? UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00) : .white))
        .cornerRadius(20)
       // .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .frame(width: 3000, height: 200)
        .onTapGesture {
            isSelected.toggle()
        }

    }
}

struct DataBaseView_Previews: PreviewProvider {
    static var previews: some View {
        DataBaseView(isSelected: true, ID: "0", Latitude: "0.0", Longitude: "0.0" )
            .previewLayout(.sizeThatFits)
        DataBaseView(isSelected: false,  ID: "0", Latitude: "0.0", Longitude: "0.0" )
            .previewLayout(.sizeThatFits)
    }
}
