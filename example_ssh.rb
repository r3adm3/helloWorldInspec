control 'sshd-21' do
    title 'set ssh protocol to 2'
    desc 'sshd should only use v2 as the supported ssh protocol'
    impacct '1.0' #this is critical ref 'compliance guide, sectio 2.1'
    describe sshd_config do #sshd_config is a special resource name 
        its('Protocol'){should cmp 2}
    end
end
