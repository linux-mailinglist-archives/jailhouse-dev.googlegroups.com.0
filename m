Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBIXWY3YQKGQETYC5JGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E9E14CF29
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 18:04:36 +0100 (CET)
Received: by mail-oi1-x23e.google.com with SMTP id u125sf96861oia.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I5VxGRgNv0YJjz1apJr896qL+YbDou93TJM9GKtFFyo=;
        b=MFVyHnRwzDjs53jgT0zonKcvNfUSPbKhP9cX7cM4D2CFyPAJ9TGyg88j5EuvHMZei3
         rZ1W6+rzXKYVD7chz8RcwnRKLMODQhDJnkFfN3APbtXzUzCyCBHcTQ3osAe5O8V0ZCSW
         c5HboBU+VWJjL3+jiC1wW7R22+CbugJAhY4vI0lMnJFmoeLRUak5Ejz8z0H6Zy5DFUsq
         ljqtyoGDN5nYUq7L4musYKhEJ2spJpp9Di76zayVcJj4fEi/Y6RKTjXs72vQFzpFvZrv
         JKCkJ3FSiBPoqnkybeAm73tsEGLeTJ6PwYI0BxeOIxSycOFTjgT3lixVtwfXHunN81tm
         /lJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I5VxGRgNv0YJjz1apJr896qL+YbDou93TJM9GKtFFyo=;
        b=q/APaaqWOtwrUfEpbTUsiBf4QOO8UcGZE/xrpalzobT0ihOfeZ85cY49jxfH/ECqyp
         hmhatbrzQnNwi+UH23Gvz+rRr/rlKdwmZQndtsm+kcQPC+Ag9mCWacdsvhpdOVrqV48J
         +JR945cUs6s9ae6siat6g0tUxgZfpXnVxjdk5uNihOenjUJF4+KnhUiqO7TDjFClbYXo
         qj4qpjURJVeH0bAyAsBiww08V4BYeajo5utScqWJ7i1dXdfi/S7Kw/56ez7NrQmlaVVm
         vmAeTowYid861MIMnYxeEKcUNugwKpwWwdKLdpBrY7/Dz6X4GI0OLBEoV2dfad2E5KQb
         WSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I5VxGRgNv0YJjz1apJr896qL+YbDou93TJM9GKtFFyo=;
        b=lQg3kznzwOJeZ8sLAx4nrcyAD3CeEIHZrart8dnpPXZYTt27StQf3TEO2UdzdnYrtK
         9q3JxhkyGB/BN7yCjayQmnw+aluLnzPTGSIgssjomHiQ5tWnl2WzDeTZ0LcbFIsogAot
         pFoAxocayzs9YzYI5EjsdcdokDv0Smm8OUsuQC6RFZxIJfog+PVMpGMonboeCanb46Vj
         cQ97chZWnK0N5eD32uxW5ELqolJ8yfT5EY6FptIHkqp/QJVJd4x5fh1FHYAMbTfduUlm
         5QE0dvDaS4ZRq/ifoAGG0GVwKj1Z2aTdIyAS1oUbUyHZDtar+MjlX7d/7o+7/IZ5t5lY
         ucOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkNnw0LXbavWqmQbnJjadGw5ggPs/QcPmTgZVGOh+faNWZXS7H
	s3Ez0LBma9amsLjCJmwqCn0=
X-Google-Smtp-Source: APXvYqyZHr0d5rtD3GGXCt+g+gzh32fAQuJES71EAIwhTVbWnNvNpueAdOUwOdwQno3SKq2nXccPcQ==
X-Received: by 2002:aca:c415:: with SMTP id u21mr7152006oif.49.1580317475285;
        Wed, 29 Jan 2020 09:04:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a01:: with SMTP id g1ls41207otn.6.gmail; Wed, 29 Jan
 2020 09:04:34 -0800 (PST)
X-Received: by 2002:a9d:7652:: with SMTP id o18mr150124otl.227.1580317474463;
        Wed, 29 Jan 2020 09:04:34 -0800 (PST)
Date: Wed, 29 Jan 2020 09:04:33 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
In-Reply-To: <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_758_1655305765.1580317473728"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_758_1655305765.1580317473728
Content-Type: multipart/alternative; 
	boundary="----=_Part_759_100713899.1580317473729"

------=_Part_759_100713899.1580317473729
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I changed the extlinux as suggested by Henning schild, as
attached file:
and rebooted the system and checked the following:
printenv gives:
tx2@tx2 $ sudo printenv
[sudo] password for tx2:=20
LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=
=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D=
30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:=
*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=
=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D0=
1;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D01;31:*.gz=
=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;3=
1:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.=
tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D=
01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31=
:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=
=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D=
01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;=
35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.=
tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=
=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D0=
1;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;3=
5:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:
LANG=3Den_US.UTF-8
HOME=3D/home/tx2
TERM=3Dxterm-256color
PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/b=
in
MAIL=3D/var/mail/root
LOGNAME=3Droot
USER=3Droot
USERNAME=3Droot
SHELL=3D/bin/bash
SUDO_COMMAND=3D/usr/bin/printenv
SUDO_USER=3Dtx2
SUDO_UID=3D1000
SUDO_GID=3D1000
=20
Similarly output of cat /proc/cmdline is :
root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4 console=3DttyS0,115200n=
8=20
console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb no_console_sus=
pend=3D1=20
earlycon=3Duart8250,mmio32,0x3100000 nvdumper_reserved=3D0x2772e0000 gpt=20
tegra_fbmem2=3D0x140000@0x9607d000 lut_mem2=3D0x2008@0x9607a000=20
usbcore.old_scheme_first=3D1 tegraid=3D18.1.2.0.0 maxcpus=3D6 boot.slot_suf=
fix=3D=20
boot.ratchetvalues=3D0.2031647.1 bl_prof_dataptr=3D0x10000@0x275840000=20
sdhci_tegra.en_boot_part_access=3D1 quiet mem=3D7808M vmalloc=3D512M

when i again tried to enable jailhouse through command sudo jailhouse=20
enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell
terminal cell hangs and debug cell gives following output:
Dump for CPU0:
pid: 8867  comm: jailhouse
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000038
  x6 ffffffc1e7ffe738   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800112a990  x25 ffffff800112af80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800112b2d0  x29 ffffffc1d8dd7bc0
 x30 0000000000000016   sp ffffffc1d8dd7bc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1d8dd7bc0   fp ffffffc1d8dd7bc0
on_each_cpu+0x58/0x98:
  pc ffffff8008151800   sp ffffffc1d8dd7bd0   fp ffffffc1d8dd7be0
