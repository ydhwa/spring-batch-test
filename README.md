# Spring Batch Test

## Description
Spring Batch 테스트

### Function
1. 1분 주기로 DB에서 처리할 데이터를 읽어들인다.
   - cron: 15 * * * * *
2. 데이터를 처리한다.
   - 0~5초 정도의 delay를 주는 동작으로 대체
3. 처리 결과를 다시 DB에 저장한다.

### Test
1. 데이터를 chunk 단위로 처리할 수 있는가?
   - ex) 10개씩 끊어서 동시 처리
   - ***chunk 단위로 처리 가능하다.***
2. Batch Metadata 테이블을 RDB에서 생성하지 않고 처리할 수 있는가?
   - ***Job에서 DefaultBatchConfigurer를 상속받고, dataSource에 null 값을 세팅하면 Map 기반의 JobRepository가 실행된다.***
3. Reader에서 Querydsl 도입이 가능한가?
   - ***ItemReader를 직접 구현하여 사용해야 한다. (JpaPagingItemReader base로 구현)***

## Spec
- Spring Boot 2.4.5
- Spring Batch
- Spring Data JPA
- MariaDB 10.3
- Querydsl

## Database
```
src/main/resources/database-schema.sql
```

## Reference
- https://docs.spring.io/spring-batch/docs/current/reference/html/index.html
- https://www.fwantastic.com/2019/12/spring-batch-intro.html
- https://woowabros.github.io/experience/2020/02/05/springbatch-querydsl.html
- https://stackoverflow.com/questions/25077549/spring-batch-without-persisting-metadata-to-database
- https://jojoldu.tistory.com/493
- https://stackoverflow.com/questions/22509529/jpaitemwriter-no-transaction-is-in-progress
- https://www.tutorialfor.com/questions-335881.htm
- https://woowabros.github.io/experience/2020/02/06/hikaricp-avoid-dead-lock.html
- https://stackoverflow.com/questions/4932503/how-to-kill-mysql-connections
- https://www.toptal.com/spring/spring-batch-tutorial
