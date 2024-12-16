import { FoodItemModel } from '../models/MTModelIndex'
import { AddOrCutEnum, CartStore } from '../utils'

@Preview
@Component
struct MTAddOrCut {

  @Prop
  fid: number = -1

  @Prop
  foodItem: FoodItemModel = new FoodItemModel()

  @Styles ImageStyle() {
    .width("100%")
    .aspectRatio(1)
  }

  @Consume
  userCart: FoodItemModel[]

  getFoodCount() {
    return this.userCart.find(item => item.id === this.fid)?.count || 0
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
      .visibility(this.getFoodCount() ? Visibility.Visible : Visibility.Hidden)
      .onClick(() => {
        CartStore.addOrCutCart(AddOrCutEnum.CUT, this.foodItem)
      })
      Text(this.getFoodCount().toString())
        .visibility(this.getFoodCount() ? Visibility.Visible : Visibility.Hidden)
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
      .onClick(() => {
        CartStore.addOrCutCart(AddOrCutEnum.ADD, this.foodItem)
      })
    }
  }
}

export default MTAddOrCut
