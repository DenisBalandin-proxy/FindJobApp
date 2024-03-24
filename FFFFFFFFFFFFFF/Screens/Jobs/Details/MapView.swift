//
//  MapView.swift
//  FindJob
//
//  Created by Denis on 3/22/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var data: MapEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(data.company)
                    .font(Resources.Fonts.title3)
                    .foregroundStyle(Resources.Colors.white)
                
                Image(.approved)
            }
            Map(interactionModes: [])
                .frame(height: 58)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("\(data.adress.town), \(data.adress.street), \(data.adress.house)")
                .font(Resources.Fonts.text1)
                .foregroundStyle(Resources.Colors.white)
        }
        .padding(
            EdgeInsets(
                top: 12,
                leading: 16,
                bottom: 12,
                trailing: 16
            )
        )
        .background(Resources.Colors.grey1)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
