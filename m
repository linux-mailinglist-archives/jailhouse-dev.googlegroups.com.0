Return-Path: <jailhouse-dev+bncBDLLFRUURMIBB27ORKEAMGQEYETKLHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B53DA61D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Jul 2021 16:13:00 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id fq10-20020a056214258ab02903395e637cf9sf979397qvb.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Jul 2021 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IzQmX2FsdCG9QKkH9SLQlCkYXRIO706HWoJxtRcC9eE=;
        b=dDjifYKB+X1OOtybwwOSp2jIAKUBWSLRnyluraGDLinsj90BGFQzf/HBcklr3BcNA+
         /b4DT6EXCeI8XaVyUjDgZisbNmq3s+Z7V2Y76LsQv0vqYUuyGr9DpXAh/i4K1xHU8JlZ
         0fN4DjUXNAZ7YNKFGVw5y0CgsgWyTQEZXHYJR7BGPHCl8bSBA85oPE94j+dxU5NLzymj
         y+8BI9EuGTpVCrM9AAgF4epGFN7oRKCKHF2eMfU3b9GkhUCorq1/43zwEmatLpCmJRAR
         qCQy0rre/DJ3cNZ9Put1HVnPCOdylnmhghpksMxOJAx0s/AVTSTA1lI6uk7O2aVyv0lk
         by8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IzQmX2FsdCG9QKkH9SLQlCkYXRIO706HWoJxtRcC9eE=;
        b=qupPLmcR7A6uVvCJu9PNqt2zGYTieTp2V6DkkINx5naIhQtqAA9hDl8984456S8RDb
         nSs0/kqKMh9RI/jhDhIkdvdtqIB0CZOkBxwqy+8TLraWh1PXyv9ZZwngl6zcesvO7UeL
         Uxr9Vo74yNkHoc25tcjHOzFgtk/Oogkokas/CljSwnIdD2IYM5/Xgz9L2oj3P/fiCme5
         nH35//8a/P1zwasvNdBufiwwujS8mSlRdSYBz6Pts1v+A/sm4jC3n+q+esXXoByhKqXo
         Wfh0hhA6dveBinJmB+LCmGvH04Gim8lqBT/IAI5hVdLUGguj93MxojAkBbTuXnH5bIAP
         iRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IzQmX2FsdCG9QKkH9SLQlCkYXRIO706HWoJxtRcC9eE=;
        b=d0+k+ffYPkdSyeqtSWvLiWWWz2eF+6jZrGSaxlBfaY86W5MDL1Ebyb/dge427dlNXD
         YFHm8LhdmutpLhCqnhPc9HivbodkEz++DK5wSOR2TMyDJGk0+5cz9PBaOuDXIA3ODLOy
         ZdayXE9zW2l4RWY5uobwfVS+6fDk9eRn8TRd5e62YXjV6WIefRVuh+oxJCs8o2h0YCqp
         fyTR8aurinYTEnIOvjqq3krNCSWOoaa9z67OSYxJAWBbo87WdM1HUq9gJxLQXlwQmSOf
         DDewVkMVn7CMviEcE576psurXHpuwkifUGmR9sd/47aX13Ngh6eAHm7TH06355t6pj3z
         VqSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J1XuVBgE1GSIZeaFC1iHlPs6SQj81lwTkSwKw4w7TVk/H4qHO
	q0J8L0nwQ9GBgtt176/gfbw=
X-Google-Smtp-Source: ABdhPJwWRceZX3n7NfCYMKFz7lai+05IchhlCZWj1jihy2cA0MkvP7ZPA/gDTSviEAmFcjhCwcdUnA==
X-Received: by 2002:a37:ad0a:: with SMTP id f10mr5603237qkm.284.1627567979829;
        Thu, 29 Jul 2021 07:12:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a24c:: with SMTP id l73ls3415686qke.6.gmail; Thu, 29 Jul
 2021 07:12:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2006:: with SMTP id c6mr5327630qka.337.1627567979055;
        Thu, 29 Jul 2021 07:12:59 -0700 (PDT)
