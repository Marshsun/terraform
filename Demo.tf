provider "aws" {
  region = "ap-south-1" # choose your AWS region
}

resource "aws_instance" "jenkins_master" {
  ami           = "ami-0e1d30f2c40c4c701" # Ubuntu 22.04 LTS (update if needed)
  instance_type = "t2.micro"
  key_name      = "your-key"

  security_groups = [aws_security_group.jenkins_sg.name]

  tags = {
    Name = "Jenkins-Master"
  }
}

resource "aws_instance" "app_node" {
  ami           = "ami-0e1d30f2c40c4c701"
  instance_type = "t2.micro"
  key_name      = "your-key"

  security_groups = [aws_security_group.tomcat_sg.name]

  tags = {
    Name = "App-Node"
  }
}

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "tomcat_sg" {
  name = "tomcat-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}












ansible 




- hosts: app_node
  become: yes
  tasks:
    - name: Install Java
      apt:
        name: openjdk-11-jdk
        state: present
        update_cache: yes

    - name: Download Tomcat
      get_url:
        url: https://downloads.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
        dest: /tmp/tomcat.tar.gz

    - name: Extract Tomcat
      unarchive:
        src: /tmp/tomcat.tar.gz
        dest: /opt/
        remote_src: yes

    - name: Start Tomcat
      shell: nohup /opt/apache-tomcat-9.0.78/bin/startup.sh





war




- hosts: app_node
  become: yes
  tasks:
    - name: Copy WAR file to Tomcat
      copy:
        src: target/addressbook.war
        dest: /opt/apache-tomcat-9.0.78/webapps/


jenkin



pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/<your-repo>.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Tomcat Install') {
            steps {
                ansiblePlaybook credentialsId: 'ansible-key', inventory: 'inventory', playbook: 'tomcat-install.yml'
            }
        }

        stage('Deploy WAR') {
            steps {
                ansiblePlaybook credentialsId: 'ansible-key', inventory: 'inventory', playbook: 'deploy-war.yml'
            }
        }
    }
}


