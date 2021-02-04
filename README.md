# flutter_dialog

A new Flutter package.

## Getting Started

```
   ManagerUtils.showBottomDialog(
      context,
      SheetBottomDialog(titleText: Text('确认要退出登录吗？'),cancelItem: AlertItem(
          text: Text('取消'),
          callBack: () {
            print('取消');
          }), items: [
        AlertItem(
            text: Text('相机'),
            callBack: () {
              print('相机');
            }),
        AlertItem(
            text: Text('相册'),
            callBack: () {
              print('相册');
            }),
      ]));
      
```

```
  ManagerUtils.showBottomDialog(
    context,
    SheetPickerDialog(
      items: ['北京', '上海', '天津', '深圳', '武汉', '广州', '杭州'],
      callBack: (index, text) {

        print('========${index}==${text}');

      },
    ));
      
```
```
 ManagerUtils.showCenterDialog(
   context,
   AlertCenterDialog(
     titleText: Text('提示'),
     contentText: Text('说的话v十点半v城市阿迪面包车进行明显比女性从v',textAlign: TextAlign.center,),
     alertItems: [
       AlertItem(text: Text('取消'), callBack: () {
         print('取消');
       }),
       AlertItem(text: Text('确定'), callBack: () {
         print('确定');

       }),
     ],
   ));
      
```
```
 ManagerUtils.showCenterDialog(
    context,
    AlertCenterCustomDialog(
      child: Container(
       padding: EdgeInsets.all(15),
        color: Colors.red,
        child: Text(''),
      ),
      alertItems: [
        AlertItem(
            text: Text('取消'),
            callBack: () {
              print('取消');
            }),
        AlertItem(
            text: Text('确定'),
            callBack: () {
              print('确定');
            }),
      ],
    ));

```

