class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    # Accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
    def received_one?(item)
        freebs = self.freebies
        freebs.each do |free|
            free.item_name.equal? item
        end
    end

    def give_away (dev, freebie)
        if freebie.dev_id == self.id
            freebie.update(dev_id: dev.id)
        end
    end
end