Date: Thu, 29 Jul 2021 07:12:58 -0700 (PDT)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
In-Reply-To: <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
Subject: Re: Help needed regarding AGL with Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3198_724423489.1627567978336"
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

------=_Part_3198_724423489.1627567978336
Content-Type: multipart/alternative; 
	boundary="----=_Part_3199_1018409581.1627567978336"

------=_Part_3199_1018409581.1627567978336
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sir,

Thank you for your response.

> I would recommend to switch to 5.10 or queues/jailhouse as I'm no longer

> updating 5.4 with potential fixes.

>

It=E2=80=99s now working perfectly with the `queues/jailhouse` kernel.=20


> > - Any hints to get it working properly with the "queues/jailhouse"=20
branch.

>

> Is that failing cell your non-root Linux cell? I suppose it ran out of

> RAM. How much did you assign to it?

>

No, I was asking for the root cell.

Also, we now have the working Jailhouse setup and `root cell`, the problem=
=20
we are now facing is related to `non-root linux` cell, we have used the=20
`bzImage` and `rootfs.cpio`from `jailhouse-images` for booting the=20
`non-root-linux-cell`, and used the address for `low RAM` and `high RAM`=20
w.r.t to the address spit out by the `jailhouse config create=20
<cell_config_name>` for the root cell.

Error Log:

$ nc localhost <port>

Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 3

Code location: 0xfffffffff0000050

Using xAPIC

Page pool usage after early setup: mem 49/975, remap 1/131072

Initializing processors:

 CPU 3... (APIC ID 3) OK

 CPU 1... (APIC ID 1) OK

 CPU 2... (APIC ID 2) OK

 CPU 0... (APIC ID 0) OK

Initializing unit: VT-d

DMAR unit @0xfed90000/0x1000

Reserving 24 interrupt(s) for device ff:00.0 at index 0

Initializing unit: IOAPIC

Initializing unit: Cache Allocation Technology

Initializing unit: PCI

Adding PCI device 00:00.0 to cell "RootCell"

Adding PCI device 00:01.0 to cell "RootCell"

Reserving 3 interrupt(s) for device 00:01.0 at index 24

Adding PCI device 00:02.0 to cell "RootCell"

Reserving 3 interrupt(s) for device 00:02.0 at index 27

Adding PCI device 00:03.0 to cell "RootCell"

Adding PCI device 00:04.0 to cell "RootCell"

Reserving 2 interrupt(s) for device 00:04.0 at index 30

Adding PCI device 00:1b.0 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1b.0 at index 32

Adding PCI device 00:1d.0 to cell "RootCell"

Adding PCI device 00:1d.1 to cell "RootCell"

Adding PCI device 00:1d.2 to cell "RootCell"

Adding PCI device 00:1d.7 to cell "RootCell"

Adding PCI device 00:1f.0 to cell "RootCell"

Adding PCI device 00:1f.2 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1f.2 at index 33

Adding PCI device 00:1f.3 to cell "RootCell"

Page pool usage after late setup: mem 268/975, remap 65545/131072

Activating hypervisor

Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"

Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"

Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"

CPU 2 received SIPI, vector 9a

CPU 3 received SIPI, vector 9a

^C

I have attached the root cell and non-root cell configurations, please find=
=20
attached.

I also saw some patches related to `jailhouse debug console` in the recent=
=20
update(5.14-rc2), could it be helpful in resolving this issue?


Thanks and Regards,

Anmol


On Wednesday, July 21, 2021 at 8:54:25 PM UTC+5:30 j.kiszka...@gmail.com=20
wrote:

