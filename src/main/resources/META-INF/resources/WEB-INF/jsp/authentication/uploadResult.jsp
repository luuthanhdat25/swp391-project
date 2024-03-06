<!DOCTYPE html>
<html>
<head>
    <title>Upload Result</title>
</head>
<body>

<h2>Upload Result</h2>

<ul>
    <li th:each="fileName : ${fileNames}">File <span th:text="${fileName}"></span> uploaded successfully.</li>
</ul>

</body>
</html>
