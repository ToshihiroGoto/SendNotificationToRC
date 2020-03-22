//
//  ContentView.swift
//  SendNotificationToRC
//
//  Created by Toshihiro Goto on 2020/03/22.
//  Copyright © 2020 Toshihiro Goto. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    let arView = ARViewContainer()
    
    var body: some View {
        
        ZStack {
            
            arView.edgesIgnoringSafeArea(.all)
            
            Button(action:{
                self.arView.boxAnchor.notifications.triggerFlip.post()
            }){
                Group {
                    HStack {
                        Image(systemName: "goforward").font(Font.system(size: 14))
                        Text("Flip").baselineOffset(-4)
                    }
                    .padding(
                        EdgeInsets(
                            top: 4,
                            leading: 20,
                            bottom: 8,
                            trailing: 20)
                    )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 2)
                    )
                }
            }
            
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let boxAnchor = try! Experience.loadBox()
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        arView.scene.anchors.append(self.boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
