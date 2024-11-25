@Entry
@Component
struct ScrollCase02 {
  @State message: string = 'Hello World';

  build() {
  //   横向滚动
    Row() {
      Scroll() {
        Row({ space: 10 }) {
          ScrollCase02Item()
          ScrollCase02Item()
          ScrollCase02Item()
          ScrollCase02Item()
          ScrollCase02Item()
          ScrollCase02Item()
          ScrollCase02Item()
        }
      }.height(200)
      .width("100%")
      .backgroundColor(Color.Orange)
      .padding(10)
      .scrollable(ScrollDirection.Horizontal)
    }.height("100%")
    .width("100%")
    .backgroundColor(Color.Pink)
  }
}

@Component
struct ScrollCase02Item {
  build() {
    Row() {
      Column() {
        Text("ScrollItem Content")
      }.width("100%")
    }.width(150)
    .height("100%")
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}