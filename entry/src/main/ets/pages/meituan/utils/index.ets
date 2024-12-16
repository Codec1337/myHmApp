import { FoodItemModel } from '../models/MTModelIndex'

export const USER_CART = "user_cart"

export const USER_CART_CHANGE = "user_cart_change"

PersistentStorage.persistProp(USER_CART, [])

export class CartStore {
  static getUserCart() {
    return AppStorage.get<FoodItemModel[]>(USER_CART) || []
  }

  static addOrCutCart(type: AddOrCutEnum, foodItem: FoodItemModel) {
    const userCart = CartStore.getUserCart()

    const food = userCart.find((item) => item.id === foodItem.id)
    const foodIndex = userCart.findIndex((item) => item.id === foodItem.id)
    if (type === AddOrCutEnum.ADD) {
      if(food) {
        food.count += 1
      }else {
        foodItem.count = 1
        userCart.unshift(foodItem)
      }
    } else if(type === AddOrCutEnum.CUT) {
      if (food && food.count > 0) {
        food.count -= 1
        if (food.count === 0) {
          userCart.splice(foodIndex, 1)
        }
      } else {
        userCart.splice(foodIndex, 1)
      }

    }

    // appStorage持久化时针对复杂数据类型，地址未变化，不会去持久化
    AppStorage.set(USER_CART, [ ...userCart ])
    getContext().eventHub.emit(USER_CART_CHANGE)

  }

  static clearUserCart() {
    AppStorage.set(USER_CART, [])
    getContext().eventHub.emit(USER_CART_CHANGE)
  }
}

export enum AddOrCutEnum {
  ADD,
  CUT
}
