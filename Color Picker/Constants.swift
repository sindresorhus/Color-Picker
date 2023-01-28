import Cocoa
import KeyboardShortcuts

extension Defaults.Keys {
	static let recentlyPickedColors = Key<[NSColor]>("recentlyPickedColors", default: [])

	// Settings
	static let showInMenuBar = Key<Bool>("showInMenuBar", default: false)
	static let hideMenuBarIcon = Key<Bool>("hideMenuBarIcon", default: false)
	static let showColorSamplerOnOpen = Key<Bool>("showColorSamplerOnOpen", default: false)
	static let menuBarItemClickAction = Key<MenuBarItemClickAction>("menuBarItemClickAction", default: .showMenu)
	static let preferredColorFormat = Key<ColorFormat>("preferredColorFormat", default: .hex)
	static let stayOnTop = Key<Bool>("stayOnTop", default: true)
	static let uppercaseHexColor = Key<Bool>("uppercaseHexColor", default: false)
	static let hashPrefixInHexColor = Key<Bool>("hashPrefixInHexColor", default: false)
	static let legacyColorSyntax = Key<Bool>("legacyColorSyntax", default: false)
	static let shownColorFormats = Key<Set<ColorFormat>>("shownColorFormats", default: [.hex, .hsl, .rgb, .lch])
	static let largerText = Key<Bool>("largerText", default: false)
	static let copyColorAfterPicking = Key<Bool>("copyColorAfterPicking", default: false)
	static let showAccessibilityColorName = Key<Bool>("showAccessibilityColorName", default: false)
}

extension KeyboardShortcuts.Name {
	static let pickColor = Self("pickColor")
	static let toggleWindow = Self("toggleWindow")
}

enum ColorFormat: String, CaseIterable, Defaults.Serializable {
	case hex
	case hsl
	case rgb
	case lch

	var title: String {
		switch self {
		case .hex:
			return "Hex"
		case .hsl:
			return "HSL"
		case .rgb:
			return "RGB"
		case .lch:
			return "LCH"
		}
	}
}

extension ColorFormat: Identifiable {
	var id: Self { self }
}

enum MenuBarItemClickAction: String, CaseIterable, Defaults.Serializable {
	case showMenu
	case showColorSampler
	case toggleWindow

	var title: String {
		switch self {
		case .showMenu:
			return "Show menu"
		case .showColorSampler:
			return "Show color sampler"
		case .toggleWindow:
			return "Toggle window"
		}
	}

	var tip: String {
		switch self {
		case .showMenu:
			return "Right-click to show the color sampler"
		case .showColorSampler, .toggleWindow:
			return "Right-click to show the menu"
		}
	}
}
