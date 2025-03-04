//
//  SceneDelegate.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create the main tab bar controller
                let tabBarController = UITabBarController()
                
                // Home
                let homeVC = HomeViewController()
                homeVC.tabBarItem = UITabBarItem(
                    title: "Home",
                    image: UIImage(named: "home"),
                    selectedImage: UIImage(named: "home")
                )
                
                // Generator
                let generatorVC = UIViewController()
                generatorVC.view.backgroundColor = .white
                generatorVC.tabBarItem = UITabBarItem(
                    title: "Generator",
                    image: UIImage(named: "magicpen"),
                    selectedImage: UIImage(named: "magicpen")
                )
                
                // Add
                let addVC = UIViewController()
                addVC.view.backgroundColor = .white
                addVC.tabBarItem = UITabBarItem(
                    title: "Add",
                    image: UIImage(named: "pluscircle"),
                    selectedImage: UIImage(named: "pluscircle")
                )
                
                // Favourite
                let favouriteVC = UIViewController()
                favouriteVC.view.backgroundColor = .white
                favouriteVC.tabBarItem = UITabBarItem(
                    title: "Favourite",
                    image: UIImage(named: "tabheart"),
                    selectedImage: UIImage(named: "tabheart")
                )
                
                // Planner
                let plannerVC = UIViewController()
                plannerVC.view.backgroundColor = .white
                plannerVC.tabBarItem = UITabBarItem(
                    title: "Planner",
                    image: UIImage(named: "calendar"),
                    selectedImage: UIImage(named: "calendar")
                )
                
                // Assign all controllers to the tab bar
                tabBarController.viewControllers = [
                    homeVC, generatorVC, addVC, favouriteVC, plannerVC
                ]
                
                // Set up the window
                window = UIWindow(windowScene: windowScene)
                window?.rootViewController = tabBarController
                window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

