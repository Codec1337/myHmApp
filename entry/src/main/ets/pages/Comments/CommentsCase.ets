import { AppNavBar, CommentItem } from './components'

@Entry
@Component
struct CommentsCase {
  build() {
    Column() {
      AppNavBar({ title: "评论回复" })
      CommentItem()
      Divider()
        .strokeWidth(2)
        .color("#eee")
      List() {
        ForEach(new Array(9).fill(1), () => {
          ListItem() {
            CommentItem()
          }
        })
      }.padding({
        bottom: 20
      }).layoutWeight(1)
    }
    .width('100%')
    .height("100%")
  }
}