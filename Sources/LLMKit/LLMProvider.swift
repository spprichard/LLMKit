import LLM
import Foundation

public protocol LanguageModelInference {
    func getCompletion(from input: borrowing String) async -> String
}

extension LLM: LanguageModelInference {}

public actor LLMProvider {
    private let model: LanguageModelInference

    init(model: LanguageModelInference) {
        self.model = model
    }

    func response(to prompt: String) async -> String {
        return await self.model.getCompletion(from: prompt)
    }
}
