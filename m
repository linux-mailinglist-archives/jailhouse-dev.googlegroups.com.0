Return-Path: <jailhouse-dev+bncBDSLXZPS5ULBBJ7P3KJAMGQE3KLVGAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ABF4FF5FE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 13:44:40 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id q5-20020a05620a0d8500b004738c1b48besf941074qkl.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 04:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GnILErlgwN2DsrsSvTxm+ycGpd5Z5HRnXqE+G+se7ow=;
        b=EqQJPpn36NQFernXenMfO1joLwE+jOmdTh5ueL0EwYQFws47pfopZwoi2lre1A+oT2
         iSIMzm3Oqvuja+2qzEqkANyuIaM8likjN6s20mKlEZSY6kwTCkLEIgKWsVLlX+8uw9rv
         wikKljYQRb1Dr7Sd5QYhJUP5ugusrhRU5Zltb6FaecGOsNo3ig2a0gVYikuVPUlx7Db2
         GCtXa6OrSrDRST1KVNReqPx/AsssK12z+VhPmwhj20Ggixm7KjoRGZhGrUyPs9lKF3qt
         quoWPTyo8Dph27ZApFUBtXCYttUArBzQwCD5Zi4nn/9l4B0cYtnmXu+sLRRqRSe1WtbG
         GbNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GnILErlgwN2DsrsSvTxm+ycGpd5Z5HRnXqE+G+se7ow=;
        b=ZpN09K3nu/YNAssdU+WPQ1CXt5XlIFd4YGBIGy6WbIzymkdyYZni3apFG+w+x55s84
         KFwA5FhYbV7QBh+xKgcWCxmMR4a//7T564Xtx5KMj0Ucdex1CPOkp9YWMOc9jPOhTYH3
         H9OE+tk27rsjprIEvi4Qedc6XaYIdqXPS4xO9aM6RZZoypDZLGhxENB2N3okMUO722lC
         1h5D2Il/ZDlkK1ELrQP4jO+44Oj+VUTJ9Yx9PajAcoZfmOOOLKcHYZEUFe3ZP6BQDrcO
         oNqK7Ty4THdbsdfmGwl1qxv57OvHnzFyoIVbpPoQfbS4c6y0s86crN/ET9ECiuHxRPbz
         OIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GnILErlgwN2DsrsSvTxm+ycGpd5Z5HRnXqE+G+se7ow=;
        b=KmnS9O54iuFkHk0MkXlAmi0pPV85aNrxVh6yzg3g7izMwvLDmAnYh4BtKl3ZtSYt0J
         81f0cSYUYmOT/+yzt35Xqr3BuOYX0JpSwt0O+tIFoxAIzmyZPUbQnw00nk2cLKH/sWJN
         KyBLd/Da4YhZBeFu2n6qEgKxhL2mYcEJqdrV/aqUr1sSuyF7m0SJ/2dXDRMPKkMinbav
         Z76kM43666sgDaibvUIlAJzwTqjG4y4uZFUKvr1Jm50oMhCn9b4BhVKGqZxl7K2t7+fK
         AeojjDcf1QkMMqyNKda1DUFKBHsrbVe5Gp8ZhbidXqzZFscEKKOjZGwGhAYHCzPncCRv
         HYHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Bc179yrXOBOPhpR5X1Uu+PbbotFh/d2H/vccgbczqxMWhHTxW
	7wl4Wqw+fbf0jVpAuf38ca0=
X-Google-Smtp-Source: ABdhPJyoqMEQFU9DDptIOgQfokBDKS0pUy+abfU1Knn95FvVMpLZPfpUXo/n0C3TqujsegHct0sgTw==
X-Received: by 2002:a05:620a:1714:b0:69c:2f16:ed76 with SMTP id az20-20020a05620a171400b0069c2f16ed76mr6369235qkb.750.1649850279568;
        Wed, 13 Apr 2022 04:44:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:584c:0:b0:2ed:227e:bf3b with SMTP id h12-20020ac8584c000000b002ed227ebf3bls1227124qth.10.gmail;
 Wed, 13 Apr 2022 04:44:38 -0700 (PDT)
X-Received: by 2002:a05:622a:254:b0:2e1:ca15:3cbe with SMTP id c20-20020a05622a025400b002e1ca153cbemr6689761qtx.650.1649850278804;
        Wed, 13 Apr 2022 04:44:38 -0700 (PDT)
