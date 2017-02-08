class Park < ApplicationRecord

  before_save :upload_file


  has_and_belongs_to_many :rangers
  private

  def upload_file

  end


end
