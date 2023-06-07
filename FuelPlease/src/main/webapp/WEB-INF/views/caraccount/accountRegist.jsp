<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>

<section>
    <div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-9 col-sm-12 aRegist-form">
                <div class="titlebox">
                    <p>Fuel Please 차계부등록</p>
                </div>
                <form action="${pageContext.request.contextPath}/caraccount/regist" method="post" name="aRegistForm">
                    <div class="form-group">
                        <label for="year">연도</label>
                        <div class="select-group">
                            <select name="year" class="form-control" id="year">
                                <option>2023</option>
                                <option>2022</option>
                                <option>2021</option>
                                <option>2020</option>
                                <option>2019</option>
                                <option>2018</option>
                                <option>2017</option>
                                <option>2016</option>
                                <option>2015</option>
                                <option>2014</option>
                                <option>2013</option>
                            </select>
                        </div>
                        <label for="month">월</label>
                        <div class="select-group">
                            <select name="month" class="form-control" id="month">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                            </select>
                        </div>
                        <label for="day">일</label>
                        <div class="select-group">
                            <select name="day" class="form-control" id="day">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="type">주유타입</label>
                        <select name="type" id="type">
                            <option>휘발유</option>
                            <option>고급휘발유</option>
                            <option>LPG</option>
                            <option>전기</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="price">가격</label>
                        <input type="text" class="form-control" id="price" name="price" placeholder="단위:원, 숫자만 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="note">비고</label>
                        <input type="text" class="form-control" id="note" name="note" placeholder="메모작성란">
                    </div>
                    <!-- 
                    <div class="form-group">
                        <label for="location">장소</label>
                        <input type="text" name="location" class="form-control" id="location" placeholder="장소">
                    </div>
                    -->

                    <div class="form-group">
                        <button type="button" id="registBtn" class="btn btn-lg btn-info btn-block">등록하기</button>
                        <button type="button" id="listBtn" class="btn btn-lg btn-info btn-block"
                            onclick="location.href='${pageContext.request.contextPath}/caraccount/accountList'">목록</button>
                    </div>
                </form>
            </div>
        </div>

</section>
<script>
    
    document.getElementById('registBtn').onclick = function () {
        let pirce = document.getElementById('price').value;
        if (pirce === '') {
            alert('가격을 입력해주세요');
            return;
        }

        if (confirm('차계부 등록을 진행합니다.')) {       
            alert('등록 되었습니다.');
            document.aRegistForm.submit();
        }
    }
    
</script>




<%@ include file="../include/footer.jsp" %>