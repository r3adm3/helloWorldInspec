title 'ensure all vms have a particular label across all projects'
control 'gcp-projects-zones-vm-label-loop-1.0' do
    impact 1.0
    title 'ensure all vms have must be there label key set'
    google_projects.project_names.each do |project-name|
        google_compute_zones (project: project_name).zone_names.each do |zone-name|
            google_compute_instances(project: project_name).zone_names.each do |instance-name|
                describe google_compute_instance(project:project_name, zone: zone_name).instance_names.each do
                 its('labels_keys'){should include 'must_be_there'}
                end
            end
        end
    end
end
