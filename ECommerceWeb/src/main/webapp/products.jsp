<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products</title>
    <style>
        body { 
            font-family: sans-serif; 
            background: linear-gradient(135deg, #f0f4f8, #e6ecf3);
            margin: 0;
            padding: 0;
        }
        .container { width: 90%; margin: 0 auto; padding: 20px; }
        .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ccc; margin-bottom: 20px; }
        .product-grid { display: flex; flex-wrap: wrap; gap: 20px; }
        .product-card { background: white; border: 1px solid #ccc; padding: 15px; width: 220px; text-align: center; display: flex; flex-direction: column; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .product-card img { max-width: 100%; height: 150px; object-fit: cover; margin-bottom: 10px; border-radius: 8px; }
        .product-card .product-info { flex-grow: 1; }
        .product-card button { background-color: black; color: white; border: none; padding: 10px; cursor: pointer; width: 100%; margin-top: auto; border-radius: 8px; }
        .product-card button:hover { opacity: 0.85; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>Our Products</h2>
        <a href="${pageContext.request.contextPath}/cart">View Cart</a>
    </div>

    <c:if test="${not empty sessionScope.user}">
        <p>Welcome, ${sessionScope.user.name}!</p>
    </c:if>

    <div class="product-grid">
        <c:forEach var="product" items="${productList}">
            <div class="product-card">
                <img src="${product.imageUrl}" alt="${product.name}">
                <div class="product-info">
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <h4>Price: $${product.price}</h4>
                    <p>In Stock: ${product.stockQuantity}</p>
                </div>
                <form action="${pageContext.request.contextPath}/cart/add" method="post">
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
