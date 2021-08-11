Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBHFR2CEAMGQEGKCYBCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6A3E97B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Aug 2021 20:36:13 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id q11-20020a05620a05abb02903ca17a8eef8sf1898952qkq.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Aug 2021 11:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+aD1hjsl/xIitsr5OHaovOLLfCCzIDTdlQkISbSUKuA=;
        b=XX22MBYK7/jczi0/WfqqCk9Jc4VuwaYg7ivbvs/qTRRbGYxXZ8b6v+wW95ml1OD7Gy
         j4R5FrOYtvv0Dcw1eOBTduPJbCf4bSiBQaSkdiwyOGJYIvJeUDEI1oZsGBSwJahUymq4
         242u1l4gU9tksmC4aWRs7kp8K7Al93QZAC1rWW+xbkxLqN3Alh+e2fVD0add4bOO9Jef
         /YqJXr2A0bOAwKRLlQFFIA2uYDQ5nBaYSF4b/JhRv8k5GlqXHYiDT7HDmVnKM9yAEZQt
         OF3f2N3zfgm8rVuC13IzmNxIQtM2SNtvo+LXbIw6raGJ2lx7tRR7kK/J4xAUZAFA+66z
         DZOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+aD1hjsl/xIitsr5OHaovOLLfCCzIDTdlQkISbSUKuA=;
        b=tJ1SD7eRFtPbfBHt/Unkh+xYfqJiZHxxFb6Kz+6m9C3nnESV2NXEfgAquqi//96NQE
         kgxIVHGnR791kZ5UpxxcScodCuU5pvN7hniWCSYzpWWeeaeVFp0SuWfdQ26nSSVRfG+8
         cuuzAbonEW1V2tqLIZopc1hGopeqg05TpFDW9p0JS6If/cl+tjNg7A4h8MtiSP5mVC7v
         BzYMHRsBWdJQ3jjSi2Qu/RxhFfbeNjbRalT/EqX5XxLFOqm5j2RfAe8pP8l67owXEr5G
         laBHwYCmRZe64tJV6JkFuZvSyj5fydWSjh4I+qlfE2CwjfVCHiJo2wx5tjiR4NFe0/8X
         TZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+aD1hjsl/xIitsr5OHaovOLLfCCzIDTdlQkISbSUKuA=;
        b=I3YGae9TglqSknsTu8FDXI6tQ7r8RRzV5EOiEWBoce+1klU8dR9+g2jCNNCrEwdQgB
         rqsOrNTAL6xa6eDPamEdfhJ3OwsPx6x3jieoqDLj5i3hTMchX7GvTSIZ2Di9Q1LuSXau
         t6Oa5F+JmR7ItKFPBqNG+tS6xwqwXDy8RrQa851qwZgFRrHT2L+lYzISWQ5johiXhqIr
         4qkvSvx9/ZWwkCLsNLWAOz7H2ZS0mKIexcFj0zIXXa0vFSvMAKmWXQWkkQkTmAmZzmqn
         +gwtFgB8DLvvLXJ/yuhLHyO0BfdlitINORnf/iRrW0GUqdv/dQWzLvFi/l2wcQcH214d
         ezGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531vq4XgW4bAYCpPBpMiQoKP6DV7ZWtwGNGtLPykTp/mhArfAEOi
	IKmCJG8hIlMnfBf7GF/+c8Y=
X-Google-Smtp-Source: ABdhPJzR9XqY+kGJI01AfTCXtZDmfUSOp7zAp9oNx9J4WZV/KK0cADHvA0c8oo1ICv2ZW0ewg9XIaw==
X-Received: by 2002:ac8:70d7:: with SMTP id g23mr116165qtp.250.1628706972371;
        Wed, 11 Aug 2021 11:36:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5c0c:: with SMTP id i12ls1403970qti.6.gmail; Wed, 11 Aug
 2021 11:36:11 -0700 (PDT)
X-Received: by 2002:ac8:5982:: with SMTP id e2mr80407qte.285.1628706971574;
        Wed, 11 Aug 2021 11:36:11 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:36:10 -0700 (PDT)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
