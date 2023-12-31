<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý xe</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            img {
                width: 200px;
                height: 120px;
                object-fit: cover;
                border-radius: 5px;
            }

            h2 {
                text-align: center;
                margin-top: 20px;
                margin-bottom: 30px;
                font-size: 28px;
            }

            table {
                width: 100%;
                margin-bottom: 20px;
                border-collapse: collapse;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            th, td {
                padding: 12px 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #343a40;
                color: #fff;
                font-weight: 600;
                text-transform: uppercase;
            }

            tr:nth-child(even) {
                background-color: #f8f8f8;
            }

            .button-container {
                display: flex;
                justify-content: center;
            }

            .edit-button, .delete-button {
                padding: 8px 12px;
                margin: 0 5px;
                font-size: 14px;
                font-weight: 500;
                text-transform: uppercase;
                border-radius: 5px;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .edit-button {
                background-color: #007bff;
                border: none;
            }

            .delete-button {
                background-color: #dc3545;
                border: none;
            }

            .edit-button:hover, .delete-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h2>Quản lý</h2>
        <table id="rentalTable" class="table table-striped table-hover">
            <tr>
                <th>ID</th>
                <th>Khách hàng</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Địa điểm</th>
                <th>Tên xe</th>
                <th>Ảnh xe</th>
                <th>Chi phí</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach items="${listRental}" var="o">
                <tr>
                    <td>${o.rentalId}</td>
                    <td>${o.customerName}</td>
                    <td>${o.startDate}</td>
                    <td>${o.endDate}</td>
                    <td>${o.address}</td>
                    <td>${o.carName}</td>
                    <td><img src="images/${o.carPicture}" alt="Car Image"></td>
                    <td>${o.cost}</td>
                    <c:choose>
                        <c:when test="${o.status eq 'uncheck'}">
                            <td>
                                <button class="edit-button" onclick="checkRental(${o.rentalId})" data-rental-id="${o.rentalId}">Duyệt đơn</button>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class="">
                                <button class="edit-button">Đã xác nhận</button>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    
                </tr>
            </c:forEach>
        </table>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                // Button click event handler
                $('.edit-button').click(function () {
                    var rentalId = $(this).data('rental-id');
                    checkRental(rentalId);
                });
            });

            function checkRental(rentalId) {
                $.ajax({
                    type: 'POST',
                    url: 'UpdateRentalStatus', // Servlet URL
                    data: { rentalId: rentalId },
                    success: function (response) {
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        </script>
    </body>
</html>
