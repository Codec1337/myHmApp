import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ChatPageCase {
  @State message: string = 'Hello World 聊天页面';

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("拉起支付功能")
          .onClick(() => {
            const uiAbilityContext = getContext() as common.UIAbilityContext
            uiAbilityContext.startAbility({
              bundleName: "com.example.myhmapp",
              abilityName: "PayEntryAbility",
              parameters: {
                orderId: Date.now()
              }
            })
          })
        Button("拉起支付功能-并获取支付结果")
          .onClick(async () => {
            const uiAbilityContext = getContext() as common.UIAbilityContext
            const result = await uiAbilityContext.startAbilityForResult({
              bundleName: "com.example.myhmapp",
              abilityName: "PayEntryAbility",
              parameters: {
                orderId: Date.now()
              }
            })
            promptAction.showDialog({
              message: JSON.stringify(result)
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}