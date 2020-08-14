## 전자정부 표준프레임워크 커스터마이징 

***
### 커스터마이징 후 파스타 클라우드 활용예정(공통)
1. 스프링프로젝트 kimriyoon_egov 변경 -> kimriyoon-egov
2. 이클립스에서 kimriyoon-egov 프로젝트를 파스타에 배포.(Mysql용)
3. kimriyoon-egov 프로젝트용 클라우드 DB생성: 서비스명은 egov-mysql-db
4. 파스타 클라우드에서 egov-mysql-db의 원격접속이름과 암호를 확인.
5. 이미 생성된 phpmyadmin 애플리케이션명: kimriyoon-myadmin 실행.
6. http://kimriyoon-myadmin.paas-ta.org 접속 후 전자정부 프로젝트용 더미데이터 인서트.
7. http://kimriyoon-egov.paas-ta.org 사이트에서 파스타 배포결과 확인.
***

### 20200814(금) 작업예정(아래)
- 3. 로컬PC에서 결과 확인 후 파스타에 배포예정.
- 2. 멤버 뷰페이지, 업데이트페이지, 인서트 페이지 생성.

```
● 우리가 기존에 작업한 스프링 프로젝트는 아래처럼
<form id="폼이름" name="폼이름">
</form>
● 전자정부 프로젝트에서는 아래처럼
<form:form commandName="폼이름" name="폼이름">
</form:form>
```
- 1. 컨트롤러에 멤버리스트페이지 경로추가(아래)
- edu.human.com.member.web 패키지생성(컨트롤러용 패키지)
- MemberController.java @Controller클래스 생성.
- com/member/selectMember.do 경로추가(아래)
- 0. 관리자관리 경로 com/member.selectMember.do 로그인체크 추가
  로그인체크 관련 파일: egov-com-servlet.xml(서블렛파일) 인터셉터 관리
 뷰리졸버(viewresolver): 뷰단(jsp)단 해석기계.(웹페이지루트, 확장자 지정)

```
/**
 관리자관리 목록을 조회한다.
*/
@RequestMapping("/com/member/selectMember.do")
public List<EmployerInfoVO> selectMember(Model model) throws Exception {
	model.addAttribute("resultList", 멤버서비스호출);
	return "com/member/list";
}
```

### 20200812-13(수-목) 작업내역(아래)
- 6. jsp폴더(뷰폴더)에 inc/EgovIncLefmenu.jsp 파일 수정

```
메뉴 내용 추가(아래)
<li class="dept02"><a href="javascript:fn_main_headPageAction('57','com/member/selectMember.do')">관리자관리</a></li>
```
- 5. viewMember 쿼리+DAO+Service매서드 추가 후 Junit 테스트 OK.
- 4. Junit 테스트로 CRUD 확인.
- 3. Service 클래스에서 insertMember, updateMember, deleteMember 메서드 생성
- 2. DAO 클래스에서 insertMember, updateMember, deleteMember 메서드 생성
- 1. 쿼리생성: src/main/resources/egovframework/mapper/com/member/member_mysql.xml
  
### 20200811(화) 작업내역(아래)
- Junit 테스터로 DAO의 selectMember 실행하기. 

```
3. egov-com-servlet.xml 파일에서 component-scan 부분에서 제외된(exclude)를 -> 포함시킴(include)
2. src/test/java/~/TestMember.java 추가함. @ContextConfiguration 경로가 2개추가.
1. 전자정부 프로젝트는 기본 Junit이 없기때문에 테스트환경 만들어야 함. Pon.xml에 junit 모듈 추가하기.
```
- DAO(@Repository), Service(@Service) 만들기

```
3. service/impl/MemberServiceImpl.java (구현클래스) 특이사항:@Resource 대신에 @Inject 사용
2. service/MemberService.java (인터페이스)
1. service/impl/MemberDAO.java (추상클래스를 사용, extends EgovAbstractMapper 필수)
```
- 프로젝트에서 마이바티스 사용하기

```
4. 스프링 마이바티스 설정파일 추가: context-mapper.xml
- configLocation: 마이바티스 설정파일 위치 mapper-config.xml 추가
- mapperLocation: 쿼리가 존재하는 폴더위치 member_mysql.xml 추가(쿼리) 
3. 관리자관리 테이블과get,set 하는 VO 만들기: EmployerInfoVO.java
- 테이블 생성쿼리에서 필드명 복사 VO 자바파일에서 사용, 특이사항:대->소문자변경단축기(Ctrl_Shitf+y)
2. 관리자관리에 사용되는 테이블 확인 : emplyrinfo
1. 메이븐 모듈 추가(pom.xml)
<!-- 마이바티스 사용 모듈 추가 -->
<dependency> 
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis</artifactId>
	<version>3.2.8</version>
</dependency>
<dependency>
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis-spring</artifactId>
	<version>1.2.2</version>
</dependency>
```
### 20200810(월) 작업내역(아래)
- context-datasource.xml: Hsql 데이터베이스 사용 주석처리

```
<!-- hsql -->
<!-- 여기만 주석처리
<jdbc:embedded-database id="dataSource-hsql" type="HSQL">
	<jdbc:script location= "classpath:/db/shtdb.sql"/>
</jdbc:embedded-database>
-->
```
- globals.properties :(주,유니코드 에디터로 수정) DB에 관련된 전역변수 지정(아래)

```
# DB서버 타입(mysql,oracle,altibase,tibero) - datasource 및 sqlMap 파일 지정에 사용됨
Globals.DbType = mysql
Globals.UserName=root
Globals.Password=apmsetup
# mysql
Globals.DriverClassName=net.sf.log4jdbc.DriverSpy
Globals.Url=jdbc:mysql://127.0.0.1:3306/sht
#Hsql - local hssql 사용시에 적용
#Globals.DriverClassName=net.sf.log4jdbc.DriverSpy
#Globals.Url=jdbc:log4jdbc:hsqldb:hsql://127.0.0.1/sampledb
```
- web.xml : 톰캣(WAS)가 실행될때 불러들이는 xml설정들 확인.

```
egov-com-serlet.xml(아래) 
- DispatcherServlet(서블렛배치=콤포넌트-scan:@Controller,@Service,@Repository에 관련된 설정 수정)
- <context:component-scan base-package="egovframework,edu">
- 위에서 ,edu 추가: edu.human.com패키지추가로 해당패키지로 시작하는 콤포넌트를 빈(실행가능한 클래스)으로 자동등록하게 처리
```
- pom.xml : 메이븐 설정 파일중 Hsql DB를 Mysql DB사용으로 변경(아래)

```
<!-- 주석처리
<dependency>
	<groupId>org.hsqldb</groupId>
	<artifactId>hsqldb</artifactId>
	<version>2.3.2</version>
</dependency>
 -->
<!-- mysql driver 주석해제 -->	
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.31</version>
</dependency>

<!-- log4jdbc driver 주석해제. 기능:Console창에 쿼리보이기 -->        
<dependency>
    <groupId>com.googlecode.log4jdbc</groupId>
    <artifactId>log4jdbc</artifactId>
    <version>1.2</version>
    <exclusions>
        <exclusion>
            <artifactId>slf4j-api</artifactId>
            <groupId>org.slf4j</groupId>
        </exclusion>
    </exclusions>
</dependency>
```