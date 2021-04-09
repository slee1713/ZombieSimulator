//
//  ContentView.swift
//  Shared
//
//  Created by Spencer Lee on 4/2/21.
//


import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var tempInput = ""
  
    var plotSelect = [ "Susceptible population S", "Zombie Population Z", "Removed Population R"]
    @State private var selectedPlotIndex = 0
    

    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("Population:")
                        .font(.callout)
                        .bold()
                    TextField("temp", text: $tempInput)
                        .padding()
                }.padding()
                
                Toggle(isOn: $isChecked) {
                            Text("Display Error")
                        }
                .padding()
                
                
            }
            HStack{
                Picker(selection: $selectedPlotIndex, label: Text(""))
                    { ForEach(0 ..< plotSelect.count) { Text(self.plotSelect[$0])
                    }
                }
                Text("Selected Population: \(plotSelect[selectedPlotIndex])")
                .padding()
                
            }
            HStack{
                Button("Calculate", action: {self.calculate()} )
                .padding()
                
            }
            
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        let pop = Double(tempInput)!
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
         //calculator.basicModelPlotZ(Population: pop)
        let tempPopulationIndex = selectedPlotIndex
        
        switch tempPopulationIndex {
            
            case 0:
                calculator.basicModelPlotS(Population: pop)
            case 1:
            calculator.basicModelPlotZ(Population: pop)
        case 2:
            calculator.basicModelPlotR(Population: pop)
        default:
            calculator.basicModelPlotS(Population: pop)
        }
    
        // end calculate function
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
