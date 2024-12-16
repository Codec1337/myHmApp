import { FoodItemModel } from '../models/MTModelIndex'

@Preview
@Component
struct MTBottomCase {

  @Consume
  showCart: boolean

  @Consume
  userCart: FoodItemModel[]

  getTotalCount() {
    return this.userCart.reduce((acc: number, item: FoodItemModel) => {
      return acc + item.count
    }, 0)
  }

  getTotalPrice() {
    return this.userCart.reduce((acc: number, item: FoodItemModel) => {
      return acc + item.count * item.price
    }, 0)
  }

  build() {
    Row() {
      Row() {
        Badge({
          value: this.getTotalCount().toString(),
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
        .onClick(() => {
          this.showCart = !this.showCart
        })
        Column() {
          Text() {
            Span("￥")
            Span(this.getTotalPrice().toString())
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
