<html>
<%--<link rel="stylesheet" href="cssPage.css">--%>
<%--<link rel="icon" href="data:;base64,=">--%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pixylizatorr</title>
</head>
<style>
        .brd {
            border: 4px double black; /* Параметры границы */
            background: #ffcc33; /* Цвет фона */
            padding: 5px; /* Поля вокруг текста */
        }
</style>
<body bgcolor="FF E4 B5">
<h1  class ="brd" align="center" style="color:#CC7722">Pixelizator</h1>
<%--        <h2>Hello from HelloServlet</h2>--%>
<form action="hello">
    <button type="submit" value="Upload"  style="font-size: 20px" ></button>
</form>
    <div class="input">
        <label class="forformelem " for="fileUploader">
            Choose image to upload
        </label><br>
        <input type="file" value="upload" id="fileUploader" name="file" accept="image/*" width="500" height="600">
    </div>
    <div class="firstImageBlock">
        <img class="img1" id="forInput" src="" alt="Input" width="400" height="400">
    </div>
    <div class="secondImageBlock">
        <img class="img2" id="forOutput" src="" alt="Output" width="400" height="400">
    </div>

    <div class="inputData">
        <label for="pixSize"> Pixel size:</label>
        <input type="text" id="pixSize">
        <button id="#clickBtn">Pixelizate</button>
    </div>

<script src="get_data.js"></script>
</body>
</html>
