import { ICommentItem, ICommentItemModel } from '../models'

@Preview
@Component
struct CommentItem {

  @Prop commentItem: ICommentItemModel = new ICommentItemModel({} as ICommentItem)

  changeLike: () => void = () => {}

  build() {
    Row({ space: 10 }) {
      Image($r("app.media.startIcon"))
        .width(36)
        .borderRadius(30)
      Column({ space: 10 }) {
        Text(this.commentItem.author)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(this.commentItem.content)
          .fontSize(14)
        Row() {
          Text(`${this.commentItem.time}.IP属地 ${this.commentItem.area}`)
            .fontSize(12)
            .fontColor("#ccc")
          Row({ space: 4 }) {
            Image($r("app.media.heart_fill"))
              .fillColor(this.commentItem.likeFlag ? Color.Red : "#ccc")
              .width(12)
            Text(this.commentItem.likeNum.toString())
              .fontColor(this.commentItem.likeFlag ? Color.Red : "#ccc")
              .fontSize(12)
          }.onClick(this.changeLike)
        }.width("100%")
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

    }.width("100%")
    .alignItems(VerticalAlign.Top)
    .padding({
      top: 10,
      bottom: 10,
      left: 10,
      right: 10
    })
  }
}

export {
  CommentItem
}