//
//  HexagonViewController.swift
//  Sample
//
//  Created by Edward Toy on 19/06/2021.
//

import UIKit
import Sixsmith

class HexagonViewController: UIViewController {

    var hexagonView: HexagonView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "suitcase"), tag: 0)
        
        let hexagonView = HexagonView(frame: view.frame)
        hexagonView.backgroundColor = .systemBackground
        
        view.addSubview(hexagonView)
        
        self.hexagonView = hexagonView
    }
}

extension HexagonViewController: HexGroupDataSource {
    var coordinateSystem: CoordinateSystem {
        .increaseTowardBottomRight
    }
    
    var groupOrigin: Vector2 {
        .init(
            Double(view.frame.size.width) / 2,
            Double(view.frame.size.height) / 2
        )
    }
    
    var groupShape: HexGroup.Shape {
        .hexagon(radius: 4)
    }
    
    var hexagonSize: Double {
        25.0
    }
    
    var hexagonScaleFactor: Double {
        0.95
    }
    
    var hexagonOrientation: Orientation {
        .flat
    }
}


extension HexagonViewController: HexDrawDelegate {
    func dataForHex(_ hex: Hex, drawData: DrawData) {
        hexagonView?.paths.append(drawData.vertices)
    }
    
    func drawDidFinish() {
        
    }
}
