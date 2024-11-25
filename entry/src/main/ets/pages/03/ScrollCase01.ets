@Entry
@Component
struct ScrollCase01 {

  @State middleContentHeight: number = 0

  scroller: Scroller = new Scroller()

  // 上下滚动DEMO
  build() {
    Column() {
      Row() {
        Text("header")
          .fontColor(Color.White)
      }.height(50)
      .width("100%")
      .backgroundColor(Color.Red)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        this.scroller.scrollEdge(Edge.Bottom)
      })
      Scroll(this.scroller) {
        Column({ space: 15 }) {
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
        }.padding(10)
      }.height(this.middleContentHeight)
      // .backgroundColor(Color.Blue)
      .width("100%")
      .scrollBarColor(Color.Brown)

      Row() {
        Text("Footer")
          .fontColor(Color.White)
      }.height(50)
      .width("100%")
      .backgroundColor(Color.Green)
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        this.scroller.scrollEdge(Edge.Top)
      })
    }.height("100%")
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .onAreaChange((oldValue: Area, newValue: Area) => {
      console.log("newValue", JSON.stringify(newValue))
      this.middleContentHeight = (newValue.height) as number - 100
    })
  }
}

@Component
struct ScrollItem {
  build() {
    Row() {
      Text("Scroll Content")
    }.height(200)
    .backgroundColor(Color.Orange)
    .width("100%")
    .justifyContent(FlexAlign.Center)
  }
}