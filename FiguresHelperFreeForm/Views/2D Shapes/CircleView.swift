//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    @State var radius = 10.0
    
    // MARK: Computed properties
    @State var provideRadius = ""
    
    
    var radius = Double? {
       
        //Texts of the provided input
        // 1, Ensure that we can simply change the input into double
        //2, Ensure that the value as a Double is more than 0
        //With a guard statement, we list the things we wish to be
        //true and provide an action to carry out when those
        //conditions are not met
        guard let radius = Double(provideRadius),
                radius > 0
        else{
            return nil
    }
        
        return radius
        
    }
    
    
    
    var area: Double? {
        
        guard let radius = radius
        else {
            return nil
        }
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius",
                          text: $provideRadius,
                            prompt: Text("Numeric value greater than 8"))
                    .foregroundColor(.red)
                // Output: Radius
                SliderValueView(value: radius)
                
                SectionLabelView(text: "Area", variable: "")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}
