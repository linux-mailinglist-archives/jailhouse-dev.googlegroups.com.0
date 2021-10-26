Return-Path: <jailhouse-dev+bncBC64DZNZYEERBQ5236FQMGQEADUOVQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E843B07D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Oct 2021 12:49:41 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id gs5-20020a056214226500b00382f5609124sf13255274qvb.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Oct 2021 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5c9JQja/qzSloruxcfRr3/rNMoobOXP8YTwgCOyLh1g=;
        b=pAAYOKu1LOK3V8YWUwe29cDIaCrPeqytByydV43tL4TpBRrqdrHet4xKvzd5AhlTLE
         1gZw9Oli4YAwpJri6hzPwuTWZffsGYynfj72kLt0NT+owabv/gdxzCHwSDGPj9K6qINP
         mUWGoUNiK+jfiq0v6JjMQpCtxV9PTLnP/LCNZGm00sHGHpUwZ7RDr9RgiYTYMr3EEugt
         4LAgNmJMeXptQiw/DxsWImeXS+MSKARAa238FkI1ulmGvIXeRbWpz1R58DszL1//oROX
         cLWhPQURntOxNGgk0nouRUSNFXxYXPpkQuz5wS6VoGYU0qR5Tx4H7YmG9mpIpaVcp8G/
         ViTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5c9JQja/qzSloruxcfRr3/rNMoobOXP8YTwgCOyLh1g=;
        b=E/coCPfGLdIgRYBdkumt/1ziKjcvPUcqxeUqxy1/mYcGjAcRkx6APMaJ1D1SE161H0
         NakQOms5qyG3yl6wJH0MBgRyQY4gXlywwpL0+k/xFOnWJHQmkSI/AjTZNLVnBhACk2K9
         pabtwtHz9zmRDfuyHePf89tTP5JFbV+itiRLBSHRzLHgm9jABnq99QBrod1lr22zJTYt
         /0d1tjqhHdvaa/8Ywt53h6szQB4CXZyYazP0UPJYVm6/ImlBYXPmOWTwhQ/uHcdrIlGd
         NALW51veWDcdHL/RJHVADufYBJgwC/q2/DrFxIfYM0osZP0sZs5tCJmj95INLHkJpwu9
         N0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5c9JQja/qzSloruxcfRr3/rNMoobOXP8YTwgCOyLh1g=;
        b=e6BmwYfsCQ33FHy3CQYVbIZd0YyQHWEdt7F6CghybVzY+0AH26Xk2LgVDO1Y1b1v3i
         ePMMcC8wD4Tx2f5GJnBW6+tsQ+RviXhWSUqXcFjV8N8NmIauHWhwKjtFWhglw0HDrZgE
         JvWEOxT2v0iD3eNZQBVyhCZDeUm795qk8VrTKFriNXGn7Tprf0neFBRZh0xsyjuWxyVF
         eWQts8UG9C9f6YV6Uc/ywK5XJbHOpx6bUL7hWJTVmxe5lMVNGN/q2ituNeQoO9lge6Dp
         imvTDs7ZCgOIw70Wm/hnJTPJuUIf1Qw4L6Kv7z65hrwZmCjyKqz9t1uGRbhCE5RHEdRM
         N8xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/drFrChIQCd2SIxes/3OHHa3keCKOEBiRmMEgF4FdSa69sYSX
	eUl8ctbQhF3Nf/+mZ3UE5mI=
X-Google-Smtp-Source: ABdhPJzwVxpdydcwYHNAkKi3dUGmYEAIa30QlBh+B/2ZfehaUx2BPFl4H/QS+IoGJjSc5mFA9F5TVg==
X-Received: by 2002:a37:a604:: with SMTP id p4mr18334609qke.0.1635245379946;
        Tue, 26 Oct 2021 03:49:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4095:: with SMTP id f21ls10004024qko.4.gmail; Tue,
 26 Oct 2021 03:49:39 -0700 (PDT)
X-Received: by 2002:a37:9f55:: with SMTP id i82mr18181646qke.133.1635245379404;
        Tue, 26 Oct 2021 03:49:39 -0700 (PDT)
Date: Tue, 26 Oct 2021 03:49:38 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ff786d5c-affd-4f94-9411-04bd223a8bc0n@googlegroups.com>
In-Reply-To: <CAC+yH-beQxOE-Wdwe+ESFjM3Mw5KeS=kKpda1RZ6rrZ5bQLxuw@mail.gmail.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
 <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
 <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
 <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de>
 <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
 <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de>
 <CAC+yH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA@mail.gmail.com>
 <457f3a55-732d-15a6-8e4b-d4a86202e302@web.de>
 <CAC+yH-beQxOE-Wdwe+ESFjM3Mw5KeS=kKpda1RZ6rrZ5bQLxuw@mail.gmail.com>
