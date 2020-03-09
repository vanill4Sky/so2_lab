opening_token = "{{{"
closing_token = "}}}"

template_file = open("readme_template.md", "r")
template_data =  template_file.read()

output = ""

start = 0
end = template_data.rfind(closing_token) + len(closing_token)

while(start < end):
    opening_token_pos = template_data.find(opening_token, start, end)
    output += template_data[start:opening_token_pos]
    closing_token_pos = template_data.find(closing_token, opening_token_pos + len(opening_token), end)
    start = closing_token_pos + len(closing_token)

    script_filename = template_data[
        opening_token_pos + len(opening_token) : closing_token_pos]
    try:
        script_file_data = open(script_filename, "r").read()
    except:
        script_file_data = "in progress"
    
    output += script_file_data

output += template_data[start:len(template_data)]

output_file = open("readme.md", "w")
output_file.write(output)

# flake8
