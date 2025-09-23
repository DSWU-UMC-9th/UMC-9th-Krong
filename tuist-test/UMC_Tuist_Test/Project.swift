import ProjectDescription

let project = Project(
    name: "UMC_Tuist_Test",
    targets: [
        .target(
            name: "UMC_Tuist_Test",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.UMC-Tuist-Test",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "UMC_Tuist_Test/Sources",
                "UMC_Tuist_Test/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "UMC_Tuist_TestTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.UMC-Tuist-TestTests",
            infoPlist: .default,
            buildableFolders: [
                "UMC_Tuist_Test/Tests"
            ],
            dependencies: [.target(name: "UMC_Tuist_Test")]
        ),
    ]
)
