require 'rails_helper'
# this is for naming a new project and it will get that name and store it
RSpec.feature "Projects", type: :feature do
  context "Create new project" do # to create a new project
    before(:each) do # before creating make a new project path
      visit new_project_path
      within("form") do # within the form 
        fill_in "Title", with: "Test title" # fill in the title of the project with what the user named it
      end
    end
 
    scenario "should be successful" do # on a successful creation
      fill_in "Description", with: "Test description" # fill in the description with what the user typed
      click_button "Create Project" # create a project 
      expect(page).to have_content("Project was successfully created") # show that the project was created
    end

    scenario "should fail" do # should it fail
      click_button "Create Project" # on the button click
      expect(page).to have_content("Description can't be blank") # say what is wrong, here it is no description 
    end
  end

  context "Update project" do  # for updating (editing) a project
    let(:project) { Project.create(title: "Test title", description: "Test content") } # get the title and description
    before(:each) do # before loading the page
      visit edit_project_path(project) # get the edit project path of the current project
    end

    scenario "should be successful" do # on a successfull update
      within("form") do # within the form 
        fill_in "Description", with: "New description content" # fill in the new desprition into the descirption box
      end
      click_button "Update Project" # on the button click update the project
      expect(page).to have_content("Project was successfully updated") # say that it was successful
    end

    scenario "should fail" do # on a fail
      within("form") do # within form 
        fill_in "Description", with: "" # enter the new description, here it is blank
      end
      click_button "Update Project" # on the click update project button
      expect(page).to have_content("Description can't be blank") # say why it will not load, here it is because the descirption is blank
    end
  end

  context "Remove existing project" do # to remove a project
    let!(:project) { Project.create(title: "Test title", description: "Test content") } # get the project tile/description 
    scenario "remove project" do # if the user says remove the project
      visit projects_path # go to the projects path
      click_link "Destroy" # click on the destory button
      expect(page).to have_content("Project was successfully destroyed") # prompt the user on what happened
      expect(Project.count).to eq(0) # check the project count and update it to show the one project was removed
    end
  end
end