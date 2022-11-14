require "application_system_test_case"

class UniversitySubjectsTest < ApplicationSystemTestCase
  setup do
    @university_subject = university_subjects(:one)
  end

  test "visiting the index" do
    visit university_subjects_url
    assert_selector "h1", text: "University subjects"
  end

  test "should create university subject" do
    visit university_subjects_url
    click_on "New university subject"

    fill_in "Bimester", with: @university_subject.bimester
    fill_in "Comment", with: @university_subject.comment
    fill_in "Coordinator", with: @university_subject.coordinator
    fill_in "Grade", with: @university_subject.grade
    fill_in "Name", with: @university_subject.name
    click_on "Create University subject"

    assert_text "University subject was successfully created"
    click_on "Back"
  end

  test "should update University subject" do
    visit university_subject_url(@university_subject)
    click_on "Edit this university subject", match: :first

    fill_in "Bimester", with: @university_subject.bimester
    fill_in "Comment", with: @university_subject.comment
    fill_in "Coordinator", with: @university_subject.coordinator
    fill_in "Grade", with: @university_subject.grade
    fill_in "Name", with: @university_subject.name
    click_on "Update University subject"

    assert_text "University subject was successfully updated"
    click_on "Back"
  end

  test "should destroy University subject" do
    visit university_subject_url(@university_subject)
    click_on "Destroy this university subject", match: :first

    assert_text "University subject was successfully destroyed"
  end
end
