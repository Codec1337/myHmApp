@Preview
@Component
struct MTAddOrCut {

  @Styles ImageStyle() {
    .width("100%")
    .aspectRatio(1)
  }

  build() {
    Row({ space: 8 }) {
      Row() {
        Image($r("app.media.ic_screenshot_line"))
          .ImageStyle()
      }.border({
        width: 1,
        color: $r("app.color.main_color")
      }).width(16)
      .padding(2)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .borderRadius(4)
      Text("0")
      Row() {
        Image($r("app.media.ic_public_add_filled"))
          .ImageStyle()
      }.border({
        width: 1,
        color: $r("app.color.main_color")
      }).width(16)
      .padding(2)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.main_color"))
      .borderRadius(4)
    }
  }
}

export default MTAddOrCut
