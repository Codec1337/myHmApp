@Entry
@Component
struct ObserveCase {

  @State
  list: IListItemModel[] = [
    new IListItemModel({
      id: 1,
      title: "测试",
      count: 1
    } as IListItem),
    new IListItemModel({
      id: 2,
      title: "测试2",
      count: 2
    } as IListItem),
    new IListItemModel({
      id: 3,
      title: "测试3",
      count: 3
    } as IListItem),
  ]

  build() {
    Row() {
      Column() {
        ForEach(this.list, (item: IListItemModel) => {
          ObserveListItem({ item: item })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ObserveListItem {
  @ObjectLink
  item: IListItemModel
  build() {
    ListItem() {
      Row({ space: 10 }) {
        Text(this.item.title)
        Text(this.item.count.toString())
          .onClick(() => {
            this.item.count += 1
          })
      }
    }
  }
}

interface IListItem {
  id: number
  title: string
  count: number
}

@Observed
export class IListItemModel implements IListItem {
  id: number = 0
  title: string = ''
  count: number = 0

  constructor(model: IListItem) {
    this.id = model.id
    this.title = model.title
    this.count = model.count
  }
}