jailhouse_cmd_enable+0x420/0x710 [jailhouse]:
  pc ffffff8001127a10   sp ffffffc1d8dd7bf0   fp ffffffc1d8dd7c10
jailhouse_ioctl+0x8c/0x110 [jailhouse]:
  pc ffffff8001127d8c   sp ffffffc1d8dd7c20   fp ffffffc1d8dd7de0
do_vfs_ioctl+0xb0/0x8d8:
  pc ffffff8008273188   sp ffffffc1d8dd7df0   fp ffffffc1d8dd7e00
SyS_ioctl+0x8c/0xa8:
  pc ffffff8008273a3c   sp ffffffc1d8dd7e10   fp ffffffc1d8dd7e80
el0_svc_naked+0x34/0x38:
  pc ffffff80080838c0   sp ffffffc1d8dd7e90   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000000   x5 0000000000000038
  x6 ffffffc1e7ffe738   x7 5e72736877646c75
  x8 7f7f7f7f7f7f7f7f   x9 fefefdff6862726f
 x10 ffffff7f7f7f7f7f  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000000  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000040  x23 0000000000000000
 x24 ffffff800112a990  x25 ffffff800112af80
 x26 ffffff8018000000  x27 ffffff8009e5a998
 x28 ffffff800112b2d0  x29 ffffffc1d8dd7bc0
 x30 0000000000000016   sp ffffffc1d8dd7bc0
  pc ffffff8018004050 cpsr 200000c5 (EL1h)
 sp_el0   ffffffc19a788e00
 elr_el1  ffffff800845c6ec
 spsr_el1 20000045
debug> Dump for CPU5:
pid: 0  comm: swapper/5
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7feff50   fp ffffffc1e7feff50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7feff60   fp ffffffc1e7feff70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7feff80   fp ffffffc1e7feffa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7feffb0   fp ffffffc1e7feffb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7feffc0   fp ffffffc1e7ff0000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7ff0010   fp ffffffc1e7ff0040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9fd80   fp ffffffc1def9feb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9fec0   fp ffffffc1def9ff00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9ff10   fp ffffffc1def9ff30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9ff40   fp ffffffc1def9ff60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9ff70   fp ffffffc1def9ffd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9ffe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000005  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000005  x25 ffffffc1e7fec060
 x26 ffffffc1e7ff0050  x27 ffffff8009e46000
 x28 ffffffc1def7e200  x29 ffffffc1e7feff50
 x30 0000000000000016   sp ffffffc1e7feff50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7e200
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU4:
pid: 0  comm: swapper/4
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7fd6f50   fp ffffffc1e7fd6f50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7fd6f60   fp ffffffc1e7fd6f70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7fd6f80   fp ffffffc1e7fd6fa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7fd6fb0   fp ffffffc1e7fd6fb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7fd6fc0   fp ffffffc1e7fd7000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7fd7010   fp ffffffc1e7fd7040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def9bd80   fp ffffffc1def9beb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def9bec0   fp ffffffc1def9bf00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def9bf10   fp ffffffc1def9bf30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def9bf40   fp ffffffc1def9bf60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def9bf70   fp ffffffc1def9bfd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def9bfe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000004  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000004  x25 ffffffc1e7fd3060
 x26 ffffffc1e7fd7050  x27 ffffff8009e46000
 x28 ffffffc1def7d400  x29 ffffffc1e7fd6f50
 x30 0000000000000016   sp ffffffc1e7fd6f50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7d400
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> Dump for CPU3:
pid: 0  comm: swapper/3
  x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000003  x25 ffffffc1e7fba060
 x26 ffffffc1e7fbe050  x27 ffffff8009e46000
 x28 ffffffc1def7c600  x29 ffffffc1e7fbdf50
 x30 0000000000000016   sp ffffffc1e7fbdf50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)

0xffffff8018004050:
  pc ffffff8018004050   sp ffffffc1e7fbdf50   fp ffffffc1e7fbdf50
flush_smp_call_function_queue+0xb8/0x160:
  pc ffffff8008150e00   sp ffffffc1e7fbdf60   fp ffffffc1e7fbdf70
generic_smp_call_function_single_interrupt+0x18/0x20:
  pc ffffff8008151d28   sp ffffffc1e7fbdf80   fp ffffffc1e7fbdfa0
handle_IPI+0x94/0x2e8:
  pc ffffff800809322c   sp ffffffc1e7fbdfb0   fp ffffffc1e7fbdfb0
gic_handle_irq+0xa8/0xb0:
  pc ffffff8008080d90   sp ffffffc1e7fbdfc0   fp ffffffc1e7fbe000
el1_irq+0xe8/0x18c:
  pc ffffff8008082be8   sp ffffffc1e7fbe010   fp ffffffc1e7fbe040
cpuidle_enter_state+0xb8/0x380:
  pc ffffff8008b9b330   sp ffffffc1def97d80   fp ffffffc1def97eb0
cpuidle_enter+0x34/0x48:
  pc ffffff8008b9b66c   sp ffffffc1def97ec0   fp ffffffc1def97f00
call_cpuidle+0x44/0x70:
  pc ffffff8008112a1c   sp ffffffc1def97f10   fp ffffffc1def97f30
cpu_startup_entry+0x1b0/0x200:
  pc ffffff8008112d98   sp ffffffc1def97f40   fp ffffffc1def97f60
secondary_start_kernel+0x190/0x1f8:
  pc ffffff8008092ce8   sp ffffffc1def97f70   fp ffffffc1def97fd0
0x8115a1a4:
  pc 000000008115a1a4   sp ffffffc1def97fe0   fp 0000000000000000
debug>   x0 0000000000000003   x1 0000000000100000
  x2 000000000000c000   x3 ffffff8018000000
  x4 0000000000000015   x5 00ffffffffffffff
  x6 000000001110e1e4   x7 fefefeff646c606d
  x8 7f7f7f7f7f7f7f7f   x9 0000000000000005
 x10 0101010101010101  x11 ffff0002b0e00000
 x12 0000000271000000  x13 0000ffffc0200000
 x14 0000000003100000  x15 0000ffffc0100000
 x16 0000000000000003  x17 ffffff8001127014
 x18 0000000000000000  x19 ffffff800112b2d0
 x20 ffffff8018000000  x21 0000000000000000
 x22 0000000000000001  x23 0000000000000001
 x24 0000000000000003  x25 ffffffc1e7fba060
 x26 ffffffc1e7fbe050  x27 ffffff8009e46000
 x28 ffffffc1def7c600  x29 ffffffc1e7fbdf50
 x30 0000000000000016   sp ffffffc1e7fbdf50
  pc ffffff8018004050 cpsr 200001c5 (EL1h)
 sp_el0   ffffffc1def7c600
 elr_el1  ffffff8008b9b330
 spsr_el1 60000045
