//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    
    @ObservedObject var basicLocal = ModelEquations()

    func plotYEqualsX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func basicModelPlotS(Population: Double) {
        
        //
        let localY = basicLocal.BasicModelS(Population: Population)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "time steps"
        plotDataModel!.changingPlotParameters.yLabel = "S population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S vs time steps"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    
    func basicModelPlotZ(Population: Double) {
        
        //
        let localY = basicLocal.BasicModelZ(Population: Population)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "time steps"
        plotDataModel!.changingPlotParameters.yLabel = "Zombie population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Zombies vs time steps"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func basicModelPlotR(Population: Double) {
        
        //
        let localY = basicLocal.BasicModelR(Population: Population)
        
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = Population
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = Double(localY.count)
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "time steps"
        plotDataModel!.changingPlotParameters.yLabel = "Removed population"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "R vs time steps"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        
        for i in 0 ..< localY.count {

            //create x values here

            let x = Double(i)

        //create y values here

            let y = Double(localY[i])
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
}