In-Reply-To: <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
 <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
Subject: Re: Help needed regarding AGL with Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1494_415174606.1628706970771"
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

------=_Part_1494_415174606.1628706970771
Content-Type: multipart/alternative; 
	boundary="----=_Part_1495_1777818906.1628706970771"

------=_Part_1495_1777818906.1628706970771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hello,

Non-Root Linux inmate is working now and also boot logs are showing in the=
=20
serial console.

Now I am trying to follow the Virtio over IVSHMEM block and want to get it=
=20
running, some references I took are [1], [2], [3].

I am using the `queues/jailhouse` kernel for Root cell, and same for=20
Non-root cell(with .config from `jailhouse-images`).

I did some changes in the Root cell and added the required memory regions=
=20
and also added the PCI devices, memory address matching with the non-root=
=20
cell.

I have also enabled the `UIO_IVSHMEM` in the kernel and can see that=20
`/sys/bus/pci/drivers/uio_ivshmem/new_id` is present.

Also `virtio_ivshmem` is present in Non-root cell's kernel.

My Questions are:

- After running the `$ echo "110a 4106 110a 4106 ffc002 ffffff" >=20
/sys/bus/pci/drivers/uio_ivshmem/new_id`, It's not showing any responses.=
=20
Is it expected?

- In this command `$ virtio-ivshmem-block /dev/uio0 /path/to/disk.image`, I=
=20
am not able to load the `virtio-ivshmem-block` module, and is the=20
`disc.image` a standard `LinuxInstallation.img`?

- For `virtio-ivshmem-block`, do I need to compile the=20
`virtio-ivshmem-block.c` externally and copy the module to the QEmulated=20
Image?

- Can we also use the `queues/jailhouse` kernel for this setup instead of=
=20
`queues/ivshmem2`?

Please tell me if I am missing any Important steps.

I am also attaching the Root cell and Non Root cell config files.

Thanks and Regards,

Anmol

[1]=20
https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell-c=
ommunication.md

[2] https://groups.google.com/g/jailhouse-dev/c/3xvC22mud-E/m/AFF665uxBAAJ

[3] https://groups.google.com/g/jailhouse-dev/c/vYWIKp-Fw8w/m/1Nx59bsQHwAJ


On Thursday, July 29, 2021 at 7:42:58 PM UTC+5:30 Anmol wrote:

