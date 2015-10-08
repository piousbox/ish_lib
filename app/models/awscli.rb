
def puts! args, label=""
  puts "+++ +++ #{label}"
  puts args.inspect
end

class Awscli

  def self.vpcs_index
    out = []
    vpcs = `aws ec2 describe-vpcs`
    vpcs = vpcs.split "\n"
    vpcs.each do |v|
      if "VPCS" == v[0...4]
        cells = v.split "\t"
        out.push :id => cells[6]
      end
    end
    return out
  end

  def self.vpcs_subnets opts = {}
    out = []
    subnets = `aws ec2 describe-subnets`.split "\n"
    subnets.each_with_index do |subnet, idx|
      break if idx+1 == subnets.length
      subnet = subnet.split "\t"
      if opts[:vpc_id] == subnet[8]
        next_subnet = subnets[idx+1].split("\t")
        if opts[:public] && next_subnet[2] == "Public subnet"
          out.push({ :id => subnet[7], :subnet => subnet })
        end
        if !opts[:public] && next_subnet[2] == "Private subnet"
          out.push({ :id => subnet[7], :subnet => subnet })
        end
      end
    end
    return out
  end

  def self.nodes_list args={}
    # puts! args, 'ARGS'
    out = []
    
    nodes = `aws ec2 describe-instances`.split "\n"
    nodes.each_with_index do |glob_node, idx|
      node = glob_node.split "\t"
      if 'INSTANCES' == node[0]
        # puts! node.length, 'glob node'
        # puts! node[node.length-3], 'node 19'
        if node[node.length-3] == args[:subnet_id]
          this_hash = { :node => node, :id => node[7], :ip => node[13] }
          this_ip = ''
          `aws ec2 describe-instances --instance-id #{node[7]}`.split("\n").each do |line|
            # puts! line.split("\t")[0], 'line'
            if line.split("\t")[0] == "PRIVATEIPADDRESSES"
              this_ip = line.split("\t")[3]
            end
          end
          this_hash[:ip] = this_ip
          puts! this_hash
          out.push this_hash
        end
      end
    end

    # puts! out, 'OUT'
    return out
  end

end

