Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBL7O4XUQKGQEZ55NFBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62D749E6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 11:32:33 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id u200sf19305481oia.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mrLP3DlVGdKU5M/+gzhr6jCbQiZtjlkSZYtDnmCmRiE=;
        b=b/KejdV1xhgrHJjhBEzWdCc4T1rTx/npPGihj+oYOjDQpGM4qo2ohBG7uCRgS9rm9Q
         kLHtGIxQZJ5AwV9TtG0odgMyZSgYDvwTrS6Fku25nSDnmRtHV9pHxhuvVdRXUgX7owng
         81uG6ewPTIXxspaCjiUi6gCEZbU86pT/l5Mo70+CWl7h2iPfDnHoaDLKIYCicJZAm0qi
         9RJvbdg4RqmsFcPa2LKdNQpdU4M2A09fcF7itx1Zl2xC1K8oSwwE6cYiNIC7mSeDCr8P
         3VnNePH2BnAgo4tdc+7EBaYsKr8M78uiW8QLRynFr66GSFXjTH7DGxst1Rg8Bsvr/Rzj
         5Vkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mrLP3DlVGdKU5M/+gzhr6jCbQiZtjlkSZYtDnmCmRiE=;
        b=l1BOuQBg1B0QJWuw5Qdm+bSlsTmNU+Nm1x4PiCwcHQuKCzEypWuoyn8KWJTz7hl62v
         qipz1SCNqasgwYrMgk9rcjTlBGYJPk3UnBPcKAF0YxGwEdyDiNEgSdKSXdh6BOKdqiVT
         DAEX4CXtIwXQeKQqpCZ0lbDujvi3+fbOZUL8+LYXqTCrNTtHCUD2WBnShGKafcJa5xNT
         MI6RfC0h7gb1TW5DtJMLzjpiJXkwjP3selBbtFU21PMdhm5xfhuYpWgpu1ZrGcj4gpAh
         OXi5LV5eEzA66AxRA3ye0YDR6HkcBB35DqQ7AHwHe5kBnIC2fmTzpnGsACmiaffPgUbr
         ilsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mrLP3DlVGdKU5M/+gzhr6jCbQiZtjlkSZYtDnmCmRiE=;
        b=c+zxIpUudZR3QsRqAGBPhY0i6FPWgNYTJcVobsLpwka1VEFJ9Dp5yElqQx1a19GwqB
         gS6vVuCTBDzmoOBu31AIPgk+HYrG97Cnib3V2IDbKT6duNibBTTHr50gQCYKILyp0r84
         h8YXdOCPTKlzYakCFchLD2Yo61Xr7l04s63VcJ0WlZ5ruwV0oFweLGEYwGrdjYbq+sxg
         1QJQuCD1ntZQK30cveKEh9Z9p+oX3HOQ7GYejDfcc/bPQNC0l+saudEK4F0o0Xds01j3
         nAUvWcp9RWJc//1kqpbf+Dpo48ILW5Z5kYsGJcuv+vvlqWgVTUPc/4l8QBIyCKqyIaD6
         ZoJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX1h0zAYR1Vy/lV+/6k81biwGujJZIOG9nMw4uAKFHfeYm7i2Jj
	xJYk02U61JXYMuJZHC7zeaQ=
X-Google-Smtp-Source: APXvYqwRXZKbb01cJwThDLvdEacSnSHgK28IjZETzebRiHKwwg3Y6MnxrsoLce6guYEif/FIOb+SiA==
X-Received: by 2002:a9d:73d0:: with SMTP id m16mr67177581otk.190.1564047152069;
        Thu, 25 Jul 2019 02:32:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4705:: with SMTP id k5ls6418680oik.13.gmail; Thu, 25 Jul
 2019 02:32:31 -0700 (PDT)
X-Received: by 2002:aca:fc92:: with SMTP id a140mr45718524oii.19.1564047151269;
        Thu, 25 Jul 2019 02:32:31 -0700 (PDT)
Date: Thu, 25 Jul 2019 02:32:30 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
Subject: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7165_1866588425.1564047150417"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_7165_1866588425.1564047150417
Content-Type: multipart/alternative; 
	boundary="----=_Part_7166_306772384.1564047150417"

------=_Part_7166_306772384.1564047150417
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to apply cache coloring to Linux and Erika. As root cell Linux 
cannot be colored, i intend to use colored Linux in a non-root cell and 
colored Erika in another non-root cell (the system stays as: Linux in root 
cell, Linux and Erika in non-root cells).

The problem that is occuring to me is when i issue the command: jailhouse 
cell linux ultra96-linux-demo.cell Image -i rootfs.cpio -c "console=ttyS0, 
115200"

The error is the following:

root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux 
ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio 
-c "console=ttyS0, 115200"
[  127.150370] python invoked oom-killer: 
gfp_mask=0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK), nodemask=(null),  
order=0, oom_score_adj=0
[  127.162750] CPU: 3 PID: 2733 Comm: python Tainted: G           O    
4.14.0-xilinx-v2018.2 #3
[  127.171145] Hardware name: ZynqMP ZCU100 RevC (DT)
[  127.175920] Call trace:
[  127.178365] [<ffffff8008088c58>] dump_backtrace+0x0/0x368
[  127.183734] [<ffffff8008088fd4>] show_stack+0x14/0x20
[  127.188773] [<ffffff8008a18cf8>] dump_stack+0x9c/0xbc
[  127.193807] [<ffffff800813b430>] dump_header.isra.6+0x7c/0x194
[  127.199619] [<ffffff800813aaa0>] oom_kill_process+0x280/0x500
[  127.205348] [<ffffff800813b050>] out_of_memory+0xe0/0x3e8
[  127.210730] [<ffffff80081400c0>] __alloc_pages_nodemask+0xa20/0xad8
[  127.216982] [<ffffff8008163cf4>] __pte_alloc+0x2c/0x130
[  127.222188] [<ffffff8008167b10>] __handle_mm_fault+0x678/0xb90
[  127.228003] [<ffffff8008168080>] handle_mm_fault+0x58/0xa0
[  127.233472] [<ffffff80080954b8>] do_page_fault+0x188/0x400
[  127.238939] [<ffffff800809576c>] do_translation_fault+0x3c/0x48
[  127.244842] [<ffffff80080812c4>] do_mem_abort+0x3c/0xa0
[  127.250049] Exception stack(0xffffff800d23bb90 to 0xffffff800d23bcd0)
[  127.256473] bb80:                                   0000007fba7ff034 
ffffffc00b702000
[  127.264285] bba0: ffffffffffffffc0 ffffff800d23be18 0000000000000000 
0000007fba800034
[  127.272097] bbc0: 0000007fba7ffff4 52800026f9001e7f aa1403e1aa1603e3 
2a1903e5aa1303e0
[  127.279909] bbe0: d28000022a1703e4 97ffe99eb90077a6 f9401e63f00057bb 
912a836190003980
[  127.287721] bc00: f9003fa19129e000 0000000000000000 0000000000000000 
0000007f95f45240
[  127.295533] bc20: 0000000000000010 ffffffc00b701000 0000000000001000 
0000000000001000
[  127.303345] bc40: ffffff800d23bde0 0000000041db6000 ffffffc04d604a00 
0000000000041db7
[  127.311157] bc60: ffffffc048231368 ffffffc04d604a98 0000000000001000 
ffffff800d23bcd0
[  127.318969] bc80: ffffff80084179b4 ffffff800d23bcd0 ffffff8008a16f58 
0000000080000145
[  127.326781] bca0: ffffff800d23bcc0 ffffff8008135f94 0000008000000000 
0000000000000000
[  127.334592] bcc0: ffffff800d23bcd0 ffffff8008a16f58
[  127.339453] [<ffffff8008082f14>] el1_da+0x24/0x84
[  127.344143] [<ffffff8008a16f58>] __arch_copy_to_user+0x1d8/0x220
[  127.350131] [<ffffff8008138eb0>] generic_file_read_iter+0x2d0/0x888
[  127.356383] [<ffffff8008225e24>] ext4_file_read_iter+0x3c/0x58
[  127.362198] [<ffffff800819aac4>] __vfs_read+0xac/0x108
[  127.367317] [<ffffff800819aba8>] vfs_read+0x88/0x168
[  127.372263] [<ffffff800819b230>] SyS_read+0x48/0xb0
[  127.377123] Exception stack(0xffffff800d23bec0 to 0xffffff800d23c000)
[  127.383547] bec0: 0000000000000004 0000007f78a49034 0000000044f90000 
0000007fbe193000
[  127.391359] bee0: 0000000024b47f90 0000007f78a49034 d503201fd503201f 
d503201fd503201f
[  127.399171] bf00: 000000000000003f d503201fd503201f d503201fd503201f 
d503201fd503201f
[  127.406983] bf20: d503201fd503201f d503201fd503201f 0000000000000004 
00000000044f9123
[  127.414795] bf40: 0000007fbe30c478 0000007fbe0a44d0 0000000000000000 
0000000000000004
[  127.422607] bf60: 0000007fbe18b5c0 0000000044f90201 0000000000000bd0 
0000000044f91201
[  127.430419] bf80: 0000007fbe18ad38 0000007f78a49034 0000007fbdc3f938 
00000000249922f0
[  127.438231] bfa0: 00000000249922f0 0000007feb4ffa30 0000007fbe0b0074 
0000007feb4ffa30
[  127.446043] bfc0: 0000007fbe102740 0000000020000000 0000000000000004 
000000000000003f
[  127.453855] bfe0: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  127.461667] [<ffffff80080837b0>] el0_svc_naked+0x24/0x28
[  127.466996] Mem-Info:
[  127.469235] active_anon:294134 inactive_anon:1174 isolated_anon:0
[  127.469235]  active_file:313 inactive_file:1514 isolated_file:0
[  127.469235]  unevictable:447 dirty:3 writeback:0 unstable:0
[  127.469235]  slab_reclaimable:1745 slab_unreclaimable:4538
[  127.469235]  mapped:2301 shmem:1216 pagetables:1274 bounce:0
[  127.469235]  free:68319 free_pcp:54 free_cma:64609
[  127.502659] Node 0 active_anon:1176536kB inactive_anon:4696kB 
active_file:1288kB inactive_file:6636kB unevictable:1788kB 
isolated(anon):0kB isolated(file):0kB mapped:9588kB dirty:12kB 
writeback:0kB shmem:4864kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 
0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? no
[  127.530260] DMA free:272284kB min:22528kB low:28160kB high:33792kB 
active_anon:1176540kB inactive_anon:4696kB active_file:1340kB 
inactive_file:6984kB unevictable:1788kB writepending:12kB present:1556480kB 
managed:1507504kB mlocked:1788kB kernel_stack:3968kB pagetables:5096kB 
bounce:0kB free_pcp:112kB local_pcp:0kB free_cma:257868kB
[  127.559597] lowmem_reserve[]: 0 0 0
[  127.563055] DMA: 512*4kB (UMEC) 208*8kB (UMEC) 110*16kB (UMEC) 65*32kB 
(UMEC) 33*64kB (UMEC) 17*128kB (UMEC) 7*256kB (UMEC) 4*512kB (UMC) 4*1024kB 
(UMEC) 3*2048kB (UEC) 62*4096kB (C) = 279872kB
[  127.580247] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 
hugepages_size=2048kB
[  127.588662] 1700 total pagecache pages
[  127.592395] 0 pages in swap cache
[  127.595693] Swap cache stats: add 0, delete 0, find 0/0
[  127.600900] Free swap  = 0kB
[  127.603763] Total swap = 0kB
[  127.606628] 389120 pages RAM
[  127.609492] 0 pages HighMem/MovableOnly
[  127.613312] 12244 pages reserved
[  127.616516] 65536 pages cma reserved
[  127.620083] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds 
swapents oom_score_adj name
[  127.628624] [ 1785]     0  1785     2819      589       6       3        
0         -1000 udevd
[  127.637188] [ 2074]     0  2074      831      290       5       3        
0             0 inetd
[  127.645779] [ 2086]     0  2086     2734      347       5       3        
0             0 ultra96-power-b
[  127.655241] [ 2091]     0  2091    42979     3749      20       4        
0             0 python
[  127.663922] [ 2114]     0  2114     2528      392       8       3        
0             0 wpa_supplicant
[  127.673296] [ 2140]     0  2140     2528      419       8       3        
0             0 wpa_supplicant
[  127.682671] [ 2145]     0  2145      773       23       5       3        
0             0 udhcpd
[  127.691350] [ 2155]     0  2155      773       25       5       3        
0             0 udhcpc
[  127.700030] [ 2172]   999  2172      828      355       6       3        
0             0 dbus-daemon
[  127.709144] [ 2180]     0  2180      849       32       6       3        
0             0 xinit
[  127.717738] [ 2188]     0  2188      608       35       5       3        
0             0 dropbear
[  127.726594] [ 2189]     0  2189    22883     1288      15       3        
0             0 Xorg
[  127.735098] [ 2195]   997  2195      583      271       5       3        
0             0 rpcbind
[  127.743865] [ 2208]     0  2208      464      338       5       3        
0         -1000 watchdog
[  127.752717] [ 2215]   994  2215      768      435       5       3        
0             0 rpc.statd
[  127.761658] [ 2220]     0  2220     1157      182       6       3        
0             0 bluetoothd
[  127.770685] [ 2227]   996  2227      926      164       5       3        
0             0 distccd
[  127.779452] [ 2228]   996  2228      926       50       5       3        
0             0 distccd
[  127.788218] [ 2242]   995  2242    18202      382       9       3        
0             0 ntpd
[  127.796724] [ 2246]     0  2246      773       18       5       3        
0             0 syslogd
[  127.805491] [ 2250]     0  2250      773       19       5       3        
0             0 klogd
[  127.814092] [ 2260]     0  2260      503       22       5       3        
0             0 xinetd
[  127.822765] [ 2265]   998  2265      973      349       6       3        
0             0 avahi-daemon
[  127.831966] [ 2266]   998  2266      942      215       5       3        
0             0 avahi-daemon
[  127.841166] [ 2272]     0  2272     1386      342       6       3        
0             0 ofonod
[  127.849847] [ 2290]     0  2290    23947      479       9       3        
0             0 tcf-agent
[  127.858788] [ 2295]     0  2295      753      301       5       3        
0             0 start_getty
[  127.867902] [ 2296]     0  2296      753      322       5       3        
0             0 start_getty
[  127.877016] [ 2297]     0  2297      995      418       6       3        
0             0 login
[  127.885609] [ 2298]     0  2298      773       51       5       3        
0             0 getty
[  127.894202] [ 2299]   996  2299      926       50       5       3        
0             0 distccd
[  127.902969] [ 2300]   996  2300      926       50       5       3        
0             0 distccd
[  127.911736] [ 2303]     0  2303     1993      497       8       3        
0             0 matchbox-window
[  127.921197] [ 2308]     0  2308     1102      234       8       3        
0             0 dbus-launch
[  127.930311] [ 2309]     0  2309      798      355       6       3        
0             0 dbus-daemon
[  127.939425] [ 2316]     0  2316    57427      489      13       3        
0             0 at-spi-bus-laun
[  127.948888] [ 2324]     0  2324      753      332       5       3        
0             0 launch-ultra96-
[  127.958348] [ 2339]     0  2339   690455     6747     145       7        
0             0 chromium-bin
[  127.967548] [ 2344]     0  2344     7709     1680      19       3        
0             0 matchbox-deskto
[  127.977009] [ 2345]     0  2345     7738     1534      18       3        
0             0 matchbox-panel
[  127.986387] [ 2346]     0  2346      485       93       5       3        
0             0 cat
[  127.994804] [ 2347]     0  2347      485       91       5       3        
0             0 cat
[  128.003223] [ 2351]   996  2351      926       50       5       3        
0             0 distccd
[  128.011989] [ 2355]     0  2355      798      331       7       3        
0             0 dbus-daemon
[  128.021104] [ 2358]     0  2358     2052      436       8       3        
0             0 gconfd-2
[  128.029957] [ 2361]     0  2361   103877      901      14       3        
0             0 pulseaudio
[  128.038984] [ 2362]   996  2362      926       50       5       3        
0             0 distccd
[  128.047754] [ 2364]     0  2364    39310      214      11       3        
0             0 at-spi2-registr
[  128.057216] [ 2367]     0  2367     4554      390      13       3        
0             0 settings-daemon
[  128.066676] [ 2368]   996  2368      926       50       5       3        
0             0 distccd
[  128.075443] [ 2370]     0  2370     1163      659       5       3        
0             0 sh
[  128.083776] [ 2372]     0  2372   511735      409      42       5        
0             0 console-kit-dae
[  128.093242] [ 2440]     0  2440    47906     1906      53       3        
0             0 chromium-bin
[  128.102439] [ 2543]     0  2543   274244     5637     126      10        
0           300 chromium-bin
[  128.111639] [ 2733]     0  2733   285462   271363     537       4        
0             0 python
[  128.120318] Out of memory: Kill process 2733 (python) score 699 or 
sacrifice child
[  128.127884] Killed process 2733 (python) total-vm:1141848kB, 
anon-rss:1084380kB, file-rss:1072kB, shmem-rss:0kB
[  128.269538] oom_reaper: reaped process 2733 (python), now anon-rss:0kB, 
file-rss:0kB, shmem-rss:0kB
Killed

