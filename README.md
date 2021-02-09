# cocoapods-gitee

使用 gitee 镜像仓库解决国内网络环境下 cocoapods 从 github 下载依赖缓慢甚至失败的问题。

## 安装

```bash
gem install cocoapods-gitee
```

## 使用

在 Podfile 中添加以下代码：

```ruby
plugin 'cocoapods-gitee', {
  # 以下为 react-native 中依赖但 gitee 镜像仓库中并未同步的代码库，映射到在 gitee 中我个人 fork 的代码库。
  # 以下镜像仓库并不能保证即使同步，可替换为自己的镜像库。
  'https://github.com/krzyzanowskim/OpenSSL.git' => 'https://gitee.com/SyMind/OpenSSL.git',
  'https://github.com/priteshrnandgaonkar/rsocket-cpp.git' => 'https://gitee.com/SyMind/rsocket-cpp.git',
  'https://github.com/priteshrnandgaonkar/peertalk.git': 'https://gitee.com/SyMind/peertalk.git'
}
```

## 备注

为了提升插件安装速度，代码库将移至 gitee：[https://gitee.com/SyMind/cocoapods-gitee](https://gitee.com/SyMind/cocoapods-gitee)。
