import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONArray;
import org.json.JSONObject;

public class JsonCoordinateTransformer {

    public static void main(String[] args) {
        String inputFilePath = "/Users/gupro/Downloads/서울시 지하철역 엘리베이터 위치정보.json"; // 입력 파일 경로
        String outputFilePath = "/Users/gupro/Downloads/서울시 지하철역 엘리베이터 위치정보.json"; // 출력 파일 경로

        try {
            // JSON 파일 읽기
            BufferedReader reader = new BufferedReader(new FileReader(inputFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            // JSON 파싱
            JSONArray jsonArray = new JSONArray(sb.toString());

            // 모든 JSON 객체 처리
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);

                // node_wkt 필드에서 좌표 추출
                String nodeWkt = jsonObject.getString("node_wkt");
                double[] coordinates = extractCoordinates(nodeWkt);

                // 새로운 x, y 필드를 추가
                jsonObject.put("x_wgs84", coordinates[0]);
                jsonObject.put("y_wgs84", coordinates[1]);
            }

            // 변환된 JSON을 파일에 저장
            FileWriter writer = new FileWriter(outputFilePath);
            writer.write(jsonArray.toString(4)); // 들여쓰기 포함 저장
            writer.close();

            System.out.println("변환된 JSON이 저장되었습니다: " + outputFilePath);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // POINT(x y) 형식의 문자열에서 x와 y 좌표 추출
    private static double[] extractCoordinates(String pointString) {
        String regex = "-?\\d+(\\.\\d+)?";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(pointString);

        double[] coordinates = new double[2];
        int count = 0;
        while (matcher.find() && count < 2) {
            coordinates[count++] = Double.parseDouble(matcher.group());
        }
        return coordinates;
    }
}

