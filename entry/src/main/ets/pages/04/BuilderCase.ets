@Entry
@Component
struct BuilderCase {
  @State message: string = 'Hello World';

  @Builder
  selectItem(item: ISelectListItemModel) {
    Row() {
      Text(item.content)
        .fontColor(item.isSelected ? Color.White : Color.Black)
    }.height(50)
    .backgroundColor(item.isSelected ? Color.Green : "#ffefefef")
    .width("100%")
    .borderRadius(8)
    .padding(10)
  }

  selectList: ISelectListItemModel[] = [
    new ISelectListItemModel({
      content: "选项一",
      id: 1,
      isSelected: false
    }),
    new ISelectListItemModel({
      content: "选项二",
      id: 2,
      isSelected: false
    }),
    new ISelectListItemModel({
      content: "选项三",
      id: 3,
      isSelected: true
    }),
    new ISelectListItemModel({
      content: "选项四",
      id: 4,
      isSelected: false
    }),
  ]

  build() {
    Column({ space: 10 }) {
      ForEach(this.selectList, (item: ISelectListItemModel) => {
        this.selectItem(item)
      })
    }.width("100%")
    .height("100%")
    .padding(10)
  }
}

interface ISelectListItem {
  content: string
  id: number
  isSelected: boolean
}

class ISelectListItemModel implements ISelectListItem {
  content: string = ""
  id: number = -1
  isSelected: boolean = false

  constructor(item: ISelectListItem) {
    this.content = item.content
    this.id = item.id
    this.isSelected = item.isSelected
  }
}