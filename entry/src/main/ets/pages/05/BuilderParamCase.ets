@Entry
@Component
struct BuilderParamCase {

  @Builder
  topBuilder() {
    Column() {
      Text("Header")
        .fontColor(Color.White)
    }.width("100%")
    .height(100)
    .backgroundColor(Color.Brown)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  bodyBuilder() {
    Column() {
      Text("Body")
        .fontColor(Color.White)
    }.width("100%")
    .height(200)
    .backgroundColor(Color.Orange)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Row() {
      Column({ space: 10 }) {
         CardComponent({ top: this.topBuilder, body: this.bodyBuilder })
         CardComponent({ body: this.bodyBuilder })
      }
      .width('100%')
      .height("100%")
    }
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}

@Component
struct CardComponent{
  @Builder
  defaultBuilderParam() {}

  @BuilderParam
  top: () => void = this.defaultBuilderParam
  @BuilderParam
  body: () => void = this.defaultBuilderParam

  build() {
    Column() {
      Column({ space: 10 }) {
        this.top()
        this.body()
        Row({ space: 10 }) {
          Button("取消")
          Button("确认")
        }.width("100%")
        .justifyContent(FlexAlign.End)
      }
      .padding(10)
      .backgroundColor(Color.White)
      .borderRadius(8)
    }.width("100%")
    .padding(20)
  }
}