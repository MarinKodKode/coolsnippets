import Foundation
import SwiftUI

struct SpotifySlider: View {
    @Binding var value: Double // Valor de 0.0 a 1.0
    @State private var isDragging: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // 1. Barra de fondo (Gris oscuro)
                Capsule()
                    .fill(Color.white.opacity(0.3))
                    .frame(height: isDragging ? 6 : 4) // Se hace más gruesa al tocar
                
                // 2. Barra de progreso (Blanca)
                Capsule()
                    .fill(Color.white)
                    .frame(width: CGFloat(value) * geometry.size.width, height: isDragging ? 6 : 4)
                
                // 3. El Indicador (Thumb) - Solo visible o más grande al arrastrar
                Circle()
                    .fill(Color.white)
                    .frame(width: isDragging ? 12 : 0) // Aparece al interactuar
                    .offset(x: (CGFloat(value) * geometry.size.width) - 6)
                    .shadow(radius: 4)
            }
            .contentShape(Rectangle()) // Área de toque extendida
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        isDragging = true
                        let rawValue = gesture.location.x / geometry.size.width
                        self.value = max(0, min(1, Double(rawValue)))
                    }
                    .onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isDragging = false
                        }
                    }
            )
        }
        .frame(height: 8)
        .animation(.spring(response: 0.3), value: isDragging)
    }
}
