import SwiftUI

extension Image {
    init?(data: Data?) {
        guard let data = data,
              let uiImage = UIImage(data: data) else { return nil }
        self.init(uiImage: uiImage)
    }
}
