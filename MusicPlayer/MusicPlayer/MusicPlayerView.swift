import SwiftUI

struct PlayingMusicview: View {
    
    @State private var progressSong : Double  = 0.03
    var body: some View {
        ZStack(){
            LinearGradient(
                colors: [
                    Color(hex: "8D6E63"),
                    Color(hex: "212121")
            ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(.all)
            
            VStack(spacing : 12){
                
                //Top bar
                HStack(alignment: .center, spacing : 24){
                    Button(action: {}){
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                    Spacer()
                    Text("Liked Songs")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.white)
                            .font(.system(size: 22, weight: .semibold))
                    }
                }
                .padding(.horizontal, 24)
                
                
                //Cover image song
                VStack {
                    Image("cover")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 370, height: 370)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                        )
                }
                .padding(.top, 24)
                
                
                //Info Author, Song title
                HStack(spacing : 24) {
                    VStack(alignment : .leading ,spacing : 12) {
                        Text("Ode - Nitefreak Remix")
                            .foregroundStyle(.white)
                            .font(.system(size: 26, weight: .bold))
                        
                        Text("Nitefreak - Oluwadamvic")
                            .foregroundStyle(.white)
                            .font(.system(size: 16,weight: .semibold))
                    }
                    Spacer()
                    Button(action : {}){
                        Image(systemName: "checkmark")
                            .foregroundStyle(.foreground)
                            .font(.system(size: 16))
                            .padding(6)
                    }
                    .background(Color.green)
                    .clipShape(.circle)
                    
                }
                .padding(.top, 28)
                .padding(.horizontal, 24)
                
                
                //Slider (music progress)
                
                VStack(spacing : 12){
                    SpotifySlider(value: $progressSong)
                        .tint(.white)
                    HStack(){
                        Text("0:02")
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.8))
                        Spacer()
                        Text("-3.57")
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                
                //Player Controls
                
                HStack(){
                    Image(systemName: "shuffle")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.green)
                    Spacer()
                    Image(systemName: "backward.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "pause.circle.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "forward.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "arrow.trianglehead.rectanglepath")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 24)
            
                //Play  Controls
                
                HStack {
                    HStack{
                        Image(systemName: "headphones")
                            .foregroundStyle(.green)
                        Text("Redmi Buds 6 Lite")
                            .font(.system(size: 12))
                            .foregroundStyle(.green)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.white)
                        Image(systemName: "list.bullet.below.rectangle")
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    PlayingMusicview()
}

