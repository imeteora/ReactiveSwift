//
//  Reactive.swift
//  reactive_swift
//
//  Created by Zhu Delun on 2018/7/20.
//  Copyright © 2018 GameBable Inc, Ltd. All rights reserved.
//

import Foundation

public struct Reactable<Base> {
    public var base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ReactableCompatible {
    associatedtype CompatibleType

    static var react: Reactable<CompatibleType>.Type { get set }
    var react: Reactable<CompatibleType> { get set }
}

extension ReactableCompatible {
    public static var react: Reactable<Self>.Type {
        get {
            return Reactable<Self>.self
        }
        set {
            // EMPTY
        }
    }

    public var react: Reactable<Self> {
        get {
            return Reactable(self)
        }
        set {
            // EMPTY
        }
    }
}

extension NSObject: ReactableCompatible {}


