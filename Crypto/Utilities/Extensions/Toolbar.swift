//
//  Toolbar.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 16.02.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func createToolbar(text: String) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .bold()
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
        })
    }
    
    func createToolbarSettings(action: (() -> Void)?, text: String) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .bold()
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    action?()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(width: 10, height: 16)
                })
                .padding(.trailing, 20)
            }
        })
    }
    
    func createToolbarDetail(action: (() -> Void)?, text: String) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .bold()
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    action?()
                }, label: {
                    Image.arrow
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(width: 9, height: 15)
                })
                .padding(.leading, 20)
            }
        })
    }
}
