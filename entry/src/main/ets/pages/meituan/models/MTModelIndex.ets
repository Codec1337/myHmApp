
export class CategoryModel {
  tag: string = ""
  name: string = ""
  foods: FoodItemModel[] = []
}

export class FoodItemModel {
  id: number = -1
  name: string = ""
  like_ratio_desc: string = ""
  month_saled: number = 0
  unit: string = ""
  food_tag_list: string[] = []
  price: number = 0
  picture: string = ""
  description: string = ""
  tag: string = ""
  count: number = 0
}
