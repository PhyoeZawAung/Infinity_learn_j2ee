package uni.project.infinitylearn.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VideoStream extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final int BUFFER_SIZE = 10240; // 10KB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoPath = request.getParameter("path");
        String rootPath = System.getProperty("user.dir");
        String uploadPath = rootPath + File.separator + "uploads";
        String filePath = uploadPath + File.separator + videoPath;
        File videoFile = new File(filePath);

        if(!videoFile.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Video not found");
            return;
        }
        // Set the content type and length
        String mineType = getServletContext().getMimeType(videoFile.getAbsolutePath());

        if(mineType == null) {
            mineType = "application/octet-stream";
        }
        response.setContentType(mineType);
        response.setContentLength((int) videoFile.length());

        int videoLength = (int) videoFile.length();
        int start = 0;
        int end = videoLength - 1;
        boolean isPartial = false;

        String range = request.getHeader("Range");

        if (range != null) {
            isPartial = true;
            String[] ranges = range.replace("bytes=", "").split("-");
            start = Integer.parseInt(ranges[0]);
            if (ranges.length > 1) {
                end = Integer.parseInt(ranges[1]);
            }
            response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
            response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + videoLength);
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
        }
        response.setHeader("Accept-Ranges", "bytes");
        // Set the content disposition to inline

       long contentLength = end - start + 1;

       if(isPartial) {
        response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
        response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + videoLength);
            
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
        }
        response.setHeader("Content-Length", String.valueOf(contentLength));
        response.setHeader("Content-Disposition", "inline; filename=\"" + videoFile.getName() + "\"");

        // Stream the video file
        try (java.io.FileInputStream in = new java.io.FileInputStream(videoFile);
             java.io.OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead;
            in.skip(start);
            long bytesToRead = end - start + 1;

            while ((bytesToRead > 0) && (bytesRead = in.read(buffer, 0, (int) Math.min(buffer.length, bytesToRead))) != -1) {
                out.write(buffer, 0, bytesRead);
                bytesToRead -= bytesRead;
            }
        }
    }
    
}
