All you have to do is replace the value of NFS_SERVER to your nfs server ip and NFS_PATH to the path of your file mount. 

          env:
            - name: PROVISIONER_NAME
              value: example.com/nfs
            - name: NFS_SERVER
              value: <<NFS Server IP>>
            - name: NFS_PATH
              value: /srv/nfs/kubedata
      volumes:
        - name: nfs-client-root
          nfs:
            server: <<NFS Server IP>>
            path: /srv/nfs/kubedata

Other that that just copy the yaml file and create the resource.