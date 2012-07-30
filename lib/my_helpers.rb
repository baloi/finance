def expenditure_list(expenditures)
  ret_val = ''

  expenditures.each {|expense|
    ret_val = ret_val + "#{expense[0]}, #{expense[1]}" 
    ret_val = ret_val + '<br/>' 

  }

  ret_val
end
