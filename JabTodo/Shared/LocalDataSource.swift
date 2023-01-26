//
//  LocalDataSource.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 26/01/23.
//

import Foundation
import UserNotifications
import NotificationCenter

class LocalDataSource {
  
    static var shared: LocalDataSource = LocalDataSource()
  
    private init() {}
    
    private func saveAppInit() {
        UserDefaults.standard.set(true, forKey: "app_init")
    }
    
    private func getAppInit() -> Bool {
        let appInit = UserDefaults.standard.bool(forKey: "app_init")
        
        return appInit
    }
    
    private func removeNotification(id: String) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [id])
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    func addNotification(id: String, message: String, time: TimeInterval) {
        let stopNotificationAction = UNNotificationAction(identifier: "jabTodo.stopNotificationAction", title: "Parar notificação", options: [])
        let cancelarAction = UNNotificationAction(identifier: "jabTodo.cancelarAction", title: "Cancelar", options: [])

        let remediosCategory = UNNotificationCategory(
            identifier: "jabTodo",
            actions: [stopNotificationAction, cancelarAction],
            intentIdentifiers: [],
            options: .customDismissAction)
        let content = UNMutableNotificationContent()
        content.title = "Tarefas"
        content.body = message
        content.sound = .default
        content.categoryIdentifier = "jabTodo"

        UNUserNotificationCenter.current().setNotificationCategories([remediosCategory])
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: time, repeats: true)

        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}

extension LocalDataSource {
    
    // MARK: - Adiciona uma notificação local passando um id, uma mensagem e um intervalo
    func setNotification(id: String, message: String, time: TimeInterval) {
        addNotification(id: id, message: message, time: time)
    }
    
    // MARK: - Deleta uma notificação local passando um id
    func deleteNotication(id: String) {
        removeNotification(id: id)
    }
    
    // MARK: - Essa função é chamada quando o usuario clicar no botão começar da mensagem de boas vinda para que ela não apareça mais
    func setAppInit() {
        saveAppInit()
    }
    
    // MARK: - Checa se o usuario clicou no botão começar da mensagem de boas vindas para que ela seja ou não mostrada
    func checkAppInit() -> Bool {
        return getAppInit()
    }
}
