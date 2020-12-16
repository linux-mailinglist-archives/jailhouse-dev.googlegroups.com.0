Return-Path: <jailhouse-dev+bncBCY2BFVMXUPBBLP74X7AKGQEQWFH4FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B72DB9AD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 04:31:58 +0100 (CET)
Received: by mail-qk1-x73a.google.com with SMTP id a68sf16848517qke.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Dec 2020 19:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8J7B5athAGZXACzdvHPv4HprQRUqmhMudMLCnnfUcJo=;
        b=F6OeiPjEjOFEIyneEKjRwdihzraYAE2GBYgqZsU6CH6vMA4Jgu+etzvSMKbtYktDzc
         biVriJHE4i8Nd/o4zS9r6hymZsQTDrDy3TFW+Fag+GtyaZKkNmcB3HI7AtcW8uVkjXnd
         EGnHZdVbO+BuO2bTcVDLPcZZ1K8EGqALv+mGx5gMSG2r5NPAPUHnzO/WpbcbwISFYhy9
         9oXNvqnJ8MLgWzHOrkqFnx7ww5znwBRwmqzYASF/cp7zzvIYtjaSXodKGYyq0EBGVW0N
         /yMGK2wgwsh7oipGyBGDnv0aQK5dnDbQhw8yS9im6TYI1lyLFP1/zubhG6wl1Ua6i88j
         5ZEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8J7B5athAGZXACzdvHPv4HprQRUqmhMudMLCnnfUcJo=;
        b=Mhf+V4D7wN3X+rQyYOmkrIAujpt7OJxx12uA2fzXxDDfqcGTq71G9sG2clVerLwrZL
         +bK8n8S5jS4ChZfi8Q0iRz+biINXU1ENoXv+alGb0bcomgT4NdCFTuf4/CYOCSLvqpfq
         ONC7r5w7O5bmGeiYAQ2NZZZOWyYznv/2ZRNIVOuPqD7xweBpXfi30THcft8iQ/SSBDyT
         zivJ0rsOQb2Op0M2gaAfK0mlD9CbI37S6jy/KByMSBiiTyf5i+NKldvyZ882qmaiaD4f
         t7gTxGl8kQWswRuFQYHveXSNT01EB16o7hNW+FXGrD3ctHMDACVa+fwQDilprhNAtate
         OL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8J7B5athAGZXACzdvHPv4HprQRUqmhMudMLCnnfUcJo=;
        b=mZ0NO0px3tbC4nG9MKc4Ea4PNG5z8oetx2k1ZgGAXwEiaoOnWXeEfdoZjF+R1djF20
         qFSB6U33sXDgEy07oC7po4zLxkLGPJOqg/FNzLGdghsaiqz0Xibw10AsjdF4G+gQrqU3
         XUUSQKztP8zxhPd/z8UNvJcB81AHs6zJDwrI8ZOPad8H9tIZbZURp0gHQMzoVkrAULV/
         Q0xJR4vmTJRtMRHfmgTMQa07a/bnQPO4DfWLkd1P3vN+DQCPWapoa5n5tEr1BYLx4ALg
         VJTTXhh1GTE7xRNbZW6iPkXO080fTGs9xh2Oiq8VuudDVBQ08ed4Tzkhqt4mnwWnJzNd
         hkdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DeXmIZ+D/xu2vJmC/gXxB7Owo1pZmxdThNCww5GcueqJHe75f
	aPAo9x4lfK4ohALfKNtDTUY=
X-Google-Smtp-Source: ABdhPJwjIHQHW+3+0Y1qhQCYcE7RgYE1JlKyPiYEMwtHo3CdcP0WzP5Bmw6QFqDySHllCU57b31Efg==
X-Received: by 2002:a37:7402:: with SMTP id p2mr42230923qkc.412.1608089517754;
        Tue, 15 Dec 2020 19:31:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:e193:: with SMTP id p19ls5252269qvl.10.gmail; Tue, 15
 Dec 2020 19:31:57 -0800 (PST)
X-Received: by 2002:ad4:5bce:: with SMTP id t14mr41114195qvt.6.1608089517149;
        Tue, 15 Dec 2020 19:31:57 -0800 (PST)
Date: Tue, 15 Dec 2020 19:31:56 -0800 (PST)
From: Fredy Zhang <fredyzhang2018@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn@googlegroups.com>
Subject: IVSHMEM-NET Verify
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_340_1165746621.1608089516298"
X-Original-Sender: fredyzhang2018@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_340_1165746621.1608089516298
Content-Type: multipart/alternative; 
	boundary="----=_Part_341_196015453.1608089516298"

------=_Part_341_196015453.1608089516298
Content-Type: text/plain; charset="UTF-8"

Hi, 

I am porting the IVSHMEM-NET patches on TI TDA4VM kernel 5.4. the module 
can loaded sucessfully. Can you please help to give some suggestions on how 
to verify the driver works fine ? thanks. 

1. running the jailhouse linux-demo. 
2. check the ifconfig
root@j7-evm:~# ifconfig 
eth0      Link encap:Ethernet  HWaddr 50:51:A9:FC:B2:20  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:82 errors:0 dropped:0 overruns:0 frame:0
          TX packets:82 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:6220 (6.0 KiB)  TX bytes:6220 (6.0 KiB)
3. modprove ivshmem-net, it 
root@j7-evm:~# modprobe ivshmem-net    
root@j7-evm:~# lsmod 
Module                  Size  Used by
ivshmem_net           327680  0
xt_conntrack          262144  1
xt_MASQUERADE         262144  1
xt_addrtype           262144  2
iptable_filter        262144  1
iptable_nat           262144  1
4. check the ifconfig 
root@j7-evm:~# ifconfig , I found a docker0 node. is the docker0 for 
IVSHMEM-NET ?
docker0   Link encap:Ethernet  HWaddr 02:42:51:08:03:0E  
          inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth0      Link encap:Ethernet  HWaddr 50:51:A9:FC:B2:20  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:82 errors:0 dropped:0 overruns:0 frame:0
          TX packets:82 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:6220 (6.0 KiB)  TX bytes:6220 (6.0 KiB)

