import { FoodItemModel } from '../models/MTModelIndex'

const USER_CART = "user_cart"

PersistentStorage.persistProp(USER_CART, [])

export class CartStore {
  static getUserCart() {
    return AppStorage.get<FoodItemModel[]>(USER_CART) || []
  }
}