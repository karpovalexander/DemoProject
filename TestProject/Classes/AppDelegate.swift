//
//  AppDelegate.swift
//  TestProject


import UIKit

/*
 Технические требования
 Верстка - Autolayout c использованием Interface Builder
 Язык разработки - Swift
 Задача
 1) Сверстать экран мобильного приложения и реализовать корректную логику работы всех его элементов
 • Поле ввода должно быть активно, при появлении клавиатуры контент на экране должен адаптироваться. По нажатию на return, клавиатура должна скрываться
 • Кнопка info  должна модально открывать пустой экран с возможностью закрыть его.
 • Горизонтальный слайдер должен работать в режиме пагинации, все баннеры в слайдере (за исключением первого и последнего) должны центрироваться. Слайдер должен скроллиться вместе с остальным контентом.
 • По свайпу влево у ячеек должна появляться кнопка удаления, никакого действия по нажатию на нее производиться не должно.
 2) Реализовать загрузку отображаемых данных с сервера. Спецификация запросов представлена в формате Swagger-документа в файле test.yaml
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureNavigationBarApperance()
        configureRootViewController()
        
        return true
    }
    
    // MARK: -
    
    private func configureRootViewController() {
        guard let viewController = UIViewController.instantiateInitialViewController(fromStoryboard: .home) else {
            return
        }
        let navController = UINavigationController(rootViewController: viewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    private func configureNavigationBarApperance() {
        let apperance = UINavigationBar.appearance()
        apperance.barTintColor = Color.white
        apperance.shadowImage = UIImage()
        apperance.isTranslucent = true
        apperance.setBackgroundImage(UIImage(), for: .default)
    }
}