debug> [0000.230] I> Welcome to MB2(TBoot-BPMP)(version: 01=20
01.00.160913-t186-M-00.00-mobile-7d3edb9d)
[0000.238] I> bit @ 0xd480000
[0000.241] I> Boot-device: eMMC
[0000.248] I> sdmmc bdev is already initialized
[0000.253] I> pmic: reset reason (nverc)        : 0x0
[0000.285] I> Found 18 partitions in SDMMC_BOOT (instance 3)
[0000.303] I> Found 33 partitions in SDMMC_USER (instance 3)
[0000.309] W> No valid slot number is found in scratch register
[0000.315] W> Return default slot: _a
...............................................................
and linux reboots.
whats the problem why jailhouse is not loading now??
On Wednesday, January 29, 2020 at 1:01:57 AM UTC-6, Jan Kiszka wrote:
>
> On 28.01.20 22:50, Saroj Sapkota wrote:=20
> > I'm trying to run jailhouse on Jetson tx2 kit. I downloaded the=20
> > jailhouse and compiled it and run the command=20
> >=20
> > =3D>sudo insmod Downloads/linux-jailhouse-jetson/driver/jailhouse.ko=20
> >=20
> > // there is no error message in terminal console=20
> >=20
> > but it gives following output on the serial console:=20
> >=20
> > tx2@tx2-desktop:~$ [  129.954491] jailhouse: loading out-of-tree module=
=20
> > taints kernel.=20
> >=20
> > After this I tried to enable jailhouse through this command=20
> >=20
> > =3D>sudo jailhouse enable=20
> Downloads/linux-jetson/configs/arm64/jetson-tx2.celsudo jailhouse enable=
=20
> Downloads/linux-jetson/configs/arm64/jetson-tx2.celll=20
> > // terminal displays: JAILHOUSE_ENABLE: Invalid argument=20
> >=20
> > //and on the terminal console it displays:=20
> >=20
> > [  333.421533] jailhouse: mem_region_request failed for hypervisor=20
> > memory mem_region_request failed for hypervisor memory=20
> > mem_region_request failed for hypervisor memory mem_region_request=20
> > failed for hypervisor memory.=20
> > [  333.428303] jailhouse: Did you reserve the memory with "memmap=3D" o=
r=20
> > "mem=3D"?=20
> >=20
> > I have changed /boot/extlinux/extlinux.conf file as follows:=20
> > TIMEOUT 30=20
> > DEFAULT primary=20
> >=20
> > MENU TITLE L4T boot options=20
> >=20
> > LABEL primary=20
> >        MENU LABEL primary kernel=20
> >        LINUX /boot/Image=20
> >        INITRD /boot/initrd=20
> >        APPEND ${cbootargs} quiet=20
> > **mem=3D7808M vmalloc=3D512M**=20
> > # When testing a custom kernel, it is recommended that you create a=20
> > backup of=20
> > # the original kernel and add a new entry to this file so that the=20
> > device can=20
> > # fallback to the original kernel. To do this:=20
> > #=20
> > # 1, Make a backup of the original kernel=20
> > #      sudo cp /boot/Image /boot/Image.backup=20
> > #=20
> > # 2, Copy your custom kernel into /boot/Image=20
> > #=20
> > # 3, Uncomment below menu setting lines for the original kernel=20
> > #=20
> > # 4, Reboot=20
> >=20
> > # LABEL backup=20
> > #    MENU LABEL backup kernel=20
> > #    LINUX /boot/Image.backup=20
> > #    INITRD /boot/initrd=20
> > #    APPEND ${cbootargs}*=20
> > *=20
> > *=20
> > *=20
> > but this change is not working. So what's the wrong in this=20
> > extlinux.conf file as boot up is ignoring *mem=3D7808M vmalloc=3D512M *=
this=20
> > statement.*=20
> > *=20
>
> So, /proc/cmdline of the booted system is not containing your change?=20
> Then I would say your system is using a different boot configuration=20
> mechanism. Where did you get the image from? Is U-Boot involved in the=20
> boot-up? What does "printenv" report about how the boot is configured?=20
> Maybe you need to adjust the command line in the environment instead.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/73f42baf-5afe-4a77-80d1-8e4bc9419f62%40googlegroups.com.

------=_Part_759_100713899.1580317473729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I changed the extlinux as suggested by Henning schild=
, as</div><div>attached file:</div><div>and rebooted the system and checked=
 the following:<br></div><div>printenv gives:</div><div>tx2@tx2 $ sudo prin=
tenv<br>[sudo] password for tx2: <br>LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;=
36:mh=3D00:pi=3D40;33:so=3D01;35:do=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=
=3D40;31;01:mi=3D00:su=3D37;41:sg=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:=
st=3D37;44:ex=3D01;32:*.tar=3D01;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;=
31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*=
.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D=
01;31:*.Z=3D01;31:*.dz=3D01;31:*.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lz=
o=3D01;31:*.xz=3D01;31:*.zst=3D01;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01=
;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*=
.jar=3D01;31:*.war=3D01;31:*.ear=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=
=3D01;31:*.ace=3D01;31:*.zoo=3D01;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;=
31:*.cab=3D01;31:*.wim=3D01;31:*.swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.=
jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.b=
mp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D=
01;35:*.xpm=3D01;35:*.tif=3D01;35:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;3=
5:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.=
mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D01;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=
=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01=
;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*=
.avi=3D01;35:*.fli=3D01;35:*.flv=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D=
01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35=
:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mi=
d=3D00;36:*.midi=3D00;36:*.mka=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D=
00;36:*.ra=3D00;36:*.wav=3D00;36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36=
:*.xspf=3D00;36:<br>LANG=3Den_US.UTF-8<br>HOME=3D/home/tx2<br>TERM=3Dxterm-=
256color<br>PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:=
/bin:/snap/bin<br>MAIL=3D/var/mail/root<br>LOGNAME=3Droot<br>USER=3Droot<br=
>USERNAME=3Droot<br>SHELL=3D/bin/bash<br>SUDO_COMMAND=3D/usr/bin/printenv<b=
r>SUDO_USER=3Dtx2<br>SUDO_UID=3D1000<br>SUDO_GID=3D1000<br>=C2=A0</div><div=
>Similarly output of cat /proc/cmdline is :</div><div>root=3D/dev/mmcblk0p1=
 rw rootwait rootfstype=3Dext4 console=3DttyS0,115200n8 console=3Dtty0 fbco=