> Hello Sir,
>
> Thank you for your response.
>
> > I would recommend to switch to 5.10 or queues/jailhouse as I'm no longe=
r
>
> > updating 5.4 with potential fixes.
>
> >
>
> It=E2=80=99s now working perfectly with the `queues/jailhouse` kernel.=20
>
>
> > > - Any hints to get it working properly with the "queues/jailhouse"=20
> branch.
>
> >
>
> > Is that failing cell your non-root Linux cell? I suppose it ran out of
>
> > RAM. How much did you assign to it?
>
> >
>
> No, I was asking for the root cell.
>
> Also, we now have the working Jailhouse setup and `root cell`, the proble=
m=20
> we are now facing is related to `non-root linux` cell, we have used the=
=20
> `bzImage` and `rootfs.cpio`from `jailhouse-images` for booting the=20
> `non-root-linux-cell`, and used the address for `low RAM` and `high RAM`=
=20
> w.r.t to the address spit out by the `jailhouse config create=20
> <cell_config_name>` for the root cell.
>
> Error Log:
>
> $ nc localhost <port>
>
> Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 3
>
> Code location: 0xfffffffff0000050
>
> Using xAPIC
>
> Page pool usage after early setup: mem 49/975, remap 1/131072
>
> Initializing processors:
>
>  CPU 3... (APIC ID 3) OK
>
>  CPU 1... (APIC ID 1) OK
>
>  CPU 2... (APIC ID 2) OK
>
>  CPU 0... (APIC ID 0) OK
>
> Initializing unit: VT-d
>
> DMAR unit @0xfed90000/0x1000
>
> Reserving 24 interrupt(s) for device ff:00.0 at index 0
>
> Initializing unit: IOAPIC
>
> Initializing unit: Cache Allocation Technology
>
> Initializing unit: PCI
>
> Adding PCI device 00:00.0 to cell "RootCell"
>
> Adding PCI device 00:01.0 to cell "RootCell"
>
> Reserving 3 interrupt(s) for device 00:01.0 at index 24
>
> Adding PCI device 00:02.0 to cell "RootCell"
>
> Reserving 3 interrupt(s) for device 00:02.0 at index 27
>
> Adding PCI device 00:03.0 to cell "RootCell"
>
> Adding PCI device 00:04.0 to cell "RootCell"
>
> Reserving 2 interrupt(s) for device 00:04.0 at index 30
>
> Adding PCI device 00:1b.0 to cell "RootCell"
>
> Reserving 1 interrupt(s) for device 00:1b.0 at index 32
>
> Adding PCI device 00:1d.0 to cell "RootCell"
>
> Adding PCI device 00:1d.1 to cell "RootCell"
>
> Adding PCI device 00:1d.2 to cell "RootCell"
>
> Adding PCI device 00:1d.7 to cell "RootCell"
>
> Adding PCI device 00:1f.0 to cell "RootCell"
>
> Adding PCI device 00:1f.2 to cell "RootCell"
>
> Reserving 1 interrupt(s) for device 00:1f.2 at index 33
>
> Adding PCI device 00:1f.3 to cell "RootCell"
>
> Page pool usage after late setup: mem 268/975, remap 65545/131072
>
> Activating hypervisor
>
> Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
>
> Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
>
> Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
>
> CPU 2 received SIPI, vector 9a
>
> CPU 3 received SIPI, vector 9a
>
> ^C
>
> I have attached the root cell and non-root cell configurations, please=20
> find attached.
>
> I also saw some patches related to `jailhouse debug console` in the recen=
t=20
> update(5.14-rc2), could it be helpful in resolving this issue?
>
>
> Thanks and Regards,
>
> Anmol
>
>
> On Wednesday, July 21, 2021 at 8:54:25 PM UTC+5:30 j.kiszka...@gmail.com=
=20
> wrote:
>
>> Hi Anmol,=20
>>
>> sorry for the very late reply.=20
>>
>> On 25.06.21 16:38, Anmol karn wrote:=20
>> > Hi,=20
>> >=20
>> > I am currently working on a GSoC'21 project "VirtIO-blk implementation=
=20
>> > with AGL on Jailhouse".=20
>> >=20
>> > I am new to the Jailhouse and trying to get jailhouse(v0.12) work with=
=20
>> > QEmu(x86-64) with a custom agl-image.=20
>> >=20
>> > I have been using a 5.4 kernel(jailhouse-enabling/5.4).=20
>> >=20
>> > We are getting Kernel panics and unknown failures with=20
>> > `jailhouse-enabling/5.4`, so we decided to shift to `queues/jailhouse`=
=20
>> > (452bfd9102265f67afd5818024ca2664aa3afa60), and then we somehow manage=
d=20
>> > to QEmulate it without kernel panics, but now it's showing some unknow=
n=20
>> > behaviors, and also not booting properly:=20
>> >=20
>> > Log:=20
>> > [    0.007617] [Firmware Bug]: TSC_DEADLINE disabled due to Errata;=20
>> > please update microcode to version: 0xb2 (or later)=20
>> > [    0.525808] kvm: already loaded the other module=20
>> > [    0.567138] hdaudio hdaudioC0D0: Unable to bind the codec=20
>> >=20
>> > Automotive Grade Linux 11.91.0 qemux86-64 ttyS0=20
>> >=20
>> > qemux86-64 login: [   27.731494] virtio_gpu virtio0: [drm] *ERROR*=20
>> > fbdev: Failed to setup generic emulation (ret=3D-22)=20
>> > [   27.841660] Out of memory: Killed process 161 (systemd-udevd)=20
>> > total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
>> > pgtables:64kB oom_score_adj:0=20
>> >=20
>> > qemux86-64 login: =20
>> > qemux86-64 login: =20
>> > qemux86-64 login: root=20
>> >=20
>> > ^C^C^C^C^C=20
>> >=20
>> > [  236.927354] Out of memory: Killed process 167 ((agetty))=20
>> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
>> > pgtables:48kB oom_score_adj:0=20
>> > [  437.781132] Out of memory: Killed process 166 (systemd-udevd)=20
>> > total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
>> > pgtables:64kB oom_score_adj:0=20
>> > [  457.378023] Out of memory: Killed process 170 ((agetty))=20
>> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
>> > pgtables:48kB oom_score_adj:0=20
>> > [  516.062574] Out of memory: Killed process 171 ((agetty))=20
>> > total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0=
=20
>> > pgtables:48kB oom_score_adj:0=20
>> > QEMU 4.2.0 monitor - type 'help' for more information=20
>> > (qemu) q=20
>> >=20
>> >=20
>> > Questions: =20
>> > - Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kernel=
=20
>> > with some patchset.=20
>>
>> I would recommend to switch to 5.10 or queues/jailhouse as I'm no longer=
=20
>> updating 5.4 with potential fixes.=20
>>
>> > - Any hints to get it working properly with the "queues/jailhouse"=20
>> branch.=20
>>
>> Is that failing cell your non-root Linux cell? I suppose it ran out of=
=20
>> RAM. How much did you assign to it?=20
>>
>> Jan=20
>>
>> --=20
>> Siemens AG, T RDA IOT=20
>> Corporate Competence Center Embedded Linux=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn%40googlegroups.com.

