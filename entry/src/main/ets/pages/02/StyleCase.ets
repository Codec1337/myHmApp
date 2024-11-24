@Entry
@Component
struct StyleCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
      }
      .width('50%')
      .aspectRatio(1) // 宽高比
      .backgroundColor(Color.Red)
    }
    .height('100%')
  }
}