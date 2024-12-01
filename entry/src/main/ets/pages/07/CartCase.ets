@Entry
@Component
struct CartCase {

  @State
  goodsList: IGoodsItem[] = [
    {
      goods_name: "外套",
      goods_price: 200,
      goods_count: 8,
      goods_id: "1"
    },
    {
      goods_name: "鞋子",
      goods_price: 100,
      goods_count: 2,
      goods_id: "2"
    },
    {
      goods_name: "帽子",
      goods_price: 20,
      goods_count: 1,
      goods_id: "3"
    },
  ]

  build() {
    Row() {
      Column()  {
        GoodsListComp({ list: this.goodsList })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct GoodsListComp {
  @Link
  list: IGoodsItem[]

  addOrCutGoods(item: IGoodsItem, type: "add" | "cut") {
    if (type === "add") {
      item.goods_count += 1
    } else {
      if (item.goods_count) {
        item.goods_count -= 1
      }
    }
    const index = this.list.findIndex((listItem) => {
      return listItem.goods_id === item.goods_id
    })
    this.list.splice(index, 1, item)
  }

  build() {
    Column() {
      List() {
        ForEach(this.list, (item: IGoodsItem, index: number) => {
          ListItem() {
            Row({ space: 10 }) {
              Text(item.goods_name)
              Text(item.goods_price.toString())
              Row({ space: 10 }) {
                Text("-")
                  .addOrCutText()
                  .onClick(() => {
                    this.addOrCutGoods(item, "cut")
                  })
                Text(item.goods_count.toString())
                Text("+")
                  .addOrCutText()
                  .onClick(() => {
                    this.addOrCutGoods(item, "add")
                  })
              }.width(100)
              .height("100%")
              .justifyContent(FlexAlign.End)
            }.width("100%")
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({
              left: 10,
              right: 10
            })
          }
          .width("100%")
          .height(40)
          .border({
            width: {
              bottom: index === this.list.length - 1 ? 0 : 1
            },
            color: "#999"
          })
        })
      }
      .border({
        width: 1,
        color: "#999"
      })
      .borderRadius(8)
    }.width("100%")
    .height("100%")
    .padding(20)
  }
}

@Extend(Text)
function addOrCutText() {
  .width(20)
  .height(20)
  .borderRadius(10)
  .textAlign(TextAlign.Center)
  .border({
    width: 1,
    color: "#999"
  })
  .fontColor("#999")
}

interface IGoodsItem {
  goods_name: string
  goods_price: number
  goods_count: number
  goods_id: string
}