@Entry
@Component
struct LoginFormCase {

  @State userInfo: IUserInfoModel = new IUserInfoModel({
    username: "admin",
    age: 20,
    gender: "男",
    address: {
      province: "xxx",
      city: "xxx",
      area: "xx"
    }
  })

  build() {
    Column({ space: 16 }) {
      Row({ space: 10 }) {
        Text("用户名：")
          .width(70)
        TextInput({
          text: this.userInfo.username
        })
          .layoutWeight(1)
      }.width("100%")
      .padding({
        left: 10,
        right: 10
      })
      Row({ space: 10 }) {
        Text("年龄：")
          .width(70)
        TextInput({
          text: this.userInfo.age.toString()
        })
          .type(InputType.Number)
          .layoutWeight(1)
      }.width("100%")
      .padding({
        left: 10,
        right: 10
      })
      Row({ space: 10 }) {
        Text("性别：")
          .width(70)
        Select([
          {
            value: "男"
          },
          {
            value: "女"
          }
        ])
          .value(this.userInfo.gender)
          .layoutWeight(1)
      }.width("100%")
      .padding({
        left: 10,
        right: 10
      })
      Row({ space: 10 }) {
        Text("地址：")
          .width(70)
        TextInput({
          text: this.userInfo.address.province
        })
          .layoutWeight(1)
        TextInput({
          text: this.userInfo.address.city
        })
          .layoutWeight(1)
        TextInput({
          text: this.userInfo.address.area
        })
          .layoutWeight(1)
      }.width("100%")
      .padding({
        left: 10,
        right: 10
      })
      Row() {
        Button("修改地址")
          .width("100%")
          .onClick(() => {
            this.userInfo.address.area = "兰考"
            this.userInfo.address = new IUserInfoAdressModel(this.userInfo.address)
          })
      }.padding({
        left: 10,
        right: 10
      })
    }.height("100%")
    .width("100%")
    .padding({
      top: 30,
      bottom: 30
    })
  }
}

interface IUserInfoAdress {
  province: string
  city: string
  area: string
}

interface IUserInfo {
  username: string
  age: number
  gender: "男" | "女"
  address: IUserInfoAdress
}

class IUserInfoModel1 implements  IUserInfo {
  username: string
  age: number
  gender: '男' | '女'
  address: IUserInfoAdress
  constructor(model: IUserInfo) {
    this.username = model.username
    this.age = model.age
    this.gender = model.gender
    this.address = model.address
  }
}
export class IUserInfoAdressModel implements IUserInfoAdress {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: IUserInfoAdress) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}
export class IUserInfoModel implements IUserInfo {
  username: string = ''
  age: number = 0
  gender: "男" | "女" = "男"
  address: IUserInfoAdress = new IUserInfoAdressModel({} as IUserInfoAdress)

  constructor(model: IUserInfo) {
    this.username = model.username
    this.age = model.age
    this.gender = model.gender
    this.address = model.address
  }
}
