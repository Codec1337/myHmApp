@Preview
@Component
struct FoodItem {
  build() {
    Row() {
      Image($r("app.media.food_item"))
        .width(100)
        .height(100)
      Column({ space: 4 }) {
        Text("小份酸汤鱼小份酸汤鱼小份酸汤鱼小份酸汤鱼小份酸汤鱼")
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)
          .fontSize(16)
        Text("主料：酸汤、鱼等")
          .fontSize(12)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)
        Text("点评网友推荐")
          .fontSize(10)
          .padding({
            left: 4,
            right: 4,
            top: 2,
            bottom: 2,
          })
          .backgroundColor($r("app.color.main_color"))
          .fontColor($r("app.color.font_main_color"))
          .borderRadius(4)
        Text() {
          Span("月销售")
          Span("30")
          Span("好评度")
          Span("100%")
        }.fontSize(12)
        Text() {
          Span("￥")
            .fontSize(10)
            .fontColor($r("app.color.font_main_color"))

          Span("34.23")
            .fontSize(18)
            .fontColor($r("app.color.font_main_color"))
        }
      }.layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 10,
        right: 10,
      })
    }.padding({
      left: 10,
      right: 10,
      top: 8,
      bottom: 8,
    })
    .alignItems(VerticalAlign.Top)
  }
}

export default FoodItem
