//: Playground - noun: a place where people can play

import PlaygroundSupport
import SpriteKit
import UIKit


let w: CGFloat = 640
let h: CGFloat = 480

let rect: CGRect = CGRect(x: 0, y: 0, width: w, height: h)
let view: SKView = SKView(frame: rect)
view.showsFPS = true
view.showsNodeCount = true


let scene: SKScene = SKScene(size: CGSize(width: w, height: h))
scene.scaleMode = SKSceneScaleMode.aspectFill
scene.backgroundColor = UIColor.blue


view.presentScene(scene)


PlaygroundPage.current.liveView = view
