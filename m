Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBAW572FQMGQEQ5QPMAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3C4415D8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Nov 2021 10:08:19 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id bi16-20020a05620a319000b00462d999de94sf6490955qkb.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Nov 2021 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HsPE2VcO3u2D5l5do/0dkJm5xXH86cZCTIa0hL9XS/A=;
        b=aItHcxZL2dP5ZhyGNMagYLLG+6YTIIi7dojYkodCtThN2hDnplKZQI0EJiVh0A7XXc
         Xbudu7hHV7CePzDGioXtFE6zSzIsmyGaSlcb9ilvBdgIcdkUHsEHUzUiN7OaGNBASfOQ
         4aYLRZWKn1RXIKV8TyNfrbXxB1CzfuigHrlo48G6LQ5BXZeJRY0SHu0F9YrBGEN0vQ0N
         DDUEjlhzHXmBNiy+IDjSec9NWIy8+vLL6xYB8qX/u1umMIvqWhOPur6Fs/LzSWn2Wtl/
         a9mR5gLXdmKNgnDsX7rRQUWXnNsB2L05uM1fawM6tQLF03zoJRAJTh5MtP06UCRUd7bG
         5ong==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HsPE2VcO3u2D5l5do/0dkJm5xXH86cZCTIa0hL9XS/A=;
        b=fIkH6788kLVScDB89Ran8ZsVFM0BF9F2GOmw0E68GcQQefcYLVRt58z9otf9cmdJ6o
         jEHrLts1IEzlVMRBubyhu1EAZeiSs256678MijWQ/9ab+sX9sTZeFv7y5/+ow4L/eXYp
         A/D6pSRAFxDiAEC/OrgXND+7j1Der03bqvMiZBmV2bA2LtKV7cm6XtSmceUgHy+I4mo0
         00Y5uvS9YEzidr/6XniGNW5doyz96uo3kfBNm88PoOuydNpEPu9LVo1HynJxvVlbxdmg
         GhSfOO73E9yH4DJqjfK10oIYb7WztIatL9pM5bcJIhlhITqx8THlhf+tNt0fBvG6UMhW
         AGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HsPE2VcO3u2D5l5do/0dkJm5xXH86cZCTIa0hL9XS/A=;
        b=JPb8at4vX3L65zIqiEd7FDdMjXnSJhaa1x4fjv27wnn46aFFBSi+Lnk2qarExqMoZA
         fL2bpcFSwDkvGrI85rbpZ9fYRMq5d4FgsDEuOS/7c+TTjY9+Zh5yFii/iauD6IMbdK+c
         cM1/ldVLh8JrUL86WhlX+wUMQWbzlHTxkMnF+LiOJRRJGVtg/glVXT3pZpoLiP1fbclJ
         v3GW/Y01ItTW+cxj42kfIT4sVs3HW7HbBPmQr+XJbSC+7y/5h2SLNUIDmlqK7ER9744Q
         4AW5TNy6bVuKgNgpMG2nEEPwvMci1HRudqrBHeXzBhAK4i3oW42gI07Q34PA1s9LiVen
         x4OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311mKw8XMl2wEc0n3sCvn+EFo3QhEzfsGtiRRf/+OvcwISo1LIZ
	1j7bC89Wb9Kd8NqcXYw7jfQ=
X-Google-Smtp-Source: ABdhPJws79GS+4LclVOrC8VXoQ7hmS97zCkJoe/mbDK/5fvYaLzcaeO8XfGl8PkQ5HuJq0d3p1B7Xw==
X-Received: by 2002:ac8:5fd2:: with SMTP id k18mr29011435qta.379.1635757698982;
        Mon, 01 Nov 2021 02:08:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1a10:: with SMTP id fh16ls3636875qvb.0.gmail; Mon,
 01 Nov 2021 02:08:18 -0700 (PDT)
X-Received: by 2002:a05:6214:20a7:: with SMTP id 7mr26539409qvd.63.1635757698440;
        Mon, 01 Nov 2021 02:08:18 -0700 (PDT)
