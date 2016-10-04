//
//  GameScene.swift
//  Study01
//
//  Created by Yoshizumi Ashikawa on 2016/09/28.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameScene: SKScene {
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?

  override func didMove(to view: SKView) {

	self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode

    if let label = self.label {
      label.alpha = 0.0
      label.run(SKAction.fadeIn(withDuration: 2.0))
    }

		let w = (self.size.width + self.size.height) * 0.03
		let size = CGSize(width: w, height: w)
    spinnyNode = SKShapeNode.init(rectOf: size, cornerRadius: 1)


    if let spinnyNode = self.spinnyNode {
			spinnyNode.lineWidth = 2.5
      spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
      spinnyNode.strokeColor = SKColor.yellow
    }

  }


  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches {
      if let n = self.spinnyNode?.copy() as! SKNode? {
        n.position = t.location(in: self)
        let removeAction = SKAction.removeFromParent()
        let fadeOutAction = SKAction.init(named: "Pulse")
        let actionSequecne = SKAction.sequence([fadeOutAction!,removeAction])
        n.run(actionSequecne)
        self.addChild(n)
      }
    }

  }
}
