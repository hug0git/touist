/*
 *
 * Project TouIST, 2015. Easily formalize and solve real-world sized problems
 * using propositional logic and linear theory of reals with a nice GUI.
 *
 * https://github.com/olzd/touist
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Contributors:
 *     Alexis Comte, Abdelwahab Heba, Olivier Lezaud,
 *     Skander Ben Slimane, Maël Valais
 *
 */

package translation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Abdel
 * @Modified by Mael
 */
public class Translator {
	final private String outputFilePath = "out.cnf";
	final private String outputTableFilePath = "out.table";
	private String translatorProgramFilePath;
	private Map<Integer,String> literalsMap = new HashMap<Integer,String>();
	private List<Error> errors;
	private List<Warning> warnings;

	private Process p;



	/**
	 * This generic message class holds a message generated by the translator,
	 * with the format (row,column,message_text)
	 * @author maelv
	 */
	public class Message {
		private int rowInCode;
		private int columnInCode;
		private String sampleOfCode;

		public Message(int rowInCode, int columnInCode, String sampleOfCode) {
			this.rowInCode = rowInCode;
			this.columnInCode = columnInCode;
			this.sampleOfCode = sampleOfCode;
		}

		@Override
		public String toString() {
			// TODO enhance this message display
			return "Message [rowInCode=" + rowInCode + ", columnInCode="
					+ columnInCode + ", sampleOfCode=" + sampleOfCode + "]";
		}
	}

	/**
	 * This class holds one error that might be generated by the translator,
	 * with the format (row,column,error_text)
	 * @author maelv
	 */
	public class Error extends Message {
		public Error(int rowInCode, int columnInCode, String sampleOfCode) {
			super(rowInCode, columnInCode, sampleOfCode);
		}

	}

	/**
	 * This class holds one warning that might be generated by the translator,
	 * with the format (row,column,warning_text)
	 * @author maelv
	 */
	public class Warning extends Message {
		public Warning(int rowInCode, int columnInCode, String sampleOfCode) {
			super(rowInCode, columnInCode, sampleOfCode);
		}
	}

	public Translator(String translatorProgramFilePath) {
		this.translatorProgramFilePath = translatorProgramFilePath;
	}

	/**
	 * Calls the translator/compiler to transform the ".bigand" file to a
	 * ".dimacs" file (along with a "mapping" file). This method also calls the
	 * parsing methods parseErrorsAndWarnings and (if the translation actually
	 * passed) parseLiteralsMapFile.
	 *
	 * @param bigandFilePath is the name of the file that the
	 * translator/compiler is going to compute. The translation is handled by a
	 * third-part program called by an system "exec" command. The translator can
	 * return three kind of things : - A ".dimacs" file and a "mapping" file if
	 * everything goes well. The mapping file allows the user to get the
	 * original litteral name instead of the integer notation used by the
	 * ".dimacs" file. Note that it can be used after the solver gives results.
	 * - If anything goes wrong (syntax error, semantic error, wrong type...),
	 * the translator gives his error message on the "stderr" file.
	 *
	 * @return true if the translation went well (migth have generated some
	 * warning though), false of fatal errors (syntax/semantic errors) happened
	 *
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public boolean translate(String bigandFilePath) throws IOException, InterruptedException {
		/* return_code :
		 *  | OK -> 0
  			| COMPILE_ERRORS -> 1
  			| COMPILE_JUSTWARNINGS -> 2
  			| ARGUMENTS_ERROR -> 3
		 */
		String cmd =
				translatorProgramFilePath
				+ " -o " + outputFilePath
				+ " -table " + outputTableFilePath
				+ " " + bigandFilePath;
		this.p = Runtime.getRuntime().exec(cmd);
		int return_code = p.waitFor();
		// Response will put 2Lines: first contain dimacs path & seconde TR path
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				this.p.getInputStream()));
		List<String> lines = new ArrayList<String>();
		while (reader.ready()) {
			lines.add(reader.readLine());
		}
		reader.close();

		// TODO Parse the output from "List<String> lines"
		if(return_code == 0) {
			parseLiteralsMapFile(outputTableFilePath);
		}
		return return_code==0;
	}

	/**
	 * Allows the user to get the literalsMap that contains the matching table
	 * between the DIMACS integers and the real literals names. This map is used
	 * by the Solver instance.
	 * @warning This table is NOT the same as the table returned by Solver class
	 * @return the map
	 */
	public Map<Integer,String> getLiteralsMap() {
		return literalsMap;
	}

	/**
	 * Allows the user to get the path of the generated DIMACS file.
	 * @return the file path
	 */
	public String getDimacsFilePath() {
		return outputFilePath;
	}

	/**
	 * Allows the user to get a list of the warnings generated by the
	 * translator. See the Warning class.
	 * @return the list of warnings
	 */
	public List<Warning> getWarnings() {
		return warnings;
	}

	/**
	 * Allows the user to get a list of the errors generated by the translator.
	 * See the Error class.
	 * @return the list of warnings
	 */
	public List<Error> getErrors(String stderr) {
		return errors;
	}

	/**
	 * Method used by Translator.translate() to parse the errors and the
	 * warnings from the standard error output ("stderr") provided by the
	 * translation program.
	 * @param rawStderr the raw output from the "stderr" file generated by the
	 * translation program
	 */
	private void parseErrorsAndWarnings(String rawStderr) {
		// TODO parseErrorsAndWarnings
	}

	/**
	 * Method used by Translator.translate() to parse the literals map file that
	 * holds the matching names for the given DIMACS integers.
	 * @param literalsMapFilePath
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	private void parseLiteralsMapFile(String literalsMapFilePath)
			throws FileNotFoundException, IOException {
		/*
		 * Example of Table/map file:
		 * 		A(b) 3
		 * 		B(a) 4
		 * 		C(a) 1
		 * 		B(b) 2
		 */
		File TR = new File(literalsMapFilePath);
		BufferedReader br = new BufferedReader(new FileReader(TR));
		String line = "";
		while (br.ready()) {
			line = br.readLine();
			String[] splitted = line.split(" ");
			String literalString = splitted[0];
			int literalCode = Integer.parseInt(splitted[1]);
			literalsMap.put(literalCode, literalString);
		}
		br.close();
	}

}