Regards,
Fredy

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn%40googlegroups.com.

------=_Part_341_196015453.1608089516298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<div><br></div><div>I am porting the IVSHMEM-NET patches on TI TDA=
4VM kernel 5.4. the module can loaded sucessfully. Can you please help to g=
ive some suggestions on how to verify the driver works fine ? thanks.&nbsp;=
</div><div><br></div><div>1. running the jailhouse linux-demo.&nbsp;</div><=
div>2. check the ifconfig</div><div><div>root@j7-evm:~# ifconfig&nbsp;</div=
><div>eth0&nbsp; &nbsp; &nbsp; Link encap:Ethernet&nbsp; HWaddr 50:51:A9:FC=
:B2:20&nbsp;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP BROADCAS=
T MULTICAST&nbsp; MTU:1500&nbsp; Metric:1</div><div>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; RX packets:0 errors:0 dropped:0 overruns:0 frame:0</div><div>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; TX packets:0 errors:0 dropped:0 overruns:0=
 carrier:0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; collisions:0 txqueu=
elen:1000&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX bytes:0 (0.=
0 B)&nbsp; TX bytes:0 (0.0 B)</div><div><br></div><div>lo&nbsp; &nbsp; &nbs=
p; &nbsp; Link encap:Local Loopback&nbsp;&nbsp;</div><div>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; inet addr:127.0.0.1&nbsp; Mask:255.0.0.0</div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; inet6 addr: ::1/128 Scope:Host</div><div>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; UP LOOPBACK RUNNING&nbsp; MTU:65536&nbsp; Met=
ric:1</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX packets:82 errors:0 d=
ropped:0 overruns:0 frame:0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TX=
 packets:82 errors:0 dropped:0 overruns:0 carrier:0</div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; collisions:0 txqueuelen:1000&nbsp;</div><div>&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; RX bytes:6220 (6.0 KiB)&nbsp; TX bytes:6220 (6.0=
 KiB)</div></div><div>3. modprove ivshmem-net, it&nbsp;</div><div><div>root=
@j7-evm:~# modprobe ivshmem-net&nbsp; &nbsp;&nbsp;</div><div>root@j7-evm:~#=
 lsmod&nbsp;</div><div>Module&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; Size&nbsp; Used by</div><div>ivshmem_net&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;327680&nbsp; 0</div><div>xt_conntrack&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; 262144&nbsp; 1</div><div>xt_MASQUERADE&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;262144&nbsp; 1</div><div>xt_addrtype&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;262144&nbsp; 2</div><div>iptable_filter&nbsp; &nbsp; &nb=
sp; &nbsp; 262144&nbsp; 1</div><div>iptable_nat&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;262144&nbsp; 1</div></div><div>4. check the ifconfig&nbsp;</di=
v><div><div>root@j7-evm:~# ifconfig , I found a docker0 node. is the docker=
0 for IVSHMEM-NET ?</div><div>docker0&nbsp; &nbsp;Link encap:Ethernet&nbsp;=
 HWaddr 02:42:51:08:03:0E&nbsp;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; inet addr:172.17.0.1&nbsp; Bcast:172.17.255.255&nbsp; Mask:255.255.=
0.0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP BROADCAST MULTICAST&nbs=
p; MTU:1500&nbsp; Metric:1</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX =
packets:0 errors:0 dropped:0 overruns:0 frame:0</div><div>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; TX packets:0 errors:0 dropped:0 overruns:0 carrier:0</div=
><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; collisions:0 txqueuelen:0&nbsp;</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX bytes:0 (0.0 B)&nbsp; TX byte=
s:0 (0.0 B)</div><div><br></div><div>eth0&nbsp; &nbsp; &nbsp; Link encap:Et=
hernet&nbsp; HWaddr 50:51:A9:FC:B2:20&nbsp;&nbsp;</div><div>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; UP BROADCAST MULTICAST&nbsp; MTU:1500&nbsp; Metric:1</d=
iv><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX packets:0 errors:0 dropped:0 =
overruns:0 frame:0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TX packets:=
0 errors:0 dropped:0 overruns:0 carrier:0</div><div>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; collisions:0 txqueuelen:1000&nbsp;</div><div>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; RX bytes:0 (0.0 B)&nbsp; TX bytes:0 (0.0 B)</div><div><br>=
</div><div>lo&nbsp; &nbsp; &nbsp; &nbsp; Link encap:Local Loopback&nbsp;&nb=
sp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet addr:127.0.0.1&nbsp; =
Mask:255.0.0.0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; inet6 addr: ::1=
/128 Scope:Host</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; UP LOOPBACK RU=
NNING&nbsp; MTU:65536&nbsp; Metric:1</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; RX packets:82 errors:0 dropped:0 overruns:0 frame:0</div><div>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; TX packets:82 errors:0 dropped:0 overruns:0 ca=
rrier:0</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; collisions:0 txqueuele=
n:1000&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RX bytes:6220 (6.=
0 KiB)&nbsp; TX bytes:6220 (6.0 KiB)</div></div><div><br></div><div>Regards=
,</div><div>Fredy</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5e2bd88b-6b59-45f4-897c-ad3ffda1b76bn%40googlegroups.co=
m</a>.<br />

------=_Part_341_196015453.1608089516298--

------=_Part_340_1165746621.1608089516298--
