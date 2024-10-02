import re
def default_preprocessing(filepath):
    search_keywords = ['CWE', 'good', 'bad']
    with open(filepath, 'r') as file:
        lines = file.readlines()
    
    identifier_counter = {}
    count = 1
    new_lines = []
    within_code_section = False
    for line in lines:
        # Skip lines before 'target triple'
        if "target triple" in line:
            within_code_section = True
            continue
        
        if within_code_section:
            # Skip lines after 'attributes'
            if "attributes" in line:
                break
            
            # Skip metadata lines
            if line.startswith(";"):
                continue
            
            # Search for identifiers containing keywords
            for keyword in search_keywords:
                if keyword in line:
                    identifiers = re.findall(r'\b\w+\b', line)
                    for identifier in identifiers:
                        if keyword in identifier:
                            if identifier not in identifier_counter:
                                identifier_counter[identifier] = count
                                count += 1
                            new_identifier = f"a_{identifier_counter[identifier]}"
                            line = re.sub(rf'\b{identifier}\b', new_identifier, line)
            
            new_lines.append(line)
    with open(filepath, 'w') as file:
        file.writelines(new_lines)
    return file