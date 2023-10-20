require "csv"

class TransactionProcessor
  def self.execute(filename)
    ActiveRecord::Base.transaction do
      csv = CSV.parse(File.open(filename), headers: true)
      csv.each do |line|
        Transaction.create(line)
      end
    end
  end
end

