import { localStorage, IUserProfileModel } from "./storage/localStorageModel"
import { router } from '@kit.ArkUI';

@Entry(localStorage)
@Component
struct LocalStorageCase {
  @State message: string = 'Hello World';

  @LocalStorageProp("user")
  user: IUserProfileModel = new IUserProfileModel({
    username: "",
    age: 0
  })

  build() {
    Row() {
      Column() {
        Text(this.user.username)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.user.age += 1
            setTimeout(() => {
              router.pushUrl({
                url: "pages/08/LocalStorageCaseB"
              })
            }, 1000)
          })
        Text(this.user.age.toString())
      }
      .width('100%')
    }
    .height('100%')
  }
}