> Hi Anmol,=20
>
> sorry for the very late reply.=20
>
> On 25.06.21 16:38, Anmol karn wrote:=20
> > Hi,=20
> >=20
> > I am currently working on a GSoC'21 project "VirtIO-blk implementation=
=20
> > with AGL on Jailhouse".=20
> >=20
> > I am new to the Jailhouse and trying to get jailhouse(v0.12) work with=
=20
> > QEmu(x86-64) with a custom agl-image.=20
> >=20
> > I have been using a 5.4 kernel(jailhouse-enabling/5.4).=20
> >=20
> > We are getting Kernel panics and unknown failures with=20
> > `jailhouse-enabling/5.4`, so we decided to shift to `queues/jailhouse`=
=20
> > (452bfd9102265f67afd5818024ca2664aa3afa60), and then we somehow managed=
=20
> > to QEmulate it without kernel panics, but now it's showing some unknown=
=20
> > behaviors, and also not booting properly:=20
> >=20
> > Log:=20
> > [    0.007617] [Firmware Bug]: TSC_DEADLINE disabled due to Errata;=20
> > please update microcode to version: 0xb2 (or later)=20
> > [    0.525808] kvm: already loaded the other module=20
> > [    0.567138] hdaudio hdaudioC0D0: Unable to bind the codec=20
> >=20
> > Automotive Grade Linux 11.91.0 qemux86-64 ttyS0=20
> >=20
> > qemux86-64 login: [   27.731494] virtio_gpu virtio0: [drm] *ERROR*=20
> > fbdev: Failed to setup generic emulation (ret=3D-22)=20
> > [   27.841660] Out of memory: Killed process 161 (systemd-udevd)=20
> > total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID:0=20
> > pgtables:64kB oom_score_adj:0=20
> >=20
> > qemux86-64 login: =20
> > qemux86-64 login: =20
> > qemux86-64 login: root=20
> >=20
> > ^C^C^C^C^C=20
> >=20
> > [  236.927354] Out of memory: Killed process 167 ((agetty))=20
> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=20
> > pgtables:48kB oom_score_adj:0=20
> > [  437.781132] Out of memory: Killed process 166 (systemd-udevd)=20
> > total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
> > pgtables:64kB oom_score_adj:0=20
> > [  457.378023] Out of memory: Killed process 170 ((agetty))=20
> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=20
> > pgtables:48kB oom_score_adj:0=20
> > [  516.062574] Out of memory: Killed process 171 ((agetty))=20
> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=20
> > pgtables:48kB oom_score_adj:0=20
> > QEMU 4.2.0 monitor - type 'help' for more information=20
> > (qemu) q=20
> >=20
> >=20
> > Questions: =20
> > - Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kernel=20
> > with some patchset.=20
>
> I would recommend to switch to 5.10 or queues/jailhouse as I'm no longer=
=20
> updating 5.4 with potential fixes.=20
>
> > - Any hints to get it working properly with the "queues/jailhouse"=20
> branch.=20
>
> Is that failing cell your non-root Linux cell? I suppose it ran out of=20
> RAM. How much did you assign to it?=20
>
> Jan=20
>
> --=20
> Siemens AG, T RDA IOT=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/83beed08-7e85-4607-bdf8-e4ec983912f8n%40googlegroups.com.

------=_Part_3199_1018409581.1627567978336
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sir,<div><br></div><div>Thank you for your response.<br><div><br></di=
v><div><p dir=3D"ltr">&gt; I would recommend to switch to 5.10 or queues/ja=
ilhouse as I'm no longer</p><p dir=3D"ltr">&gt; updating 5.4 with potential=
 fixes.</p><p dir=3D"ltr">&gt;</p><p dir=3D"ltr">It=E2=80=99s now working p=
erfectly with the `queues/jailhouse` kernel.&nbsp;</p><p dir=3D"ltr"><br></=
p><p dir=3D"ltr">&gt; &gt; - Any hints to get it working properly with the =
"queues/jailhouse" branch.</p><p dir=3D"ltr">&gt;</p><p dir=3D"ltr">&gt; Is=
 that failing cell your non-root Linux cell? I suppose it ran out of</p><p =
