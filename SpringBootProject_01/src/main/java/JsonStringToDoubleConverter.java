import org.json.JSONArray;
import org.json.JSONObject;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class JsonStringToDoubleConverter {

    public static void main(String[] args) {
        // JSON 파일 경로
        String filePath = "/Users/gupro/Downloads/localization.json";

        try {
            // JSON 파일을 문자열로 읽음
            String content = new String(Files.readAllBytes(Paths.get(filePath)));

            // JSON 파일을 JSONObject로 변환
            JSONArray jsonArray = new JSONArray(content);

            // JSON Array의 각 객체에 대해 특정 키 값을 변환
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);

                // 특정 키 값 변환 (예: x_wgs84와 y_wgs84)
                if (jsonObject.has("x_wgs84")) {
                    String x_wgs84Str = jsonObject.getString("x_wgs84");
                    jsonObject.put("x_wgs84", Double.parseDouble(x_wgs84Str));
                }
                if (jsonObject.has("y_wgs84")) {
                    String y_wgs84Str = jsonObject.getString("y_wgs84");
                    jsonObject.put("y_wgs84", Double.parseDouble(y_wgs84Str));
                }
            }

            // 변환된 JSON 객체를 다시 파일로 저장
            try (FileWriter file = new FileWriter(filePath)) {
                file.write(jsonArray.toString(4)); // 4는 들여쓰기(indent) 레벨
                file.flush();
            }

            System.out.println("변환이 완료되었습니다.");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
