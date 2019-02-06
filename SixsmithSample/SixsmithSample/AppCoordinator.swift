
import UIKit

class AppCoordinator: NSObject {

    let uiViewController: UIHexagonViewController
    let spriteKitCoordinator: SpriteKitCoordinator

    var rootViewController: UIViewController {
        return tabBarController
    }

    let tabBarController: UITabBarController

    override init() {
        tabBarController = UITabBarController()

        uiViewController = UIHexagonViewController()
        spriteKitCoordinator = SpriteKitCoordinator()
    }

    func start() {
        uiViewController.tabBarItem = UITabBarItem(title: "UIKit", image: UIImage(named: "UIKitImage"), selectedImage: nil)

        tabBarController.viewControllers = [uiViewController, spriteKitCoordinator.rootViewControlle]

        tabBarController.delegate = self
    }
}

extension AppCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is SKHexagonViewController {
            spriteKitCoordinator.start()
        }
    }
}
