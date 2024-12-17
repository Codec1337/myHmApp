import { router } from '@kit.ArkUI';
import("@ohos/demo/src/main/ets/pages/Index")

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
        Button(this.message + "-name方式")
          .onClick(() => {
            router.pushNamedRoute({
              name: "shared_pay_index"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}