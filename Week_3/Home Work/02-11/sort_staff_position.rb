# frozen_string_literal: true

sort_staff_position.rb

def list_position
  _positions = {
    'tonggiamdoc' => 0,
    'giamdoc' => 1,
    'truongphong' => 2,
    'nhanvienvp' => 3,
    'nhanviensale' => 4
  }
end

def sort_employees(employees)
	return [] if employees.empty?
  employees.each do |employee|
    employee[:positions].sort_by! { |position| list_position[position] }
  end
  employees.sort_by! do |employee|
    -employee[:id]
  end
  employees
end

employees = [
  { id: 1, positions: %w[nhanviensale truongphong] },
  { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }
]

sort_employees(employees)

###############################################################################
# Test case

require 'minitest/autorun'

class SortEmployeesTest < Minitest::Test
  def test_sort_employees_with_empty_list()
    employees = []

    assert_equal([], sort_employees(employees))
  end

  def test_sort_employees_with_one_employee()
    employees = [{ id: 1, positions: %w[nhanviensale truongphong] }]

    assert_equal([{ id: 1, positions: %w[truongphong nhanviensale] }], sort_employees(employees))
  end

  def test_sort_employees_with_two_employees()
    employees = [
      { id: 1, positions: %w[nhanviensale truongphong] },
      { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }
    ]

    assert_equal([
      { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] },
      { id: 1, positions: %w[truongphong nhanviensale] }
    ], sort_employees(employees))

    employees = [
      { id: 1, positions: %w[nhanviensale truongphong] },
      { id: 2, positions: %w[nhanviensale nhanvienvp truongphong giamdoc tonggiamdoc] }
    ]

    assert_equal([
      { id: 2, positions: %w[tonggiamdoc giamdoc truongphong nhanvienvp nhanviensale] },
      { id: 1, positions: %w[truongphong nhanviensale] }
    ], sort_employees(employees))
  end

  def test_sort_employees_with_duplicate_positions()
    employees = [
      { id: 1, positions: %w[nhanviensale truongphong nhanviensale] },
      { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong nhanviensale] }
    ]

    assert_equal([
      { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale nhanviensale] },
      { id: 1, positions: %w[truongphong nhanviensale nhanviensale] }
    ], sort_employees(employees))
  end
end