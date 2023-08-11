import Quick
import Nimble

@testable import MVP

final class QNPresenterTestT: QuickSpec {
    override func spec() {

        var sut: Presenter!
        var networkMock: NetworkMock!
        var viewControllerSpy: ViewControllerSpy!

        beforeEach {
            networkMock = NetworkMock()
            viewControllerSpy = ViewControllerSpy()
            sut = Presenter(network: networkMock)
            sut.viewController = viewControllerSpy
        }

        describe("init") {
            it("Should be a kind of PresenterType") {
                expect(sut).to(beAKindOf(PresenterType.self))
            }
        }

        describe("loadData") {
            
            context("when request has success") {
                
                beforeEach {
                    sut.loadData()
                }
                
                it("Should call viewController method show correctly") {
                    expect(viewControllerSpy.showArgs).to(equal([.loading, .ready("Mock result")]))
                }
                
                it("Should call network method fetchStatus once") {
                    expect(networkMock.fetchStatusCallCount).to(equal(1))
                }
            }
            
            context("when request has failure") {
                
                beforeEach {
                    networkMock.returnedResult = .failure(.networkError)
                    sut.loadData()
                }
                
                it("Should call viewController method show correctly") {
                    expect(viewControllerSpy.showArgs).to(equal([.loading, .error]))
                }

                it("Should call network method fetchStatus once") {
                    expect(networkMock.fetchStatusCallCount).to(equal(1))
                }
            }
        }
        
        describe("tryAgain") {
            
            beforeEach {
                networkMock.returnedResult = .failure(.networkError)
                sut.tryAgain()
            }
            
            it("Should call viewController method show correctly") {
                expect(viewControllerSpy.showArgs).to(equal([.loading, .error]))
            }

            it("Should call network method fetchStatus once") {
                expect(networkMock.fetchStatusCallCount).to(equal(1))
            }
        }
    }
}
