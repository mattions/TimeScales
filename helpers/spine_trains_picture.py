# IPython log file

def create_spine_name(spine_list):
    spine_sections_name = []
    for spine in spine_list:
        spine_sec_head = "spine%s_head" %spine
        spine_sec_neck = "spine%s_neck" %spine
        spine_sec_psd = "spine%s_psd" %spine
        spine_sections_name.append(spine_sec_head)
        spine_sections_name.append(spine_sec_neck)
        spine_sections_name.append(spine_sec_psd)
    return spine_sections_name




if __name__ == "__main__":

    spines_stimulated = [554, 555, 556, 558, 559, 560, 562, 563, 564, 
                  1468, 1469, 1470, 1472, 1473, 1474, 1476, 1477, 
                  1478]
    spines_second_train = [555, 559, 563, 1469, 1476, 1473]
    
    spines_sections_name = create_spine_name(spines_stimulated)
    spines_second_train_name = create_spine_name(spines_second_train)
    
    scalar_value = []
    
    for spine_sec in spines_sections_name:
        if spine_sec in spines_second_train_name:
            scalar_value.append(1)
        else:
            scalar_value.append(0.5)
            
    print "Now run: "
    print "controls.visio.select_sections(spines_sections_name, scalar_value)"