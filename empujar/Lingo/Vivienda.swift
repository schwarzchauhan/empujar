//
//  Vivienda.swift
//  empujar
//
//  Created by Harsh Chauhan on 9/13/25.
//


import SwiftUI
import Translation

struct Vivienda: View {
    @State private var showTranslation = false
    @State private var sampleText: String = "Home"
    
    var body: some View {
        ContentView(showTranslation: $showTranslation, sampleText: $sampleText)
    }
}

struct Article: Identifiable {
    var id: UUID = UUID()
    var text: String = ""
    var translatedText: String = ""
}

struct ContentView: View {
    @Binding var showTranslation: Bool
    @Binding var sampleText: String
    @State private var configuration: TranslationSession.Configuration? =
        TranslationSession.Configuration(
            source: .init(identifier: "en-US"),
            target: .init(identifier: "es")   // Spanish (generic)
        )
    
    // TODO: - HARSH CHAUHAN Add the sf symbols
    @State public var articles: [Article] = ["the home",
                                             "the sofa",
                                             "the lamp",
                                             "the cushion"].map { str in
        Article(id: UUID(), text: str)
    }
    
    func updateTranslation(response: TranslationSession.Response) {
        
        guard let index = articles.firstIndex(where: { $0.id.uuidString == response.clientIdentifier }) else {
            return
        }
        
        articles[index].translatedText = response.targetText
        
    }
    
    var body: some View {
        VStack {
            
            List(articles) { article in
                Text(article.translatedText)
            }
            .translationTask(configuration) { session in
                
                let requests = articles.map { TranslationSession.Request(sourceText: $0.text, clientIdentifier: $0.id.uuidString) }
                
                if let responses = try? await session.translations(from: requests) {
                    
                    responses.forEach { response in
                        updateTranslation(response: response)
                    }
                }
            }
        }
    }

}


struct Vivienda_Previews: PreviewProvider {
    static var previews: some View {
        Vivienda()
    }
}