------=_Part_1495_1777818906.1628706970771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hello,</p><p dir=3D"ltr">Non-Root Linux inmate is working no=
w and also boot logs are showing in the serial console.</p><p dir=3D"ltr">N=
ow I am trying to follow the Virtio over IVSHMEM block and want to get it r=
unning, some references I took are [1], [2], [3].</p><br><p dir=3D"ltr">I a=
m using the `queues/jailhouse` kernel for Root cell, and same for Non-root =
cell(with .config from `jailhouse-images`).</p><p dir=3D"ltr">I did some ch=
anges in the Root cell and added the required memory regions and also added=
 the PCI devices, memory address matching with the non-root cell.</p><p dir=
=3D"ltr">I have also enabled the `UIO_IVSHMEM` in the kernel and can see th=
at `/sys/bus/pci/drivers/uio_ivshmem/new_id` is present.</p><p dir=3D"ltr">=
Also `virtio_ivshmem` is present in Non-root cell's kernel.</p><br><p dir=
=3D"ltr">My Questions are:</p><p dir=3D"ltr">- After running the `$ echo "1=
10a 4106 110a 4106 ffc002 ffffff" &gt; /sys/bus/pci/drivers/uio_ivshmem/new=
_id`, It's not showing any responses. Is it expected?</p><p dir=3D"ltr">- I=
n this command `$ virtio-ivshmem-block /dev/uio0 /path/to/disk.image`, I am=
 not able to load the `virtio-ivshmem-block` module, and is the `disc.image=
` a standard `LinuxInstallation.img`?</p><p dir=3D"ltr">- For `virtio-ivshm=
em-block`, do I need to compile the `virtio-ivshmem-block.c` externally and=
 copy the module to the QEmulated Image?</p><p dir=3D"ltr">- Can we also us=
