//
//  ViewController.swift
//  ARAudit
//
//  Created by ameen khalil on 18/03/2018.
//  Copyright © 2018 Ameen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
      
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
        
        
       //RAM
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(x:planeAnchor.center.x,y:0,z:planeAnchor.extent.z)
            
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        plane.materials = [gridMaterial]
            planeNode.geometry = plane
            node.addChildNode(planeNode)
            
        
        
        }
        else {
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
           
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlane)
            let hitResult = results.first
            
            //Motherboard
            
            sceneView.scene.rootNode.addChildNode(MOD)
            
            
            
            
            
            
            
            
            //Ram
            var MOD2 = SCNNode()
            MOD2 = makeModule(widthp: 0.001, heightp: 0.1, lengthp: 0.1, chamForRad: 0, ImageURL: "art.scnassets/computerram.jpg", planePlusX: 0.2,planePlusY: 0.3,planePlusZ: 0.4)
           sceneView.scene.rootNode.addChildNode(MOD2)
            
          //  if let hitResult = results.first {
            //  }
        
    }}
    
    
    
    
    
    
    
    
    
    
    
//    func makeModule(widthp: CGFloat,heightp: CGFloat, lengthp: CGFloat, chamForRad: CGFloat,ImageURL: String,planePlusX:Float,planePlusY:Float,planePlusZ:Float)->SCNNode
//    {
//        let motherboard = SCNBox(width: widthp,height: heightp,length: lengthp, chamferRadius: chamForRad)
//        let material2 = SCNMaterial()
//        material2.diffuse.contents = UIImage(named: ImageURL)
//        motherboard.materials = [material2]
//        let mnode = SCNNode()
//        //mnode.position = SCNVector3(x: hitResult.worldTransform.columns.3.x+planePlusX,y: hitResult.worldTransform.columns.3.y+planePlusY,z: hitResult.worldTransform.columns.3.z+planePlusZ)
//        mnode.position = SCNVector3(x: planePlusX,y: planePlusY,z: planePlusZ)
//        mnode.geometry = motherboard
//        mnode.transform = SCNMatrix4MakeRotation(-2, 0, 0.7, 0)
//
//
//
//        return mnode
//    }
//
    
    
  
}