Date: Wed, 13 Apr 2022 04:44:38 -0700 (PDT)
From: manliang tang <manliang.tang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a46c03b4-9f14-4240-ad4f-0dad3a335f47n@googlegroups.com>
Subject: Kernel crash after exiting from enter_hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_378_783957455.1649850278213"
X-Original-Sender: manliang.tang@gmail.com
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

------=_Part_378_783957455.1649850278213
Content-Type: multipart/alternative; 
	boundary="----=_Part_379_312124738.1649850278213"

------=_Part_379_312124738.1649850278213
Content-Type: text/plain; charset="UTF-8"

Based on Kernel 4.19, I tried to run Jailhouse on real ARM board. I build 
the driver/firmware/tool/configuration file successfully, copy all these 
files to ARM board, then set the bootargs(mem=) and inert the driver 
module. I saw the Kernel crash when run the "jailhouse enable" command.
1. command
/data # insmod jailhouse.ko 
/data # cp jailhouse.bin /lib/firmware/
/data # ./jailhouse enable aml-c2.cell

2. Attached is the detailed log



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a46c03b4-9f14-4240-ad4f-0dad3a335f47n%40googlegroups.com.

------=_Part_379_312124738.1649850278213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Based on Kernel 4.19, I tried to run Jailhouse on real ARM board. I build t=
he driver/firmware/tool/configuration file successfully, copy all these fil=
es to ARM board, then set the bootargs(mem=3D) and inert the driver module.=
 I saw the Kernel crash when run the "jailhouse enable" command.<div>1. com=
mand</div><div>/data # insmod jailhouse.ko <br>/data # cp jailhouse.bin /li=
b/firmware/<br>/data # ./jailhouse enable aml-c2.cell<br></div><div><br></d=
iv><div>2. Attached is the detailed log</div><div><br></div><div><br><br></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a46c03b4-9f14-4240-ad4f-0dad3a335f47n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a46c03b4-9f14-4240-ad4f-0dad3a335f47n%40googlegroups.co=
m</a>.<br />

------=_Part_379_312124738.1649850278213--

------=_Part_378_783957455.1649850278213
Content-Type: text/plain; charset=US-ASCII; 
	name=Kernel_crash_after_exiting_hypervisor.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=Kernel_crash_after_exiting_hypervisor.txt
X-Attachment-Id: 54ff89c0-76e6-44cc-bb80-fde6dde80d66
Content-ID: <54ff89c0-76e6-44cc-bb80-fde6dde80d66>

/data # insmod jailhouse.ko 
/data # cp jailhouse.bin /lib/firmware/
/data # ./jailhouse enable aml-c2.cell 

