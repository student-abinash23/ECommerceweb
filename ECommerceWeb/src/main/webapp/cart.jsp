<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Your Shopping Cart</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; }
        .container { width: 80%; margin: 20px auto; background-color: #fff; padding: 20px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; color: #555; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .total-row { font-weight: bold; background-color: #e9e9e9; }
        .empty-cart { text-align: center; padding: 50px; color: #888; }
        .action-links { display: flex; justify-content: space-between; margin-top: 20px; }
        .action-links a, .checkout-btn { padding: 10px 20px; text-decoration: none; border-radius: 5px; }
        .action-links a { background-color: #007bff; color: white; }
        .action-links a:hover { background-color: #0056b3; }
        .checkout-btn { background-color: #28a745; color: white; border: none; cursor: pointer; float: right; }
        .checkout-btn:hover { background-color: #218838; }
        .quantity-control { display: flex; align-items: center; }
        .quantity-control button { background: none; border: 1px solid #ccc; padding: 5px 10px; cursor: pointer; }
        .quantity-control input { width: 40px; text-align: center; border: 1px solid #ccc; }
        .remove-btn { color: #dc3545; text-decoration: none; font-weight: bold; }
        .remove-btn:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Shopping Cart</h2>
        <div class="action-links">
            <a href="${pageContext.request.contextPath}/products">Continue Shopping</a>
            <a href="${pageContext.request.contextPath}/cart/clear">Clear Cart</a>
        </div>
        <hr>

        <c:if test="${empty sessionScope.cart.items}">
            <div class="empty-cart">
                <p>Your cart is empty. Why not add some amazing products? 😊</p>
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.cart.items}">
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.cart.items}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td><fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$"/></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/update" method="post" style="display:inline;">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.product.stockQuantity}" onchange="this.form.submit()">
                                </form>
                            </td>
                            <td><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="$"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/cart/remove?productId=${item.product.id}" class="remove-btn">Remove</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr class="total-row">
                        <td colspan="3">Grand Total</td>
                        <td colspan="2"><fmt:formatNumber value="${sessionScope.cart.total}" type="currency" currencySymbol="$"/></td>
                    </tr>
                </tfoot>
            </table>
            <br>
            <button class="checkout-btn">Proceed to Checkout</button>
        </c:if>
    </div>
</body>
</html>