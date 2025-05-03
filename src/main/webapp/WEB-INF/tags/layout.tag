<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="title" required="true" %>

<html>
<head>
    <title>${title}</title>
</head>
<body>
    <header>
        <h1>This is the header</h1>
    </header>

    <main>
        <jsp:doBody />
    </main>

    <footer>
        <p>This is the footer</p>
    </footer>
</body>
</html>
