export interface IUserProfile {
  phone: string
  nickName: string
  id: number
  avatar: string | Resource
}
export class IUserProfileModel implements IUserProfile {
  phone: string = ''
  nickName: string = ''
  id: number = 0
  avatar: string | Resource = ''

  constructor(model: IUserProfile) {
    this.phone = model.phone
    this.nickName = model.nickName
    this.id = model.id
    this.avatar = model.avatar
  }
}
