# HomeWork

- **기본원칙**
1. 명확성
2. 일관성
3. 자기설명금지

### Code
``` objectivec
@property UITextField *pwText; (x)
@property UITextField *passwordText; (o)

UIButton *pwbt (x)
UIButton *passwordButton (o)
누구나 알아볼수있도록 변수이름을 명확히 적어주어야 한다.
```

- **접두어**

### Code
``` objectivec
ui imageview (x)
UI는 대문자로 정해져 있기 때문에 소문자로는 잘못된 표현이다
UIImageView (o)
대문자로 표기하여야 한다
```

- **클래스 및 프로퍼티명**

### Code
``` objectivec
@interface ViewController (o)
명확히 표현되어 있다
@interface viewController (x)
클래스이름은 무조건 앞자리에 대문자가 표기되어야 한다

- (void)touchIn:(UIButton *)button (O)
메서드명이 소문자와 대문자로 되어있어 명확하다
- (void)touchin:(UIButton *)button (X)
메서드명이 구분이 되어있지 않아 명확하지 않다
- (void)Touchin:(UIButton *)Button (x)
메서드명의 처음은 대문자로 해서는 안된다
```

- **헤더파일**

파일명에 애플에서 정해놓은 클래스의 이름과 동일하게 해서는 안된다.
동작이 안되지는 않지만 피하는게 좋다.
>x-code파일명 UITableVIew 1 (x)  StudyTableView (o)