What do i need to change in my configurations to make this work?
I send in attachment my config files.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/885a6592-84d9-43f4-a037-10ce73f968ab%40googlegroups.com.

------=_Part_7166_306772384.1564047150417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIHRyeWluZyB0
byBhcHBseSBjYWNoZSBjb2xvcmluZyB0byBMaW51eCBhbmQgRXJpa2EuIEFzIHJvb3QgY2VsbCBM
aW51eCBjYW5ub3QgYmUgY29sb3JlZCwgaSBpbnRlbmQgdG8gdXNlIGNvbG9yZWQgTGludXggaW4g
YSBub24tcm9vdCBjZWxsIGFuZCBjb2xvcmVkIEVyaWthIGluIGFub3RoZXIgbm9uLXJvb3QgY2Vs
bCAodGhlIHN5c3RlbSBzdGF5cyBhczogTGludXggaW4gcm9vdCBjZWxsLCBMaW51eCBhbmQgRXJp
a2EgaW4gbm9uLXJvb3QgY2VsbHMpLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIHByb2Js
ZW0gdGhhdCBpcyBvY2N1cmluZyB0byBtZSBpcyB3aGVuIGkgaXNzdWUgdGhlIGNvbW1hbmQ6IGph
aWxob3VzZSBjZWxsIGxpbnV4IHVsdHJhOTYtbGludXgtZGVtby5jZWxsIEltYWdlIC1pIHJvb3Rm
cy5jcGlvIC1jICZxdW90O2NvbnNvbGU9dHR5UzAsIDExNTIwMCZxdW90OzwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhlIGVycm9yIGlzIHRoZSBmb2xsb3dpbmc6PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48ZGl2PnJvb3RAeGlsaW54LXVsdHJhOTYtcmV2YS0yMDE4XzI6fiMgamFpbGhvdXNl
IGNlbGwgbGludXggdWx0cmE5Ni1saW51eC1kZW1vLmNlbGwgSW1hZ2UgLWQgaW5tYXRlLXp5bnFt
cC16Y3UxMDItMi5kdGIgLWkgcm9vdGZzLmNwaW8gLWMgJnF1b3Q7Y29uc29sZT10dHlTMCwgMTE1
MjAwJnF1b3Q7PC9kaXY+PGRpdj5bwqAgMTI3LjE1MDM3MF0gcHl0aG9uIGludm9rZWQgb29tLWtp
bGxlcjogZ2ZwX21hc2s9MHgxNjA4MGMwKEdGUF9LRVJORUx8X19HRlBfWkVST3xfX0dGUF9OT1RS
QUNLKSwgbm9kZW1hc2s9KG51bGwpLMKgIG9yZGVyPTAsIG9vbV9zY29yZV9hZGo9MDwvZGl2Pjxk
aXY+W8KgIDEyNy4xNjI3NTBdIENQVTogMyBQSUQ6IDI3MzMgQ29tbTogcHl0aG9uIFRhaW50ZWQ6
IEfCoCDCoCDCoCDCoCDCoCDCoE/CoCDCoCA0LjE0LjAteGlsaW54LXYyMDE4LjIgIzM8L2Rpdj48
ZGl2PlvCoCAxMjcuMTcxMTQ1XSBIYXJkd2FyZSBuYW1lOiBaeW5xTVAgWkNVMTAwIFJldkMgKERU
KTwvZGl2PjxkaXY+W8KgIDEyNy4xNzU5MjBdIENhbGwgdHJhY2U6PC9kaXY+PGRpdj5bwqAgMTI3
LjE3ODM2NV0gWyZsdDtmZmZmZmY4MDA4MDg4YzU4Jmd0O10gZHVtcF9iYWNrdHJhY2UrMHgwLzB4
MzY4PC9kaXY+PGRpdj5bwqAgMTI3LjE4MzczNF0gWyZsdDtmZmZmZmY4MDA4MDg4ZmQ0Jmd0O10g
c2hvd19zdGFjaysweDE0LzB4MjA8L2Rpdj48ZGl2PlvCoCAxMjcuMTg4NzczXSBbJmx0O2ZmZmZm
ZjgwMDhhMThjZjgmZ3Q7XSBkdW1wX3N0YWNrKzB4OWMvMHhiYzwvZGl2PjxkaXY+W8KgIDEyNy4x
OTM4MDddIFsmbHQ7ZmZmZmZmODAwODEzYjQzMCZndDtdIGR1bXBfaGVhZGVyLmlzcmEuNisweDdj
LzB4MTk0PC9kaXY+PGRpdj5bwqAgMTI3LjE5OTYxOV0gWyZsdDtmZmZmZmY4MDA4MTNhYWEwJmd0
O10gb29tX2tpbGxfcHJvY2VzcysweDI4MC8weDUwMDwvZGl2PjxkaXY+W8KgIDEyNy4yMDUzNDhd
IFsmbHQ7ZmZmZmZmODAwODEzYjA1MCZndDtdIG91dF9vZl9tZW1vcnkrMHhlMC8weDNlODwvZGl2
PjxkaXY+W8KgIDEyNy4yMTA3MzBdIFsmbHQ7ZmZmZmZmODAwODE0MDBjMCZndDtdIF9fYWxsb2Nf
cGFnZXNfbm9kZW1hc2srMHhhMjAvMHhhZDg8L2Rpdj48ZGl2PlvCoCAxMjcuMjE2OTgyXSBbJmx0
O2ZmZmZmZjgwMDgxNjNjZjQmZ3Q7XSBfX3B0ZV9hbGxvYysweDJjLzB4MTMwPC9kaXY+PGRpdj5b
wqAgMTI3LjIyMjE4OF0gWyZsdDtmZmZmZmY4MDA4MTY3YjEwJmd0O10gX19oYW5kbGVfbW1fZmF1
bHQrMHg2NzgvMHhiOTA8L2Rpdj48ZGl2PlvCoCAxMjcuMjI4MDAzXSBbJmx0O2ZmZmZmZjgwMDgx
NjgwODAmZ3Q7XSBoYW5kbGVfbW1fZmF1bHQrMHg1OC8weGEwPC9kaXY+PGRpdj5bwqAgMTI3LjIz
MzQ3Ml0gWyZsdDtmZmZmZmY4MDA4MDk1NGI4Jmd0O10gZG9fcGFnZV9mYXVsdCsweDE4OC8weDQw
MDwvZGl2PjxkaXY+W8KgIDEyNy4yMzg5MzldIFsmbHQ7ZmZmZmZmODAwODA5NTc2YyZndDtdIGRv
X3RyYW5zbGF0aW9uX2ZhdWx0KzB4M2MvMHg0ODwvZGl2PjxkaXY+W8KgIDEyNy4yNDQ4NDJdIFsm
bHQ7ZmZmZmZmODAwODA4MTJjNCZndDtdIGRvX21lbV9hYm9ydCsweDNjLzB4YTA8L2Rpdj48ZGl2
PlvCoCAxMjcuMjUwMDQ5XSBFeGNlcHRpb24gc3RhY2soMHhmZmZmZmY4MDBkMjNiYjkwIHRvIDB4
ZmZmZmZmODAwZDIzYmNkMCk8L2Rpdj48ZGl2PlvCoCAxMjcuMjU2NDczXSBiYjgwOsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMDAwMDAwN2ZiYTdm
ZjAzNCBmZmZmZmZjMDBiNzAyMDAwPC9kaXY+PGRpdj5bwqAgMTI3LjI2NDI4NV0gYmJhMDogZmZm
ZmZmZmZmZmZmZmZjMCBmZmZmZmY4MDBkMjNiZTE4IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwN2Zi
YTgwMDAzNDwvZGl2PjxkaXY+W8KgIDEyNy4yNzIwOTddIGJiYzA6IDAwMDAwMDdmYmE3ZmZmZjQg
NTI4MDAwMjZmOTAwMWU3ZiBhYTE0MDNlMWFhMTYwM2UzIDJhMTkwM2U1YWExMzAzZTA8L2Rpdj48
ZGl2PlvCoCAxMjcuMjc5OTA5XSBiYmUwOiBkMjgwMDAwMjJhMTcwM2U0IDk3ZmZlOTllYjkwMDc3
YTYgZjk0MDFlNjNmMDAwNTdiYiA5MTJhODM2MTkwMDAzOTgwPC9kaXY+PGRpdj5bwqAgMTI3LjI4
NzcyMV0gYmMwMDogZjkwMDNmYTE5MTI5ZTAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwN2Y5NWY0NTI0MDwvZGl2PjxkaXY+W8KgIDEyNy4yOTU1MzNdIGJjMjA6IDAw
MDAwMDAwMDAwMDAwMTAgZmZmZmZmYzAwYjcwMTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAwMDAw
MDAwMDEwMDA8L2Rpdj48ZGl2PlvCoCAxMjcuMzAzMzQ1XSBiYzQwOiBmZmZmZmY4MDBkMjNiZGUw
IDAwMDAwMDAwNDFkYjYwMDAgZmZmZmZmYzA0ZDYwNGEwMCAwMDAwMDAwMDAwMDQxZGI3PC9kaXY+
PGRpdj5bwqAgMTI3LjMxMTE1N10gYmM2MDogZmZmZmZmYzA0ODIzMTM2OCBmZmZmZmZjMDRkNjA0
YTk4IDAwMDAwMDAwMDAwMDEwMDAgZmZmZmZmODAwZDIzYmNkMDwvZGl2PjxkaXY+W8KgIDEyNy4z
MTg5NjldIGJjODA6IGZmZmZmZjgwMDg0MTc5YjQgZmZmZmZmODAwZDIzYmNkMCBmZmZmZmY4MDA4
YTE2ZjU4IDAwMDAwMDAwODAwMDAxNDU8L2Rpdj48ZGl2PlvCoCAxMjcuMzI2NzgxXSBiY2EwOiBm
ZmZmZmY4MDBkMjNiY2MwIGZmZmZmZjgwMDgxMzVmOTQgMDAwMDAwODAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwPC9kaXY+PGRpdj5bwqAgMTI3LjMzNDU5Ml0gYmNjMDogZmZmZmZmODAwZDIzYmNk
MCBmZmZmZmY4MDA4YTE2ZjU4PC9kaXY+PGRpdj5bwqAgMTI3LjMzOTQ1M10gWyZsdDtmZmZmZmY4
MDA4MDgyZjE0Jmd0O10gZWwxX2RhKzB4MjQvMHg4NDwvZGl2PjxkaXY+W8KgIDEyNy4zNDQxNDNd
IFsmbHQ7ZmZmZmZmODAwOGExNmY1OCZndDtdIF9fYXJjaF9jb3B5X3RvX3VzZXIrMHgxZDgvMHgy
MjA8L2Rpdj48ZGl2PlvCoCAxMjcuMzUwMTMxXSBbJmx0O2ZmZmZmZjgwMDgxMzhlYjAmZ3Q7XSBn
ZW5lcmljX2ZpbGVfcmVhZF9pdGVyKzB4MmQwLzB4ODg4PC9kaXY+PGRpdj5bwqAgMTI3LjM1NjM4
M10gWyZsdDtmZmZmZmY4MDA4MjI1ZTI0Jmd0O10gZXh0NF9maWxlX3JlYWRfaXRlcisweDNjLzB4
NTg8L2Rpdj48ZGl2PlvCoCAxMjcuMzYyMTk4XSBbJmx0O2ZmZmZmZjgwMDgxOWFhYzQmZ3Q7XSBf
X3Zmc19yZWFkKzB4YWMvMHgxMDg8L2Rpdj48ZGl2PlvCoCAxMjcuMzY3MzE3XSBbJmx0O2ZmZmZm
ZjgwMDgxOWFiYTgmZ3Q7XSB2ZnNfcmVhZCsweDg4LzB4MTY4PC9kaXY+PGRpdj5bwqAgMTI3LjM3
MjI2M10gWyZsdDtmZmZmZmY4MDA4MTliMjMwJmd0O10gU3lTX3JlYWQrMHg0OC8weGIwPC9kaXY+
PGRpdj5bwqAgMTI3LjM3NzEyM10gRXhjZXB0aW9uIHN0YWNrKDB4ZmZmZmZmODAwZDIzYmVjMCB0
byAweGZmZmZmZjgwMGQyM2MwMDApPC9kaXY+PGRpdj5bwqAgMTI3LjM4MzU0N10gYmVjMDogMDAw
MDAwMDAwMDAwMDAwNCAwMDAwMDA3Zjc4YTQ5MDM0IDAwMDAwMDAwNDRmOTAwMDAgMDAwMDAwN2Zi
ZTE5MzAwMDwvZGl2PjxkaXY+W8KgIDEyNy4zOTEzNTldIGJlZTA6IDAwMDAwMDAwMjRiNDdmOTAg
MDAwMDAwN2Y3OGE0OTAzNCBkNTAzMjAxZmQ1MDMyMDFmIGQ1MDMyMDFmZDUwMzIwMWY8L2Rpdj48
ZGl2PlvCoCAxMjcuMzk5MTcxXSBiZjAwOiAwMDAwMDAwMDAwMDAwMDNmIGQ1MDMyMDFmZDUwMzIw
MWYgZDUwMzIwMWZkNTAzMjAxZiBkNTAzMjAxZmQ1MDMyMDFmPC9kaXY+PGRpdj5bwqAgMTI3LjQw
Njk4M10gYmYyMDogZDUwMzIwMWZkNTAzMjAxZiBkNTAzMjAxZmQ1MDMyMDFmIDAwMDAwMDAwMDAw
MDAwMDQgMDAwMDAwMDAwNDRmOTEyMzwvZGl2PjxkaXY+W8KgIDEyNy40MTQ3OTVdIGJmNDA6IDAw
MDAwMDdmYmUzMGM0NzggMDAwMDAwN2ZiZTBhNDRkMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDQ8L2Rpdj48ZGl2PlvCoCAxMjcuNDIyNjA3XSBiZjYwOiAwMDAwMDA3ZmJlMThiNWMw
IDAwMDAwMDAwNDRmOTAyMDEgMDAwMDAwMDAwMDAwMGJkMCAwMDAwMDAwMDQ0ZjkxMjAxPC9kaXY+
PGRpdj5bwqAgMTI3LjQzMDQxOV0gYmY4MDogMDAwMDAwN2ZiZTE4YWQzOCAwMDAwMDA3Zjc4YTQ5
MDM0IDAwMDAwMDdmYmRjM2Y5MzggMDAwMDAwMDAyNDk5MjJmMDwvZGl2PjxkaXY+W8KgIDEyNy40
MzgyMzFdIGJmYTA6IDAwMDAwMDAwMjQ5OTIyZjAgMDAwMDAwN2ZlYjRmZmEzMCAwMDAwMDA3ZmJl
MGIwMDc0IDAwMDAwMDdmZWI0ZmZhMzA8L2Rpdj48ZGl2PlvCoCAxMjcuNDQ2MDQzXSBiZmMwOiAw
MDAwMDA3ZmJlMTAyNzQwIDAwMDAwMDAwMjAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwNCAwMDAwMDAw
MDAwMDAwMDNmPC9kaXY+PGRpdj5bwqAgMTI3LjQ1Mzg1NV0gYmZlMDogMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMDwvZGl2
PjxkaXY+W8KgIDEyNy40NjE2NjddIFsmbHQ7ZmZmZmZmODAwODA4MzdiMCZndDtdIGVsMF9zdmNf
bmFrZWQrMHgyNC8weDI4PC9kaXY+PGRpdj5bwqAgMTI3LjQ2Njk5Nl0gTWVtLUluZm86PC9kaXY+
PGRpdj5bwqAgMTI3LjQ2OTIzNV0gYWN0aXZlX2Fub246Mjk0MTM0IGluYWN0aXZlX2Fub246MTE3
NCBpc29sYXRlZF9hbm9uOjA8L2Rpdj48ZGl2PlvCoCAxMjcuNDY5MjM1XcKgIGFjdGl2ZV9maWxl
OjMxMyBpbmFjdGl2ZV9maWxlOjE1MTQgaXNvbGF0ZWRfZmlsZTowPC9kaXY+PGRpdj5bwqAgMTI3
LjQ2OTIzNV3CoCB1bmV2aWN0YWJsZTo0NDcgZGlydHk6MyB3cml0ZWJhY2s6MCB1bnN0YWJsZTow
PC9kaXY+PGRpdj5bwqAgMTI3LjQ2OTIzNV3CoCBzbGFiX3JlY2xhaW1hYmxlOjE3NDUgc2xhYl91
bnJlY2xhaW1hYmxlOjQ1Mzg8L2Rpdj48ZGl2PlvCoCAxMjcuNDY5MjM1XcKgIG1hcHBlZDoyMzAx
IHNobWVtOjEyMTYgcGFnZXRhYmxlczoxMjc0IGJvdW5jZTowPC9kaXY+PGRpdj5bwqAgMTI3LjQ2
OTIzNV3CoCBmcmVlOjY4MzE5IGZyZWVfcGNwOjU0IGZyZWVfY21hOjY0NjA5PC9kaXY+PGRpdj5b
wqAgMTI3LjUwMjY1OV0gTm9kZSAwIGFjdGl2ZV9hbm9uOjExNzY1MzZrQiBpbmFjdGl2ZV9hbm9u
OjQ2OTZrQiBhY3RpdmVfZmlsZToxMjg4a0IgaW5hY3RpdmVfZmlsZTo2NjM2a0IgdW5ldmljdGFi
bGU6MTc4OGtCIGlzb2xhdGVkKGFub24pOjBrQiBpc29sYXRlZChmaWxlKTowa0IgbWFwcGVkOjk1
ODhrQiBkaXJ0eToxMmtCIHdyaXRlYmFjazowa0Igc2htZW06NDg2NGtCIHNobWVtX3RocDogMGtC
IHNobWVtX3BtZG1hcHBlZDogMGtCIGFub25fdGhwOiAwa0Igd3JpdGViYWNrX3RtcDowa0IgdW5z
dGFibGU6MGtCIGFsbF91bnJlY2xhaW1hYmxlPyBubzwvZGl2PjxkaXY+W8KgIDEyNy41MzAyNjBd
IERNQSBmcmVlOjI3MjI4NGtCIG1pbjoyMjUyOGtCIGxvdzoyODE2MGtCIGhpZ2g6MzM3OTJrQiBh
Y3RpdmVfYW5vbjoxMTc2NTQwa0IgaW5hY3RpdmVfYW5vbjo0Njk2a0IgYWN0aXZlX2ZpbGU6MTM0
MGtCIGluYWN0aXZlX2ZpbGU6Njk4NGtCIHVuZXZpY3RhYmxlOjE3ODhrQiB3cml0ZXBlbmRpbmc6
MTJrQiBwcmVzZW50OjE1NTY0ODBrQiBtYW5hZ2VkOjE1MDc1MDRrQiBtbG9ja2VkOjE3ODhrQiBr
ZXJuZWxfc3RhY2s6Mzk2OGtCIHBhZ2V0YWJsZXM6NTA5NmtCIGJvdW5jZTowa0IgZnJlZV9wY3A6
MTEya0IgbG9jYWxfcGNwOjBrQiBmcmVlX2NtYToyNTc4NjhrQjwvZGl2PjxkaXY+W8KgIDEyNy41
NTk1OTddIGxvd21lbV9yZXNlcnZlW106IDAgMCAwPC9kaXY+PGRpdj5bwqAgMTI3LjU2MzA1NV0g
RE1BOiA1MTIqNGtCIChVTUVDKSAyMDgqOGtCIChVTUVDKSAxMTAqMTZrQiAoVU1FQykgNjUqMzJr
QiAoVU1FQykgMzMqNjRrQiAoVU1FQykgMTcqMTI4a0IgKFVNRUMpIDcqMjU2a0IgKFVNRUMpIDQq
NTEya0IgKFVNQykgNCoxMDI0a0IgKFVNRUMpIDMqMjA0OGtCIChVRUMpIDYyKjQwOTZrQiAoQykg
PSAyNzk4NzJrQjwvZGl2PjxkaXY+W8KgIDEyNy41ODAyNDddIE5vZGUgMCBodWdlcGFnZXNfdG90
YWw9MCBodWdlcGFnZXNfZnJlZT0wIGh1Z2VwYWdlc19zdXJwPTAgaHVnZXBhZ2VzX3NpemU9MjA0
OGtCPC9kaXY+PGRpdj5bwqAgMTI3LjU4ODY2Ml0gMTcwMCB0b3RhbCBwYWdlY2FjaGUgcGFnZXM8
L2Rpdj48ZGl2PlvCoCAxMjcuNTkyMzk1XSAwIHBhZ2VzIGluIHN3YXAgY2FjaGU8L2Rpdj48ZGl2
PlvCoCAxMjcuNTk1NjkzXSBTd2FwIGNhY2hlIHN0YXRzOiBhZGQgMCwgZGVsZXRlIDAsIGZpbmQg
MC8wPC9kaXY+PGRpdj5bwqAgMTI3LjYwMDkwMF0gRnJlZSBzd2FwwqAgPSAwa0I8L2Rpdj48ZGl2
PlvCoCAxMjcuNjAzNzYzXSBUb3RhbCBzd2FwID0gMGtCPC9kaXY+PGRpdj5bwqAgMTI3LjYwNjYy
OF0gMzg5MTIwIHBhZ2VzIFJBTTwvZGl2PjxkaXY+W8KgIDEyNy42MDk0OTJdIDAgcGFnZXMgSGln
aE1lbS9Nb3ZhYmxlT25seTwvZGl2PjxkaXY+W8KgIDEyNy42MTMzMTJdIDEyMjQ0IHBhZ2VzIHJl
c2VydmVkPC9kaXY+PGRpdj5bwqAgMTI3LjYxNjUxNl0gNjU1MzYgcGFnZXMgY21hIHJlc2VydmVk
PC9kaXY+PGRpdj5bwqAgMTI3LjYyMDA4M10gWyBwaWQgXcKgIMKgdWlkwqAgdGdpZCB0b3RhbF92
bcKgIMKgIMKgIHJzcyBucl9wdGVzIG5yX3BtZHMgc3dhcGVudHMgb29tX3Njb3JlX2FkaiBuYW1l
PC9kaXY+PGRpdj5bwqAgMTI3LjYyODYyNF0gWyAxNzg1XcKgIMKgIMKgMMKgIDE3ODXCoCDCoCDC
oDI4MTnCoCDCoCDCoCA1ODnCoCDCoCDCoCDCoDbCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAg
wqAgwqAgwqAgwqAtMTAwMCB1ZGV2ZDwvZGl2PjxkaXY+W8KgIDEyNy42MzcxODhdIFsgMjA3NF3C
oCDCoCDCoDDCoCAyMDc0wqAgwqAgwqAgODMxwqAgwqAgwqAgMjkwwqAgwqAgwqAgwqA1wqAgwqAg
wqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBpbmV0ZDwvZGl2PjxkaXY+
W8KgIDEyNy42NDU3NzldIFsgMjA4Nl3CoCDCoCDCoDDCoCAyMDg2wqAgwqAgwqAyNzM0wqAgwqAg
wqAgMzQ3wqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKg
IMKgIMKgMCB1bHRyYTk2LXBvd2VyLWI8L2Rpdj48ZGl2PlvCoCAxMjcuNjU1MjQxXSBbIDIwOTFd
wqAgwqAgwqAwwqAgMjA5McKgIMKgIDQyOTc5wqAgwqAgwqAzNzQ5wqAgwqAgwqAgMjDCoCDCoCDC
oCDCoDTCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIHB5dGhvbjwvZGl2PjxkaXY+
W8KgIDEyNy42NjM5MjJdIFsgMjExNF3CoCDCoCDCoDDCoCAyMTE0wqAgwqAgwqAyNTI4wqAgwqAg
wqAgMzkywqAgwqAgwqAgwqA4wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKg
IMKgIMKgMCB3cGFfc3VwcGxpY2FudDwvZGl2PjxkaXY+W8KgIDEyNy42NzMyOTZdIFsgMjE0MF3C
oCDCoCDCoDDCoCAyMTQwwqAgwqAgwqAyNTI4wqAgwqAgwqAgNDE5wqAgwqAgwqAgwqA4wqAgwqAg
wqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCB3cGFfc3VwcGxpY2FudDwv
ZGl2PjxkaXY+W8KgIDEyNy42ODI2NzFdIFsgMjE0NV3CoCDCoCDCoDDCoCAyMTQ1wqAgwqAgwqAg
NzczwqAgwqAgwqAgwqAyM8KgIMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDC
oCDCoCDCoCDCoCDCoCDCoDAgdWRoY3BkPC9kaXY+PGRpdj5bwqAgMTI3LjY5MTM1MF0gWyAyMTU1
XcKgIMKgIMKgMMKgIDIxNTXCoCDCoCDCoCA3NzPCoCDCoCDCoCDCoDI1wqAgwqAgwqAgwqA1wqAg
wqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCB1ZGhjcGM8L2Rpdj48
ZGl2PlvCoCAxMjcuNzAwMDMwXSBbIDIxNzJdwqAgwqA5OTnCoCAyMTcywqAgwqAgwqAgODI4wqAg
wqAgwqAgMzU1wqAgwqAgwqAgwqA2wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKg
IMKgIMKgIMKgMCBkYnVzLWRhZW1vbjwvZGl2PjxkaXY+W8KgIDEyNy43MDkxNDRdIFsgMjE4MF3C
oCDCoCDCoDDCoCAyMTgwwqAgwqAgwqAgODQ5wqAgwqAgwqAgwqAzMsKgIMKgIMKgIMKgNsKgIMKg
IMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgeGluaXQ8L2Rpdj48ZGl2
PlvCoCAxMjcuNzE3NzM4XSBbIDIxODhdwqAgwqAgwqAwwqAgMjE4OMKgIMKgIMKgIDYwOMKgIMKg
IMKgIMKgMzXCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAg
wqAgwqAgwqAwIGRyb3BiZWFyPC9kaXY+PGRpdj5bwqAgMTI3LjcyNjU5NF0gWyAyMTg5XcKgIMKg
IMKgMMKgIDIxODnCoCDCoCAyMjg4M8KgIMKgIMKgMTI4OMKgIMKgIMKgIDE1wqAgwqAgwqAgwqAz
wqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBYb3JnPC9kaXY+PGRpdj5bwqAgMTI3
LjczNTA5OF0gWyAyMTk1XcKgIMKgOTk3wqAgMjE5NcKgIMKgIMKgIDU4M8KgIMKgIMKgIDI3McKg
IMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAg
cnBjYmluZDwvZGl2PjxkaXY+W8KgIDEyNy43NDM4NjVdIFsgMjIwOF3CoCDCoCDCoDDCoCAyMjA4
wqAgwqAgwqAgNDY0wqAgwqAgwqAgMzM4wqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAzwqAgwqAgwqAg
wqAgMMKgIMKgIMKgIMKgIMKgLTEwMDAgd2F0Y2hkb2c8L2Rpdj48ZGl2PlvCoCAxMjcuNzUyNzE3
XSBbIDIyMTVdwqAgwqA5OTTCoCAyMjE1wqAgwqAgwqAgNzY4wqAgwqAgwqAgNDM1wqAgwqAgwqAg
wqA1wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBycGMuc3Rh
dGQ8L2Rpdj48ZGl2PlvCoCAxMjcuNzYxNjU4XSBbIDIyMjBdwqAgwqAgwqAwwqAgMjIyMMKgIMKg
IMKgMTE1N8KgIMKgIMKgIDE4MsKgIMKgIMKgIMKgNsKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDC
oCDCoCDCoCDCoCDCoCDCoCDCoDAgYmx1ZXRvb3RoZDwvZGl2PjxkaXY+W8KgIDEyNy43NzA2ODVd
IFsgMjIyN13CoCDCoDk5NsKgIDIyMjfCoCDCoCDCoCA5MjbCoCDCoCDCoCAxNjTCoCDCoCDCoCDC
oDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGRpc3RjY2Q8
L2Rpdj48ZGl2PlvCoCAxMjcuNzc5NDUyXSBbIDIyMjhdwqAgwqA5OTbCoCAyMjI4wqAgwqAgwqAg
OTI2wqAgwqAgwqAgwqA1MMKgIMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDC
oCDCoCDCoCDCoCDCoCDCoDAgZGlzdGNjZDwvZGl2PjxkaXY+W8KgIDEyNy43ODgyMThdIFsgMjI0
Ml3CoCDCoDk5NcKgIDIyNDLCoCDCoCAxODIwMsKgIMKgIMKgIDM4MsKgIMKgIMKgIMKgOcKgIMKg
IMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgbnRwZDwvZGl2PjxkaXY+
W8KgIDEyNy43OTY3MjRdIFsgMjI0Nl3CoCDCoCDCoDDCoCAyMjQ2wqAgwqAgwqAgNzczwqAgwqAg
wqAgwqAxOMKgIMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDC
oCDCoCDCoDAgc3lzbG9nZDwvZGl2PjxkaXY+W8KgIDEyNy44MDU0OTFdIFsgMjI1MF3CoCDCoCDC
oDDCoCAyMjUwwqAgwqAgwqAgNzczwqAgwqAgwqAgwqAxOcKgIMKgIMKgIMKgNcKgIMKgIMKgIMKg
M8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAga2xvZ2Q8L2Rpdj48ZGl2PlvCoCAx
MjcuODE0MDkyXSBbIDIyNjBdwqAgwqAgwqAwwqAgMjI2MMKgIMKgIMKgIDUwM8KgIMKgIMKgIMKg
MjLCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAg
wqAwIHhpbmV0ZDwvZGl2PjxkaXY+W8KgIDEyNy44MjI3NjVdIFsgMjI2NV3CoCDCoDk5OMKgIDIy
NjXCoCDCoCDCoCA5NzPCoCDCoCDCoCAzNDnCoCDCoCDCoCDCoDbCoCDCoCDCoCDCoDPCoCDCoCDC
oCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGF2YWhpLWRhZW1vbjwvZGl2PjxkaXY+W8KgIDEy
Ny44MzE5NjZdIFsgMjI2Nl3CoCDCoDk5OMKgIDIyNjbCoCDCoCDCoCA5NDLCoCDCoCDCoCAyMTXC
oCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAw
IGF2YWhpLWRhZW1vbjwvZGl2PjxkaXY+W8KgIDEyNy44NDExNjZdIFsgMjI3Ml3CoCDCoCDCoDDC
oCAyMjcywqAgwqAgwqAxMzg2wqAgwqAgwqAgMzQywqAgwqAgwqAgwqA2wqAgwqAgwqAgwqAzwqAg
wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBvZm9ub2Q8L2Rpdj48ZGl2PlvCoCAxMjcu
ODQ5ODQ3XSBbIDIyOTBdwqAgwqAgwqAwwqAgMjI5MMKgIMKgIDIzOTQ3wqAgwqAgwqAgNDc5wqAg
wqAgwqAgwqA5wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCB0
Y2YtYWdlbnQ8L2Rpdj48ZGl2PlvCoCAxMjcuODU4Nzg4XSBbIDIyOTVdwqAgwqAgwqAwwqAgMjI5
NcKgIMKgIMKgIDc1M8KgIMKgIMKgIDMwMcKgIMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKg
IMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgc3RhcnRfZ2V0dHk8L2Rpdj48ZGl2PlvCoCAxMjcu
ODY3OTAyXSBbIDIyOTZdwqAgwqAgwqAwwqAgMjI5NsKgIMKgIMKgIDc1M8KgIMKgIMKgIDMyMsKg
IMKgIMKgIMKgNcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAg
c3RhcnRfZ2V0dHk8L2Rpdj48ZGl2PlvCoCAxMjcuODc3MDE2XSBbIDIyOTddwqAgwqAgwqAwwqAg
MjI5N8KgIMKgIMKgIDk5NcKgIMKgIMKgIDQxOMKgIMKgIMKgIMKgNsKgIMKgIMKgIMKgM8KgIMKg
IMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgbG9naW48L2Rpdj48ZGl2PlvCoCAxMjcuODg1
NjA5XSBbIDIyOThdwqAgwqAgwqAwwqAgMjI5OMKgIMKgIMKgIDc3M8KgIMKgIMKgIMKgNTHCoCDC
oCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGdl
dHR5PC9kaXY+PGRpdj5bwqAgMTI3Ljg5NDIwMl0gWyAyMjk5XcKgIMKgOTk2wqAgMjI5OcKgIMKg
IMKgIDkyNsKgIMKgIMKgIMKgNTDCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAw
wqAgwqAgwqAgwqAgwqAgwqAgwqAwIGRpc3RjY2Q8L2Rpdj48ZGl2PlvCoCAxMjcuOTAyOTY5XSBb
IDIzMDBdwqAgwqA5OTbCoCAyMzAwwqAgwqAgwqAgOTI2wqAgwqAgwqAgwqA1MMKgIMKgIMKgIMKg
NcKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgZGlzdGNjZDwv
ZGl2PjxkaXY+W8KgIDEyNy45MTE3MzZdIFsgMjMwM13CoCDCoCDCoDDCoCAyMzAzwqAgwqAgwqAx
OTkzwqAgwqAgwqAgNDk3wqAgwqAgwqAgwqA4wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKg
IMKgIMKgIMKgIMKgIMKgMCBtYXRjaGJveC13aW5kb3c8L2Rpdj48ZGl2PlvCoCAxMjcuOTIxMTk3
XSBbIDIzMDhdwqAgwqAgwqAwwqAgMjMwOMKgIMKgIMKgMTEwMsKgIMKgIMKgIDIzNMKgIMKgIMKg
IMKgOMKgIMKgIMKgIMKgM8KgIMKgIMKgIMKgIDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgZGJ1cy1s
YXVuY2g8L2Rpdj48ZGl2PlvCoCAxMjcuOTMwMzExXSBbIDIzMDldwqAgwqAgwqAwwqAgMjMwOcKg
IMKgIMKgIDc5OMKgIMKgIMKgIDM1NcKgIMKgIMKgIMKgNsKgIMKgIMKgIMKgM8KgIMKgIMKgIMKg
IDDCoCDCoCDCoCDCoCDCoCDCoCDCoDAgZGJ1cy1kYWVtb248L2Rpdj48ZGl2PlvCoCAxMjcuOTM5
NDI1XSBbIDIzMTZdwqAgwqAgwqAwwqAgMjMxNsKgIMKgIDU3NDI3wqAgwqAgwqAgNDg5wqAgwqAg
wqAgMTPCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGF0LXNw
aS1idXMtbGF1bjwvZGl2PjxkaXY+W8KgIDEyNy45NDg4ODhdIFsgMjMyNF3CoCDCoCDCoDDCoCAy
MzI0wqAgwqAgwqAgNzUzwqAgwqAgwqAgMzMywqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAzwqAgwqAg
wqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBsYXVuY2gtdWx0cmE5Ni08L2Rpdj48ZGl2PlvC
oCAxMjcuOTU4MzQ4XSBbIDIzMzldwqAgwqAgwqAwwqAgMjMzOcKgIMKgNjkwNDU1wqAgwqAgwqA2
NzQ3wqAgwqAgwqAxNDXCoCDCoCDCoCDCoDfCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAg
wqAwIGNocm9taXVtLWJpbjwvZGl2PjxkaXY+W8KgIDEyNy45Njc1NDhdIFsgMjM0NF3CoCDCoCDC
oDDCoCAyMzQ0wqAgwqAgwqA3NzA5wqAgwqAgwqAxNjgwwqAgwqAgwqAgMTnCoCDCoCDCoCDCoDPC
oCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIG1hdGNoYm94LWRlc2t0bzwvZGl2Pjxk
aXY+W8KgIDEyNy45NzcwMDldIFsgMjM0NV3CoCDCoCDCoDDCoCAyMzQ1wqAgwqAgwqA3NzM4wqAg
wqAgwqAxNTM0wqAgwqAgwqAgMTjCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAg
wqAgwqAgwqAwIG1hdGNoYm94LXBhbmVsPC9kaXY+PGRpdj5bwqAgMTI3Ljk4NjM4N10gWyAyMzQ2
XcKgIMKgIMKgMMKgIDIzNDbCoCDCoCDCoCA0ODXCoCDCoCDCoCDCoDkzwqAgwqAgwqAgwqA1wqAg
wqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBjYXQ8L2Rpdj48ZGl2
PlvCoCAxMjcuOTk0ODA0XSBbIDIzNDddwqAgwqAgwqAwwqAgMjM0N8KgIMKgIMKgIDQ4NcKgIMKg
IMKgIMKgOTHCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAg
wqAgwqAgwqAwIGNhdDwvZGl2PjxkaXY+W8KgIDEyOC4wMDMyMjNdIFsgMjM1MV3CoCDCoDk5NsKg
IDIzNTHCoCDCoCDCoCA5MjbCoCDCoCDCoCDCoDUwwqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAzwqAg
wqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBkaXN0Y2NkPC9kaXY+PGRpdj5bwqAgMTI4
LjAxMTk4OV0gWyAyMzU1XcKgIMKgIMKgMMKgIDIzNTXCoCDCoCDCoCA3OTjCoCDCoCDCoCAzMzHC
oCDCoCDCoCDCoDfCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAw
IGRidXMtZGFlbW9uPC9kaXY+PGRpdj5bwqAgMTI4LjAyMTEwNF0gWyAyMzU4XcKgIMKgIMKgMMKg
IDIzNTjCoCDCoCDCoDIwNTLCoCDCoCDCoCA0MzbCoCDCoCDCoCDCoDjCoCDCoCDCoCDCoDPCoCDC
oCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGdjb25mZC0yPC9kaXY+PGRpdj5bwqAgMTI4
LjAyOTk1N10gWyAyMzYxXcKgIMKgIMKgMMKgIDIzNjHCoCDCoDEwMzg3N8KgIMKgIMKgIDkwMcKg
IMKgIMKgIDE0wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBw
dWxzZWF1ZGlvPC9kaXY+PGRpdj5bwqAgMTI4LjAzODk4NF0gWyAyMzYyXcKgIMKgOTk2wqAgMjM2
MsKgIMKgIMKgIDkyNsKgIMKgIMKgIMKgNTDCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDCoCDC
oCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGRpc3RjY2Q8L2Rpdj48ZGl2PlvCoCAxMjguMDQ3
NzU0XSBbIDIzNjRdwqAgwqAgwqAwwqAgMjM2NMKgIMKgIDM5MzEwwqAgwqAgwqAgMjE0wqAgwqAg
wqAgMTHCoCDCoCDCoCDCoDPCoCDCoCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGF0LXNw
aTItcmVnaXN0cjwvZGl2PjxkaXY+W8KgIDEyOC4wNTcyMTZdIFsgMjM2N13CoCDCoCDCoDDCoCAy
MzY3wqAgwqAgwqA0NTU0wqAgwqAgwqAgMzkwwqAgwqAgwqAgMTPCoCDCoCDCoCDCoDPCoCDCoCDC
oCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIHNldHRpbmdzLWRhZW1vbjwvZGl2PjxkaXY+W8Kg
IDEyOC4wNjY2NzZdIFsgMjM2OF3CoCDCoDk5NsKgIDIzNjjCoCDCoCDCoCA5MjbCoCDCoCDCoCDC
oDUwwqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAzwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKg
IMKgMCBkaXN0Y2NkPC9kaXY+PGRpdj5bwqAgMTI4LjA3NTQ0M10gWyAyMzcwXcKgIMKgIMKgMMKg
IDIzNzDCoCDCoCDCoDExNjPCoCDCoCDCoCA2NTnCoCDCoCDCoCDCoDXCoCDCoCDCoCDCoDPCoCDC
oCDCoCDCoCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIHNoPC9kaXY+PGRpdj5bwqAgMTI4LjA4Mzc3
Nl0gWyAyMzcyXcKgIMKgIMKgMMKgIDIzNzLCoCDCoDUxMTczNcKgIMKgIMKgIDQwOcKgIMKgIMKg
IDQywqAgwqAgwqAgwqA1wqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBjb25zb2xl
LWtpdC1kYWU8L2Rpdj48ZGl2PlvCoCAxMjguMDkzMjQyXSBbIDI0NDBdwqAgwqAgwqAwwqAgMjQ0
MMKgIMKgIDQ3OTA2wqAgwqAgwqAxOTA2wqAgwqAgwqAgNTPCoCDCoCDCoCDCoDPCoCDCoCDCoCDC
oCAwwqAgwqAgwqAgwqAgwqAgwqAgwqAwIGNocm9taXVtLWJpbjwvZGl2PjxkaXY+W8KgIDEyOC4x
MDI0MzldIFsgMjU0M13CoCDCoCDCoDDCoCAyNTQzwqAgwqAyNzQyNDTCoCDCoCDCoDU2MzfCoCDC
oCDCoDEyNsKgIMKgIMKgIDEwwqAgwqAgwqAgwqAgMMKgIMKgIMKgIMKgIMKgIMKgMzAwIGNocm9t
aXVtLWJpbjwvZGl2PjxkaXY+W8KgIDEyOC4xMTE2MzldIFsgMjczM13CoCDCoCDCoDDCoCAyNzMz
wqAgwqAyODU0NjLCoCDCoDI3MTM2M8KgIMKgIMKgNTM3wqAgwqAgwqAgwqA0wqAgwqAgwqAgwqAg
MMKgIMKgIMKgIMKgIMKgIMKgIMKgMCBweXRob248L2Rpdj48ZGl2PlvCoCAxMjguMTIwMzE4XSBP
dXQgb2YgbWVtb3J5OiBLaWxsIHByb2Nlc3MgMjczMyAocHl0aG9uKSBzY29yZSA2OTkgb3Igc2Fj
cmlmaWNlIGNoaWxkPC9kaXY+PGRpdj5bwqAgMTI4LjEyNzg4NF0gS2lsbGVkIHByb2Nlc3MgMjcz
MyAocHl0aG9uKSB0b3RhbC12bToxMTQxODQ4a0IsIGFub24tcnNzOjEwODQzODBrQiwgZmlsZS1y
c3M6MTA3MmtCLCBzaG1lbS1yc3M6MGtCPC9kaXY+PGRpdj5bwqAgMTI4LjI2OTUzOF0gb29tX3Jl
YXBlcjogcmVhcGVkIHByb2Nlc3MgMjczMyAocHl0aG9uKSwgbm93IGFub24tcnNzOjBrQiwgZmls
ZS1yc3M6MGtCLCBzaG1lbS1yc3M6MGtCPC9kaXY+PGRpdj5LaWxsZWQ8L2Rpdj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PldoYXQgZG8gaSBuZWVkIHRvIGNoYW5nZSBpbiBteSBjb25maWd1cmF0
aW9ucyB0byBtYWtlIHRoaXMgd29yaz88L2Rpdj48ZGl2Pkkgc2VuZCBpbiBhdHRhY2htZW50IG15
IGNvbmZpZyBmaWxlcy48L2Rpdj48L2Rpdj4NCg0KPHA+PC9wPgoKLS0gPGJyIC8+CllvdSByZWNl
aXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2ds
ZSBHcm91cHMgJnF1b3Q7SmFpbGhvdXNlJnF1b3Q7IGdyb3VwLjxiciAvPgpUbyB1bnN1YnNjcmli
ZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5k
IGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdv
b2dsZWdyb3Vwcy5jb20iPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bTwvYT4uPGJyIC8+ClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgPGEg
aHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvODg1
YTY1OTItODRkOS00M2Y0LWEwMzctMTBjZTczZjk2OGFiJTQwZ29vZ2xlZ3JvdXBzLmNvbT91dG1f
bWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9Zm9vdGVyIj5odHRwczovL2dyb3Vwcy5nb29nbGUuY29t
L2QvbXNnaWQvamFpbGhvdXNlLWRldi84ODVhNjU5Mi04NGQ5LTQzZjQtYTAzNy0xMGNlNzNmOTY4
YWIlNDBnb29nbGVncm91cHMuY29tPC9hPi48YnIgLz4K
------=_Part_7166_306772384.1564047150417--