e the `queues/jailhouse` kernel for this setup instead of `queues/ivshmem2`=
?</p><br><p dir=3D"ltr">Please tell me if I am missing any Important steps.=
</p><br><p dir=3D"ltr">I am also attaching the Root cell and Non Root cell =
config files.</p><br><p dir=3D"ltr">Thanks and Regards,</p><p dir=3D"ltr">A=
nmol</p><br><p dir=3D"ltr">[1] https://github.com/siemens/jailhouse/blob/ma=
ster/Documentation/inter-cell-communication.md</p><p dir=3D"ltr">[2] https:=
//groups.google.com/g/jailhouse-dev/c/3xvC22mud-E/m/AFF665uxBAAJ</p><p dir=
=3D"ltr">[3] https://groups.google.com/g/jailhouse-dev/c/vYWIKp-Fw8w/m/1Nx5=
9bsQHwAJ</p><br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">On Thursday, July 29, 2021 at 7:42:58 PM UTC+5:30 Anmol wrote:<b=
r/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hello Sir,<div=
><br></div><div>Thank you for your response.<br><div><br></div><div></div><=
/div><div><div><p dir=3D"ltr">&gt; I would recommend to switch to 5.10 or q=
ueues/jailhouse as I&#39;m no longer</p><p dir=3D"ltr">&gt; updating 5.4 wi=
th potential fixes.</p><p dir=3D"ltr">&gt;</p></div></div><div><div><p dir=
=3D"ltr">It=E2=80=99s now working perfectly with the `queues/jailhouse` ker=
nel.=C2=A0</p></div></div><div><div><p dir=3D"ltr"><br></p><p dir=3D"ltr">&=
gt; &gt; - Any hints to get it working properly with the &quot;queues/jailh=
ouse&quot; branch.</p><p dir=3D"ltr">&gt;</p><p dir=3D"ltr">&gt; Is that fa=
iling cell your non-root Linux cell? I suppose it ran out of</p><p dir=3D"l=
tr">&gt; RAM. How much did you assign to it?</p><p dir=3D"ltr">&gt;</p><br>=
</div></div><div><div><p dir=3D"ltr">No, I was asking for the root cell.</p=
><p dir=3D"ltr">Also, we now have the working Jailhouse setup and `root cel=
l`, the problem we are now facing is related to `non-root linux` cell, we h=
ave used the `bzImage` and `rootfs.cpio`from `jailhouse-images` for booting=
 the `non-root-linux-cell`, and used the address for `low RAM` and `high RA=
M` w.r.t to the address spit out by the `jailhouse config create &lt;cell_c=
onfig_name&gt;` for the root cell.</p><p dir=3D"ltr">Error Log:</p><p dir=
=3D"ltr">$ nc localhost &lt;port&gt;</p><p dir=3D"ltr">Initializing Jailhou=
se hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 3</p><p dir=3D"ltr">Code l=
ocation: 0xfffffffff0000050</p><p dir=3D"ltr">Using xAPIC</p><p dir=3D"ltr"=
>Page pool usage after early setup: mem 49/975, remap 1/131072</p><p dir=3D=
"ltr">Initializing processors:</p><p dir=3D"ltr">=C2=A0CPU 3... (APIC ID 3)=
 OK</p><p dir=3D"ltr">=C2=A0CPU 1... (APIC ID 1) OK</p><p dir=3D"ltr">=C2=
=A0CPU 2... (APIC ID 2) OK</p><p dir=3D"ltr">=C2=A0CPU 0... (APIC ID 0) OK<=
/p><p dir=3D"ltr">Initializing unit: VT-d</p><p dir=3D"ltr">DMAR unit @0xfe=
d90000/0x1000</p><p dir=3D"ltr">Reserving 24 interrupt(s) for device ff:00.=
0 at index 0</p><p dir=3D"ltr">Initializing unit: IOAPIC</p><p dir=3D"ltr">=
Initializing unit: Cache Allocation Technology</p><p dir=3D"ltr">Initializi=
ng unit: PCI</p><p dir=3D"ltr">Adding PCI device 00:00.0 to cell &quot;Root=
Cell&quot;</p><p dir=3D"ltr">Adding PCI device 00:01.0 to cell &quot;RootCe=
ll&quot;</p><p dir=3D"ltr">Reserving 3 interrupt(s) for device 00:01.0 at i=
ndex 24</p><p dir=3D"ltr">Adding PCI device 00:02.0 to cell &quot;RootCell&=
quot;</p><p dir=3D"ltr">Reserving 3 interrupt(s) for device 00:02.0 at inde=
x 27</p><p dir=3D"ltr">Adding PCI device 00:03.0 to cell &quot;RootCell&quo=
t;</p><p dir=3D"ltr">Adding PCI device 00:04.0 to cell &quot;RootCell&quot;=
</p><p dir=3D"ltr">Reserving 2 interrupt(s) for device 00:04.0 at index 30<=
/p><p dir=3D"ltr">Adding PCI device 00:1b.0 to cell &quot;RootCell&quot;</p=
><p dir=3D"ltr">Reserving 1 interrupt(s) for device 00:1b.0 at index 32</p>=
<p dir=3D"ltr">Adding PCI device 00:1d.0 to cell &quot;RootCell&quot;</p><p=
 dir=3D"ltr">Adding PCI device 00:1d.1 to cell &quot;RootCell&quot;</p><p d=
