// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import XCTest
import OpenAPIKit30
@testable import CreateAPI

final class GenerateSchemesTests: XCTestCase {
    func testGenerateWithDefaultOptions() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-default", actual: output)
    }
    
    func testGenerateClasses() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.schemes.isGeneratingStructs = false
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-classes", actual: output)
    }
    
    func testPetstoreGenerateClassesWithBaseClass() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.schemes.isGeneratingStructs = false
        options.schemes.baseClass = "NSObject"
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-classes-with-base", actual: output)
    }
    
    func testChangeAccessControl() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.access = nil
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-internal-default", actual: output)
    }
    
    func testDisableCommentsGeneration() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.isGeneratingComments = false
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-disable-comments", actual: output)
    }
    
    func testDisableInitWithCoder() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.schemes.isGeneratingInitWithCoder = false
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-disable-init-with-code", actual: output)
    }
    
    func testPetstoreDisableInlining() {
        // GIVEN
        let spec = spec(named: "petstore")
        let options = GenerateOptions()
        options.isInliningPrimitiveTypes = false
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-schemes-generate-disable-inlining", actual: output)
    }
    
    func testPetstoreExpanded() {
        // GIVEN
        let spec = spec(named: "petstore-expanded")
        let options = GenerateOptions()
        options.isGeneratingComments = false
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
                
        // THEN
        compare(expected: "petstore-expanded-schemes-generate-default", actual: output)
    }
    
    func testPetstoreAllDefault() {
        // GIVEN
        let spec = spec(named: "petstore-all")
        let options = GenerateOptions()
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
        
        // THEN
        compare(expected: "petstore-all-schemes-generate-default", actual: output)
    }

    func testGenerateGithub() {
        // GIVEN
        let spec = spec(named: "github")
        let options = GenerateOptions()
        
        // WHEN
        let output = GenerateSchemas(spec: spec, options: options, verbose: false).run()
        
        // THEN
        compare(expected: "github-schemes-generate-default", actual: output)
    }
}