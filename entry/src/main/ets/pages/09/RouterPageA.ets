import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterPageA {
  @State message: string = 'Hello World A';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("跳转B")
          .onClick(() => {
            router.pushUrl({
              url: "pages/09/RouterPageB"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}