Date: Mon, 1 Nov 2021 02:08:17 -0700 (PDT)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7b9d8cc1-2559-42d4-b4f0-13e1d9742fa1n@googlegroups.com>
In-Reply-To: <ff786d5c-affd-4f94-9411-04bd223a8bc0n@googlegroups.com>
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
 <ff786d5c-affd-4f94-9411-04bd223a8bc0n@googlegroups.com>
Subject: Re: Help needed regarding AGL with Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6170_548035036.1635757697601"
X-Original-Sender: anmol.karan123@gmail.com
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

------=_Part_6170_548035036.1635757697601
Content-Type: multipart/alternative; 
	boundary="----=_Part_6171_901761906.1635757697601"

------=_Part_6171_901761906.1635757697601
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

You have to recheck if you have correctly added the PCI devices in your=20
`config.` files, and check using:

```
qemux86-64:~# lspci -k
.
.
.
00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
Subsystem: Siemens AG Device 4106
.
```

Also, one important note below:

> ffc0... -> back-end device
>
> > qemux86-64:~# lspci -k
> > .
> > .
> > .
> > 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
>
> ff80 -> you have a front-end device here


---
Anmol


On Tuesday, October 26, 2021 at 4:19:38 PM UTC+5:30 huangc...@gmail.com=20
wrote:

