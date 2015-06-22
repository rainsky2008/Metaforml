input_path = ARGV[0]

directory = Dir.glob("#{input_path}/*")

app_path = "xsl"
metaphor_jar = File.join(app_path, 'metaphor.jar')
saxon8_jar = File.join(app_path, 'saxon8.jar')
saxon9_jar = File.join(app_path, 'SaxonPE9-5-1-10J/saxon9pe.jar')
template_xsl = File.join(app_path, 'templates.xsl')
mathtype_xsl = File.join(app_path, 'mathtype2ml.xsl')
createXSL = File.join(app_path, 'createXSL.xsl')
dynamic_xsl = File.join(app_path, 'dynamic.xsl')

directory.each do |folder|
	sub_folder = Dir.glob("#{folder}/*")	
	sub_folder.each do |folders|		
		sub_sub_folder = Dir.glob("#{folders}/*")	
		sub_sub_folder.each do |files|
			puts File.expand_path(files)			
			# OLE to xml
			result = `java -jar #{metaphor_jar} -i #{files} -o #{File.join(folders, 'output.xml')}`
			
			# normalize the xml
			result = `java -jar #{saxon8_jar} -o #{File.join(folders, 'inp.xml')} #{File.join(folders, 'output.xml')} #{template_xsl}`

			# merge the xml into one
			#result = `java -jar #{saxon9_jar} #{File.join(folders, 'inp.xml')} #{mathtype_xsl} >#{File.join(app_path, 'math2mml.xml')}`

			# create dynamic xsl
			result = `java -jar saxon8.jar -o #{dynamic_xsl} #{File.join(app_path, 'math2mml.xml')} #{createXSL}`

			# convert olexml to mathml
			result = `java -jar #{saxon8_jar} -o #{File.join(folders, 'final_mml.xml')} #{File.join(folders, 'inp.xml')} #{dynamic_xsl}`
		end
	end
end