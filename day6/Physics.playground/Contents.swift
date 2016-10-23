//: Playground - noun: a place where people can play

import PlaygroundSupport
import SpriteKit


let w = 640
let h = 480

var view:SKView?
let CATEGORY = UInt32(0x1 << 0)

class MyScene: SKScene, SKPhysicsContactDelegate {
  override func didMove(to view: SKView) {
    self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.0)
    self.physicsWorld.contactDelegate = self
    self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//    self.physicsBody?.contactTestBitMask = 0xFFFFFFFF
//    self.physicsBody?.collisionBitMask = 0xFFFFFFFF

    for index in 1...100 {
      let radius = 20*CGFloat(index)/100
      let circle = SKShapeNode(circleOfRadius: radius)
      let r = CGFloat(arc4random()%255)/255
      let g = CGFloat(arc4random()%255)/255
      let b = CGFloat(arc4random()%255)/255
      circle.fillColor = UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
      circle.strokeColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
      circle.physicsBody = SKPhysicsBody(circleOfRadius: radius)
      //circle.physicsBody?.usesPreciseCollisionDetection = true
      circle.physicsBody?.categoryBitMask = CATEGORY
			circle.physicsBody?.collisionBitMask = CATEGORY

      let pos = CGPoint(x: CGFloat(arc4random()%UInt32(w)), y: CGFloat(arc4random()%UInt32(h)))
      circle.position = pos
      self.addChild(circle)
    }

    let ground = SKShapeNode(rect: CGRect(x: 0, y: 0, width: w, height: 30))
    ground.fillColor = UIColor.brown
		ground.position = CGPoint(x: 0, y: 0)

    ground.physicsBody = SKPhysicsBody(edgeChainFrom: ground.path!)
    ground.physicsBody?.restitution = 0.75
    ground.strokeColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
    ground.physicsBody?.isDynamic = false
//    ground.physicsBody?.collisionBitMask = 0xFFFFFFFF
    self.addChild(ground)

  }

  func didBeginContact(contact: SKPhysicsContact!) {
    print("collison")
  }
}

func setup() -> Void{
  view = SKView(frame: CGRect(x: 0, y: 0, width: w, height: h))
  if let view = view {
    view.presentScene(MyScene(size: CGSize(width: w, height: h)))
		PlaygroundPage.current.liveView = view
  }
}


setup()

