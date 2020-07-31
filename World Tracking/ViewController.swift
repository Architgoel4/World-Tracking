//
//  ViewController.swift
//  World Tracking
//
//  Created by Goel, Archit on 01/01/19.
//  Copyright © 2019 Goel, Archit. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: UIButton) {
       let doorNode = SCNNode(geometry:SCNPlane(width: 0.03, height: 0.06))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
       let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0 ))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        let cylinderNode = SCNNode(geometry: SCNCylinder(radius: 0.05, height: 0.05))
//        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        let node = SCNNode()
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.0))
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        node.geometry = SCNPyramid(width: 0.2, height: 0.3, length: 0.2)
//        node.geometry = SCNPlane(width: 0.3, height: 0.2)
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
//        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.2, height: 0.3)
//        node.geometry = SCNSphere(radius: 0.1)
//        node.geometry = SCNCylinder(radius: 0.1, height: 0.2)
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.3)
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue

        
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(0.2, 0.3, -0.2)
        boxNode.position = SCNVector3(0, -0.05, 0)
        doorNode.position = SCNVector3(0, -0.02, 0.053)
        self.sceneView.scene.rootNode.addChildNode(node)
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)

    }
    
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{ (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
}

