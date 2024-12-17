import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterModuleCase {
  @State message: string = '跳转支付模块';

  build() {
    Row() {
      Column() {
        Button(this.message)
          .onClick(() => {
            router.pushUrl({
              url: "@bundle:com.example.myhmapp/library/ets/pages/Index"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}