n=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb no_console_suspend=3D1 earlycon=
=3Duart8250,mmio32,0x3100000 nvdumper_reserved=3D0x2772e0000 gpt tegra_fbme=
m2=3D0x140000@0x9607d000 lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_fi=
rst=3D1 tegraid=3D18.1.2.0.0 maxcpus=3D6 boot.slot_suffix=3D boot.ratchetva=
lues=3D0.2031647.1 bl_prof_dataptr=3D0x10000@0x275840000 sdhci_tegra.en_boo=
t_part_access=3D1 quiet mem=3D7808M vmalloc=3D512M</div><div><br></div><div=
>when i again tried to enable jailhouse through command sudo jailhouse enab=
le Downloads/linux-jetson/configs/arm64/jetson-tx2.cell</div><div><wbr></di=
v><div>terminal cell hangs and debug cell gives following output:</div><div=
>Dump for CPU0:<br>pid: 8867=C2=A0 comm: jailhouse<br>=C2=A0 x0 00000000000=
00003=C2=A0=C2=A0 x1 0000000000100000<br>=C2=A0 x2 000000000000c000=C2=A0=
=C2=A0 x3 ffffff8018000000<br>=C2=A0 x4 0000000000000000=C2=A0=C2=A0 x5 000=
0000000000038<br>=C2=A0 x6 ffffffc1e7ffe738=C2=A0=C2=A0 x7 5e72736877646c75=
<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 fefefdff6862726f<br>=C2=A0x10=
 ffffff7f7f7f7f7f=C2=A0 x11 ffff0002b0e00000<br>=C2=A0x12 0000000271000000=
=C2=A0 x13 0000ffffc0200000<br>=C2=A0x14 0000000003100000=C2=A0 x15 0000fff=
fc0100000<br>=C2=A0x16 0000000000000000=C2=A0 x17 ffffff8001127014<br>=C2=
=A0x18 0000000000000000=C2=A0 x19 ffffff800112b2d0<br>=C2=A0x20 ffffff80180=
00000=C2=A0 x21 0000000000000000<br>=C2=A0x22 0000000000000040=C2=A0 x23 00=
00000000000000<br>=C2=A0x24 ffffff800112a990=C2=A0 x25 ffffff800112af80<br>=
=C2=A0x26 ffffff8018000000=C2=A0 x27 ffffff8009e5a998<br>=C2=A0x28 ffffff80=
0112b2d0=C2=A0 x29 ffffffc1d8dd7bc0<br>=C2=A0x30 0000000000000016=C2=A0=C2=
=A0 sp ffffffc1d8dd7bc0<br>=C2=A0 pc ffffff8018004050 cpsr 200000c5 (EL1h)<=
br><br>0xffffff8018004050:<br>=C2=A0 pc ffffff8018004050=C2=A0=C2=A0 sp fff=
fffc1d8dd7bc0=C2=A0=C2=A0 fp ffffffc1d8dd7bc0<br>on_each_cpu+0x58/0x98:<br>=
=C2=A0 pc ffffff8008151800=C2=A0=C2=A0 sp ffffffc1d8dd7bd0=C2=A0=C2=A0 fp f=
fffffc1d8dd7be0<br>jailhouse_cmd_enable+0x420/0x710 [jailhouse]:<br>=C2=A0 =
pc ffffff8001127a10=C2=A0=C2=A0 sp ffffffc1d8dd7bf0=C2=A0=C2=A0 fp ffffffc1=
d8dd7c10<br>jailhouse_ioctl+0x8c/0x110 [jailhouse]:<br>=C2=A0 pc ffffff8001=
127d8c=C2=A0=C2=A0 sp ffffffc1d8dd7c20=C2=A0=C2=A0 fp ffffffc1d8dd7de0<br>d=
o_vfs_ioctl+0xb0/0x8d8:<br>=C2=A0 pc ffffff8008273188=C2=A0=C2=A0 sp ffffff=
c1d8dd7df0=C2=A0=C2=A0 fp ffffffc1d8dd7e00<br>SyS_ioctl+0x8c/0xa8:<br>=C2=
=A0 pc ffffff8008273a3c=C2=A0=C2=A0 sp ffffffc1d8dd7e10=C2=A0=C2=A0 fp ffff=
ffc1d8dd7e80<br>el0_svc_naked+0x34/0x38:<br>=C2=A0 pc ffffff80080838c0=C2=
=A0=C2=A0 sp ffffffc1d8dd7e90=C2=A0=C2=A0 fp 0000000000000000<br>debug&gt;=
=C2=A0=C2=A0 x0 0000000000000003=C2=A0=C2=A0 x1 0000000000100000<br>=C2=A0 =
x2 000000000000c000=C2=A0=C2=A0 x3 ffffff8018000000<br>=C2=A0 x4 0000000000=
000000=C2=A0=C2=A0 x5 0000000000000038<br>=C2=A0 x6 ffffffc1e7ffe738=C2=A0=
=C2=A0 x7 5e72736877646c75<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 fef=
efdff6862726f<br>=C2=A0x10 ffffff7f7f7f7f7f=C2=A0 x11 ffff0002b0e00000<br>=
=C2=A0x12 0000000271000000=C2=A0 x13 0000ffffc0200000<br>=C2=A0x14 00000000=
03100000=C2=A0 x15 0000ffffc0100000<br>=C2=A0x16 0000000000000000=C2=A0 x17=
 ffffff8001127014<br>=C2=A0x18 0000000000000000=C2=A0 x19 ffffff800112b2d0<=
