//: Study SpriteAnimation with SpriteKit

import PlaygroundSupport
import SpriteKit


let windowW: CGFloat = 640
let windowH: CGFloat = 480

//: Run
func run(){
  var view: SKView?
  var scene: MyScene?

  view = SKView(frame: CGRect(x: 0, y: 0, width: windowW, height: windowH))
  scene = MyScene(size: CGSize(width: windowW, height: windowH))

  if let view = view {
    view.showsFPS = true
    view.showsNodeCount = true

    if let scene = scene {
      view.presentScene(scene)
    }
  }

  PlaygroundPage.current.liveView = view
  
}

//: Scene
class MyScene:SKScene {

  private let kikiAtlasIndex: Int = 11
  private var kikiChara: CharactorNode?

  override func didMove(to view: SKView) {
    self.backgroundColor = NSColor.blue

    let kikiAtlas: SKTextureAtlas = SKTextureAtlas(named: "kiki_normal")
    var textureArray: [SKTexture] = []
    for index in 1...kikiAtlasIndex {
      let imageName:NSString = NSString(format: "kiki_normal_%02d.png", index)
      let texture: SKTexture = kikiAtlas.textureNamed(imageName as String)
      textureArray.append(texture)
    }

    kikiChara = CharactorNode(texture: textureArray[0])

    if let kikiChara = kikiChara {
      kikiChara.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
      self.addChild(kikiChara)
      kikiChara.setAnimTextureArray(textureArray: textureArray)
      kikiChara.setGameSize(size: self.size)
      kikiChara.startAnim()
    }

  }


  override func update(_ currentTime: TimeInterval) {
    if let kikiChara = kikiChara {
      kikiChara.update()
    }
  }
}

//: Charactor
class CharactorNode: SKSpriteNode {

  // private variable
  private let actionKey: String = "CHARACTOR_ACTION"
  private var textureArray: [SKTexture]?
  private var sceneSize: CGSize?

  // public variable
  public var vSpeed: CGVector = CGVector(dx: CGFloat(arc4random() % 10)-10/2 , dy: CGFloat(arc4random() % 10)-10/2)


	// private functions


  // public functions
  public func setAnimTextureArray(textureArray: [SKTexture]){
		self.textureArray = textureArray
  }

  public func setGameSize(size: CGSize) {
		sceneSize = size
  }

  public func startAnim(){
    if let textureArray = self.textureArray {
      self.removeAction(forKey: actionKey)
			let action = SKAction.animate(with: textureArray, timePerFrame: 0.25, resize: false, restore: false)
      let repeatAction = SKAction.repeatForever(action)
      self.run(repeatAction, withKey: actionKey)
    }
  }

  public func update(){
		self.position.x += self.vSpeed.dx
    self.position.y += self.vSpeed.dy


    if let sceneSize = self.sceneSize {
      if self.position.x >= sceneSize.width || self.position.x <= 0 {
				self.vSpeed.dx *= -1
      }

      if self.position.y >= sceneSize.height || self.position.y <= 0 {
        self.vSpeed.dy *= -1
      }
    }

  }


}



run()
