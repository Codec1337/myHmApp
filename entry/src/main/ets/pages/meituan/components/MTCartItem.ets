import { FoodItemModel } from '../models/MTModelIndex'
import MTAddOrCut from './MTAddOrCut'

@Preview
@Component
struct MTCartItem {

  item: FoodItemModel = new FoodItemModel()

  build() {
    Row() {
      Image($r("app.media.food_item"))
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)
      Column({ space: 6 }) {
        Text(this.item.name)
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .fontSize(16)
        Row() {
          Text() {
            Span("￥")
              .fontSize(10)
              .fontColor($r("app.color.font_main_color"))
            Span(this.item.price.toString())
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor($r("app.color.font_main_color"))
          }
          MTAddOrCut({ fid: this.item.id, foodItem: this.item })
        }.width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
      }.layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 10,
        right: 10
      })
    }.width("100%")
  }
}

export default MTCartItem
