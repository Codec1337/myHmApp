@Entry
@Component
struct CommentCase {
  build() {
    Column() {
      CommentHeader()
      CommentContent()
    }
  }
}

@Component
struct CommentHeader {
  build() {
    Row() {
      Row() {
        Image($r("app.media.chevron_left"))
          .objectFit(ImageFit.Contain)
          .fillColor("#848484")
          .height(12)
          .align(Alignment.Center)
          .alignSelf(ItemAlign.Center)
      }.width(24)
        .height(24)
        .borderRadius(12)
        .backgroundColor("#f5f5f5")
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
      Text("评论回复")
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .fontSize(18)
        .padding({
          right: 24
        })
    }.padding({
      left: 15,
      right: 15
    })
      .height(50)
      .border({
        color: "#f5f5f5",
        width: {
          bottom: 1
        },
      })
  }
}

@Component
struct CommentContent {
  build() {
    Row({ space: 10 }) {
      Image($r("app.media.startIcon"))
        .width(32)
        .height(32)
        .borderRadius(20)
      Column() {
        Text("静夜思-李白")
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({
            bottom: 10
          })
        Text("窗前明月光，疑似地上霜，举头望明月，低头思故乡。翻译：圆圆的月亮投射出一股亮亮的光")
          .fontSize(16)
          .fontColor("#565656")
          .margin({
            bottom: 10
          })
          .lineHeight(20)
        Row() {
          Text("10-21. IP属地：北京")
            .fontSize(12)
            .fontColor("#c3c4c5")
          Row() {
            Image($r("app.media.heart_fill"))
              .width(12)
              .height(12)
              .fillColor("#c3c4c5")
              .margin({
                right: 6
              })
            Text("100")
              .fontSize(12)
              .fontColor("#c3c4c5")
          }
        }.width("100%")
          .justifyContent(FlexAlign.SpaceBetween)
      }.alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }.padding({
      left: 15,
      right: 15,
      top: 20,
      bottom: 20
    }).alignItems(VerticalAlign.Top)
  }
}