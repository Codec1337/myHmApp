import { getFoodList } from './api'
import MTBottomCase from './components/MTBottom'
import MTCart from './components/MTCart'
import MTMainCase from './components/MTMain'
import MTTopCase from './components/MTTop'
import { CategoryModel, FoodItemModel } from './models/MTModelIndex'
import { CartStore } from './utils'

@Entry
@Component
struct MTIndex {

  @Provide
  showCart: boolean = false

  @Provide
  userCart: FoodItemModel[] = []

  @State
  leftList: CategoryModel[] = []

  async getFoodsData() {
    const res: CategoryModel[] = await getFoodList()
    this.leftList = res
  }

  aboutToAppear(): void {
    this.getFoodsData()
    this.userCart = CartStore.getUserCart()
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