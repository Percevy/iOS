import SwiftUI

struct PercevyNavigationBarModifier: ViewModifier {
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) private var presentationMode
    let title: String

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: backButtonTapped) { Image(.back) }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Text(title)
                        .font(.percevyFont(.subHeading1))
                        .foregroundStyle(.neutralActive)
                }
            }
            .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
                if (value.startLocation.x < 30 && value.translation.width > 100) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
    }



    private func backButtonTapped() {
        presentationMode.wrappedValue.dismiss()
    }
}

extension View {
    func percevyNavigationBar(title: String) -> some View {
        self.modifier(PercevyNavigationBarModifier(title: title))
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