------=_Part_7165_1866588425.1564047150417
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo.c
X-Attachment-Id: a841bd37-b3ce-4955-99fe-cb48c97de6ee
Content-ID: <a841bd37-b3ce-4955-99fe-cb48c97de6ee>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux-demo inmate on Avnet Ultra96 board:
 * 2 CPUs, 128M RAM, serial port 2
 *
 * Copyright (c) Siemens AG, 2014-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_cell_desc cell;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[7];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "non-root",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,/* |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,*/

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09.vpci_irq_base =3D 140-32,

=09=09.console =3D {
=09=09=09.address =3D 0xff010000, /*UART1*/
=09=09=09//.address =3D 0xff000000, /*UART0*/ //se eu meter uart0 da erro u=
nhandled trap
=09=09=09.type=3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=090xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=09//0xc, //1100
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09/*.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,*/
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0,
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* IVSHMEM shared memory region */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09=09/* RAM */{
=09=09=09.phys_start =3D 0x3fd00000,
=09=09=09.virt_start =3D 0x3fd00000,
=09=09=09.size =3D 0x202f0000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED, //se tirar JAILHOUSE_MEM_ROOTSHARED d=
a exception fault 0x20
=09=09},
=09=09{
=09=09=09.phys_start =3D 0,
=09=09=09.virt_start =3D 0x10000,
=09=09=09.size =3D 0x3ed00000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 */
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */
=09=09=09.pin_bitmap =3D {
=09=09=09=09//1 << (54 - 32),
=09=09=09=091 << (53 - 32), // cat /proc/interrupts interrupt da UART0 AQUI=
 ESTA A DIFEREN=C3=87A
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128)) //PL to PS interrupt si=
gnals 8 to 15.
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 0 << 3, // 00:00.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 3,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_7165_1866588425.1564047150417
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96.c
X-Attachment-Id: 515b6b6c-108d-437f-85b1-31d903567dac
Content-ID: <515b6b6c-108d-437f-85b1-31d903567dac>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Avnet Ultra96 board
 *
 * Copyright (c) Siemens AG, 2016-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_system header;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[3];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.header =3D {
=09=09.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
=09=09.hypervisor_memory =3D {
=09=09=09.phys_start =3D 0x7c000000,
=09=09=09.size =3D       0x00400000,
=09=09},
=09=09.debug_console =3D {
=09=09=09.address =3D 0xff010000,
=09=09=09.size =3D 0x1000,
=09=09=09.type =3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09=09.platform_info =3D {
=09=09=09.pci_mmconfig_base =3D 0xfc000000,
=09=09=09.pci_mmconfig_end_bus =3D 0,
=09=09=09.pci_is_virtual =3D 1,
=09=09=09.arm =3D {
=09=09=09=09.gic_version =3D 2,
=09=09=09=09.gicd_base =3D 0xf9010000,
=09=09=09=09.gicc_base =3D 0xf902f000,
=09=09=09=09.gich_base =3D 0xf9040000,
=09=09=09=09.gicv_base =3D 0xf906f000,
=09=09=09=09.maintenance_irq =3D 25,
=09=09=09},
=09=09},
=09=09.root_cell =3D {
=09=09=09.name =3D "root",

=09=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09=09.vpci_irq_base =3D 136-32,
=09=09},
=09},

=09.cpus =3D {
=09=090xf,
=09},

=09.mem_regions =3D {
=09=09/* MMIO (permissive) */ {
=09=09=09.phys_start =3D 0xfd000000,
=09=09=09.virt_start =3D 0xfd000000,
=09=09=09.size =3D=09      0x03000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x0,
=09=09=09.virt_start =3D 0x0,
=09=09=09.size =3D 0x7c000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,
=09=09},
=09=09/* IVSHMEM shared memory region for 00:00.0 */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000,
=09=09=09.pin_base =3D 32,
=09=09=09.pin_bitmap =3D {
=09=09=09=090xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 0001:00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.iommu =3D 1,//
=09=09=09//.domain =3D 1,
=09=09=09.bdf =3D 0 << 3,
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 2,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,=20
=09=09=09//.num_msix_vectors =3D 1,//se colocar isto, qd fa=C3=A7o insmod u=
io_ivshmem.ko ele n diz "using jailhouse mode" e dps n existe /dev/uio1
=09=09},
=09},
};

------=_Part_7165_1866588425.1564047150417--
