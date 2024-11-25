@Entry
@Component
struct StackCase {

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Image($r("app.media.chevron_left"))
        .width(16)
      Text("评论回复")
        .width("100%")
        .height("100%")
        .textAlign(TextAlign.Center)
    }.width("100%")
    .height(50)
    .padding({
      left: 10,
      right: 10
    })
    .backgroundColor(Color.Orange)
  }
}