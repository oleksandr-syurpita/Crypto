//
//  GraphView.swift
//  Crypto
//
//  Created by Oleksandr Syurpita on 17.02.2023.
//

import SwiftUI

struct GraphView: View {
    
    @ObservedObject var viewModel: GraphViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .bottom, spacing: 26) {
                    ForEach(viewModel.priceInfoViewModels) { priceInfoViewModel in
                        Rectangle()
                            .foregroundColor(priceInfoViewModel.color)
                            .frame(width: 35, height: (Double(viewModel.fullBarHeight) / viewModel.maxValue) * priceInfoViewModel.price)
                            .cornerRadius(.infinity)
                    }
                }
                divider
                HStack(spacing: 9) {
                    ForEach(viewModel.priceInfoViewModels) { val in
                        Text(val.day)
                    }
                    .frame(width: 50, height: 30)
                    .foregroundColor(Color.cultured)
                    .background(Color.monochrome)
                    .cornerRadius(40)
                    .padding(.bottom, 10)
                }
            }
        }
        .frame(width: 330, height: 330, alignment: .bottom)
        .background(Color.noire)
        .cornerRadius(15)
    }
}

private extension GraphView {
    var divider: some View {
        Color.gray
            .cornerRadius(.infinity)
            .frame(height: 5)
            .padding([.trailing, .leading], 25)
    }
}

 let coinInfo: [PriceInfo] = [
     PriceInfo(price: 90.4, day: "01.11"),
     PriceInfo(price: 21.0, day: "02.11"),
     PriceInfo(price: 54.4, day: "03.11"),
     PriceInfo(price: 32.4, day: "04.11"),
     PriceInfo(price: 54.4, day: "05.11")
 ]

struct GraphComponentView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(viewModel: .init(coinInfo: coinInfo))
    }
}
