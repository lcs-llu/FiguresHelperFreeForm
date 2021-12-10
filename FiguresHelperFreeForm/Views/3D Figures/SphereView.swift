//
//  SphereView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct SphereView: View {
    
    
@State var providedRadius = ""
var radius: Double? {
        
       guard let radius = Double(providedRadius),
              radius > 0
        else {
                
            return nil
        }
        
        return radius
    }
    
    var surfaceArea: Double? {
        
        guard let radius = radius else {
        return nil
                    }
                    
        return 4 * Double.pi * radius * radius
            }
                
                
                var body: some View {
                ScrollView {
                        
                    VStack(alignment: .leading, spacing: 20) {
                            
                    DiagramView(image: "sphere",
                                horizontalPadding: 50)
                            
                    SectionLabelView(text: "Radius", variable: "r")

                            
                        TextField("Radius",
                        text: $providedRadius,
                        prompt: Text("Please insert a Number."))
                                
                        .foregroundColor(radius == nil ? Color.red : Color.primary)
                            
                            
                            
                    SectionLabelView(text: "Surface Area", variable: "")

                           
                    OutputValueView(value: surfaceArea, suffix: "cubed units")
                            
                        }
                        
                    }
                .navigationTitle("Sphere")
                .padding()
                }
            }

            struct SphereView_Previews: PreviewProvider {
                static var previews: some View {
                    NavigationView {
                        SphereView()
                    }
                }
            }