dir=3D"ltr">&gt; RAM. How much did you assign to it?</p><p dir=3D"ltr">&gt;=
</p><br><p dir=3D"ltr">No, I was asking for the root cell.</p><p dir=3D"ltr=
">Also, we now have the working Jailhouse setup and `root cell`, the proble=
m we are now facing is related to `non-root linux` cell, we have used the `=
bzImage` and `rootfs.cpio`from `jailhouse-images` for booting the `non-root=
-linux-cell`, and used the address for `low RAM` and `high RAM` w.r.t to th=
e address spit out by the `jailhouse config create &lt;cell_config_name&gt;=
` for the root cell.</p><p dir=3D"ltr">Error Log:</p><p dir=3D"ltr">$ nc lo=
calhost &lt;port&gt;</p><p dir=3D"ltr">Initializing Jailhouse hypervisor v0=
.12 (273-g6d9c51d0-dirty) on CPU 3</p><p dir=3D"ltr">Code location: 0xfffff=
ffff0000050</p><p dir=3D"ltr">Using xAPIC</p><p dir=3D"ltr">Page pool usage=
 after early setup: mem 49/975, remap 1/131072</p><p dir=3D"ltr">Initializi=
ng processors:</p><p dir=3D"ltr">&nbsp;CPU 3... (APIC ID 3) OK</p><p dir=3D=
"ltr">&nbsp;CPU 1... (APIC ID 1) OK</p><p dir=3D"ltr">&nbsp;CPU 2... (APIC =
ID 2) OK</p><p dir=3D"ltr">&nbsp;CPU 0... (APIC ID 0) OK</p><p dir=3D"ltr">=
Initializing unit: VT-d</p><p dir=3D"ltr">DMAR unit @0xfed90000/0x1000</p><=
p dir=3D"ltr">Reserving 24 interrupt(s) for device ff:00.0 at index 0</p><p=
 dir=3D"ltr">Initializing unit: IOAPIC</p><p dir=3D"ltr">Initializing unit:=
 Cache Allocation Technology</p><p dir=3D"ltr">Initializing unit: PCI</p><p=
 dir=3D"ltr">Adding PCI device 00:00.0 to cell "RootCell"</p><p dir=3D"ltr"=
>Adding PCI device 00:01.0 to cell "RootCell"</p><p dir=3D"ltr">Reserving 3=
 interrupt(s) for device 00:01.0 at index 24</p><p dir=3D"ltr">Adding PCI d=
evice 00:02.0 to cell "RootCell"</p><p dir=3D"ltr">Reserving 3 interrupt(s)=
 for device 00:02.0 at index 27</p><p dir=3D"ltr">Adding PCI device 00:03.0=
 to cell "RootCell"</p><p dir=3D"ltr">Adding PCI device 00:04.0 to cell "Ro=
otCell"</p><p dir=3D"ltr">Reserving 2 interrupt(s) for device 00:04.0 at in=
dex 30</p><p dir=3D"ltr">Adding PCI device 00:1b.0 to cell "RootCell"</p><p=
 dir=3D"ltr">Reserving 1 interrupt(s) for device 00:1b.0 at index 32</p><p =
dir=3D"ltr">Adding PCI device 00:1d.0 to cell "RootCell"</p><p dir=3D"ltr">=
Adding PCI device 00:1d.1 to cell "RootCell"</p><p dir=3D"ltr">Adding PCI d=
evice 00:1d.2 to cell "RootCell"</p><p dir=3D"ltr">Adding PCI device 00:1d.=
7 to cell "RootCell"</p><p dir=3D"ltr">Adding PCI device 00:1f.0 to cell "R=
ootCell"</p><p dir=3D"ltr">Adding PCI device 00:1f.2 to cell "RootCell"</p>=
<p dir=3D"ltr">Reserving 1 interrupt(s) for device 00:1f.2 at index 33</p><=
p dir=3D"ltr">Adding PCI device 00:1f.3 to cell "RootCell"</p><p dir=3D"ltr=
">Page pool usage after late setup: mem 268/975, remap 65545/131072</p><p d=
ir=3D"ltr">Activating hypervisor</p><p dir=3D"ltr">Adding virtual PCI devic=
e 00:0c.0 to cell "linux-x86-demo"</p><p dir=3D"ltr">Adding virtual PCI dev=
ice 00:0d.0 to cell "linux-x86-demo"</p><p dir=3D"ltr">Adding virtual PCI d=
evice 00:0e.0 to cell "linux-x86-demo"</p><p dir=3D"ltr">CPU 2 received SIP=
I, vector 9a</p><p dir=3D"ltr">CPU 3 received SIPI, vector 9a</p><p dir=3D"=
ltr">^C</p><br><p dir=3D"ltr">I have attached the root cell and non-root ce=
ll configurations, please find attached.</p><p dir=3D"ltr">I also saw some =
patches related to `jailhouse debug console` in the recent update(5.14-rc2)=
, could it be helpful in resolving this issue?</p><p dir=3D"ltr"><br></p><p=
 dir=3D"ltr">Thanks and Regards,</p><p dir=3D"ltr">Anmol</p><div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr"=
