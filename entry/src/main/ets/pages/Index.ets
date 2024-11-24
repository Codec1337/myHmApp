@Entry // 装饰器
@Component // 装饰器
// struct-自定义组件基于struct实现
struct Index {
  build() {
    // Column它的子组件都会以纵向方式排列
    Column() {
      Header()
      Main()
      Footer()
    }
  }
}

@Component
struct Header {
  build() {
    Row() {
      Text('Header')
    }
      .width('100%')
      .height(50)
      .backgroundColor(Color.Pink)
  }
}

@Component
struct Main {
  build() {
    Row() {
      Text('Main')
    }
    .width('100%')
    .height(200)
    .backgroundColor(Color.White)
  }
}

@Component
struct Footer {
  build() {
    Row() {
      Text('Footer')
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Pink)
  }
}

// struct Index {
//   // 响应式声明
//   @State message: string = 'Hello World';
//   /*
//    * 必须有build函数
//    * */
//   build() {
//     // 声明式UI描述
//     Row() {
//       HomeIndex()
//       Column() {
//         Text(this.message)
//           .fontSize(50)
//           .fontWeight(FontWeight.Bold)
//           .fontColor('red')
//       }
//       .width('100%')
//     }
//     .height('100%')
//   }
// }

@Component
struct HomeIndex {
  build() {
    Image($r("app.media.app_icon"))
      .size({
        height: 50
      })
  }
}