Initializing Jailhouse hypervisor v0.12 (294-g6af5edfb-dirty) oPage pool usage after early setup:sOKOIi0Page pool usage after late setup[   61.844932@0] enter_hypervisor done
[   61.845302@0] jailhouse_cmd_enable - 602
[   61.845767@0] jailhouse_cmd_enable - 610
[   61.846318@0] jailhouse_cmd_enable - 616
[ rf  600.12x745@0] jailhouse_cmd_enable - 620
[   61.846894@1] Unable to handle kernel execution of user memory at virtual address 0000000000000000
[   61.848384@1] Mem abort info:
2[   61.849574@1] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Unhcf 790x2f[   61.850809@1] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
UnhLf0f 1f0x[   61.852056@1] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[  0  3c.1x52l58@0]   ESR = 0x86000005
[   61.852063@0]   Exception class = IABT (current EL), IL = 32 bits
[   61.853317@1] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   61.854366@0]   SET = 0, FnV = 0
[   61.854368@0]   EA = 0, S1PTW = 0
[   61.854376@0] user pgtable: 4k pages, 39-bit VAs, pgdp = 00000000b434e935
[   61.855486@1] Mem abort info:
[   61.855872@0] [0000000000000000] pgd=0000000000000000, pud=0000000000000000
[   61.856289@1]   ESR = 0x86000005
[   61.856293@1]   Exception class = IABT (current EL), IL = 32 bits
[   61.857130@0] Internal error: Oops: 86000005 [#1] PREEMPT SMP
[   61.857503@1] Mem abort info:
[   61.858362@0] Modules linked in: jailhouse(O) dhd(O) overlay exportfs
[   60.x 40528764@1]   ESR = 0x86000005
[   61.859522@0] Process iot_network (pid: 1991, stack limit = 0x00000000fe4c9003)
[   61.859531@0] CPU: 0 PID: 1991 Comm: iot_network Tainted: G           O      4.19.180-11479-g46df404924cb-dirty #12
[   61.860244@1] Mem abort info:
[   61.860606@0] Hardware name: Google Venus B1 (DT)
[   61.861690@1]   ESR = 0x86000005
[   61.861854@0] pstate: 80400005 (Nzcv daif +PAN -UAO)
[   61.862770@1]   Exception class = IABT (current EL), IL = 32 bits
[   61.864061@0] pc :           (null)
[   61.864072@0] lr : ipv6_dev_get_saddr+0xec/0x17c
[   61.864074@0] sp : ffffff800b44ba70
[   61.864076@0] x29: ffffff800b44bad0 x28: ffffffc01a748000 
[   61.864080@0] x27: 0000000000000000 x26: 000000000000ff9b 
[   61.864086@0] x25: 000000000000000e x24: ffffff800b44bc38 
[   61.864452@1] Mem abort info:
[   61.865015@0] x23: 0000000000000000 x22: ffffff8008f71850 
[   61.865421@1]   ESR = 0x86000005
[   61.866033@0] x21: ffffffc03b713050 x20: ffffff8008f71740 
[   61.866799@1]   SET = 0, FnV = 0
[   61.867223@0] x19: ffffff800b44bc48 x18: 0000000000000000 
[   61.867227@0] x17: 0000000000000000 x16: 0000000000000001 
[   61.867799@1]   EA = 0, S1PTW = 0
[   61.868231@0] x15: 0000000000000000 x14: 0000604860480120 
[   61.868234@0] x13: 00000000000000fc x12: 000000000000c0fe 
[   61.868917@1] user pgtable: 4k pages, 39-bit VAs, pgdp = 00000000a2287d1f
[   61.869595@0] x11: 0000000000000000 x10: 0000000000000001 
[   61.869599@0] x9 : 0000000000000000 x8 : ffffffc01c007c08 
[   61.870287@1]   Exception class = IABT (current EL), IL = 32 bits
[   61.870648@0] x7 : 0000604860480120 x6 : 0000000000001000 
[   61.871336@1]   SET = 0, FnV = 0
[   61.871732@0] x5 : 0000000000000000 x4 : 0000000000000001 
[   61.872421@1]   SET = 0, FnV = 0
[   61.872815@0] x3 : ffffff800b44ba88 x2 : ffffffc01c007c00 
[   61.873502@1]   EA = 0, S1PTW = 0
[   61.874178@0] x1 : ffffff800b44ba70 x0 : 0000000000000001 
[   61.874182@0] Call trace:
[   61.874186@0]            (null)
[   61.874594@1]   Exception class = IABT (current EL), IL = 32 bits
[   61.875275@0]  ip6_dst_lookup_tail+0x268/0x3d8
[   61.875278@0]  ip6_dst_lookup_flow+0x40/0x9c
[   61.875284@0]  ip6_datagram_dst_update+0x184/0x248
[   61.875957@1]   SET = 0, FnV = 0
[   61.876802@0]  __ip6_datagram_connect+0x250/0x2ec
[   61.876805@0]  ip6_datagram_connect+0x34/0x54
[   61.876812@0]  inet_dgram_connect+0x70/0xd4
[   61.877490@1]   EA = 0, S1PTW = 0
[   61.878171@0]  __sys_connect+0xb4/0x100
[   61.878930@1] user pgtable: 4k pages, 39-bit VAs, pgdp = 00000000a2287d1f
[   61.879608@0]  __arm64_sys_connect+0x1c/0x28
[   61.879613@0]  el0_svc_common+0x94/0x108
[   61.879617@0]  el0_svc_handler+0x1c/0x24
[   61.880010@1] [0000000000000000] pgd=0000000000000000, pud=0000000000000000
[   61.880691@0]  el0_svc+0x8/0x14c
[   61.880698@0] Code: bad PC value
[   61.892977@0] ---[ end trace e1366e7c21b5e31d ]---
[   61.906267@0] Kernel panic - not syncing: Fatal exception
[   61.906297@0] SMP: stopping secondary CPUs
[   62.961828@0] SMP: failed to stop secondary CPUs 0-1
[   62.961848@0] Kernel Offset: disabled
[   62.962205@0] CPU features: 0x0,20002000
[   62.962692@0] Memory Limit: 800 MB
[   62.975773@0] Rebooting in 5 seconds..
[   67.975973@0] SMP: stopping secondary CPUs
[   69.031060@0] SMP: failed to stop secondary CPUs 0-1
[   69.031080@0] reboot reason 12
[   69.031362@0] Reboot failed -- System halted

------=_Part_378_783957455.1649850278213--
