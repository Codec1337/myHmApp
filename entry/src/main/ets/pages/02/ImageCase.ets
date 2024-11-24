@Entry
@Component
struct ImageCase {
  @State message: string = 'Hello World';

  build() {
    Row({ space: 10 }) {
      Image("/assets/img.png")
        .width(50)
        .borderRadius(50)
      Image($r("app.media.background"))
        .width(50)
        .borderRadius(50)
      Image($rawfile("background.png"))
        .width(50)
        .borderRadius(50)
    // 使用网络图片时须开启网络权限-
    //   Image("")
    //     .width(50)
    //     .borderRadius(50)
    }
    .height('100%')
  }
}