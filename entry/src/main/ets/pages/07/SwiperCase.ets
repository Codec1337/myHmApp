@Entry
@Component
struct SwiperCase {
  build() {
    Row() {
      Column() {
        Swiper() {
          ForEach(new Array(9).fill(10), (item: number, index) => {
            Text(index.toString())
              .width("100%")
              .backgroundColor(Color.Pink)
              .fontColor(Color.White)
              .height(100)
              .textAlign(TextAlign.Center)
          })
        }.index(3)
      }
      .width('100%')
    }
    .height('100%')
  }
}