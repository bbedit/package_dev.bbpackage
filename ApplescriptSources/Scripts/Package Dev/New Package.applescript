-- an Applescript UI over the create_package.rb script in the BBEdit Package Package

to find_my_path()
	--return path to me
	return alias "OSX_Vera:Users:aias:Dropbox:Application Support:BBEdit:Packages:BBEdit_PackageDev.bbpackage:Contents:Scripts:Package Dev:New Package.scpt"
end find_my_path

on find_package_root()
	set path_to_me to find_my_path()
	
	tell application "Finder"
		return container of (container of (container of path_to_me))
	end tell
end find_package_root

on find_create_package_script()
	set package_root to find_package_root()
	
	tell application "Finder"
		return POSIX path of ((file "create_package.rb" of folder "bin" of folder "SharedSupport" of package_root) as string)
		
	end tell
end find_create_package_script

on run
	set dialog_res to display dialog "Name of the new package to create" default answer "Lua"
	set package_name to text returned of dialog_res
	
	set dialog_res to display dialog "What file suffix is used to identify files of this type? (Can be blank)" default answer ".lua"
	set file_extension to text returned of dialog_res
	
	--display dialog (find_create_package() as string)
	
	set shell_result to do shell script ("/usr/bin/ruby " & quoted form of find_create_package_script() & " '" & package_name & "'" & " '" & file_extension & "'")
	--end
	--display dialog (path to me as string)
	
	
	tell app "BBEdit" to make new document with properties {contents: shell_result}
end run