br>=C2=A0x20 ffffff8018000000=C2=A0 x21 0000000000000000<br>=C2=A0x22 00000=
00000000040=C2=A0 x23 0000000000000000<br>=C2=A0x24 ffffff800112a990=C2=A0 =
x25 ffffff800112af80<br>=C2=A0x26 ffffff8018000000=C2=A0 x27 ffffff8009e5a9=
98<br>=C2=A0x28 ffffff800112b2d0=C2=A0 x29 ffffffc1d8dd7bc0<br>=C2=A0x30 00=
00000000000016=C2=A0=C2=A0 sp ffffffc1d8dd7bc0<br>=C2=A0 pc ffffff801800405=
0 cpsr 200000c5 (EL1h)<br>=C2=A0sp_el0=C2=A0=C2=A0 ffffffc19a788e00<br>=C2=
=A0elr_el1=C2=A0 ffffff800845c6ec<br>=C2=A0spsr_el1 20000045<br>debug&gt; D=
ump for CPU5:<br>pid: 0=C2=A0 comm: swapper/5<br>=C2=A0 x0 0000000000000003=
=C2=A0=C2=A0 x1 0000000000100000<br>=C2=A0 x2 000000000000c000=C2=A0=C2=A0 =
x3 ffffff8018000000<br>=C2=A0 x4 0000000000000015=C2=A0=C2=A0 x5 00ffffffff=
ffffff<br>=C2=A0 x6 000000001110e1e4=C2=A0=C2=A0 x7 fefefeff646c606d<br>=C2=
=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 0000000000000005<br>=C2=A0x10 010101=
0101010101=C2=A0 x11 ffff0002b0e00000<br>=C2=A0x12 0000000271000000=C2=A0 x=
13 0000ffffc0200000<br>=C2=A0x14 0000000003100000=C2=A0 x15 0000ffffc010000=
0<br>=C2=A0x16 0000000000000005=C2=A0 x17 ffffff8001127014<br>=C2=A0x18 000=
0000000000000=C2=A0 x19 ffffff800112b2d0<br>=C2=A0x20 ffffff8018000000=C2=
=A0 x21 0000000000000000<br>=C2=A0x22 0000000000000001=C2=A0 x23 0000000000=
000001<br>=C2=A0x24 0000000000000005=C2=A0 x25 ffffffc1e7fec060<br>=C2=A0x2=
6 ffffffc1e7ff0050=C2=A0 x27 ffffff8009e46000<br>=C2=A0x28 ffffffc1def7e200=
=C2=A0 x29 ffffffc1e7feff50<br>=C2=A0x30 0000000000000016=C2=A0=C2=A0 sp ff=
ffffc1e7feff50<br>=C2=A0 pc ffffff8018004050 cpsr 200001c5 (EL1h)<br><br>0x=
ffffff8018004050:<br>=C2=A0 pc ffffff8018004050=C2=A0=C2=A0 sp ffffffc1e7fe=
ff50=C2=A0=C2=A0 fp ffffffc1e7feff50<br>flush_smp_call_function_queue+0xb8/=
0x160:<br>=C2=A0 pc ffffff8008150e00=C2=A0=C2=A0 sp ffffffc1e7feff60=C2=A0=
=C2=A0 fp ffffffc1e7feff70<br>generic_smp_call_function_single_interrupt+0x=
18/0x20:<br>=C2=A0 pc ffffff8008151d28=C2=A0=C2=A0 sp ffffffc1e7feff80=C2=
=A0=C2=A0 fp ffffffc1e7feffa0<br>handle_IPI+0x94/0x2e8:<br>=C2=A0 pc ffffff=
800809322c=C2=A0=C2=A0 sp ffffffc1e7feffb0=C2=A0=C2=A0 fp ffffffc1e7feffb0<=
br>gic_handle_irq+0xa8/0xb0:<br>=C2=A0 pc ffffff8008080d90=C2=A0=C2=A0 sp f=
fffffc1e7feffc0=C2=A0=C2=A0 fp ffffffc1e7ff0000<br>el1_irq+0xe8/0x18c:<br>=
=C2=A0 pc ffffff8008082be8=C2=A0=C2=A0 sp ffffffc1e7ff0010=C2=A0=C2=A0 fp f=
fffffc1e7ff0040<br>cpuidle_enter_state+0xb8/0x380:<br>=C2=A0 pc ffffff8008b=
9b330=C2=A0=C2=A0 sp ffffffc1def9fd80=C2=A0=C2=A0 fp ffffffc1def9feb0<br>cp=
uidle_enter+0x34/0x48:<br>=C2=A0 pc ffffff8008b9b66c=C2=A0=C2=A0 sp ffffffc=
1def9fec0=C2=A0=C2=A0 fp ffffffc1def9ff00<br>call_cpuidle+0x44/0x70:<br>=C2=
=A0 pc ffffff8008112a1c=C2=A0=C2=A0 sp ffffffc1def9ff10=C2=A0=C2=A0 fp ffff=
ffc1def9ff30<br>cpu_startup_entry+0x1b0/0x200:<br>=C2=A0 pc ffffff8008112d9=
8=C2=A0=C2=A0 sp ffffffc1def9ff40=C2=A0=C2=A0 fp ffffffc1def9ff60<br>second=
ary_start_kernel+0x190/0x1f8:<br>=C2=A0 pc ffffff8008092ce8=C2=A0=C2=A0 sp =
ffffffc1def9ff70=C2=A0=C2=A0 fp ffffffc1def9ffd0<br>0x8115a1a4:<br>=C2=A0 p=
c 000000008115a1a4=C2=A0=C2=A0 sp ffffffc1def9ffe0=C2=A0=C2=A0 fp 000000000=
0000000<br>debug&gt;=C2=A0=C2=A0 x0 0000000000000003=C2=A0=C2=A0 x1 0000000=
000100000<br>=C2=A0 x2 000000000000c000=C2=A0=C2=A0 x3 ffffff8018000000<br>=
=C2=A0 x4 0000000000000015=C2=A0=C2=A0 x5 00ffffffffffffff<br>=C2=A0 x6 000=
000001110e1e4=C2=A0=C2=A0 x7 fefefeff646c606d<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=
=C2=A0=C2=A0 x9 0000000000000005<br>=C2=A0x10 0101010101010101=C2=A0 x11 ff=
ff0002b0e00000<br>=C2=A0x12 0000000271000000=C2=A0 x13 0000ffffc0200000<br>=
=C2=A0x14 0000000003100000=C2=A0 x15 0000ffffc0100000<br>=C2=A0x16 00000000=
00000005=C2=A0 x17 ffffff8001127014<br>=C2=A0x18 0000000000000000=C2=A0 x19=
 ffffff800112b2d0<br>=C2=A0x20 ffffff8018000000=C2=A0 x21 0000000000000000<=
br>=C2=A0x22 0000000000000001=C2=A0 x23 0000000000000001<br>=C2=A0x24 00000=
00000000005=C2=A0 x25 ffffffc1e7fec060<br>=C2=A0x26 ffffffc1e7ff0050=C2=A0 =
x27 ffffff8009e46000<br>=C2=A0x28 ffffffc1def7e200=C2=A0 x29 ffffffc1e7feff=
50<br>=C2=A0x30 0000000000000016=C2=A0=C2=A0 sp ffffffc1e7feff50<br>=C2=A0 =
pc ffffff8018004050 cpsr 200001c5 (EL1h)<br>=C2=A0sp_el0=C2=A0=C2=A0 ffffff=
c1def7e200<br>=C2=A0elr_el1=C2=A0 ffffff8008b9b330<br>=C2=A0spsr_el1 600000=
45<br>debug&gt; Dump for CPU4:<br>pid: 0=C2=A0 comm: swapper/4<br>=C2=A0 x0=
 0000000000000003=C2=A0=C2=A0 x1 0000000000100000<br>=C2=A0 x2 000000000000=
