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
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
            }
        })
    }
    
    func createToolbarSettings(action: (() -> Void)?, text: String) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.system(size: 35, weight: .bold))
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
                        .frame(width: 25, height: 25)
                })
                .padding(.trailing, 20)
            }
        })
    }
    
    func createToolbarDetail(action: (() -> Void)?, text: String) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    action?()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 30)
                })
                .padding(.leading, 20)
            }
        })
    }

}
