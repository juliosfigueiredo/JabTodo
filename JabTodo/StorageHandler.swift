//
//  StorageHandler.swift
//  JabTodo
//
//  Created by Julio Figueiredo on 09/12/22.
//

import Foundation


class StorageHandler {

    
    //MARK: - Configurando Plist
    static private var plistURL: URL {
        
        //Selecionando a pasta documents.
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        //Criando o arquivo Plist na pasta documents.
        return documents.appendingPathComponent("tarefas.plist")
    }
    
    
    //MARK: - Criando novo item
    static func write(item: Tarefa) {
        
        //Verificando se já existe um Plist
        if !FileManager.default.fileExists(atPath: plistURL.path) {
            
            //Criando novo Plist com o item desejado.
            FileManager.default.createFile(atPath: plistURL.path, contents: prepareData([item]), attributes: nil)
            
            //Printando o caminho do arquivo criado no console.
            print(plistURL.path)
            
        } else {
            
            //Consultando itens pré-existentes e inserido o item desejado.
            var currentItens = StorageHandler.load()
            currentItens.append(item)
            try? prepareData(currentItens).write(to: plistURL)
            
        }
    }
    
    
    //MARK: - Consultando itens
    static func load() -> [Tarefa] {
        let decoder = PropertyListDecoder()

        guard let data = try? Data.init(contentsOf: plistURL), let preferences = try? decoder.decode([Tarefa].self, from: data)
          else { return [] }

        return preferences
    }
    
    
    //MARK: - Excluíndo Plist
    static func deleteAll() {
       
        //Verificando se já existe um Plist
        if FileManager.default.fileExists(atPath: plistURL.path) {
            
            //Deletando o arquivo.
            try? FileManager.default.removeItem(at: plistURL)
        }
    }
        
        
    //MARK: - Função que ajuda a `empacotar o dado` para que ele possa ser salvo e consultado de uma maneira mais simples.
    static func prepareData(_ value: [Tarefa]) -> Data{
        
        let encoder = PropertyListEncoder()
        
        guard let data = try? encoder.encode(value) else {
            return Data()
        }
        
        return data
    }
}