c000=C2=A0=C2=A0 x3 ffffff8018000000<br>=C2=A0 x4 0000000000000015=C2=A0=C2=
=A0 x5 00ffffffffffffff<br>=C2=A0 x6 000000001110e1e4=C2=A0=C2=A0 x7 fefefe=
ff646c606d<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 0000000000000005<br=
>=C2=A0x10 0101010101010101=C2=A0 x11 ffff0002b0e00000<br>=C2=A0x12 0000000=
271000000=C2=A0 x13 0000ffffc0200000<br>=C2=A0x14 0000000003100000=C2=A0 x1=
5 0000ffffc0100000<br>=C2=A0x16 0000000000000004=C2=A0 x17 ffffff8001127014=
<br>=C2=A0x18 0000000000000000=C2=A0 x19 ffffff800112b2d0<br>=C2=A0x20 ffff=
ff8018000000=C2=A0 x21 0000000000000000<br>=C2=A0x22 0000000000000001=C2=A0=
 x23 0000000000000001<br>=C2=A0x24 0000000000000004=C2=A0 x25 ffffffc1e7fd3=
060<br>=C2=A0x26 ffffffc1e7fd7050=C2=A0 x27 ffffff8009e46000<br>=C2=A0x28 f=
fffffc1def7d400=C2=A0 x29 ffffffc1e7fd6f50<br>=C2=A0x30 0000000000000016=C2=
=A0=C2=A0 sp ffffffc1e7fd6f50<br>=C2=A0 pc ffffff8018004050 cpsr 200001c5 (=
EL1h)<br><br>0xffffff8018004050:<br>=C2=A0 pc ffffff8018004050=C2=A0=C2=A0 =
sp ffffffc1e7fd6f50=C2=A0=C2=A0 fp ffffffc1e7fd6f50<br>flush_smp_call_funct=
ion_queue+0xb8/0x160:<br>=C2=A0 pc ffffff8008150e00=C2=A0=C2=A0 sp ffffffc1=
e7fd6f60=C2=A0=C2=A0 fp ffffffc1e7fd6f70<br>generic_smp_call_function_singl=
e_interrupt+0x18/0x20:<br>=C2=A0 pc ffffff8008151d28=C2=A0=C2=A0 sp ffffffc=
1e7fd6f80=C2=A0=C2=A0 fp ffffffc1e7fd6fa0<br>handle_IPI+0x94/0x2e8:<br>=C2=
=A0 pc ffffff800809322c=C2=A0=C2=A0 sp ffffffc1e7fd6fb0=C2=A0=C2=A0 fp ffff=
ffc1e7fd6fb0<br>gic_handle_irq+0xa8/0xb0:<br>=C2=A0 pc ffffff8008080d90=C2=
=A0=C2=A0 sp ffffffc1e7fd6fc0=C2=A0=C2=A0 fp ffffffc1e7fd7000<br>el1_irq+0x=
e8/0x18c:<br>=C2=A0 pc ffffff8008082be8=C2=A0=C2=A0 sp ffffffc1e7fd7010=C2=
=A0=C2=A0 fp ffffffc1e7fd7040<br>cpuidle_enter_state+0xb8/0x380:<br>=C2=A0 =
pc ffffff8008b9b330=C2=A0=C2=A0 sp ffffffc1def9bd80=C2=A0=C2=A0 fp ffffffc1=
def9beb0<br>cpuidle_enter+0x34/0x48:<br>=C2=A0 pc ffffff8008b9b66c=C2=A0=C2=
=A0 sp ffffffc1def9bec0=C2=A0=C2=A0 fp ffffffc1def9bf00<br>call_cpuidle+0x4=
4/0x70:<br>=C2=A0 pc ffffff8008112a1c=C2=A0=C2=A0 sp ffffffc1def9bf10=C2=A0=
=C2=A0 fp ffffffc1def9bf30<br>cpu_startup_entry+0x1b0/0x200:<br>=C2=A0 pc f=
fffff8008112d98=C2=A0=C2=A0 sp ffffffc1def9bf40=C2=A0=C2=A0 fp ffffffc1def9=
bf60<br>secondary_start_kernel+0x190/0x1f8:<br>=C2=A0 pc ffffff8008092ce8=
=C2=A0=C2=A0 sp ffffffc1def9bf70=C2=A0=C2=A0 fp ffffffc1def9bfd0<br>0x8115a=
1a4:<br>=C2=A0 pc 000000008115a1a4=C2=A0=C2=A0 sp ffffffc1def9bfe0=C2=A0=C2=
=A0 fp 0000000000000000<br>debug&gt;=C2=A0=C2=A0 x0 0000000000000003=C2=A0=
=C2=A0 x1 0000000000100000<br>=C2=A0 x2 000000000000c000=C2=A0=C2=A0 x3 fff=
fff8018000000<br>=C2=A0 x4 0000000000000015=C2=A0=C2=A0 x5 00ffffffffffffff=
<br>=C2=A0 x6 000000001110e1e4=C2=A0=C2=A0 x7 fefefeff646c606d<br>=C2=A0 x8=
 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 0000000000000005<br>=C2=A0x10 010101010101=
0101=C2=A0 x11 ffff0002b0e00000<br>=C2=A0x12 0000000271000000=C2=A0 x13 000=
0ffffc0200000<br>=C2=A0x14 0000000003100000=C2=A0 x15 0000ffffc0100000<br>=
=C2=A0x16 0000000000000004=C2=A0 x17 ffffff8001127014<br>=C2=A0x18 00000000=
00000000=C2=A0 x19 ffffff800112b2d0<br>=C2=A0x20 ffffff8018000000=C2=A0 x21=
 0000000000000000<br>=C2=A0x22 0000000000000001=C2=A0 x23 0000000000000001<=
