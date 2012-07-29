require 'markaby'

def show_index
  markaby do
    html do
      head { title 'finance tools' }

      body { h1 'Here we go' 
        ul do
          li { a 'list expenses', :href => '/expense/list'}
          li { a 'list incomes', :href => '/income/list'}
          li { a 'new income', :href => '/income/new'}
          li { a 'new expense', :href => '/expense/new'}
        end
      
      }
    end
  end
end

def show_new_expense(account)
   markaby do
    html do
      head { title 'new expense' }

      body { h1 'new expense' 

      }
    end
  end
 
end

def show_expense_list(expenditures)
  markaby do
    html do
      head { title 'list expenses' }

      body { h1 'expense list' 
        expenditures.each { |expense|
            '-->'
        }

      }
    end
  end
end
