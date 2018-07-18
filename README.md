# InitialProject
用于快速搭建一个IOS空项目，预先封好网络框架，基类，工具库，分割出登录模块，修修就能用了

## 简介
`InitialProject`是基于MVC架构的iOS轻量级框架，封装了各种基类、基于PPNetwork的网络服务、工具库

## iOS 搭建高可用App框架

进入到新公司开始着手搭建APP框架，一直以来都是为了完成快速完成项目而草草的创建一个工程，中途需要用到什么
库就去集成什么库，导致架构松散，底层混乱，缺少规范，一直没能形成自己的代码风格。清晰的项目结构和良好的代
码规范是保证产品质量的关键，这里在翻阅了众多github的开源项目后选择参照UniversalProject来搭建自己的项
目框架，该框架优点：轻量小巧、层级清晰，易维护、易扩展。

## 架构图：

<div align=center><img src="http://git.zhiqi.cn/junjie/images/raw/e4a4c419f04d45ff916829e974ad9871f3187456/WechatIMG20641.jpeg"/></div>

架构原则：易读性、易维护性、易扩展性。

## 一、项目技术选型

1. 网络框架

选择AFNetworking作为基础网络框架。AFNetWorking一款轻量级网络请求开源框架，基于iOS和mac os网络进行扩展的高性
能框架，大大降低了iOS开发工程师处理网络请求的难度。

GitHub地址：https://github.com/AFNetworking/AFNetworking

在AFNetworking基础上选择PPNetworkHelper，它是对AFNetworking与YYCache的二次封装,封装常见的GET、POST、
文件上传/下载、网络状态监测的功能、方法接口简洁明了,并结合YYCache实现对网络数据的缓存,简单易用。

GitHub地址：https://github.com/jkpang/PPNetworkHelper

在PPNetworkHelper基础上，我们继承它，封装出适用于自己项目的网络管理库HttpsManager，在这一层里我们与后端人员约定好
返回的JSON格式，进行预处理，如JsonResult（根据具体项目进行修改）里的样式。也可以在这一层里对所有的请求进行拦截，如
JsonResult.code == 1,token失效，让页面跳转到登录页等。

2. 基础组件库

功能强大，性能优秀的——YYKit  

它包含了解析数据，缓存，图像处理，文本处理，异步绘制等组件，当然也有些瑕疵下面说

<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYModel" target="_blank" rel="nofollow">YYModel</a>— 高性能的 iOS JSON 模型框架。

YYCache— 高性能的 iOS 缓存框架。

<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYCache" target="_blank" rel="nofollow">YYCache</a>— 高性能的 iOS 缓存框架。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYImage" target="_blank" rel="nofollow">YYImage</a>— 功能强大的 iOS 图像框架。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYWebImage" target="_blank" rel="nofollow">YYWebImage</a>— 高性能的 iOS 异步图像加载框架。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYText" target="_blank" rel="nofollow">YYText</a>— 功能强大的 iOS 富文本框架。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYKeyboardManager" target="_blank" rel="nofollow">YYKeyboardManager</a>— iOS 键盘监听管理工具。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYDispatchQueuePool" target="_blank" rel="nofollow">YYDispatchQueuePool</a>— iOS 全局并发队列管理工具。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYAsyncLayer" target="_blank" rel="nofollow">YYAsyncLayer</a>— iOS 异步绘制与显示的工具。
<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYCategories" target="_blank" rel="nofollow">YYCategories</a>— 功能丰富的 Category 类型工具库。
选择这个框架的原因是功能和性能都比较强大，用一个框架就可以做很多事，而且YYKit的设计思想是category，几乎没有入侵性，使用起来也非常方便。

但是同事发现<a href="https://link.jianshu.com?t=https://github.com/ibireme/YYWebImage" target="_blank" rel="nofollow">YYWebImage</a>— 这个高性能异步图像加载框架可能有点过时，因为其使用的是NSURLConnection请求，而SDWebImage已替换成了URLSession。所以图像异步加载上，我还是选择更加专业的SDWebImage。</p>