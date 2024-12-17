import { common } from '@kit.AbilityKit';

@Entry
@Component
struct PayPageCase {

  @StorageProp("order_id")
  orderId: number = -1

  @State message: string = 'Hello World 支付页面';

  build() {
    Row() {
      Column() {
        Text(this.message + this.orderId)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("支付")
          .onClick(() => {
            const uiAbilityContext = getContext() as common.UIAbilityContext
            uiAbilityContext.terminateSelfWithResult({
              resultCode: 200,
              want: {
                bundleName: "com.example.myhmapp",
                abilityName: "EntryAbility",
                parameters: {
                  result: "success"
                }
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}