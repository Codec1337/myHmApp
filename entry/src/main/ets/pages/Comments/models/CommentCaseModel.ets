
export interface ICommentItem {
  id: number
  author: string
  avatar: string | ResourceStr
  likeNum: number
  time: string
  area: string
  likeFlag: boolean
  content: string
}
export class ICommentItemModel implements ICommentItem {
  id: number = 0
  author: string = ''
  avatar: string | ResourceStr = ''
  likeNum: number = 0
  time: string = ''
  area: string = ''
  likeFlag: boolean = false
  content: string = ''

  constructor(model: ICommentItem) {
    this.id = model.id
    this.author = model.author
    this.avatar = model.avatar
    this.likeNum = model.likeNum
    this.time = model.time
    this.area = model.area
    this.likeFlag = model.likeFlag
    this.content = model.content
  }
}
