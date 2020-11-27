<html>
<link rel="stylesheet" href="css.css">
<link rel="icon" href="data:;base64,=">

<head>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="https://pbs.twimg.com/media/BtuLbpeCIAA41Cu?format=jpg&name=large" type="image/x-icon">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pixylizator</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>

<body>

<h1  class ="brd" align="center" style="color:orange">Pixelizator</h1>
<div class ="all-text">
        <div>
        <label class="colorChoose" for="fileUploader" >
            Choose image to upload
        </label>
        </div>
    <div>
<%--        <label for="fileUploader" class id="custom-file-upload">Choose image to upload </label>--%>
        <input  type="file" value="upload" id="fileUploader" name="file" accept="image/*" width="500" height="600">
    </div>

    <div>
        <label  class="colorChoose" for="pixSize"> Pixel size:</label>
        <input type="text" id="pixSize">
        <button id="doPix">Pixelizate</button>
    </div>
    <div class="download">
        <label  class="colorChoose" for="types">Download type:</label>
        <select name="type" id="types">
            <option value="tiff">tiff</option>
            <option value="bmp">bmp</option>
            <option value="jpeg">jpeg</option>
            <option value="jpg">jpg</option>
            <option value="gif">gif</option>
        </select>
        <button id="downloadBtn">download</button>
    </div>

</div>
<div class="box-image">
    <div class="firstImageBlock">
        <img  class="colorChoose" id="forInput" src="" alt="Input" width="400" height="400">
    </div>
    <div class="secondImageBlock">
        <img  class="colorChoose" id="forOutput" src="" alt="Output" width="400" height="400">
    </div>
</div>


    <p class="center" align="center">
        Total size: <span  id="MB-label">0 MiB</span>
    </p>

<script src="js/get_data.js"></script>
</body>
</html>
