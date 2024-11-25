@Preview
@Component
struct CommentItem {
  build() {
    Row({ space: 10 }) {
      Image($r("app.media.startIcon"))
        .width(36)
        .borderRadius(30)
      Column({ space: 10 }) {
        Text("内容主题")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text("床前明月光，疑似地上霜，举头望明月，低头思故乡")
          .fontSize(14)
        Row() {
          Text("10-21.IP属地 上海")
            .fontSize(12)
            .fontColor("#ccc")
          Row({ space: 4 }) {
            Image($r("app.media.heart_fill"))
              .fillColor("#ccc")
              .width(12)
            Text("100")
              .fontColor("#ccc")
              .fontSize(12)
          }
        }.width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

    }.width("100%")
    .alignItems(VerticalAlign.Top)
    .padding({
      top: 10,
      bottom: 10,
      left: 10,
      right: 10
    })
  }
}

export {
  CommentItem
}