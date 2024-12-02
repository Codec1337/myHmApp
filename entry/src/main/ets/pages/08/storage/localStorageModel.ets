export interface IUserProfile {
  username: string
  age: number
}

export class IUserProfileModel implements  IUserProfile {
  username: string = ""
  age: number = 0

  constructor(user: IUserProfile) {
    this.username = user.username
    this.age = user.age
  }
}

const localStorageData: Record<string, IUserProfileModel> = {
  "user": new IUserProfileModel({
    username: "username1",
    age: 18
  })
}

export const localStorage = new LocalStorage(localStorageData)


