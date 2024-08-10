<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- Define BookRepository bean -->
    <bean id="bookRepository" class="com.library.repository.BookRepositoryImpl"/>

    <!-- Define BookService bean with setter injection -->
    <bean id="bookService" class="com.library.service.BookServiceImpl">
        <property name="bookRepository" ref="bookRepository"/>
    </bean>

</beans>