// swift-tools-version:5.4
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
	platforms: [
		.iOS(.v13),
		.tvOS(.v13)
	],
    products: [
        .library(name: "DangerDeps[SideStore]", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"), // dev
        // Danger Plugins
        // .package(url: "https://github.com/username/DangerPlugin.git", from: "0.1.0") // dev
    ],
    targets: [
        .target(name: "DangerDependencies", dependencies: ["Danger", "DangerPlugin"]) // dev
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
