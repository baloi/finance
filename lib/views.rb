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

def show_new_expense
   markaby do
    html do
      head { title 'new expense' }

      body { h1 'new expense' 
        form(:method => 'POST', :action=>'/expense/save') {
          text 'Amount: '
          input(:name => 'amount', :type => 'text') 
          br
          text 'Reason: '
          input(:name => 'reason', :type => 'text')
          br
          input(:type => 'submit', :value => 'Submit')
        }
      }
    end
  end
 
end

def show_expense_list(expenditures)
  markaby do
    html do
      head { title 'list expenses' }

      body { h1 'expense list' 
        expenditures
      }
    end
  end
end

