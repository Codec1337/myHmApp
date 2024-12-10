import { CategoryModel, FoodItemModel } from '../models/MTModelIndex';
import FoodItem from './FoodItem';

@Preview
@Component
struct MTMainCase {

  @Prop
  leftList: CategoryModel[] = []

  @State
  selectLeftIndex: number = 0;

  build() {
    Row() {
      Column() {
        ForEach(this.leftList, (item: CategoryModel, index: number) => {
          Text(item.name)
            .height(60)
            .fontSize(14)
            .backgroundColor(this.selectLeftIndex === index ? $r("app.color.white") : $r("app.color.left_back_color"))
            .width("100%")
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.selectLeftIndex = index
            })
        })
      }.width(100)
      .backgroundColor($r("app.color.left_back_color"))
      .height("100%")
      List({ space: 0 }) {
        ForEach(this.leftList[this.selectLeftIndex]?.foods, (foodItem: FoodItemModel) => {
          ListItem() {
            FoodItem({ item: foodItem })
          }
        })
      }.layoutWeight(1)
      .padding({
        bottom: 130
      })
      .height("100%")
    }.height("100%")
    .width("100%")
  }
}

export default MTMainCase
