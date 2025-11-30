# HealthLife 🏃‍♂️

一款基于 Flutter 的健康生活管理应用，帮助用户养成健康习惯、追踪健康数据、实现健康目标。

## 功能特性

### 📊 数据追踪
- **健康数据同步** - 支持 Apple Health (iOS) 和 Health Connect (Android)
- **体重记录** - 手动记录体重，查看趋势图表
- **热量管理** - 记录三餐热量，智能计算热量预算
- **活动日历** - 周/月视图查看运动数据

### 🎯 目标管理
- **目标模板** - 提供常用健康目标模板（喝水、运动、睡眠等）
- **自定义目标** - 支持创建个性化目标，设置提醒
- **打卡系统** - 每日打卡，追踪完成进度
- **数据回顾** - 目标完成情况统计与分析

### 🐾 宠物养成
- **虚拟宠物** - 完成目标获得经验值，养成专属宠物
- **等级系统** - 宠物随经验升级，解锁不同称号
- **里程碑奖励** - 达成特定目标获得成就奖励

### 📅 每周回顾
- **数据汇总** - 自动生成每周健康数据报告
- **智能称号** - 根据表现生成个性化周称号
- **分享卡片** - 生成精美分享图片，一键分享

### 🤖 AI 健康助手
- **智能对话** - 基于 LangChain + OpenAI Compatible API
- **个性化建议** - 结合用户健康数据提供定制建议
- **多模型支持** - 支持 OpenAI、Azure、Ollama、DeepSeek 等

### ⚙️ 设置与个性化
- **多语言** - 支持中文/英文
- **单位切换** - kg/lb、cm/inch 自由切换
- **通知提醒** - 目标提醒、打卡提醒
- **AI 配置** - 自定义 API 端点、密钥、模型

## 技术架构

### 技术栈

| 类别 | 技术 |
|-----|-----|
| 框架 | Flutter 3.10+ / Dart |
| 状态管理 | Riverpod 2.x + Riverpod Generator |
| 路由 | GoRouter |
| 数据库 | Drift (SQLite) |
| AI | LangChain Dart + OpenAI Compatible |
| 健康数据 | health 包 (HealthKit / Health Connect) |
| 代码生成 | Freezed 3.x, JSON Serializable |
| 图表 | fl_chart |
| 通知 | flutter_local_notifications |

### 项目结构

```
lib/
├── app/                    # 应用入口、路由、全局 Provider
│   ├── app.dart
│   ├── router.dart
│   └── providers.dart
├── core/                   # 核心工具和常量
│   ├── constants/          # 常量定义
│   ├── theme/              # 主题配置
│   └── utils/              # 工具类 (BMI计算、热量计算等)
├── features/               # 功能模块 (按功能划分)
│   ├── dashboard/          # 首页仪表盘
│   ├── goals/              # 目标管理
│   ├── gamification/       # 宠物养成
│   ├── chat_ai/            # AI 助手
│   ├── review/             # 每周回顾
│   ├── activity_calendar/  # 活动日历
│   ├── meals/              # 饮食记录
│   ├── weight/             # 体重记录
│   ├── health_source/      # 健康数据源
│   ├── onboarding/         # 引导流程
│   ├── profile/            # 个人资料
│   └── settings/           # 设置
├── shared/                 # 共享组件
│   ├── db/                 # 数据库 (Drift)
│   │   ├── tables/         # 表定义
│   │   └── daos/           # 数据访问对象
│   ├── repositories/       # 数据仓库
│   ├── services/           # 服务层
│   └── widgets/            # 通用组件
└── main.dart
```

### 功能模块架构

每个功能模块遵循清晰的分层架构：

```
feature/
├── application/     # 业务逻辑层 (Notifier/Service)
├── domain/          # 领域模型 (Freezed 数据类)
└── presentation/    # UI 层
    ├── *_page.dart  # 页面
    └── widgets/     # 页面专属组件
```

### 数据流

```
UI (Widget)
    ↓ watch/read
Provider (Riverpod)
    ↓ 
Notifier (业务逻辑)
    ↓
DAO (数据访问)
    ↓
Drift Database (SQLite)
```

## 快速开始

### 环境要求

- Flutter SDK >= 3.10.0
- Dart SDK >= 3.0.0
- Xcode 15+ (iOS 开发)
- Android Studio (Android 开发)

### 安装依赖

