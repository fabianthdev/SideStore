// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let cxxSettings: [CXXSetting] = [
  // .define("STEAMCONTROLLER_NO_PRIVATE_API", .when(platforms: [.macOS])),
]

let cSettings: [CSetting] = [
  // .define("STEAMCONTROLLER_NO_PRIVATE_API", .when(platforms: [.macOS])),
  // .define("STEAMCONTROLLER_NO_SWIZZLING")
]

let package = Package(
    name: "SideStore",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13)
	],
    products: [
        // .library(name: "DangerDeps[SideStore]", type: .dynamic, targets: ["DangerDependencies"]), // dev
		.library(name: "SideStore", targets: ["SideStore", "SideStore-ObjC"]),
		.library(name: "AltStoreCore", targets: ["AltStoreCore"]),
		.library(name: "libimobiledevice", targets: ["libimobiledevice"]),
		.library(name: "EmotionalDamage", targets: ["EmotionalDamage"]),
		.library(name: "minimuxer", targets: ["minimuxer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"), // dev
		.package(url: "https://github.com/SideStore/Roxas.git", branch: "swiftpm"),
        // Danger Plugins
        // .package(url: "https://github.com/username/DangerPlugin.git", from: "0.1.0") // dev
    ],
    targets: [
        // .target(name: "DangerDependencies", dependencies: ["Danger", "DangerPlugin"], path: "Dependencies/Danger"), // dev
		.target(name: "SideStore",
				dependencies: ["SideStore-ObjC", "AltStoreCore", "EmotionalDamage", "libimobiledevice", "minimuxer", "em_proxy"],
				path: "AltStore",
				exclude: ["Operations/Patch App/ALTAppPatcher.m"]),

		.target(name: "SideStore-ObjC",
				dependencies: ["Roxas"],
				path: "AltStore",
				sources: ["Operations/Patch App/ALTAppPatcher.m"],
				publicHeadersPath: "Operations/Patch App/"),

		.target(name: "AltStoreCore",
				dependencies: ["AltStoreCore-ObjC"],
				path: "AltStoreCore",
				exclude: [
					"Types/ALTAppPermission.m",
					"Types/ALTPatreonBenefitType.m",
					"Types/ALTSourceUserInfoKey.m"
				]),

		.target(name: "AltStoreCore-ObjC",
				dependencies: ["Roxas"],
				path: "AltStoreCore",
				sources: ["Types/ALTAppPermission.m", "Types/ALTPatreonBenefitType.m", "Types/ALTSourceUserInfoKey.m"],
				publicHeadersPath: "Types"),

		.target(name: "EmotionalDamage",
				dependencies: [""],
				path: "EmotionalDamage"),

		.target(name: "libimobiledevice",
				dependencies: [""],
				path: "Dependencies/libimobiledevice/src",
				publicHeadersPath: "Dependencies/libimobiledevice/include/libimobiledevice"),

		.binaryTarget(	name: "minimuxer",
						path: "Dependencies/minimuxer/target/release/minimuxer.xcframework"),

		.binaryTarget(	name: "em_proxy",
						path: "Dependencies/em_proxy/target/release/em_proxy.xcframework"),

		// 	name: "SideStore",
		// 	// dependencies: [
		// 	// 	.product(name: "RxSwift", package: "RxSwift")
		// 	// ],
		// 	path: "AltStore",
		// 	exclude: ["Info.plist", "*.m"],
		// 	cSettings: cSettings,
		// 	cxxSettings: cxxSettings),

		// .target(
		// 	name: "PVLibrary-ObjC",
		// 	// dependencies: [
		// 	// 	.product(name: "RxSwift", package: "RxSwift")
		// 	// ],
		// 	path: "PVLibrary",
		// 	exclude: ["Info.plist", "*.swift"],
		// 	cSettings: cSettings,
		// 	cxxSettings: cxxSettings),
    ]
)

// cargo build --release --target aarch64-apple-ios