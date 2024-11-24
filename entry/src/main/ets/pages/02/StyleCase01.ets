@Entry
@Component
struct StyleCase01 {
  @State message: string = 'Hello World';

  @Styles textStyles () {
    .width(200)
    .height(40)
    .backgroundColor(Color.Gray)
    .borderRadius(20)
  }

  build() {
    Row() {
      Column({ space: 10 }) {

        Text(this.message)
          .fontColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .textStyles()
        Text(this.message)
          .fontColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .textStyles()
        Text(this.message)
          .fontColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .extendTextStyles()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text) function extendTextStyles () {
  .fontColor(Color.Red)
  .textAlign(TextAlign.Center)
  .width(200)
  .height(40)
  .backgroundColor(Color.Yellow)
  .borderRadius(20)
}