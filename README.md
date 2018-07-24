
YZAlertController
==============

Harness the UIAlertController  with a simplified, chainable and expressive syntax.

Demo Project
==============
See `Demo/YZAlertControllerDemo.xcodeproj`

Installation
==============

### CocoaPods

1. Add `pod 'YZAlertController'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<YZAlertController/YZAlertController.h\>.


### Carthage

1. Add `github "CancerQ/YZAlertController"` to your Cartfile.
2. Run `carthage update --platform ios` and add the framework to your project.
3. Import \<YZAlertController/YZAlertController.h\>.

### Manually

1. Download all the files in the `YYKit` subdirectory.
2. Add the source files to your Xcode project.
3. Link with required frameworks:
    * UIKit
    * CoreFoundation

Requirements
==============
This library requires `iOS 8.0+` and `Xcode 9.0+`.

Notice
==============
I want to use the APIs as if it was provided by system, and I don't add prefix in
these categories. I do not recommend using the `YZAlertController` directly, you should try the separated components first.

License
==============
YZAlertController is provided under the MIT license. See LICENSE file for details.


<br/><br/>
---
中文介绍
==============
YZAlertController 是将UIAlertController使用简化的、可链接的和表达性的语法来封装利用。

演示项目
==============
查看并运行 `Demo/YZAlertControllerDemo.xcodeproj`

安装
==============

### CocoaPods

1. 在 Podfile 中添加  `pod 'YZAlertController'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<YZAlertController/YZAlertController.h\>。


### Carthage

1. 在 Cartfile 中添加 `github "CancerQ/YZAlertController"`。
2. 执行 `carthage update --platform ios` 并将生成的 framework 添加到你的工程。
3. 导入 \<YZAlertController/YZAlertController.h\>。

### 手动安装

1. 下载 YZAlertController 文件夹内的所有内容。
2. 将 YZAlertController 内的源文件添加(拖放)到你的工程。
3. 链接以下 frameworks:
    * UIKit
    * CoreFoundation

系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 9.0`。

许可证
==============
YZAlertController 使用 MIT 许可证，详情见 LICENSE 文件。


