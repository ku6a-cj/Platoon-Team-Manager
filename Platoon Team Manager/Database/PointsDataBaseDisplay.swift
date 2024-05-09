//
//  PointsDataBaseDisplay.swift
//  Platoon Team Manager
//
//  Created by Jakub Chodara on 03/05/2023.
//

import SwiftUI

struct PointsDataBaseDisplay: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) // here i can sort resoults
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        
        Form {
            Section(header: Text("Points simulation data")){
       
                    ForEach(tasks) { task in
                        VStack(spacing: -60) {
                            DataBaseView( ID: String(task.id) , Latitude: String(task.latitude) , Longitude: String( task.longitude) , MType: String(task.markerType ?? "Undefined"))
                    }
                    .padding(.vertical, -35.0)
                    }.onDelete(perform: deleteTasks)
             
                   
                
            }
        }
    }
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map{tasks[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func saveContext(){
        withAnimation(){
            do{
                try viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved Error: \(error)")
            }
        }
      
    }
    
}

struct PointsDataBaseDisplay_Previews: PreviewProvider {
    static var previews: some View {
        PointsDataBaseDisplay()
    }
}