>On Wednesday, July 21, 2021 at 8:54:25 PM UTC+5:30 j.kiszka...@gmail.com w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi Anmol=
,
<br>
<br>sorry for the very late reply.
<br>
<br>On 25.06.21 16:38, Anmol karn wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I am currently working on a GSoC'21 project "VirtIO-blk implementa=
tion
<br>&gt; with AGL on Jailhouse".
<br>&gt;=20
<br>&gt; I am new to the Jailhouse and trying to get jailhouse(v0.12) work =
with
<br>&gt; QEmu(x86-64) with a custom agl-image.
<br>&gt;=20
<br>&gt; I have been using a 5.4 kernel(jailhouse-enabling/5.4).
<br>&gt;=20
<br>&gt; We are getting Kernel panics and unknown failures with
<br>&gt; `jailhouse-enabling/5.4`, so we decided to shift to `queues/jailho=
use`
<br>&gt; (452bfd9102265f67afd5818024ca2664aa3afa60), and then we somehow ma=
naged
<br>&gt; to QEmulate it without kernel panics, but now it's showing some un=
known
<br>&gt; behaviors, and also not booting properly:
<br>&gt;=20
<br>&gt; Log:
<br>&gt; [&nbsp; &nbsp; 0.007617] [Firmware Bug]: TSC_DEADLINE disabled due=
 to Errata;
<br>&gt; please update microcode to version: 0xb2 (or later)
<br>&gt; [&nbsp; &nbsp; 0.525808] kvm: already loaded the other module
<br>&gt; [&nbsp; &nbsp; 0.567138] hdaudio hdaudioC0D0: Unable to bind the c=
odec
<br>&gt;=20
<br>&gt; Automotive Grade Linux 11.91.0 qemux86-64 ttyS0
<br>&gt;=20
<br>&gt; qemux86-64 login: [&nbsp; &nbsp;27.731494] virtio_gpu virtio0: [dr=
m] *ERROR*
<br>&gt; fbdev: Failed to setup generic emulation (ret=3D-22)
<br>&gt; [&nbsp; &nbsp;27.841660] Out of memory: Killed process 161 (system=
d-udevd)
<br>&gt; total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:64kB oom_score_adj:0
<br>&gt;=20
<br>&gt; qemux86-64 login:&nbsp;
<br>&gt; qemux86-64 login:&nbsp;
<br>&gt; qemux86-64 login: root
<br>&gt;=20
<br>&gt; ^C^C^C^C^C
<br>&gt;=20
<br>&gt; [&nbsp; 236.927354] Out of memory: Killed process 167 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; [&nbsp; 437.781132] Out of memory: Killed process 166 (systemd-ude=
vd)
<br>&gt; total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UI=
D:0
<br>&gt; pgtables:64kB oom_score_adj:0
<br>&gt; [&nbsp; 457.378023] Out of memory: Killed process 170 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; [&nbsp; 516.062574] Out of memory: Killed process 171 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; QEMU 4.2.0 monitor - type 'help' for more information
<br>&gt; (qemu) q
<br>&gt;=20
<br>&gt;=20
<br>&gt; Questions:&nbsp;
<br>&gt; - Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kern=
el
<br>&gt; with some patchset.
<br>
<br>I would recommend to switch to 5.10 or queues/jailhouse as I'm no longe=
r
<br>updating 5.4 with potential fixes.
<br>
<br>&gt; - Any hints to get it working properly with the "queues/jailhouse"=
 branch.
