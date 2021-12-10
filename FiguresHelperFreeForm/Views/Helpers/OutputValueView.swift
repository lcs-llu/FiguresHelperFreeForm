//
//  OutputValueView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct OutputValueView: View {
    
    
    let value: Double?
    let suffix: String
    
        var output: String {
        if let value = value {
            
            //we have a valid value to show
            let formattedValue = String(format: "%.1f", value)
            
            //return the output to show
            return "\(formattedValue) \(suffix)"
        }
        else {
            return "Cannot currently be computed."
        }
    }
    
    var body: some View {
        Text(output)
            .font(.title3)
            .bold()
    }
}

struct OutputValueView_Previews: PreviewProvider {
    static var previews: some View {
        OutputValueView(value: 12131.121,
                        suffix: "square units")
        
        OutputValueView(value: nil,
                        suffix: "square units")
    }
}
