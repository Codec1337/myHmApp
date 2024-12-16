import { FoodItemModel } from '../models/MTModelIndex'
import MTAddOrCut from './MTAddOrCut'

@Preview
@Component
struct FoodItem {

  @Prop
  item: FoodItemModel = new FoodItemModel()

  build() {
    Row() {
      Image($r("app.media.food_item"))
        .width(100)
        .height(100)
      Column({ space: 4 }) {
        Text(this.item.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)
          .fontSize(16)
        Text(this.item.description)
          .fontSize(12)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)
        ForEach(this.item.food_tag_list || [], (fTag: string) => {
          Text(fTag)
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
        })
        Row({ space: 4 }) {
          Text() {
            Span("月销售")
            Span(this.item.month_saled.toString())
          }.fontSize(10)
          Text(this.item.like_ratio_desc)
            .fontSize(10)
        }

        Row() {
          Text() {
            Span("￥")
              .fontSize(10)
              .fontColor($r("app.color.font_main_color"))

            Span(this.item.price.toString())
              .fontSize(18)
              .fontColor($r("app.color.font_main_color"))
          }
          MTAddOrCut({ fid: this.item.id, foodItem: this.item })
        }.width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
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
