//
//  ProductDetailView.swift
//  RetailApp
//
//  Created by Anand Nimje on 01/02/25.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.product.name)
                .font(.title)
            Button("Add to Cart") {
                viewModel.addToCart()
            }
        }
        .padding()
    }
}
