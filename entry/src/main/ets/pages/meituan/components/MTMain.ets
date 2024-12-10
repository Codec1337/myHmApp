import FoodItem from './FoodItem';

@Preview
@Component
struct MTMainCase {

  leftList: string[] = ["一人套餐", "特色烧烤", "杂粮主食"]

  @State
  selectLeftIndex: number = 0;

  build() {
    Row() {
      Column() {
        ForEach(this.leftList, (item: string, index: number) => {
          Text(item)
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
        ForEach(new Array(10).fill(1), () => {
          ListItem() {
            FoodItem()
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
