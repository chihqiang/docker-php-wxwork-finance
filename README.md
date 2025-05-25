这是一个用于构建 PHP 环境的 Docker 镜像，预装了企业微信会话内容存档扩展（`wxwork_finance_sdk`），方便开发者在容器中快速部署和调试与企业微信会话存档相关的应用。

## 特性

- 基于官方 PHP 镜像构建，支持多种 PHP 版本（如 7.4）。
- 集成企业微信会话内容存档 C SDK，并编译为 PHP 扩展。
- 提供示例代码，帮助快速上手。

## 快速开始

### 构建镜像

克隆本仓库并构建所需的 PHP 版本镜像：

~~~
docker build --build-arg="IMAGE_TAG=7.4-fpm" -t zhiqiangwang/php:7.4-fpm-wxwork-finance .
~~~

### 运行容器

运行构建好的镜像：

~~~
docker run --rm --name wxwork-finance -it zhiqiangwang/php:7.4-fpm-wxwork-finance bash

// test php
php /usr/local/lib/php/wxwork_finance_sdk/run-tests.php
~~~

容器启动后，可在其中运行 PHP 脚本，调用企业微信会话内容存档相关功能。

## 示例代码

以下是使用 `ext-wxwork_finance_sdk` 扩展的示例：

~~~
<?php
$corpId = 'your_corp_id';
$secret = 'your_secret';
$sdk = new WxworkFinanceSdk($corpId, $secret);
$data = $sdk->getChatData($seq = 0, $limit = 100);
print_r($data);
~~~

## 参考链接

- 企业微信会话内容存档文档：https://developer.work.weixin.qq.com/document/path/91774
- PHP 扩展 `wxwork_finance_sdk`：https://github.com/pangdahua/php7-wxwork-finance-sdk

