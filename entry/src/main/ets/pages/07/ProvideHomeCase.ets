import { IUserProfile, IUserProfileModel } from './models/ProvideCaseModel';

@Entry
@Component
struct ProvideHomeCase {
  @State message: string = 'Hello World';

  @Provide
  user: IUserProfileModel = new IUserProfileModel({} as IUserProfile)

  async getUserProfile() {
    const u = await new Promise<IUserProfile>((resolve) => {
      resolve({
        id: 1,
        phone: "138123456",
        nickName: "用户名",
        avatar: $r("app.media.startIcon")
      })
    })
    this.user = new IUserProfileModel(u)
  }

  aboutToAppear(): void {
    this.getUserProfile()
  }

  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            ProvideChatComp()
          }.tabBar("聊天")
          TabContent() {
            ProvideSquareComp()
          }.tabBar("广场")
          TabContent() {
            ProvideDiscoverComp()
          }.tabBar("发现")
          TabContent() {
            ProvideMyComp()
          }.tabBar("我的")
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ProvideChatComp {
  @Consume
  user: IUserProfile
  build() {
    Text(this.user.phone)
  }
}
@Component
struct ProvideSquareComp {
  @Consume
  user: IUserProfile
  build() {
    Image(this.user.avatar)
      .width(80)
  }
}
@Component
struct ProvideDiscoverComp {
  @Consume
  user: IUserProfile
  build() {
    Text(this.user.nickName)
  }
}
@Component
struct ProvideMyComp {
  @Consume
  user: IUserProfile
  build() {
    Text(this.user.id.toString())
  }
}