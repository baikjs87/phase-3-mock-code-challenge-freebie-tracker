class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item)
        self.freebies.each do |free|
            free.item_name.equal? item
        end
    end

    def give_away (dev, freebie)
        if freebie.dev_id == self.id
            binding.pry
            freebie.dev_id = dev.id
        end
    end
end