Subject: Re: Help needed regarding AGL with Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8448_1654456891.1635245378859"
X-Original-Sender: huangcm.huang@gmail.com
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

------=_Part_8448_1654456891.1635245378859
Content-Type: multipart/alternative; 
	boundary="----=_Part_8449_452250265.1635245378859"

------=_Part_8449_452250265.1635245378859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, anmol,
could you please share your ideal to fix the issue "cannot open /dev/uio0:=
=20
No such file or directory"
I have the same issue now.

On Friday, August 20, 2021 at 9:53:11 PM UTC+8 anmol.k...@gmail.com wrote:

> It's working :)
>
> qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
> Waiting for peer to be ready...
>
> Thanks and Regards,
> Anmol
>
> On Fri, Aug 20, 2021 at 6:49 PM Jan Kiszka <jan.k...@web.de> wrote:
> >
> > On 20.08.21 14:46, Anmol wrote:
> > > On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka <jan.k...@web.de> wrote:
> > >>
> > >> On 20.08.21 14:02, Anmol wrote:
> > >>> Hello,
> > >>>
> > >>> On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.k...@web.de> wrote:
> > >>>>
> > >>>> On 19.08.21 15:42, Anmol wrote:
> > >>>>> Hello,
> > >>>>>
> > >>>>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.k...@web.de>=20
> wrote:
> > >>>>>>
> > >>>>>> On 11.08.21 20:36, Anmol wrote:
> > >>>>>>
> > >>>>>> The echo should not show any response, but when you do an lspci=
=20
> -k, you
> > >>>>>> should see that the targeting devices are now driven by=20
> uio_ivshmem. If
> > >>>>>> not, the IDs might not be correct yet, or the devices are missin=
g.
> > >>>>>>
> > >>>>>> Also check the kernel console of the cell where you issued this=
=20
> echo.
> > >>>>>>
> > >>>>>
> > >>>>> I have added the PCI devices to both the cells and set the
> > >>>>> `.shmem_dev_id` accordingly, please have a look at the cell confi=
g.
> > >>>>> files I have sent.
> > >>>>>
> > >>>>> here's the `lspci -k` output:
> > >>>>> qemux86-64:~# lspci -k
> > >>>>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express=
=20
> DRAM Controller
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev=
=20
> 01)
> > >>>>> Subsystem: Red Hat, Inc. Virtio GPU
> > >>>>> Kernel driver in use: virtio-pci
> > >>>>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
> > >>>>> Subsystem: Red Hat, Inc. Virtio network device
> > >>>>> Kernel driver in use: virtio-pci
> > >>>>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
> > >>>>> Subsystem: Red Hat, Inc. Virtio RNG
> > >>>>> Kernel driver in use: virtio-pci
> > >>>>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block devic=
e
> > >>>>> Subsystem: Red Hat, Inc. Virtio block device
> > >>>>> Kernel driver in use: virtio-pci
> > >>>>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (IC=
H6
> > >>>>> Family) High Definition Audio Controller (rev 01)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: snd_hda_intel
> > >>>>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) US=
B
> > >>>>> UHCI Controller #1 (rev 03)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: uhci_hcd
> > >>>>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) US=
B
> > >>>>> UHCI Controller #2 (rev 03)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: uhci_hcd
> > >>>>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) US=
B
> > >>>>> UHCI Controller #3 (rev 03)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: uhci_hcd
> > >>>>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) US=
B2
> > >>>>> EHCI Controller #1 (rev 03)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: ehci-pci
> > >>>>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interfac=
e
> > >>>>> Controller (rev 02)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH=20
> (ICH9R/DO/DH)
> > >>>>> 6 port SATA Controller [AHCI mode] (rev 02)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: ahci
> > >>>>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus=20
> Controller (rev 02)
> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > >>>>> Kernel driver in use: i801_smbus
> > >>>>>
> > >>>>
> > >>>> Is this taken while Jailhouse was enabled? It's missing your ivshm=
em
> > >>>> devices (00:0c.0 - 00:0f.0).
> > >>>>
> > >>>
> > >>> I did some changes to the root-cell config files, and now it=E2=80=
=99s=20
> showing
> > >>> the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
> > >>> only):
> > >>>
> > >>> qemux86-64:~# lspci -k
> > >>> .
> > >>> .
> > >>> .
> > >>> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
> > >>> Subsystem: Siemens AG Device 4106
> > >>> .
> > >>> .
> > >>> .
> > >>>
> > >>> But it=E2=80=99s not showing any association with the `uio_ivshmem`=
, and also
> > >>> I am still not able to find the `/dev/uio0`.
> > >>>
> > >>
> > >> And now
> > >>
> > >> echo "110a 4106 110a 4106 ffc002 ffffff" >=20
> /sys/bus/pci/drivers/uio_ivshmem/new_id
> > >>
> > >> again.
> > >>
> > >
> > > Here's the full log:
> > >
> > > qemux86-64:~# jailhouse enable /usr/share/jailhouse/cells/qemu-agl.ce=
ll
> > > qemux86-64:~# modprobe uio_ivshmem
> > > qemux86-64:~# lsmod
> > > Module Size Used by
> > > virtio_gpu 65536 0
> > > virtio_dma_buf 16384 1 virtio_gpu
> > > virtio_net 53248 0
> > > net_failover 16384 1 virtio_net
> > > failover 16384 1 net_failover
> > > jailhouse 36864 1
> > > qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" >
> > > /sys/bus/pci/drivers/uio_ivshmem/new_id
> >
> > ffc0... -> back-end device
> >
> > > qemux86-64:~# lspci -k
> > > .
> > > .
> > > .
> > > 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
> >
> > ff80 -> you have a front-end device here
> >
> > You are either running that in the non-root cell or you misconfigured
> > the root cell (JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK is needed).
> >
> > Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ff786d5c-affd-4f94-9411-04bd223a8bc0n%40googlegroups.com.