ir=3D"ltr">Adding PCI device 00:1d.2 to cell &quot;RootCell&quot;</p><p dir=
=3D"ltr">Adding PCI device 00:1d.7 to cell &quot;RootCell&quot;</p><p dir=
=3D"ltr">Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;</p><p dir=
=3D"ltr">Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;</p><p dir=
=3D"ltr">Reserving 1 interrupt(s) for device 00:1f.2 at index 33</p><p dir=
=3D"ltr">Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;</p><p dir=
=3D"ltr">Page pool usage after late setup: mem 268/975, remap 65545/131072<=
/p><p dir=3D"ltr">Activating hypervisor</p><p dir=3D"ltr">Adding virtual PC=
I device 00:0c.0 to cell &quot;linux-x86-demo&quot;</p><p dir=3D"ltr">Addin=
g virtual PCI device 00:0d.0 to cell &quot;linux-x86-demo&quot;</p><p dir=
=3D"ltr">Adding virtual PCI device 00:0e.0 to cell &quot;linux-x86-demo&quo=
t;</p><p dir=3D"ltr">CPU 2 received SIPI, vector 9a</p><p dir=3D"ltr">CPU 3=
 received SIPI, vector 9a</p><p dir=3D"ltr">^C</p><br><p dir=3D"ltr">I have=
 attached the root cell and non-root cell configurations, please find attac=
hed.</p><p dir=3D"ltr">I also saw some patches related to `jailhouse debug =
console` in the recent update(5.14-rc2), could it be helpful in resolving t=
his issue?</p><p dir=3D"ltr"><br></p><p dir=3D"ltr">Thanks and Regards,</p>=
<p dir=3D"ltr">Anmol</p><div><br></div></div></div><div><br><div class=3D"g=
mail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, July 21, 2=
021 at 8:54:25 PM UTC+5:30 <a href data-email-masked rel=3D"nofollow">j.kis=
zka...@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Anmol,
<br>
<br>sorry for the very late reply.
<br>
<br>On 25.06.21 16:38, Anmol karn wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I am currently working on a GSoC&#39;21 project &quot;VirtIO-blk i=
mplementation
<br>&gt; with AGL on Jailhouse&quot;.
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
<br>&gt; to QEmulate it without kernel panics, but now it&#39;s showing som=
e unknown
<br>&gt; behaviors, and also not booting properly:
<br>&gt;=20
<br>&gt; Log:
<br>&gt; [=C2=A0 =C2=A0 0.007617] [Firmware Bug]: TSC_DEADLINE disabled due=
 to Errata;
