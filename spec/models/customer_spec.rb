require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  #vc quer um customer, mas quer que o nome dele seja e passa o nome
  it '#full_name - Sobrescrevendo Atributo' do
    customer = create(:customer, name: "Jackson Pires" ) #Factorybot 
    customer1 = create(:customer, name: "Jackson Pires" )
    expect(customer.full_name).to eq("Sr. Jackson Pires")
  end

  it 'Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '#full_name' do
    #nesse caso está user, pq colocou no customers.rb em factories o aliases
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  #Utilizando essa palavra ele vai trazer apenas os atributos em um hash do elemento que pediu
  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer) # vai factories vai procurar o customer e vai trazer os atribuitos desse elemento
    customer = Customer.create(attrs) # vai criar o customer com esses atributos
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 05, 28, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to be < Time.now
  end

  #na hora que cria um customer vai estar um no model e criando um novo cliente e vai mudar 
  #a quantidade de clientes em 1
  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }
end
