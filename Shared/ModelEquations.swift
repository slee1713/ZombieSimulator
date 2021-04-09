//
//  ModelEquations.swift
//  ZombieSimulator
//
//  Created by Spencer Lee on 4/2/21.
//

import Foundation
import SwiftUI
import CorePlot

class ModelEquations: ObservableObject {
    let alpha = 0.005
    let beta = 0.0095
    let zeta = 0.0001
    let delta = 0.0001
    let step = 0.05
    let Pie = 20.0
    let time = 5.0
    
    func BasicModelS(Population: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1Z: [Double] = []
        var y1Z: [Double] = []
        
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(1.0)
        rR.append(0.1)
        var n = 0
        
        for _ in stride(from: 0, through: time, by: dX) {
            
            sS.append(sS[n] + sPrime[n] * dX)
            zZ.append(zZ[n] + zPrime[n] * dX)
            rR.append(rR[n] + rPrime[n] * dX)
            
            sPrime.append(Pie - sS[n+1] * zZ[n+1] * beta - delta * sS[n+1])
            zPrime.append(sS[n+1] * zZ[n+1] * beta + zeta * rR[n+1] - alpha * sS[n+1] * zZ[n+1])
            rPrime.append(delta * sS[n+1] + alpha * sS[n+1] * zZ[n+1] - zeta * rR[n+1])
            
            k1S.append(sS[n] + sPrime[n] * dX)
            y1S.append(k1S[n] * dX / 2 + sS[n])
            
            k1Z.append(zZ[n] + zPrime[n] * dX)
            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
            
            n += 1
            
            
        }
        

        return (y1S)
        
    }
     
    func BasicModelZ(Population: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1Z: [Double] = []
        var y1Z: [Double] = []
        
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(1.0)
        rR.append(0.1)
        var n = 0
        
        for _ in stride(from: 0, through: time, by: dX) {
            
            sS.append(sS[n] + sPrime[n] * dX)
            zZ.append(zZ[n] + zPrime[n] * dX)
            rR.append(rR[n] + rPrime[n] * dX)
            
            sPrime.append(Pie - sS[n+1] * zZ[n+1] * beta - delta * sS[n+1])
            zPrime.append(sS[n+1] * zZ[n+1] * beta + zeta * rR[n+1] - alpha * sS[n+1] * zZ[n+1])
            rPrime.append(delta * sS[n+1] + alpha * sS[n+1] * zZ[n+1] - zeta * rR[n+1])
            
            k1S.append(sS[n] + sPrime[n] * dX)
            y1S.append(k1S[n] * dX / 2 + sS[n])
            
            k1Z.append(zZ[n] + zPrime[n] * dX)
            y1Z.append(k1Z[n] * dX / 2 + zZ[n])
            
            n += 1
            
            
        }
        

        return (y1Z)
        
    }
    
    func BasicModelR(Population: Double) -> [Double] {
        
        var sPrime: [Double] = []
        var zPrime: [Double] = []
        var rPrime: [Double] = []
        var sS: [Double] = []
        var zZ: [Double] = []
        var rR: [Double] = []
        var dX = step
        var k1S: [Double] = []
        var y1S: [Double] = []
        var k1R: [Double] = []
        var y1R: [Double] = []
        
        sPrime.append(0.0)
        zPrime.append(0.0)
        rPrime.append(0.0)
        sS.append(Population)
        zZ.append(1.0)
        rR.append(0.1)
        var n = 0
        
        for _ in stride(from: 0, through: time, by: dX) {
            
            sS.append(sS[n] + sPrime[n] * dX)
            zZ.append(zZ[n] + zPrime[n] * dX)
            rR.append(rR[n] + rPrime[n] * dX)
            
            sPrime.append(Pie - sS[n+1] * zZ[n+1] * beta - delta * sS[n+1])
            zPrime.append(sS[n+1] * zZ[n+1] * beta + zeta * rR[n+1] - alpha * sS[n+1] * zZ[n+1])
            rPrime.append(delta * sS[n+1] + alpha * sS[n+1] * zZ[n+1] - zeta * rR[n+1])
            
            k1S.append(sS[n] + sPrime[n] * dX)
            y1S.append(k1S[n] * dX / 2 + sS[n])
            
            k1R.append(rR[n] + rPrime[n] * dX)
            y1R.append(k1R[n] * dX / 2 + rR[n])
            
            n += 1
            
            
        }
        

        return (y1R)
        
    }
}
    