br>=C2=A0x24 0000000000000004=C2=A0 x25 ffffffc1e7fd3060<br>=C2=A0x26 fffff=
fc1e7fd7050=C2=A0 x27 ffffff8009e46000<br>=C2=A0x28 ffffffc1def7d400=C2=A0 =
x29 ffffffc1e7fd6f50<br>=C2=A0x30 0000000000000016=C2=A0=C2=A0 sp ffffffc1e=
7fd6f50<br>=C2=A0 pc ffffff8018004050 cpsr 200001c5 (EL1h)<br>=C2=A0sp_el0=
=C2=A0=C2=A0 ffffffc1def7d400<br>=C2=A0elr_el1=C2=A0 ffffff8008b9b330<br>=
=C2=A0spsr_el1 60000045<br>debug&gt; Dump for CPU3:<br>pid: 0=C2=A0 comm: s=
wapper/3<br>=C2=A0 x0 0000000000000003=C2=A0=C2=A0 x1 0000000000100000<br>=
=C2=A0 x2 000000000000c000=C2=A0=C2=A0 x3 ffffff8018000000<br>=C2=A0 x4 000=
0000000000015=C2=A0=C2=A0 x5 00ffffffffffffff<br>=C2=A0 x6 000000001110e1e4=
=C2=A0=C2=A0 x7 fefefeff646c606d<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 =
x9 0000000000000005<br>=C2=A0x10 0101010101010101=C2=A0 x11 ffff0002b0e0000=
0<br>=C2=A0x12 0000000271000000=C2=A0 x13 0000ffffc0200000<br>=C2=A0x14 000=
0000003100000=C2=A0 x15 0000ffffc0100000<br>=C2=A0x16 0000000000000003=C2=
=A0 x17 ffffff8001127014<br>=C2=A0x18 0000000000000000=C2=A0 x19 ffffff8001=
12b2d0<br>=C2=A0x20 ffffff8018000000=C2=A0 x21 0000000000000000<br>=C2=A0x2=
2 0000000000000001=C2=A0 x23 0000000000000001<br>=C2=A0x24 0000000000000003=
=C2=A0 x25 ffffffc1e7fba060<br>=C2=A0x26 ffffffc1e7fbe050=C2=A0 x27 ffffff8=
009e46000<br>=C2=A0x28 ffffffc1def7c600=C2=A0 x29 ffffffc1e7fbdf50<br>=C2=
=A0x30 0000000000000016=C2=A0=C2=A0 sp ffffffc1e7fbdf50<br>=C2=A0 pc ffffff=
8018004050 cpsr 200001c5 (EL1h)<br><br>0xffffff8018004050:<br>=C2=A0 pc fff=
fff8018004050=C2=A0=C2=A0 sp ffffffc1e7fbdf50=C2=A0=C2=A0 fp ffffffc1e7fbdf=
50<br>flush_smp_call_function_queue+0xb8/0x160:<br>=C2=A0 pc ffffff8008150e=
00=C2=A0=C2=A0 sp ffffffc1e7fbdf60=C2=A0=C2=A0 fp ffffffc1e7fbdf70<br>gener=
ic_smp_call_function_single_interrupt+0x18/0x20:<br>=C2=A0 pc ffffff8008151=
d28=C2=A0=C2=A0 sp ffffffc1e7fbdf80=C2=A0=C2=A0 fp ffffffc1e7fbdfa0<br>hand=
le_IPI+0x94/0x2e8:<br>=C2=A0 pc ffffff800809322c=C2=A0=C2=A0 sp ffffffc1e7f=
bdfb0=C2=A0=C2=A0 fp ffffffc1e7fbdfb0<br>gic_handle_irq+0xa8/0xb0:<br>=C2=
=A0 pc ffffff8008080d90=C2=A0=C2=A0 sp ffffffc1e7fbdfc0=C2=A0=C2=A0 fp ffff=
ffc1e7fbe000<br>el1_irq+0xe8/0x18c:<br>=C2=A0 pc ffffff8008082be8=C2=A0=C2=
=A0 sp ffffffc1e7fbe010=C2=A0=C2=A0 fp ffffffc1e7fbe040<br>cpuidle_enter_st=
ate+0xb8/0x380:<br>=C2=A0 pc ffffff8008b9b330=C2=A0=C2=A0 sp ffffffc1def97d=
80=C2=A0=C2=A0 fp ffffffc1def97eb0<br>cpuidle_enter+0x34/0x48:<br>=C2=A0 pc=
 ffffff8008b9b66c=C2=A0=C2=A0 sp ffffffc1def97ec0=C2=A0=C2=A0 fp ffffffc1de=
f97f00<br>call_cpuidle+0x44/0x70:<br>=C2=A0 pc ffffff8008112a1c=C2=A0=C2=A0=
 sp ffffffc1def97f10=C2=A0=C2=A0 fp ffffffc1def97f30<br>cpu_startup_entry+0=
x1b0/0x200:<br>=C2=A0 pc ffffff8008112d98=C2=A0=C2=A0 sp ffffffc1def97f40=
=C2=A0=C2=A0 fp ffffffc1def97f60<br>secondary_start_kernel+0x190/0x1f8:<br>=
=C2=A0 pc ffffff8008092ce8=C2=A0=C2=A0 sp ffffffc1def97f70=C2=A0=C2=A0 fp f=
fffffc1def97fd0<br>0x8115a1a4:<br>=C2=A0 pc 000000008115a1a4=C2=A0=C2=A0 sp=
 ffffffc1def97fe0=C2=A0=C2=A0 fp 0000000000000000<br>debug&gt;=C2=A0=C2=A0 =
x0 0000000000000003=C2=A0=C2=A0 x1 0000000000100000<br>=C2=A0 x2 0000000000=
00c000=C2=A0=C2=A0 x3 ffffff8018000000<br>=C2=A0 x4 0000000000000015=C2=A0=
=C2=A0 x5 00ffffffffffffff<br>=C2=A0 x6 000000001110e1e4=C2=A0=C2=A0 x7 fef=
efeff646c606d<br>=C2=A0 x8 7f7f7f7f7f7f7f7f=C2=A0=C2=A0 x9 0000000000000005=
<br>=C2=A0x10 0101010101010101=C2=A0 x11 ffff0002b0e00000<br>=C2=A0x12 0000=
000271000000=C2=A0 x13 0000ffffc0200000<br>=C2=A0x14 0000000003100000=C2=A0=
 x15 0000ffffc0100000<br>=C2=A0x16 0000000000000003=C2=A0 x17 ffffff8001127=