<br>&gt; please update microcode to version: 0xb2 (or later)
<br>&gt; [=C2=A0 =C2=A0 0.525808] kvm: already loaded the other module
<br>&gt; [=C2=A0 =C2=A0 0.567138] hdaudio hdaudioC0D0: Unable to bind the c=
odec
<br>&gt;=20
<br>&gt; Automotive Grade Linux 11.91.0 qemux86-64 ttyS0
<br>&gt;=20
<br>&gt; qemux86-64 login: [=C2=A0 =C2=A027.731494] virtio_gpu virtio0: [dr=
m] *ERROR*
<br>&gt; fbdev: Failed to setup generic emulation (ret=3D-22)
<br>&gt; [=C2=A0 =C2=A027.841660] Out of memory: Killed process 161 (system=
d-udevd)
<br>&gt; total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:64kB oom_score_adj:0
<br>&gt;=20
<br>&gt; qemux86-64 login:=C2=A0
<br>&gt; qemux86-64 login:=C2=A0
<br>&gt; qemux86-64 login: root
<br>&gt;=20
<br>&gt; ^C^C^C^C^C
<br>&gt;=20
<br>&gt; [=C2=A0 236.927354] Out of memory: Killed process 167 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; [=C2=A0 437.781132] Out of memory: Killed process 166 (systemd-ude=
vd)
<br>&gt; total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UI=
D:0
<br>&gt; pgtables:64kB oom_score_adj:0
<br>&gt; [=C2=A0 457.378023] Out of memory: Killed process 170 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; [=C2=A0 516.062574] Out of memory: Killed process 171 ((agetty))
<br>&gt; total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID=
:0
<br>&gt; pgtables:48kB oom_score_adj:0
<br>&gt; QEMU 4.2.0 monitor - type &#39;help&#39; for more information
<br>&gt; (qemu) q
<br>&gt;=20
<br>&gt;=20
<br>&gt; Questions:=C2=A0
<br>&gt; - Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kern=
el
<br>&gt; with some patchset.
<br>
<br>I would recommend to switch to 5.10 or queues/jailhouse as I&#39;m no l=
onger
<br>updating 5.4 with potential fixes.
<br>
<br>&gt; - Any hints to get it working properly with the &quot;queues/jailh=
ouse&quot; branch.
<br>
<br>Is that failing cell your non-root Linux cell? I suppose it ran out of
<br>RAM. How much did you assign to it?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn%40googlegroups.co=
m</a>.<br />

------=_Part_1495_1777818906.1628706970771--

------=_Part_1494_415174606.1628706970771
Content-Type: text/x-csrc; charset=US-ASCII; name=agl-qemu-root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=agl-qemu-root-cell.c
X-Attachment-Id: 36e521a5-4dd2-4e5b-9dd7-0a0a65ab934f
Content-ID: <36e521a5-4dd2-4e5b-9dd7-0a0a65ab934f>

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

// For extending virtio-blk over IVSHMEM.
#define USE_VIRTIO_BLK
//#define USE_VIRTIO_NET
//#define USE_VIRTIO_CON
//#define USE_VIRTIO_DEMO

#ifdef USE_VIRTIO_BLK
# define BLK_MEM 4
# define BLK_PCI 1
#else
# define BLK_MEM 0
# define BLK_PCI 0
#endif

#ifdef USE_IVSHMEM_DEMO
# define DEMO_MEM 5
# define DEMO_PCI 1
#else
# define DEMO_MEM 0
# define DEMO_PCI 0
#endif

#ifdef USE_IVSHMEM_NET
# define NET_MEM 4
# define NET_PCI 1
#else
# define NET_MEM 0
# define NET_PCI 0
#endif

#ifdef USE_VIRTIO_CON
# define CON_MEM 4
# define CON_PCI 1
#else
# define CON_MEM 0
# define CON_PCI 0
#endif


#define COMM_MEM_REGIONS (BLK_MEM + DEMO_MEM + NET_MEM + CON_PCI)
#define COMM_PCI_REGIONS (BLK_PCI + DEMO_PCI + NET_MEM + CON_PCI)


#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[17 + COMM_MEM_REGIONS];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[15];
	struct jailhouse_pci_device pci_devices[13 + COMM_PCI_REGIONS];
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
			.name = "AGL-Jailhouse-RootCell",
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

#if defined USE_VIRTIO_BLK
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
#endif

#if defined(USE_VIRTIO_CON)
		/* IVSHMEM shared memory region (virtio-con back-end) */
		{
			.phys_start = 0x220e0000,
			.virt_start = 0x220e0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{
			.phys_start = 0x220e1000,
			.virt_start = 0x220e1000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{ 0 },
		{ 0 },
#endif

#if defined USE_IVSHMEM_DMEO
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
#endif

#if defined(USE_IVSHMEM_NET)
	       	/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x22100000, 0),
#endif

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
#if defined USE_VIRTIO_BLK
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .iommu = 1,
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
#endif

#if defined USE_VIRTIO_CON
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .iommu = 1,
                        .domain = 0x0,
                        .bdf = 0x0d << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
                        .num_msix_vectors = 3,
                        .shmem_regions_start = BLK_MEM, /* 0 + BLK_MEM */
                        .shmem_dev_id = 1,
                        .shmem_peers = 2,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
                                VIRTIO_DEV_CONSOLE,
                },
