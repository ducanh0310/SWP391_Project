package controller.imageProfile;

import okhttp3.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/uploads")
@MultipartConfig(
    fileSizeThreshold   = 1024 * 1024 * 1,  // 1MB
    maxFileSize         = 1024 * 1024 * 10, // 10MB
    maxRequestSize      = 1024 * 1024 * 50  // 50MB
)
public class UploadServlet extends HttpServlet {
private static final String UPLOAD_DIR = "temp";
private static final String PUBLIC_KEY = "8fd56a9a01d2c29f310a";
private static final String UPLOAD_URL = "https://upload.uploadcare.com/base/";


@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Part filePart = request.getPart("file");
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

    // Tạo đường dẫn để lưu file tạm thời
    String appPath = request.getServletContext().getRealPath("");
    String uploadFilePath = appPath + File.separator + UPLOAD_DIR;
    Path uploadPath = Paths.get(uploadFilePath);

    if (!Files.exists(uploadPath)) {
        Files.createDirectories(uploadPath);
    }

    Path filePath = uploadPath.resolve(fileName);

    // Lưu file tạm thời
    try (InputStream inputStream = filePart.getInputStream()) {
        Files.copy(inputStream, filePath);
    }

    // Upload file lên UploadCare
    OkHttpClient client = new OkHttpClient();

    RequestBody fileBody = RequestBody.create(filePath.toFile(), MediaType.parse("image/jpeg"));
    RequestBody requestBody = new MultipartBody.Builder()
            .setType(MultipartBody.FORM)
            .addFormDataPart("UPLOADCARE_PUB_KEY", PUBLIC_KEY)
            .addFormDataPart("file", fileName, fileBody)
            .build();

    Request uploadRequest = new Request.Builder()
            .url(UPLOAD_URL)
            .post(requestBody)
            .build();

    try (Response uploadResponse = client.newCall(uploadRequest).execute()) {
        if (!uploadResponse.isSuccessful()) {
            throw new IOException("Unexpected code " + uploadResponse);
        }
        response.getWriter().println("File uploaded: " + uploadResponse.body().string());
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("File upload failed: " + e.getMessage());
    } finally {
        // Xóa file tạm thời sau khi upload xong
        Files.delete(filePath);
    }
}



}