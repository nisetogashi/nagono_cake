class Address < ApplicationRecord
    belongs_to :customer

    def full_address #単数形なので、self.full_addressにならないように注意
        '〒' + postal_code + ' ' + address + ' ' + name 
    end
    #今回のような取得したい情報が明確になっている場合はreturnはなくても良い。省略した場合、処理の最後の文がreturnになる
    
end