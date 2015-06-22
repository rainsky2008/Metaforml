
java -jar metaphor.jar -i /home/maha/Projects/MathType2MathML/checking/integral/t27/oleObject1.bin -o /home/maha/Projects/MathType2MathML/checking/integral/t27/output.xml


java -jar saxon8.jar -o /home/maha/Projects/MathType2MathML/checking/integral/t27/inp.xml /home/maha/Projects/MathType2MathML/checking/integral/t27/output.xml templates.xsl
#echo "Transformed"

java -jar /home/maha/Projects/mathtype2mml/math-typeole-to-mathml/xsl/SaxonPE9-5-1-10J/saxon9pe.jar text.xml mathtype2ml.xsl >math2mml.xml
#echo "Transformed"

java -jar saxon8.jar -o dynamic.xsl math2mml.xml createXSL.xsl
#echo "Transformed"

java -jar saxon8.jar -o /home/maha/Projects/MathType2MathML/checking/integral/t27/output_2.xml /home/maha/Projects/MathType2MathML/checking/integral/t27/inp.xml dynamic.xsl
#echo "Transformed"