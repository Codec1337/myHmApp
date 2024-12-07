@Preview
@Component
struct MTTopCase {

  @State currentIndex: number = 0;

  @Builder evaluateBuilder(index: number) {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Text() {
        Span("评价")
        Span("1796")
          .fontSize(12)
          .fontColor(this.currentIndex === index ? $r("app.color.select_border_color") : $r("app.color.search_font_color"))
      }.fontSize(16)
      .fontColor(this.currentIndex === index ? $r("app.color.select_border_color") : $r("app.color.un_select_color"))
      .height("100%")
      if (this.currentIndex === index) {
        Divider()
          .width(16)
          .strokeWidth(2)
          .lineCap(LineCapStyle.Round)
          .color($r("app.color.select_border_color"))
      }
    }.height("100%")

  }

  @Builder searchBuilder() {
    Search()
      .height(24)
      .width(80)
      .searchIcon({
        color: $r("app.color.search_font_color")
      })
      .margin({
        left: 10,
        right: 10
      })
  }

  @Builder
  tabBarBuilder(index: number, name?: string) {
    if (index === 1) {
      this.evaluateBuilder(index)
    } else if(index === 0 || index === 2) {
      Stack({
        alignContent: Alignment.Bottom
      }) {
        Text(name)
          .fontColor(this.currentIndex === index ? $r("app.color.select_border_color") : $r("app.color.un_select_color"))
          .height("100%")
        if (this.currentIndex === index) {
          Divider()
            .width(16)
            .strokeWidth(2)
            .lineCap(LineCapStyle.Round)
            .color($r("app.color.select_border_color"))
        }
      }.height("100%")
    }
  }

  tabController: TabsController = new TabsController()



  build() {
    Column() {
      Row() {
        Tabs({ barPosition: BarPosition.Start, index: $$this.currentIndex, controller: this.tabController  }) {
          TabContent() {
          }.tabBar(this.tabBarBuilder(0, "点菜"))
          TabContent() {
          }.tabBar(this.tabBarBuilder(1))
          TabContent() {
          }.tabBar(this.tabBarBuilder(2, "商家"))
        }.barHeight("100%")
        .layoutWeight(1)
        Row() {
          this.searchBuilder()
        }
      }
      .alignItems(VerticalAlign.Center)
    }.height(50)
    .backgroundColor($r("app.color.left_back_color"))
  }
}

export default MTTopCase
