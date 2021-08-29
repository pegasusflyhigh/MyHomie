FactoryBot.define do
	factory :guest do
		sequence(:email){|n| "user#{n}@factory.com" }
	end

	factory :reservation do
		sequence(:code){|n| "ZXS#{n}QWEFJ" }
		guest_count { 2 }
	end
end