```bash
# 克隆项目
git clone https://github.com/helloandworlder/healthlife.git
cd healthlife

# 安装依赖
flutter pub get

# 生成代码 (Freezed, Drift, Riverpod)
dart run build_runner build --delete-conflicting-outputs
```

### 运行项目

```bash
# iOS 模拟器
flutter run -d "iPhone 16 Pro"

# Android 模拟器
flutter run -d emulator-5554

# 真机运行 (需要连接设备)
flutter run
```

### iOS 配置 (HealthKit)

1. 在 Xcode 中打开 `ios/Runner.xcworkspace`
2. 选择 Runner target → Signing & Capabilities
3. 添加 HealthKit capability
4. 在 `ios/Runner/Info.plist` 中已配置健康数据权限说明

> ⚠️ 注意：iOS 模拟器不支持 HealthKit，请使用真机测试健康数据同步功能

### Android 配置 (Health Connect)

1. 确保设备已安装 Health Connect 应用
2. 权限配置已在 `AndroidManifest.xml` 中完成

## 打包发布

### iOS 打包

```bash
# 构建 Release 版本
flutter build ios --release

# 在 Xcode 中归档
# Product → Archive → Distribute App
```

### Android 打包

```bash
# 构建 APK
flutter build apk --release

# 构建 App Bundle (推荐上架 Google Play)
flutter build appbundle --release
```

### 签名配置

#### Android 签名

1. 生成签名密钥：
```bash
keytool -genkey -v -keystore ~/healthlife-release.jks -keyalg RSA -keysize 2048 -validity 10000 -alias healthlife
```

2. 创建 `android/key.properties`：
```properties
storePassword=<密码>
keyPassword=<密码>
keyAlias=healthlife
storeFile=/path/to/healthlife-release.jks
```

3. 在 `android/app/build.gradle.kts` 中配置签名

## 开发指南

### 代码生成

项目使用多个代码生成器，修改相关文件后需要重新生成：

```bash
# 一次性生成所有代码
dart run build_runner build --delete-conflicting-outputs

# 监听模式 (开发时推荐)
dart run build_runner watch --delete-conflicting-outputs
```

需要生成代码的场景：
- 修改 `@freezed` 类 → 生成 `.freezed.dart`
- 修改 `@riverpod` 注解 → 生成 `.g.dart`
- 修改 Drift 表定义 → 生成数据库代码

### 添加新功能模块

1. 在 `lib/features/` 下创建新目录
2. 按照分层架构创建子目录：
   - `application/` - 业务逻辑
   - `domain/` - 数据模型
   - `presentation/` - UI
3. 在 `router.dart` 中添加路由
4. 运行代码生成器

### 数据库迁移

修改数据库表结构时：

1. 修改 `lib/shared/db/tables/` 中的表定义
2. 更新 `lib/shared/db/app_database.dart` 中的 `schemaVersion`
3. 在 `migration` 回调中添加迁移逻辑
4. 运行 `dart run build_runner build`

### 测试

```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/core/utils/bmi_calculator_test.dart

# 生成覆盖率报告
flutter test --coverage
```

### 代码检查

```bash
# 静态分析
flutter analyze

# 格式化代码
dart format lib/
```

## AI 助手配置

应用支持任何 OpenAI Compatible API，包括：

| 服务 | 端点示例 |
|-----|---------|
| OpenAI | `https://api.openai.com/v1` |
| Azure OpenAI | `https://{resource}.openai.azure.com/openai/deployments/{deployment}` |
| Ollama | `http://localhost:11434/v1` |
| LM Studio | `http://localhost:1234/v1` |
| DeepSeek | `https://api.deepseek.com/v1` |
| Groq | `https://api.groq.com/openai/v1` |

配置步骤：
1. 打开设置页面
2. 找到「AI 助手配置」区域
3. 设置 API 端点、API Key、模型名称
4. 配置信息仅存储在本地，不会上传

## 项目维护

### 依赖更新

```bash
# 查看可更新的依赖
flutter pub outdated

# 更新依赖
flutter pub upgrade

# 更新到最新主版本 (谨慎使用)
flutter pub upgrade --major-versions
```

### 常见问题

**Q: iOS 模拟器无法获取健康数据？**
A: iOS 模拟器不支持 HealthKit，请使用真机测试。

**Q: 代码生成失败？**
A: 尝试清理后重新生成：
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

**Q: AI 助手无响应？**
A: 检查设置中的 API 配置是否正确，确保网络可以访问 API 端点。

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

---

**HealthLife** - 让健康成为习惯 💪
