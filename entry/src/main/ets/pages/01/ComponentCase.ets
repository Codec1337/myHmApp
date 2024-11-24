@Entry
@Component
struct ComponentCase {
  @State message: string = 'Hello World';

  build() {
    Scroll() {
      Column() {
        Text("First Component")
        Text() {
          Span('$')
            .fontSize(12)
          Span('50.5')
            .fontSize(20)
            .fontWeight(500)
        }

        Row() {
          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Pink)

          Column()
            .width(100)
            .height(200)
            .backgroundColor(Color.Red)

          // Column()
          //   .width(100)
          //   .height(200)
          //   .backgroundColor(Color.Pink)
        }
        .margin({ top: 1000 })
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        // .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
    }
  }
}