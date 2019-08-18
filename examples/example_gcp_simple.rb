control 'gcp-container-cluster' do
    impact 1.0
    title 'ensure container cluster node pools have correct properties'
    describe google_container_clusters (project: gcp_project_id, zone:gcp_kube_cluster_zone) do
        it { should_exist }
        its ('count') {should be <= 10}
        its ('cluster_names') {should include gcp_kube_cluster_name}
        its ('cluster_statuses' {should include "RUNNING"})
    end
end
 