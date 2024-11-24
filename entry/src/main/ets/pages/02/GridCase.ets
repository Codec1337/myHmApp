@Entry
@Component
struct GridCase {
  build() {
    Grid() {
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
    }.columnsTemplate("1fr 1fr")
      .columnsGap(10)
      .rowsGap(10)
      .padding(10)
  }
}

@Component
struct GridItemCase {
  build() {
    GridItem() {
      Row() {
        Column() {
          Text("内容")
        }.width("100%")
      }.height(200)
      .backgroundColor(Color.Pink)
      .width("100%")
    }
  }
}