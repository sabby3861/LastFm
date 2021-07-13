//
//  LastFmTests.swift
//  LastFmTests
//
//  Created by Sanjay Chauhan on 12/07/2021.
//

import XCTest
@testable import LastFm

class LastFmTests: XCTestCase, PayLoadFormat {
    
    var router: TestLFSongsRouter!
    var service: APIManagerProtocol!
    var view: LFSongsViewProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        router = TestLFSongsRouter()
        service = APIManager()
        view = LFSongsViewController()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        router = nil
        service = nil
        view = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /**
     Test case to check if the Module gas been added and the view has been configured to show
     */
    func testThatItShowsSongsViewScreen() {
        router.assembleModule(view: view)
        XCTAssertTrue(router.showSongsViewCalled)
        XCTAssertNil(router.presenter?.view, "View can not be nil")
    }
    
    func testAlbumsAPICalls()  {
        var apiModule = LFAPIModule()
        apiModule.payloadType = LFHTTPPayloadType.requestMethodGET
        apiModule.searchType = .album
        apiModule.searchText = "Love"
        let payload = formatGetPayload(url: .albumsUrl, module: apiModule)
        let api = APIManager()
        let expect = expectation(description: "API response completion")
        api.getAlbumsInfo(payload: payload) { result in
            expect.fulfill()
            switch result {
            case .success(let data):
                XCTAssertTrue( data.albums.albumMatches.album!.count > 0, "Albums should not be empty" );
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 7, handler: nil)
    }
    
    func testArtistsAPICalls()  {
        var apiModule = LFAPIModule()
        apiModule.payloadType = LFHTTPPayloadType.requestMethodGET
        apiModule.searchType = .artist
        apiModule.searchText = "John"
        let payload = formatGetPayload(url: .albumsUrl, module: apiModule)
        let api = APIManager()
        let expect = expectation(description: "API response completion")
        api.getArtistInfo(payload: payload) { result in
            expect.fulfill()
            switch result {
            case .success(let data):
                XCTAssertTrue( data.result.artistMatches.matches!.count > 0, "Artists should not be empty" );
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 7, handler: nil)
    }

    func testSongsAPICalls()  {
        var apiModule = LFAPIModule()
        apiModule.payloadType = LFHTTPPayloadType.requestMethodGET
        apiModule.searchType = .song
        apiModule.searchText = "John"
        let payload = formatGetPayload(url: .albumsUrl, module: apiModule)
        let api = APIManager()
        let expect = expectation(description: "API response completion")
        api.getSongsInfo(payload: payload) { result in
            expect.fulfill()
            switch result {
            case .success(let data):
                XCTAssertTrue( data.songs.trackMatches.matches!.count > 0, "Songs should not be empty" );
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 7, handler: nil)
    }
    //Unhappy path, failing the API call for Songs when wrong type is passed
    // Change the search type to any type except song and it will fail gracefully
    func testFailSongsAPICalls()  {
        var apiModule = LFAPIModule()
        apiModule.payloadType = LFHTTPPayloadType.requestMethodGET
        apiModule.searchType = .artist
        apiModule.searchText = "John"
        let payload = formatGetPayload(url: .albumsUrl, module: apiModule)
        let api = APIManager()
        let expect = expectation(description: "API response completion")
        api.getSongsInfo(payload: payload) { result in
            expect.fulfill()
            switch result {
            case .success(let data):
                XCTAssertTrue( data.songs.trackMatches.matches!.count > 0, "Songs should not be empty" );
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 7, handler: nil)
    }
}

extension LastFmTests {
    class TestLFSongsRouter: LFSongsRouterProtocol {
        var presenter: LFSongsPresenterProtocol?
        
        var showSongsViewCalled = false
        func assembleModule(view: LFSongsViewProtocol) {
            self.showSongsViewCalled = true
        }
    }
}
