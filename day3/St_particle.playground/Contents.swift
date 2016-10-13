//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit
import SpriteKit

var view: SKView?
var scene: SKScene?
let w: CGFloat = 640
let h: CGFloat = 480

func setup(){
  view = SKView.init(frame: CGRect(x: 0, y: 0, width: w, height: h))
  if let view = view {
		scene = SKScene(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundSupport.PlaygroundPage.current.liveView = view
  }
}

func createParticle(){
	let path = Bundle.main.path(forResource: "MyParticle", ofType: "sks")
	let fire = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode

  if let scene = scene {
    let position = CGPoint(x: w/2, y: h/2)
    fire.position = position
    scene.addChild(fire)
  }
}


setup()
createParticle()
