class AppConstants < Settingslogic
source "#{Rails.root}/config/constants.yml"
namespace Rails.env
end