@Preview
@Component
struct MTBottomCase {
  build() {
    Row() {
      Row() {
        Badge({
          value: "0",
          style: {
            badgeSize: 20,
            badgeColor: '#FA2A2D'
          },
          position: BadgePosition.Right
        }) {
          Image($r("app.media.ic_public_cart"))
            .width(49)
            .height(68)
            .position({
              y: -8
            })
        }.margin({
          left: 30
        })
        Column() {
          Text() {
            Span("￥")
            Span("0.00")
              .fontSize(24)
          }.fontColor($r("app.color.white"))
          Text() {
            Span("预估另需配送费￥")
            Span("5")
          }.fontColor($r("app.color.search_font_color"))
          .fontSize(14)
        }.alignItems(HorizontalAlign.Start)
        .padding({
          left: 10,
          right: 10
        }).layoutWeight(1)
        Text("去结算")
          .fontColor($r("app.color.white"))
          .backgroundColor($r("app.color.main_color"))
          .height("100%")
          .width(80)
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 30,
            bottomRight: 30
          })
      }
      .width("100%")
      .backgroundColor($r("app.color.black"))
      .height(60)
      .borderRadius(30)
    }.width("100%")
    .padding({
      left: 10,
      right: 10,
      bottom: 15
    })
  }
}

export default MTBottomCase