#endif

#if defined USE_IVSHMEM_DEMO
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
                        .domain = 0x0,
                        .bdf = 0x0e << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
                        .num_msix_vectors = 16,
                        .shmem_regions_start = BLK_MEM + CON_MEM,
                        .shmem_dev_id = 2,
                        .shmem_peers = 3,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },
#endif

#if defined USE_VIRTIO_NET
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .iommu = 1,
                        .domain = 0x0,
                        .bdf = 0x0f << 3,
                        .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
                        .num_msix_vectors = 2,
                        .shmem_regions_start = BLK_MEM + CON_MEM + DEMO_MEM,
                        .shmem_dev_id = 1,
                        .shmem_peers = 2,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
                },
#endif
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
 

------=_Part_1494_415174606.1628706970771
Content-Type: text/x-csrc; charset=US-ASCII; name=agl-linux-non-root-cell.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=agl-linux-non-root-cell.c
X-Attachment-Id: ee52d301-e550-4253-bc70-7acb6bc0b162
Content-ID: <ee52d301-e550-4253-bc70-7acb6bc0b162>

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

// For extending the virtio-blk over IVSHMEM.
#define USE_VIRTIO_BLK
//#define USE_VIRTIO_NET
//#define USE_VIRTIO_CON
//#define USE_VIRTIO_DEMO

#ifdef USE_VIRTIO_BLK
# define BLK_MEM 4
# define BLK_PCI 1
#else
# define BLK_MEM 0
# define BLK_PCI 0
#endif

#ifdef USE_IVSHMEM_DEMO
# define DEMO_MEM 5
# define DEMO_PCI 1
#else
# define DEMO_MEM 0
# define DEMO_PCI 0
#endif

#ifdef USE_IVSHMEM_NET
# define NET_MEM 4
# define NET_PCI 1
#else
# define NET_MEM 0
# define NET_PCI 0
#endif

#ifdef USE_VIRTIO_CON
# define CON_MEM 4
# define CON_PCI 1
#else
# define CON_MEM 0
# define CON_PCI 0
#endif

#define COMM_MEM_REGIONS (BLK_MEM + CON_MEM + NET_MEM + DEMO_PCI)
#define COMM_PCI_REGIONS (BLK_PCI + CON_PCI + NET_MEM + DEMO_PCI)

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_memory mem_regions[7 + COMM_MEM_REGIONS];
#else
	struct jailhouse_memory mem_regions[3 + COMM_MEM_REGIONS];
#endif
	struct jailhouse_cache cache_regions[1];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[2];
#ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
	struct jailhouse_pci_device pci_devices[1 + COMM_PCI_REGIONS];
#else
	struct jailhouse_pci_device pci_devices[COMM_PCI_REGIONS];
#endif
	struct jailhouse_pci_capability pci_caps[6];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "agl-linux-x86-demo",
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
#if defined USE_VIRTIO_BLK
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
#endif
#if defined USE_IVSHMEM_CON
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
#endif
#if defined USE_IVSHMEM_DEMO
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
#endif
#if defined USE_IVSHMEM_NET
		/* IVSHMEM shared memory regions (networking) */
		JAILHOUSE_SHMEM_NET_REGIONS(0x22100000, 1),
#endif
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
#if defined USE_VIRTIO_BLK
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			//.iommu = 1,
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
#endif
#if defined USE_IVSHMEM_CON
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			//.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0d << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = BLK_MEM, /* 0 + BLK_MEM */
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
				VIRTIO_DEV_CONSOLE,
		},
#endif
#if defined USE_IVSHMEM_DEMO
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			//.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0e << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = BLK_MEM + CON_MEM,
			.shmem_dev_id = 2,
			.shmem_peers = 3,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
#endif
#if defined USE_IVSHMEM_NET
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			//.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0f << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 2,
			.shmem_regions_start = BLK_MEM + CON_MEM + DEMO_MEM,
			.shmem_dev_id = 1,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
#endif
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

------=_Part_1494_415174606.1628706970771--
