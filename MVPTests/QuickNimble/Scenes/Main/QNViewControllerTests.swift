import Quick
import Nimble

@testable import MVP

final class QNViewControllerTests: QuickSpec {
    override func spec() {

        var sut: ViewController!
        var viewSpy: ViewSpy!
        var presenterSpy: PresenterSpy!

        beforeEach {
            viewSpy = ViewSpy()
            presenterSpy = PresenterSpy()
            sut = ViewController(contentView: viewSpy,
                                 presenter: presenterSpy)
        }

        describe("init") {
            it("Should be a kind of ViewControllerType") {
                expect(sut).to(beAKindOf(ViewControllerType.self))
            }
        }
        
        describe("loadView") {
            beforeEach {
                sut.loadView()
            }

            it("Should has a ViewType as view") {
                expect(sut.view).to(beAKindOf(ViewType.self))
            }
        }
        
        describe("viewDidLoad") {
            
            context("when calls presenter method loadData") {
                beforeEach {
                    sut.viewDidLoad()
                }

                it("Should call presenter method loadData once") {
                    expect(presenterSpy.loadDataCallCount).to(equal(1))
                }
            }
            
            context("when bind contentView closure didTapTryAgainButton") {
                beforeEach {
                    sut.viewDidLoad()
                    viewSpy.didTapTryAgainButton?()
                }

                it("Should call presenter method loadData correctly") {
                    expect(presenterSpy.loadDataCallCount).to(equal(2))
                }
            }
        }
        
        describe("show") { @MainActor in
            beforeEach {
                sut.show(state: .loading)
            }

            it("Should call contentView method show correctly") {
                expect(viewSpy.showArgs).to(equal([.loading]))
            }
        }
    }
}
