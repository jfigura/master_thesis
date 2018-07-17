import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class InputParser {
	
	//Transforms the original data to our matrix format.


	private static void writeLine(BufferedWriter wr, String type, String alpha,
			String alphaVar, String dist, String distVar, String beta,
			String betaVar, String gpsLat, String gpsLon, String gpsVar,
			String comp, String compVar) throws IOException {
		wr.write(String.format("%s;%s;%s;%s;%s;%s;%s,%s,%s,%s,%s,%s", type,
				alpha, alphaVar, dist, distVar, beta, betaVar, gpsLat, gpsLon,
				gpsVar, comp, compVar));
		wr.newLine();
	}

	public static void main(String[] args) {
		try {
			// open input stream test.txt for reading purpose.
			String line;
			BufferedReader br = new BufferedReader(new FileReader(
					"C://testy/robots/input.txt"));
			BufferedWriter wr = new BufferedWriter(new FileWriter(
					"C://testy/robots/output.csv"));
			while ((line = br.readLine()) != null) {
				if (line.isEmpty()) {
					continue;
				}
				if (line.startsWith("move")) {
					String[] parts = line.split(" ");
					String[] alpha = parts[1].split(":");
					String[] dist = parts[2].split(":");
					String[] beta = parts[3].split(":");
					writeLine(wr, "1", alpha[0], alpha[1], dist[0], dist[1],
							beta[0], beta[1], "0", "0", "0", "0", "0");
				}
				if (line.startsWith("compass")) {
					String[] parts = line.split(" ");
					String[] comp = parts[1].split(":");
					writeLine(wr, "2", "0", "0", "0", "0", "0", "0", "0", "0",
							"0", comp[0], comp[1]);
				}
				if (line.startsWith("gps")) {
					String[] parts = line.split(" ");
					writeLine(wr, "3", "0", "0", "0", "0", "0", "0", parts[1],
							parts[2], parts[3], "0", "0");
				}
			}
			wr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
