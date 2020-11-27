import Picture.Picture;
import com.google.gson.Gson;
import org.apache.commons.codec.binary.Base64;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet("/hello")
@MultipartConfig
public class HelloServlet extends HttpServlet {
    private static final double[] pixel = new double[4];
    private final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            PrintWriter out = response.getWriter();
            Part part = request.getPart("file");
            String pixSize = request.getHeader("pixSize");
            String imageJson = imageBytesToJson(part, Integer.parseInt(pixSize));

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.println(imageJson);
            out.close();

    }

    private void pixelizatingImgKubes(Raster src, WritableRaster dest, int pixSize) {
        for (int y = 0; y < src.getHeight(); y += pixSize) {
            for (int x = 0; x < src.getWidth(); x += pixSize) {
                src.getPixel(x, y, pixel);
                for (int yd = y; yd < y + pixSize && (yd < dest.getHeight()); yd++) {
                    for (int xd = x; xd < x + pixSize && (xd < dest.getWidth()); xd++) {
                        dest.setPixel(xd, yd, pixel);
                    }
                }
            }
        }
    }


    private BufferedImage pixelizImg(InputStream inputStream, int pixSize) throws IOException {
        BufferedImage bufferedImage = ImageIO.read(inputStream);// чтобы записать в bufferedImage, нужнчто считаь
        Raster src = bufferedImage.getData();// A class representing a rectangular array of pixels. // считали, и сделали со строки пикселей куб
        WritableRaster dest = src.createCompatibleWritableRaster();//  создали новый пустой куб

        pixelizatingImgKubes(src, dest, pixSize);
        bufferedImage.setData(dest);
        return bufferedImage;
    }


    String imageBytesToJson(Part part, int pixSize) throws IOException {
        String imageInString;
        Picture picture = new Picture();
        byte[] bytes;
        InputStream inputStream = part.getInputStream();//парс с фронта, открываем поток
        ByteArrayOutputStream boas  = new ByteArrayOutputStream();
        BufferedImage bufferedImage = pixelizImg(inputStream, pixSize);

        ImageIO.write(bufferedImage, "png", boas);
        bytes = boas.toByteArray();
        imageInString = Base64.encodeBase64String(bytes);
        picture.setImage(imageInString);
        return gson.toJson(picture);
    }

}