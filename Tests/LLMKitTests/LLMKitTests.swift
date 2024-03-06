import XCTest
import LLM
@testable import LLMKit

final class LLMKitTests: XCTestCase {
    func testCanRespondToPromptWithRealModel() async throws {
        let systemPrompt = "You are a human."
        lazy var model = HuggingFaceModel("TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF", .Q2_K, template: .chatML(systemPrompt))
        let testModel = try await LLM(from: model)
        let llm = LLMProvider(model: testModel)
        let response = await llm.response(to: "This is a test")
        XCTAssert(response != "")
    }
}
