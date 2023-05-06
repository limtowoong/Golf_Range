![image](https://user-images.githubusercontent.com/104752202/236630687-17946f60-257a-4939-8077-1c5193829276.png)

c_name에 벨류값을 주고 onchange로 checkName에 벨류 값을 저장합니다.

![image](https://user-images.githubusercontent.com/104752202/236630773-1d4be7ec-44e8-4410-85a0-e77f32fcc7de.png)

checkName이라는 function을 만들고 c_no에 checkName 안에 있는 벨류를 넣습니다.




![image](https://user-images.githubusercontent.com/104752202/236630832-7003c463-31b1-48f6-92b9-9eae3dac34ba.png)

위와 똑같습니다. 하지만

![image](https://user-images.githubusercontent.com/104752202/236630854-4e7c8375-7e9c-42dd-8aa4-1792db957ea4.png)

벨류값을 가져오고 다른 값에 넣지 않았습니다.

그럼 벨류값은 계속 class_name에 있겠죠




![image](https://user-images.githubusercontent.com/104752202/236630899-ad1b4ace-1bee-486d-87b0-1ce1b8433c35.png)

값을 받은 것을 insert 합니다

c_name에 벨류 값은 c_no에 있기 때문에 insert 하지 않습니다.

하지만 class_name에 있는 벨류 값이 바뀌지 않았기 때문에 class_name을 insert 해주고

![image](https://user-images.githubusercontent.com/104752202/236631040-d46b78c2-3459-49f1-9df7-e4d82194b284.png)


price값을 tuition에 넣었기 때문에 tuition도 insert 해줍니다.

여기서 tuition은 sql에서 number 형식이지만 

저희는 option에서 벨류값을 문장 형식으로 받았기 때문에 setString 으로 받아와줍니다.
