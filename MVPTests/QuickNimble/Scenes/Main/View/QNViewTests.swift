import Quick
import Nimble
import UIKit

@testable import MVP

final class QNViewTests: QuickSpec {
    override func spec() {

        var sut: View!

        beforeEach {
            sut = View()
            sut.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                    height: UIScreen.main.bounds.height)
            sut.layoutSubviews()
        }

        describe("init") {
            it("Should be a kind of ViewType") {
                expect(sut).to(beAKindOf(ViewType.self))
            }
        }
        
        describe("show") {
            
            context("when state is .ready") {
                
                beforeEach {
                    sut.show(state: .ready("teste"))
                }

                it("should set title property correctly") {
                    let titleLabel = sut.getSubView(by: "labelTitle") as? UILabel
                    
                    expect(titleLabel?.text).to(equal("teste"))
                    expect(titleLabel?.isHidden).to(beFalse())
                }
            }
            
            context("when state is .loading") {
                
                beforeEach {
                    sut.show(state: .loading)
                }
                
                it("should set loadingView property correctly") {
                    let loadingView = sut.getSubView(by: "viewLoading")

                    expect(loadingView?.isHidden).to(beFalse())
                }
            }
            
            context("when state is .error") {
                
                beforeEach {
                    sut.show(state: .error)
                }
                
                it("should set tryAgainButton property correctly") {
                    let errorButton = sut.getSubView(by: "buttonTryAgain")

                    expect(errorButton?.isHidden).to(beFalse())
                }
            }
        }
    }
}