> hi, anmol,
> could you please share your ideal to fix the issue "cannot open /dev/uio0=
:=20
> No such file or directory"
> I have the same issue now.
>
> On Friday, August 20, 2021 at 9:53:11 PM UTC+8 anmol.k...@gmail.com wrote=
:
>
>> It's working :)=20
>>
>> qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img=20
>> Waiting for peer to be ready...=20
>>
>> Thanks and Regards,=20
>> Anmol=20
>>
>> On Fri, Aug 20, 2021 at 6:49 PM Jan Kiszka <jan.k...@web.de> wrote:=20
>> >=20
>> > On 20.08.21 14:46, Anmol wrote:=20
>> > > On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka <jan.k...@web.de> wrote:=
=20
>> > >>=20
>> > >> On 20.08.21 14:02, Anmol wrote:=20
>> > >>> Hello,=20
>> > >>>=20
>> > >>> On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.k...@web.de>=20
>> wrote:=20
>> > >>>>=20
>> > >>>> On 19.08.21 15:42, Anmol wrote:=20
>> > >>>>> Hello,=20
>> > >>>>>=20
>> > >>>>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.k...@web.de>=20
>> wrote:=20
>> > >>>>>>=20
>> > >>>>>> On 11.08.21 20:36, Anmol wrote:=20
>> > >>>>>>=20
>> > >>>>>> The echo should not show any response, but when you do an lspci=
=20
>> -k, you=20
>> > >>>>>> should see that the targeting devices are now driven by=20
>> uio_ivshmem. If=20
>> > >>>>>> not, the IDs might not be correct yet, or the devices are=20
>> missing.=20
>> > >>>>>>=20
>> > >>>>>> Also check the kernel console of the cell where you issued this=
=20
>> echo.=20
>> > >>>>>>=20
>> > >>>>>=20
>> > >>>>> I have added the PCI devices to both the cells and set the=20
>> > >>>>> `.shmem_dev_id` accordingly, please have a look at the cell=20
>> config.=20
>> > >>>>> files I have sent.=20
>> > >>>>>=20
>> > >>>>> here's the `lspci -k` output:=20
>> > >>>>> qemux86-64:~# lspci -k=20
>> > >>>>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express=
=20
>> DRAM Controller=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev=
=20
>> 01)=20
>> > >>>>> Subsystem: Red Hat, Inc. Virtio GPU=20
>> > >>>>> Kernel driver in use: virtio-pci=20
>> > >>>>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device=
=20
>> > >>>>> Subsystem: Red Hat, Inc. Virtio network device=20
>> > >>>>> Kernel driver in use: virtio-pci=20
>> > >>>>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG=20
>> > >>>>> Subsystem: Red Hat, Inc. Virtio RNG=20
>> > >>>>> Kernel driver in use: virtio-pci=20
>> > >>>>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block=20
>> device=20
>> > >>>>> Subsystem: Red Hat, Inc. Virtio block device=20
>> > >>>>> Kernel driver in use: virtio-pci=20
>> > >>>>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW=20
>> (ICH6=20
>> > >>>>> Family) High Definition Audio Controller (rev 01)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: snd_hda_intel=20
>> > >>>>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family)=
=20
>> USB=20
>> > >>>>> UHCI Controller #1 (rev 03)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: uhci_hcd=20
>> > >>>>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family)=
=20
>> USB=20
>> > >>>>> UHCI Controller #2 (rev 03)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: uhci_hcd=20
>> > >>>>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family)=
=20
>> USB=20
>> > >>>>> UHCI Controller #3 (rev 03)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: uhci_hcd=20
>> > >>>>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family)=
=20
>> USB2=20
>> > >>>>> EHCI Controller #1 (rev 03)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: ehci-pci=20
>> > >>>>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC=20
>> Interface=20
>> > >>>>> Controller (rev 02)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH=20
>> (ICH9R/DO/DH)=20
>> > >>>>> 6 port SATA Controller [AHCI mode] (rev 02)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: ahci=20
>> > >>>>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus=20
>> Controller (rev 02)=20
>> > >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine=20
>> > >>>>> Kernel driver in use: i801_smbus=20
>> > >>>>>=20
>> > >>>>=20
>> > >>>> Is this taken while Jailhouse was enabled? It's missing your=20
>> ivshmem=20
>> > >>>> devices (00:0c.0 - 00:0f.0).=20
>> > >>>>=20
>> > >>>=20
>> > >>> I did some changes to the root-cell config files, and now it=E2=80=
=99s=20
>> showing=20
>> > >>> the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK=
=20
>> > >>> only):=20
>> > >>>=20
>> > >>> qemux86-64:~# lspci -k=20
>> > >>> .=20
>> > >>> .=20
>> > >>> .=20
>> > >>> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106=20
>> > >>> Subsystem: Siemens AG Device 4106=20
>> > >>> .=20
>> > >>> .=20
>> > >>> .=20
>> > >>>=20
>> > >>> But it=E2=80=99s not showing any association with the `uio_ivshmem=
`, and=20
>> also=20
>> > >>> I am still not able to find the `/dev/uio0`.=20
>> > >>>=20
>> > >>=20
>> > >> And now=20
>> > >>=20
>> > >> echo "110a 4106 110a 4106 ffc002 ffffff" >=20
>> /sys/bus/pci/drivers/uio_ivshmem/new_id=20
>> > >>=20
>> > >> again.=20
>> > >>=20
>> > >=20
>> > > Here's the full log:=20
>> > >=20
>> > > qemux86-64:~# jailhouse enable=20
>> /usr/share/jailhouse/cells/qemu-agl.cell=20
>> > > qemux86-64:~# modprobe uio_ivshmem=20
>> > > qemux86-64:~# lsmod=20
>> > > Module Size Used by=20
>> > > virtio_gpu 65536 0=20
>> > > virtio_dma_buf 16384 1 virtio_gpu=20
>> > > virtio_net 53248 0=20
>> > > net_failover 16384 1 virtio_net=20
>> > > failover 16384 1 net_failover=20
>> > > jailhouse 36864 1=20
>> > > qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" >=20
>> > > /sys/bus/pci/drivers/uio_ivshmem/new_id=20
>> >=20
>> > ffc0... -> back-end device=20
>> >=20
>> > > qemux86-64:~# lspci -k=20
>> > > .=20
>> > > .=20
>> > > .=20
>> > > 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106=20
>> >=20
>> > ff80 -> you have a front-end device here=20
>> >=20
>> > You are either running that in the non-root cell or you misconfigured=
=20
>> > the root cell (JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK is needed).=20
>> >=20
>> > Jan=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7b9d8cc1-2559-42d4-b4f0-13e1d9742fa1n%40googlegroups.com.

