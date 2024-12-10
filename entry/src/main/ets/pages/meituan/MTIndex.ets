import { getFoodList } from './api'
import MTBottomCase from './components/MTBottom'
import MTCart from './components/MTCart'
import MTMainCase from './components/MTMain'
import MTTopCase from './components/MTTop'
import { CategoryModel, FoodItemModel } from './models/MTModelIndex'

@Entry
@Component
struct MTIndex {

  @Provide
  showCart: boolean = false

  @State
  leftList: CategoryModel[] = []

  async getFoodsData() {
    const res: CategoryModel[] = await getFoodList()
    this.leftList = res
  }

  aboutToAppear(): void {
    this.getFoodsData()
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          MTTopCase()
          MTMainCase({ leftList: this.leftList })
        }.height("100%")
        // .backgroundColor(Color.Pink)
        .width("100%")
        if(this.showCart) {
          MTCart()
        }
        MTBottomCase()
      }.layoutWeight(1)
      .width("100%")
    }.height("100%")
    .width("100%")
  }
}