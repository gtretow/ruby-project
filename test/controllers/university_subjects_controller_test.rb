require "test_helper"

class UniversitySubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @university_subject = university_subjects(:one)
  end

  test "should get index" do
    get university_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_university_subject_url
    assert_response :success
  end

  test "should create university_subject" do
    assert_difference("UniversitySubject.count") do
      post university_subjects_url, params: { university_subject: { bimester: @university_subject.bimester, comment: @university_subject.comment, coordinator: @university_subject.coordinator, grade: @university_subject.grade, name: @university_subject.name } }
    end

    assert_redirected_to university_subject_url(UniversitySubject.last)
  end

  test "should show university_subject" do
    get university_subject_url(@university_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_university_subject_url(@university_subject)
    assert_response :success
  end

  test "should update university_subject" do
    patch university_subject_url(@university_subject), params: { university_subject: { bimester: @university_subject.bimester, comment: @university_subject.comment, coordinator: @university_subject.coordinator, grade: @university_subject.grade, name: @university_subject.name } }
    assert_redirected_to university_subject_url(@university_subject)
  end

  test "should destroy university_subject" do
    assert_difference("UniversitySubject.count", -1) do
      delete university_subject_url(@university_subject)
    end

    assert_redirected_to university_subjects_url
  end
end
