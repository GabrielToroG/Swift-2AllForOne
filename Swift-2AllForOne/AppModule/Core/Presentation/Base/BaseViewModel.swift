//
//  BaseViewModel.swift
//  Swift-2AllForOne
//
//  Created by Gabriel Alonso Toro Guzmán on 31-07-23.
//

import Foundation
import Combine

open class BaseViewModel {
    public init() {
    }
    public final var isLoading = PassthroughSubject<Bool, Error>()
    public final var isTopToast = PassthroughSubject<Bool, Error>()
}