<br>
<br>Is that failing cell your non-root Linux cell? I suppose it ran out of
<br>RAM. How much did you assign to it?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/83beed08-7e85-4607-bdf8-e4ec983912f8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/83beed08-7e85-4607-bdf8-e4ec983912f8n%40googlegroups.co=
m</a>.<br />

------=_Part_3199_1018409581.1627567978336--

------=_Part_3198_724423489.1627567978336
Content-Type: text/x-csrc; charset=US-ASCII; name=agl-linux-non-root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=agl-linux-non-root-cell.c
X-Attachment-Id: 1d20b365-2adb-47a3-ae84-684ba20a7b1b
Content-ID: <1d20b365-2adb-47a3-ae84-684ba20a7b1b>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Linux inmate, 1 CPU, 74 MB RAM, ~1MB shmem, serial ports
 *
 * Copyright (c) Siemens AG, 2013-2015
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
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_memory mem_regions[24];
#else
	struct jailhouse_memory mem_regions[20];
#endif
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[2];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_pci_device pci_devices[5];
#else
	struct jailhouse_pci_device pci_devices[4];
#endif
	struct jailhouse_pci_capability pci_caps[6];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "linux-x86-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
	},

	.cpus = {
		0b1100,
	},

	.mem_regions = {

		/* IVSHMEM shared memory region (virtio-blk front) */
		{
			.phys_start = 0x22000000,
			.virt_start = 0x22000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x22001000,
			.virt_start = 0x22001000,
			.size = 0xdf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{ 0 },
		{ 0 },
		/* IVSHMEM shared memory region (virtio-con front) */
		{
			.phys_start = 0x220e0000,
			.virt_start = 0x220e0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x220e1000,
			.virt_start = 0x220e1000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{ 0 },
		{ 0 },

		/* IVSHMEM shared memory regions (demo) */
		{
			.phys_start = 0x220f0000,
			.virt_start = 0x220f0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x220f1000,
			.virt_start = 0x220f1000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x220fa000,
			.virt_start = 0x220fa000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x220fc000,
			.virt_start = 0x220fc000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x220fe000,
			.virt_start = 0x220fe000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x22100000, 1),
		/* low RAM */ {
			.phys_start = 0x22600000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
		/* high RAM */ {
			.phys_start = 0x22700000,
			.virt_start = 0x00200000,
			.size = 0x4700000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : e1000e */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : e1000e */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : e1000e */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
#endif
	},

	.cache_regions = {
		{
			.start = 0,
			.size = 2,
			.type = JAILHOUSE_CACHE_L3,
		},
	},

	.irqchips = {
		/* IOAPIC */ {
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				(1 << 3) | (1 << 4),
			},
		},
	},

	.pio_regions = {
		PIO_RANGE(0x2e8, 8), /* serial 2: ttyS3(0x2e8) */
		PIO_RANGE(0x3e8, 8), /* serial 1: ttyS2(0x3e8) */
//		PIO_RANGE(0xe010, 8), /* OXPCIe952 serial1 */
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0c << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 0,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
				VIRTIO_DEV_BLOCK,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0d << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = 4,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
				VIRTIO_DEV_CONSOLE,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 8,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0,
			.bdf = 0x0f << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = 13,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
		{ /* e1000e */
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.domain = 0x0000,
			.bdf = 0x0010,
			.bar_mask = {
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
#endif
	},

	.pci_caps = {
		{ /* e1000e */
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xe0,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 4,
			.flags = 0,
		},
	}
};

------=_Part_3198_724423489.1627567978336
Content-Type: text/x-csrc; charset=US-ASCII; name=agl-qemu-root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=agl-qemu-root-cell.c
X-Attachment-Id: b2049295-03cb-4e1d-8b7e-2b00acf8bc64
Content-ID: <b2049295-03cb-4e1d-8b7e-2b00acf8bc64>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for QEMU Standard PC (Q35 + ICH9, 2009)
 * created with '/usr/libexec/jailhouse/jailhouse config create -c ttyS1 qemu-agl.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x22000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[17];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[15];
	struct jailhouse_pci_device pci_devices[13];
	struct jailhouse_pci_capability pci_caps[14];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x22000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x2f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xb0000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed90000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x608,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009fbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000bffff : PCI Bus 0000:00 */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-21ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x21f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 27200000-3ffd7fff : System RAM */
		{
			.phys_start = 0x27200000,
			.virt_start = 0x27200000,
			.size = 0x18dd8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: fe000000-fe7fffff : 0000:00:01.0 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe800000-fe803fff : virtio-pci-modern */
		{
			.phys_start = 0xfe800000,
			.virt_start = 0xfe800000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe804000-fe807fff : virtio-pci-modern */
		{
			.phys_start = 0xfe804000,
			.virt_start = 0xfe804000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe808000-fe80bfff : virtio-pci-modern */
		{
			.phys_start = 0xfe808000,
			.virt_start = 0xfe808000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe80c000-fe80ffff : virtio-pci-modern */
		{
			.phys_start = 0xfe80c000,
			.virt_start = 0xfe80c000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-febbffff : 0000:00:02.0 */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd0000-febd3fff : 0000:00:1b.0 */
		{
			.phys_start = 0xfebd0000,
			.virt_start = 0xfebd0000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd7000-febd7fff : ehci_hcd */
		{
			.phys_start = 0xfebd7000,
			.virt_start = 0xfebd7000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd8000-febd8fff : ahci */
		{
			.phys_start = 0xfebd8000,
			.virt_start = 0xfebd8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 22600000-271fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x22600000,
			.virt_start = 0x22600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xff00,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 03c0-03df : vga+ */
		PIO_RANGE(0x3c0, 0x20),
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		PIO_RANGE(0x3e8, 0x8),
		/* Port I/O: 0510-051b : QEMU0002:00 */
		/* PIO_RANGE(0x510, 0xc), */
		/* Port I/O: 0600-0603 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x600, 0x4), */
		/* Port I/O: 0604-0605 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x604, 0x2), */
		/* Port I/O: 0608-060b : ACPI PM_TMR */
		/* PIO_RANGE(0x608, 0x4), */
		/* Port I/O: 0620-062f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x620, 0x10), */
		/* Port I/O: 0700-073f : i801_smbus */
		/* PIO_RANGE(0x700, 0x40), */
		/* Port I/O: c000-c07f : 0000:00:04.0 */
		PIO_RANGE(0xc000, 0x80),
		/* Port I/O: c0c0-c0df : 0000:00:02.0 */
		PIO_RANGE(0xc0c0, 0x20),
		/* Port I/O: c0e0-c0ff : 0000:00:03.0 */
		PIO_RANGE(0xc0e0, 0x20),
		/* Port I/O: c100-c11f : 0000:00:1d.0 */
		PIO_RANGE(0xc100, 0x20),
		/* Port I/O: c120-c13f : 0000:00:1d.1 */
		PIO_RANGE(0xc120, 0x20),
		/* Port I/O: c140-c15f : 0000:00:1d.2 */
		PIO_RANGE(0xc140, 0x20),
		/* Port I/O: c160-c17f : 0000:00:1f.2 */
		PIO_RANGE(0xc160, 0x20),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0xff800000, 0x00000000, 0xffffc000,
				0xffffffff, 0xfffff000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 3,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd4000,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xffffffe0, 0xfffff000, 0x00000000,
				0x00000000, 0xffffc000, 0xffffffff,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 3,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd5000,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0xffffffe0, 0x00000000, 0x00000000,
				0x00000000, 0xffffc000, 0xffffffff,
			},
			.caps_start = 6,
			.num_caps = 5,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0xffffff80, 0xfffff000, 0x00000000,
				0x00000000, 0xffffc000, 0xffffffff,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd6000,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 1,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xe9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xea,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xef,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0xfffff000,
			},
			.caps_start = 12,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffc0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:01.0 */
		/* PCIDevice: 00:02.0 */
		/* PCIDevice: 00:04.0 */
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x98,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x84,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x70,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x60,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x50,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x84,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x70,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x60,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x50,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
	},
};

------=_Part_3198_724423489.1627567978336--
