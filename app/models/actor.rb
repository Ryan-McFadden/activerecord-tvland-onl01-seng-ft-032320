class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name

        name = "#{self.first_name} #{self.last_name}"

    end

    def list_roles

        roles = []

        char_list = self.characters.collect do |char|
            char.name
        end

        show_list = self.shows.collect do |show|
            show.name
        end

        role = char_list.concat show_list

        roles << role.join(" - ")

    end

end