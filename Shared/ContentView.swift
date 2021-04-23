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
    @State var popInput = ""
    @State var alphaInput = ""
    @State var betaInput = ""
    @State var zetaInput = ""
    @State var deltaInput = ""
    @State var growthInput = ""
    @State var zguessInput = ""
    @State var rhoInput = ""
    @State var gammaInput = ""
    @State var sigmaInput = ""
    @State var kappaInput = ""
    
    var plotSelect = [ "Susceptible population S: Basic Model", "Zombie Population Z: Basic Model", "Removed Population R: Basic Model", "Susceptible population S: Model With Latent Infection", "Zombie Population Z: Model With Latent Infection", "Removed Population R: Model With Latent Infection", "Infected Not Necessarily Zombie Yet Population for Latent Model", "Susceptible population S: Quarantine Model", "Zombie Population Z: Quarantine Model", "Removed Population R: Quarantine Model","Infected not yet Zombies: Quarantine Model", "Quarantine Population" ]
    
    
    
    
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
                    TextField("500", text: $popInput)
                        .padding()
                    Text("Alpha:")
                        .font(.callout)
                        .bold()
                    TextField("0.005", text: $alphaInput)
                        .padding()
                    Text("Beta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0095", text: $betaInput)
                        .padding()
                    Text("Zeta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0001", text: $zetaInput)
                        .padding()
                    Text("Delta:")
                        .font(.callout)
                        .bold()
                    TextField("0.0001", text: $deltaInput)
                        .padding()
                }.padding()
                
//                Toggle(isOn: $isChecked) {
//                            Text("Display Error")
//                        }
//                .padding()
                
                
            }
            HStack{
                Picker(selection: $selectedPlotIndex, label: Text(""))
                    { ForEach(0 ..< plotSelect.count) { Text(self.plotSelect[$0])
                    }
                }
//                Text("Selected Population: (plotSelect[selectedPlotIndex])")
//                .padding()
                
                
                Text("Growth Rate:")
                    .font(.callout)
                    .bold()
                TextField("0", text: $growthInput)
                    .padding()
                Text("Initial Zombie Number: ")
                    .font(.callout)
                    .bold()
                TextField("1", text: $zguessInput)
                    .padding()
                
            }
            HStack{
                Button("Calculate", action: {self.calculate()} )
                .padding()
               
                Text("Rho: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $rhoInput)
                    .padding()
                
                Text("Kappa: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $kappaInput)
                    .padding()
                
                Text("Gamma: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $gammaInput)
                    .padding()
                
                Text("Sigma: ")
                    .font(.callout)
                    .bold()
                TextField(".005", text: $sigmaInput)
                    .padding()
            
            }
            
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        let gam = Double(gammaInput)!
        let sig = Double(sigmaInput)!
        let kap = Double(kappaInput)!
        let row = Double(rhoInput)!
        let zgue = Double(zguessInput)!
        let pie = Double(growthInput)!
        let pop = Double(popInput)!
        let alpha = Double(alphaInput)!
        let beta = Double(betaInput)!
        let zeta = Double(zetaInput)!
        let delta = Double(deltaInput)!
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
         //calculator.basicModelPlotZ(Population: pop)
        let tempPopulationIndex = selectedPlotIndex
        
        switch tempPopulationIndex {
            
            case 0:
                calculator.basicModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta)
            case 1:
            calculator.basicModelPlotZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta)
        case 2:
            calculator.basicModelPlotR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta)
        case 3:
            calculator.latentModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row)
        case 4:
            calculator.latentModelPlotZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row)
        case 5:
            calculator.latentModelPlotR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row)
        case 6:
            calculator.latentModelPlotI(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row)
        
        case 7:
            calculator.quarantineModelS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam)
        case 8:
            calculator.quarantineModelZ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam)
        case 9:
            calculator.quarantineModelR(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam)
        case 10:
            calculator.quarantineModelI(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam)
        case 11:
            calculator.quarantineModelQ(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta, rho: row, kappa: kap, sigma: sig, gamma: gam)
        
        default:
            calculator.basicModelPlotS(Population: pop, InitialZombieNumber: zgue, GrowthRate: pie, alpha: alpha, beta: beta, zeta: zeta, delta: delta)
        }
    
        // end calculate function
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
