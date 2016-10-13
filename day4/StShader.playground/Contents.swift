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


func createObject(){

  let shaderNodeTexture = SKTexture(imageNamed: "profile")
	let shaderNode = SKSpriteNode(texture: shaderNodeTexture)

  shaderNode.size = CGSize(width: 300, height: 300)
  shaderNode.position = CGPoint(x: w/2, y: h/2)
	let shader = SKShader(fileNamed: "sample.fsh")
	shaderNode.shader = shader
  if let scene = scene {
    scene.addChild(shaderNode)
  }


}


setup()
createObject()
