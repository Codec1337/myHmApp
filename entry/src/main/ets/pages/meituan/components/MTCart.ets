import { FoodItemModel } from '../models/MTModelIndex'
import { CartStore } from '../utils'
import MTCartItem from './MTCartItem'

@Preview
@Component
struct MTCart {

  @Consume
  userCart: FoodItemModel[]

  build() {
    Column() {
      Column() {
        Row() {
          Text("购物车")
            .fontSize(12)
          Text("清空购物车")
            .fontSize(12)
            .fontColor($r("app.color.search_font_color"))
            .onClick(() => {
              CartStore.clearUserCart()
            })
        }.height(50)
        .justifyContent(FlexAlign.SpaceBetween)
        .width("100%")

        List({ space: 10 }) {
          ForEach(this.userCart, (item: FoodItemModel) => {
            ListItem() {
              MTCartItem({ item })
            }
          }, (item: FoodItemModel) => item.id.toString())
        }.width("100%")

      }.width("100%")
      .backgroundColor($r("app.color.white"))
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
      .padding({
        left: 15,
        right: 15,
        bottom: 150
      })
    }.width("100%")
    .height("100%")
    .backgroundColor("rgba(0, 0, 0, 0.6)")
    .justifyContent(FlexAlign.End)
  }
}

export default MTCart
