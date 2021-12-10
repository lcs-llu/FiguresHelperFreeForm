//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    
    
    @State var providedRadius = ""
    
    // MARK: Stored properties
    var radius: Double? {
        
        //Tests of the provided input
        //1. Ensure that we can simply change the input into a Double
        //2. Ensure that the values as a double is more than 0
        //with the guard statement, we list the things we wish to be true... and provide an action to carry out when these conditions are not met.
        guard let radius = Double(providedRadius),
              radius > 0
        else {
                //when the tests are failed, we do not have a valid radius
            return nil
        }
        // if we get here we know the radius is good
        return radius
    }
    
    // MARK: Computed properties
    
    //Attempt to calculate the area, if it can't...... retuen nil
    var area: Double? {
        //is the input actually a double, or ...... is it a Double? (might be nil)
        guard let radius = radius else {
            //we didn't have a valid radius
            //we can't calculate the area...
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
                text: $providedRadius,
                prompt: Text("Numberic value greater than 6."))
                    // CONDITION      TRUE          FALSE
                    .foregroundColor(radius == nil ? Color.red : Color.primary)
                
                // Output: Radius
                
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