------=_Part_8449_452250265.1635245378859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, anmol,<div>could you please share your ideal to fix the issue "cannot o=
pen /dev/uio0: No such file or directory"</div><div>I have the same issue n=
ow.</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">On Friday, August 20, 2021 at 9:53:11 PM UTC+8 anmol.k...@g=
mail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">It&#39;s working :)
<br>
<br>qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
<br>Waiting for peer to be ready...
<br>
<br>Thanks and Regards,
<br>Anmol
<br>
<br>On Fri, Aug 20, 2021 at 6:49 PM Jan Kiszka &lt;<a href data-email-maske=
d rel=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
<br>&gt;
<br>&gt; On 20.08.21 14:46, Anmol wrote:
<br>&gt; &gt; On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka &lt;<a href data-e=
mail-masked rel=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; On 20.08.21 14:02, Anmol wrote:
<br>&gt; &gt;&gt;&gt; Hello,
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka &lt;<a hre=
f data-email-masked rel=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
<br>&gt; &gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt; On 19.08.21 15:42, Anmol wrote:
<br>&gt; &gt;&gt;&gt;&gt;&gt; Hello,
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka &l=
t;<a href data-email-masked rel=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; On 11.08.21 20:36, Anmol wrote:
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; The echo should not show any response, bu=
t when you do an lspci -k, you
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; should see that the targeting devices are=
 now driven by uio_ivshmem. If
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; not, the IDs might not be correct yet, or=
 the devices are missing.
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; Also check the kernel console of the cell=
 where you issued this echo.
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; I have added the PCI devices to both the cell=
s and set the
<br>&gt; &gt;&gt;&gt;&gt;&gt; `.shmem_dev_id` accordingly, please have a lo=
ok at the cell config.
<br>&gt; &gt;&gt;&gt;&gt;&gt; files I have sent.
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; here&#39;s the `lspci -k` output:
<br>&gt; &gt;&gt;&gt;&gt;&gt; qemux86-64:~# lspci -k
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:00.0 Host bridge: Intel Corporation 82G33/=
G31/P35/P31 Express DRAM Controller
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:01.0 VGA compatible controller: Red Hat, I=
nc. Virtio GPU (rev 01)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. Virtio GPU
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: virtio-pci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:02.0 Ethernet controller: Red Hat, Inc. Vi=
rtio network device
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. Virtio network devic=
e
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: virtio-pci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:03.0 Unclassified device [00ff]: Red Hat, =
Inc. Virtio RNG
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. Virtio RNG
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: virtio-pci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:04.0 SCSI storage controller: Red Hat, Inc=
. Virtio block device
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. Virtio block device
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: virtio-pci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1b.0 Audio device: Intel Corporation 82801=
FB/FBM/FR/FW/FRW (ICH6
<br>&gt; &gt;&gt;&gt;&gt;&gt; Family) High Definition Audio Controller (rev=
 01)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: snd_hda_intel
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1d.0 USB controller: Intel Corporation 828=
01I (ICH9 Family) USB
<br>&gt; &gt;&gt;&gt;&gt;&gt; UHCI Controller #1 (rev 03)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: uhci_hcd
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1d.1 USB controller: Intel Corporation 828=
01I (ICH9 Family) USB
<br>&gt; &gt;&gt;&gt;&gt;&gt; UHCI Controller #2 (rev 03)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: uhci_hcd
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1d.2 USB controller: Intel Corporation 828=
01I (ICH9 Family) USB
<br>&gt; &gt;&gt;&gt;&gt;&gt; UHCI Controller #3 (rev 03)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: uhci_hcd
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1d.7 USB controller: Intel Corporation 828=
01I (ICH9 Family) USB2
<br>&gt; &gt;&gt;&gt;&gt;&gt; EHCI Controller #1 (rev 03)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: ehci-pci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1f.0 ISA bridge: Intel Corporation 82801IB=
 (ICH9) LPC Interface
