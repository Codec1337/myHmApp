@Preview
@Component
struct AppNavBar {

  title: string = "标题"

  build() {
    Row() {
      Stack() {
        Row() {
          Image($r("app.media.chevron_left"))
            .height(20)
            .fillColor("#333")
        }.height(24)
        .width(24)
        .borderRadius(14)
        .justifyContent(FlexAlign.Center)
        .border({
          color: "#333",
          width: 1
        })
        Text(this.title)
          .textAlign(TextAlign.Center)
          .width("100%")
          .height("100%")
      }.height("100%")
      .width("100%")
      .alignContent(Alignment.Start)
    }.height(50)
    .width("100%")
    .padding({
      left: 10,
      right: 10
    })
    .border({
      color: "#ddd",
      width: {
        bottom: 1
      }
    })
  }
}

export {
  AppNavBar
}