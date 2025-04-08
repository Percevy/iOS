import SwiftUI

extension Font {
    public static func percevyFont(_ style: PercevyTextStyle) -> Font {
        switch style {
        case .heading1:
            return .pretendard(size: 34, weight: .heavy)
        case .heading2:
            return .pretendard(size: 26, weight: .heavy)
        case .subHeading1:
            return .pretendard(size: 20, weight: .bold)
        case .subHeading2:
            return .pretendard(size: 18, weight: .bold)
        case .body1:
            return .pretendard(size: 16, weight: .bold)
        case .body2:
            return .pretendard(size: 16, weight: .medium)
        case .metaData1:
            return .pretendard(size: 14, weight: .medium)
        case .metaData2:
            return .pretendard(size: 12, weight: .medium)
        case .metaData3:
            return .pretendard(size: 12, weight: .bold)
        }
    }
    
    private static func pretendard(size fontSize: CGFloat, weight: Font.Weight) -> Font {
        let familyName = "Pretendard"
        
        var weightString: String
        switch weight {
        case .black: weightString = "Black"
        case .heavy: weightString = "ExtraBold"
        case .bold: weightString = "Blod"
        case .semibold: weightString = "SemiBold"
        case .medium: weightString = "Medium"
        case .regular: weightString = "Regular"
        case .light: weightString = "Light"
        case .thin: weightString = "Thin"
        case .ultraLight: weightString = "ExtraLight"
        default: weightString = "Regular"
        }
        
        return .custom("\(familyName)-\(weightString)", size: fontSize)
    }
    
    public enum PercevyTextStyle {
        case heading1
        case heading2
        case subHeading1
        case subHeading2
        case body1
        case body2
        case metaData1
        case metaData2
        case metaData3
    }
}