<br>&gt; &gt;&gt;&gt;&gt;&gt; Controller (rev 02)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1f.2 SATA controller: Intel Corporation 82=
801IR/IO/IH (ICH9R/DO/DH)
<br>&gt; &gt;&gt;&gt;&gt;&gt; 6 port SATA Controller [AHCI mode] (rev 02)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: ahci
<br>&gt; &gt;&gt;&gt;&gt;&gt; 00:1f.3 SMBus: Intel Corporation 82801I (ICH9=
 Family) SMBus Controller (rev 02)
<br>&gt; &gt;&gt;&gt;&gt;&gt; Subsystem: Red Hat, Inc. QEMU Virtual Machine
<br>&gt; &gt;&gt;&gt;&gt;&gt; Kernel driver in use: i801_smbus
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt; Is this taken while Jailhouse was enabled? It&#39=
;s missing your ivshmem
<br>&gt; &gt;&gt;&gt;&gt; devices (00:0c.0 - 00:0f.0).
<br>&gt; &gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; I did some changes to the root-cell config files, and=
 now it=E2=80=99s showing
<br>&gt; &gt;&gt;&gt; the PCI device 00:0c.0 (I have added defined macro fo=
r VIRTIO_BLK
<br>&gt; &gt;&gt;&gt; only):
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; qemux86-64:~# lspci -k
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt; 00:0c.0 Unassigned class [ff80]: Siemens AG Device 41=
06
<br>&gt; &gt;&gt;&gt; Subsystem: Siemens AG Device 4106
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt; .
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; But it=E2=80=99s not showing any association with the=
 `uio_ivshmem`, and also
<br>&gt; &gt;&gt;&gt; I am still not able to find the `/dev/uio0`.
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; And now
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; echo &quot;110a 4106 110a 4106 ffc002 ffffff&quot; &gt; /=
sys/bus/pci/drivers/uio_ivshmem/new_id
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; again.
<br>&gt; &gt;&gt;
<br>&gt; &gt;
<br>&gt; &gt; Here&#39;s the full log:
<br>&gt; &gt;
<br>&gt; &gt; qemux86-64:~# jailhouse enable /usr/share/jailhouse/cells/qem=
u-agl.cell
<br>&gt; &gt; qemux86-64:~# modprobe uio_ivshmem
<br>&gt; &gt; qemux86-64:~# lsmod
<br>&gt; &gt; Module                  Size  Used by
<br>&gt; &gt; virtio_gpu             65536  0
<br>&gt; &gt; virtio_dma_buf         16384  1 virtio_gpu
<br>&gt; &gt; virtio_net             53248  0
<br>&gt; &gt; net_failover           16384  1 virtio_net
<br>&gt; &gt; failover               16384  1 net_failover
<br>&gt; &gt; jailhouse              36864  1
<br>&gt; &gt; qemux86-64:~# echo &quot;110a 4106 110a 4106 ffc002 ffffff&qu=
ot; &gt;
<br>&gt; &gt; /sys/bus/pci/drivers/uio_ivshmem/new_id
<br>&gt;
<br>&gt; ffc0... -&gt; back-end device
<br>&gt;
<br>&gt; &gt; qemux86-64:~# lspci -k
<br>&gt; &gt; .
<br>&gt; &gt; .
<br>&gt; &gt; .
<br>&gt; &gt; 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
<br>&gt;
<br>&gt; ff80 -&gt; you have a front-end device here
<br>&gt;
<br>&gt; You are either running that in the non-root cell or you misconfigu=
red
<br>&gt; the root cell (JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK is needed).
<br>&gt;
<br>&gt; Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ff786d5c-affd-4f94-9411-04bd223a8bc0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ff786d5c-affd-4f94-9411-04bd223a8bc0n%40googlegroups.co=
m</a>.<br />

------=_Part_8449_452250265.1635245378859--

------=_Part_8448_1654456891.1635245378859--