------=_Part_6171_901761906.1635757697601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>You have to recheck if you have correctly added the =
PCI devices in your `config.` files, and check using:</div><div><br></div><=
div>```</div><div>qemux86-64:~# lspci -k<br>.<br>.<br>.<br>00:0c.0 Unassign=
ed class [ff80]: Siemens AG Device 4106<br>Subsystem: Siemens AG Device 410=
6<br>.<br></div><div>```</div><div><br></div><div>Also, one important note =
below:</div><div><br></div><div>&gt; ffc0... -&gt; back-end device<br>&gt;<=
br>&gt; &gt; qemux86-64:~# lspci -k<br>&gt; &gt; .<br>&gt; &gt; .<br>&gt; &=
gt; .<br>&gt; &gt; 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106<=
br>&gt;<br>&gt; ff80 -&gt; you have a front-end device here<br></div><div><=
br></div><div><br></div><div>---<br>Anmol</div><div><br></div><div><br></di=
v><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tues=
day, October 26, 2021 at 4:19:38 PM UTC+5:30 huangc...@gmail.com wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">hi, anmol,<div>co=
uld you please share your ideal to fix the issue "cannot open /dev/uio0: No=
 such file or directory"</div><div>I have the same issue now.</div><div><br=
></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Friday, August 20, 2021 at 9:53:11 PM UTC+8 <a href=3D"" data-email-masked=
=3D"" rel=3D"nofollow">anmol.k...@gmail.com</a> wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">It's working :)
<br>
<br>qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
<br>Waiting for peer to be ready...
<br>
<br>Thanks and Regards,
<br>Anmol
<br>
<br>On Fri, Aug 20, 2021 at 6:49 PM Jan Kiszka &lt;<a rel=3D"nofollow">jan.=
k...@web.de</a>&gt; wrote:
<br>&gt;
<br>&gt; On 20.08.21 14:46, Anmol wrote:
<br>&gt; &gt; On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka &lt;<a rel=3D"nofo=
llow">jan.k...@web.de</a>&gt; wrote:
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; On 20.08.21 14:02, Anmol wrote:
<br>&gt; &gt;&gt;&gt; Hello,
<br>&gt; &gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt; On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka &lt;<a rel=
=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
<br>&gt; &gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt; On 19.08.21 15:42, Anmol wrote:
<br>&gt; &gt;&gt;&gt;&gt;&gt; Hello,
<br>&gt; &gt;&gt;&gt;&gt;&gt;
<br>&gt; &gt;&gt;&gt;&gt;&gt; On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka &l=
t;<a rel=3D"nofollow">jan.k...@web.de</a>&gt; wrote:
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
<br>&gt; &gt;&gt;&gt;&gt;&gt; here's the `lspci -k` output:
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
<br>&gt; &gt;&gt;&gt;&gt; Is this taken while Jailhouse was enabled? It's m=
issing your ivshmem
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
<br>&gt; &gt;&gt; echo "110a 4106 110a 4106 ffc002 ffffff" &gt; /sys/bus/pc=
i/drivers/uio_ivshmem/new_id
<br>&gt; &gt;&gt;
<br>&gt; &gt;&gt; again.
<br>&gt; &gt;&gt;
<br>&gt; &gt;
<br>&gt; &gt; Here's the full log:
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
<br>&gt; &gt; qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" &gt;
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
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7b9d8cc1-2559-42d4-b4f0-13e1d9742fa1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7b9d8cc1-2559-42d4-b4f0-13e1d9742fa1n%40googlegroups.co=
m</a>.<br />

------=_Part_6171_901761906.1635757697601--

------=_Part_6170_548035036.1635757697601--
