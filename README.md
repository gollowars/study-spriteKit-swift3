# iOS Game Study with Swift3

2DGame作りの勉強

 - 0日目 勉強の道筋
 - [1日目 SpriteKitの雰囲気を感じる](https://github.com/gollowars/study-spriteKit-swift3/tree/master/day1)
 - [2日目 Playgroundでスプライトアニメーション](https://github.com/gollowars/study-spriteKit-swift3/tree/master/day2)
 - [3日目 SpriteKit Particle](https://github.com/gollowars/study-spriteKit-swift3/tree/master/day3)
 - [4日目 SKShader](https://github.com/gollowars/study-spriteKit-swift3/tree/master/day4)
 - [5日目 図形描くのどうすんだ。 - SKShapeNode](https://github.com/gollowars/study-spriteKit-swift3/tree/master/day5)

# 0日目 勉強の道筋
  - 概要
  - みにつける事

## 概要
なんだかんだでしっかりゲーム作ったことなかったので勉強しようと思う。
アクションRPGでもつくろうかし。

 - 目的1 : ゲームの作り方を学ぶ。
 - 目的2 : swift3をいじる。
 - その他目的 : 小銭稼ぎ。音楽を作る。絵を描いたりする。小銭稼ぎ。


## みにつけること
何かを学ぶ時にもcomponent思考ということで、  
できないことをピックアップして、ひとつづつ潰していく感じでいく。  
まずは必要そうな事をピックアップ。
ちなみに必要なことがわからないという状態なので以下はカン


```
└── 設計
      ├── データの管理 （DB設計とか。シナリオを管理とか。realmマスターに）
      ├── Scene管理 （StateMachineのうまい使い方とか？）
      ├── ゲーム画面の設計
          ├── スタート画面の設計 (UIViewでやった方が良いのか SKViewでやった方が良いのか？)
          ├── 草原画面の設計　（マップ上を勇者が歩くあれ。）
          ├── バトル画面の設計　（モンスターと戦うあれ）
      └──テストコード設計

└── 技術
      ├── プログラム
          ├── SpriteKitの勉強
              ├── SKView,SKSceneの使い方 [1日目 SpriteKitの雰囲気を感じる]
              ├── スプライトアニメーション [2日目 Playgroundでスプライトアニメーション]
              ├── パーティクル [3日目 sksファイルを利用してParticleを生成]
              ├── SKShader [4日目 SKShader試してみる。]
              ├── 図形描くのはどうすんだ。SKShapeNode[5日目 図形描くのどうすんだ。 - SKShapeNode]
              ├── 物理エンジン [次回予定]
      ├── キャラクターデザイン
      ├── サウンド制作
      └── シナリオ制作
```

※ここは常に更新してく
