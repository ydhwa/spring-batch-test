# Spring Batch Test

## Description
Spring Batch 테스트

### Function
1. 1분 주기로 DB에서 처리할 데이터를 읽어들인다. ()
2. 데이터를 처리한다.
   - 5초 정도의 delay를 주는 동작으로 대체  
3. 처리 결과를 다시 DB에 저장한다.

### Test
1. Batch Metadata 테이블을 RDB에서 생성하지 않고 처리할 수 있는가?
2. Reader에서 Querydsl 도입이 가능한가?

## Spec
- Spring Boot 2.4.5
- Spring Batch
- Spring Data JPA
- MariaDB 10.3