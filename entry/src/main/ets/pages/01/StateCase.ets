import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct StateCase {
  @State message: string = 'Hello World';
  @State userInfo: UserInfo = {
    username: "admin",
    age: 10,
    address: {
      province: "河南省",
      city: "开封市",
      area: "杞县"
    }
  }

  defaultTime: number = 5
  @State timerId: number = -1
  @State loginBtnEnabled: boolean = true // 按钮状态
  @State time: number = this.defaultTime

  build() {
      Column({ space: 20 }) {
        Text(`${JSON.stringify(this.userInfo)}`)
        Row({ space: 10 }) {
          Text('用户名：')
            .width(80)
          TextInput({ placeholder: '请输入用户名', text: this.userInfo.username })
            .layoutWeight(1)
            .onChange((value) => {
              this.userInfo.username = value
            })
        }
        Row({ space: 10 }) {
          Text('年龄：')
            .width(80)
          TextInput({ placeholder: '请输入年龄', text: this.userInfo.age.toString() })
            .layoutWeight(1)
            .onChange((value) => {
              this.userInfo.age = Number(value)
            })
        }
        Row({ space: 10 }) {
          Text('地址：')
            .width(80)
          TextInput({ placeholder: '请输入地址', text: this.userInfo.address.province })
            .layoutWeight(1)
            .onChange((value) => {
              this.userInfo.address = {
                province: value,
                city: this.userInfo.address.city,
                area: this.userInfo.address.area
              }
            })
          TextInput({ placeholder: '请输入地址', text: this.userInfo.address.city })
            .layoutWeight(1)
            .onChange((value) => {
              this.userInfo.address = {
                province: this.userInfo.address.province,
                city: value,
                area: this.userInfo.address.area
              }
            })

          TextInput({ placeholder: '请输入地址', text: this.userInfo.address.area })
            .layoutWeight(1)
            .onChange((value) => {
              this.userInfo.address = {
                province: this.userInfo.address.province,
                city: this.userInfo.address.city,
                area: value
              }
            })
        }
        Row() {
          Button('登录')
            .width('100%')
            .enabled(this.loginBtnEnabled)
            .onClick(() => {
              if(this.timerId >= 5) {
                return
              }
              this.loginBtnEnabled = false
              this.timerId = setInterval(() => {
                if (this.time <= 0) {
                  this.loginBtnEnabled = true
                  clearInterval(this.timerId)
                  this.time = this.defaultTime
                  promptAction.showToast({ message: '登录成功', bottom: '80%' })
                  return
                }
                this.time -= 1
              }, 1000)
            })
        }
      }
      .height('100%')
      .padding({ left: 10, right: 10, top: 10 })
  }
}

interface  AddressInfo {
  province: string
  city: string
  area: string
}

interface UserInfo {
  username: string
  age: number
  address: AddressInfo
}