014<br>=C2=A0x18 0000000000000000=C2=A0 x19 ffffff800112b2d0<br>=C2=A0x20 f=
fffff8018000000=C2=A0 x21 0000000000000000<br>=C2=A0x22 0000000000000001=C2=
=A0 x23 0000000000000001<br>=C2=A0x24 0000000000000003=C2=A0 x25 ffffffc1e7=
fba060<br>=C2=A0x26 ffffffc1e7fbe050=C2=A0 x27 ffffff8009e46000<br>=C2=A0x2=
8 ffffffc1def7c600=C2=A0 x29 ffffffc1e7fbdf50<br>=C2=A0x30 0000000000000016=
=C2=A0=C2=A0 sp ffffffc1e7fbdf50<br>=C2=A0 pc ffffff8018004050 cpsr 200001c=
5 (EL1h)<br>=C2=A0sp_el0=C2=A0=C2=A0 ffffffc1def7c600<br>=C2=A0elr_el1=C2=
=A0 ffffff8008b9b330<br>=C2=A0spsr_el1 60000045<br>debug&gt; [0000.230] I&g=
t; Welcome to MB2(TBoot-BPMP)(version: 01 01.00.160913-t186-M-00.00-mobile-=
7d3edb9d)<br>[0000.238] I&gt; bit @ 0xd480000<br>[0000.241] I&gt; Boot-devi=
ce: eMMC<br>[0000.248] I&gt; sdmmc bdev is already initialized<br>[0000.253=
] I&gt; pmic: reset reason (nverc)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0<br>[0000.285] I&gt; Found 18 partitions in SDMMC_BOOT (instance 3=
)<br>[0000.303] I&gt; Found 33 partitions in SDMMC_USER (instance 3)<br>[00=
00.309] W&gt; No valid slot number is found in scratch register<br>[0000.31=
5] W&gt; Return default slot: _a<br>.......................................=
........................</div><div>and linux reboots.</div><div>whats the p=
roblem why jailhouse is not loading now??<br></div>On Wednesday, January 29=
, 2020 at 1:01:57 AM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail_quo=
te" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;paddi=
ng-left: 1ex;">On 28.01.20 22:50, Saroj Sapkota wrote:
<br>&gt; I&#39;m trying to run jailhouse on Jetson tx2 kit. I downloaded th=
e=20
<br>&gt; jailhouse and compiled it and run the command
<br>&gt;=20
<br>&gt; =3D&gt;sudo insmod Downloads/linux-jailhouse-<wbr>jetson/driver/ja=
ilhouse.ko
<br>&gt;=20
<br>&gt; // there is no error message in terminal console
<br>&gt;=20
<br>&gt; but it gives following output on the serial console:
<br>&gt;=20
<br>&gt; tx2@tx2-desktop:~$ [=C2=A0 129.954491] jailhouse: loading out-of-t=
ree module=20
<br>&gt; taints kernel.
<br>&gt;=20
<br>&gt; After this I tried to enable jailhouse through this command
<br>&gt;=20
<br>&gt; =3D&gt;sudo jailhouse enable Downloads/linux-jetson/<wbr>configs/a=
rm64/jetson-tx2.celsudo jailhouse enable Downloads/linux-jetson/configs/arm=
64/jetson-tx2.cell<wbr>l
<br>&gt; // terminal displays: JAILHOUSE_ENABLE: Invalid argument
<br>&gt;=20
<br>&gt; //and on the terminal console it displays:
<br>&gt;=20
<br>&gt; [=C2=A0 333.421533] jailhouse: mem_region_request failed for hyper=
visor=20
<br>&gt; memory mem_region_request failed for hypervisor memory=20
<br>&gt; mem_region_request failed for hypervisor memory mem_region_request=
=20
<br>&gt; failed for hypervisor memory.
<br>&gt; [=C2=A0 333.428303] jailhouse: Did you reserve the memory with &qu=
ot;memmap=3D&quot; or=20
<br>&gt; &quot;mem=3D&quot;?
<br>&gt;=20
<br>&gt; I have changed /boot/extlinux/extlinux.conf file as follows:
<br>&gt; TIMEOUT 30
<br>&gt; DEFAULT primary
<br>&gt;=20
<br>&gt; MENU TITLE L4T boot options
<br>&gt;=20
<br>&gt; LABEL primary
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MENU LABEL primary kernel
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX /boot/Image
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 APPEND ${cbootargs} quiet
<br>&gt; **mem=3D7808M vmalloc=3D512M**
<br>&gt; # When testing a custom kernel, it is recommended that you create =
a=20
<br>&gt; backup of
<br>&gt; # the original kernel and add a new entry to this file so that the=
=20
<br>&gt; device can
<br>&gt; # fallback to the original kernel. To do this:
<br>&gt; #
<br>&gt; # 1, Make a backup of the original kernel
<br>&gt; #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo cp /boot/Image /boot/Image.ba=
ckup
<br>&gt; #
<br>&gt; # 2, Copy your custom kernel into /boot/Image
<br>&gt; #
<br>&gt; # 3, Uncomment below menu setting lines for the original kernel
<br>&gt; #
<br>&gt; # 4, Reboot
<br>&gt;=20
<br>&gt; # LABEL backup
<br>&gt; #=C2=A0=C2=A0=C2=A0 MENU LABEL backup kernel
<br>&gt; #=C2=A0=C2=A0=C2=A0 LINUX /boot/Image.backup
<br>&gt; #=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd
<br>&gt; #=C2=A0=C2=A0=C2=A0 APPEND ${cbootargs}*
<br>&gt; *
<br>&gt; *
<br>&gt; *
<br>&gt; but this change is not working. So what&#39;s the wrong in this=20
<br>&gt; extlinux.conf file as boot up is ignoring *mem=3D7808M vmalloc=3D5=
12M *this=20
<br>&gt; statement.*
<br>&gt; *
<br>
<br>So, /proc/cmdline of the booted system is not containing your change?=
=20
<br>Then I would say your system is using a different boot configuration=20
<br>mechanism. Where did you get the image from? Is U-Boot involved in the=
=20
<br>boot-up? What does &quot;printenv&quot; report about how the boot is co=
nfigured?=20
<br>Maybe you need to adjust the command line in the environment instead.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/73f42baf-5afe-4a77-80d1-8e4bc9419f62%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/73f42baf-5afe-4a77-80d1-8e4bc9419f62%40googlegroups.com<=
/a>.<br />

------=_Part_759_100713899.1580317473729--

------=_Part_758_1655305765.1580317473728
Content-Type: text/plain; charset=US-ASCII; name=extlinux.conf
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=extlinux.conf
X-Attachment-Id: 1826ea11-7224-4326-b2dc-3e9108091265
Content-ID: <1826ea11-7224-4326-b2dc-3e9108091265>

TIMEOUT 30
DEFAULT primary

MENU TITLE L4T boot options

LABEL primary
      MENU LABEL primary kernel
      LINUX /boot/Image
      INITRD /boot/initrd
      APPEND ${cbootargs} quiet mem=7808M vmalloc=512M

# When testing a custom kernel, it is recommended that you create a backup of
# the original kernel and add a new entry to this file so that the device can
# fallback to the original kernel. To do this:
#
# 1, Make a backup of the original kernel
#      sudo cp /boot/Image /boot/Image.backup
#
# 2, Copy your custom kernel into /boot/Image
#
# 3, Uncomment below menu setting lines for the original kernel
#
# 4, Reboot
# LABEL backup
#    MENU LABEL backup kernel
#    LINUX /boot/Image.backup
#    INITRD /boot/initrd
#    APPEND ${cbootargs}


------=_Part_758_1655305765.1580317473728--
