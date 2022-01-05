Return-Path: <jailhouse-dev+bncBC653PXTYYERBB5O26HAMGQETOJSC6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE2F485757
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jan 2022 18:36:08 +0100 (CET)
Received: by mail-qt1-x840.google.com with SMTP id c7-20020ac80087000000b002c419378084sf30933662qtg.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jan 2022 09:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DXNDCnbdRV0qtjpbORCkKSlhshIRESeRSXQYTu2s2K4=;
        b=YnnwFXJ/6XyDpaBzB5YwpY+YQQqocbzLvD1pdnij9FnmbEDDcCVt/Nim6EwZwn31gQ
         GVB6QhAkIFUofxY8dX3h8f1x9tmlwi6ecCQ/tvKAy6rRmJ2MVTlkceQHVk1ZlVYJDLKO
         o5gkBkvJeHbWQy9p4RjbDptq8di5nZo4j6dai7k3j8WTK0iARjfhpKV3kDZnBt+vogjV
         VWCK0JCTWyuFzGZMXdPQEDmsyzhnot3JEsefOy8GotiK0C7y2TWVl31MWUG58PExD5L1
         8fmn2wAJJfM1qixHPmCn/MedI2ssy/bUJEz2C6zrpbWmFoHXa7XGdUXMo7CPdRz1JQtr
         whtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DXNDCnbdRV0qtjpbORCkKSlhshIRESeRSXQYTu2s2K4=;
        b=nUpEsFZJkqnrOJMIvNZ/L52VDFC4rUQj+c3JEmM0j6a8WrM71q8rncz6VIhw0UAZmo
         UzMAvLLnEc7zbqGxmDdxrh5jZ7pL4mFe9xUZ1/R2GxH05epnzRdvSV9x6HzZ12HYaeTJ
         KIt2Bcm1WLqg0P9LWJnsUG4+kcl213QLFVD0fnLog6zi8hBUs7oMGpGm0Nv25QdgkuFS
         ++Ez4gUZeQUD/TiSv1e07v6ywxtwp1msGIbyXoDY1gLNQ6pvpG7Q1xsrLILi4WsSg4Z2
         ZxQb1QmpkRVg1FkjAU0VPaCEtimDwdPVOBvcGgXAd/5fsCX5fourewb6AJBYxSbp4q6y
         DhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DXNDCnbdRV0qtjpbORCkKSlhshIRESeRSXQYTu2s2K4=;
        b=14dw5A2FU7CyyFlpTaMwnRLHlzlg3l57YaMEu0iP2DKlo94/7TEpR3yvzt+XWNUUP6
         6nuZwjUDSYw9lXjA1L5EAQmUNIa94eQtc79b30CG4xnZlv2QbaHYdFPh2OIT+ARya57w
         SNXinLj86xGxcUg/7vSflR4uTjyXpchzwv9xshtVT9Z10dE0w+w+ncAU5+kKsiBHfuMT
         m1EE8JhmyOTVA9mvJTwCp11NZmAG33qGIEnQI7NvPnSx53l87/891a+yKVfKLZRq0pFd
         6RFxGdCPbNsxSnaL+s7FYmZKkWq05jP8/B541RTcezQFk+1xVJxrBzpnR+RCo1sNn5lB
         J/iQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312dfhiNLjcoU43O+uLZgudZSICkBfIXA6x2+5UopQMUILtTra/
	zWdlSIbtQEfrvNhHJkDdDtA=
X-Google-Smtp-Source: ABdhPJxDOSt32LR2lIsj4xcL7/bdQVkvlilB8CWYylSteqWhQmDfOR00LUX+imlC54kfmDKwH0jicg==
X-Received: by 2002:a05:622a:1103:: with SMTP id e3mr49603694qty.378.1641404167453;
        Wed, 05 Jan 2022 09:36:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7f83:: with SMTP id z3ls22436333qtj.1.gmail; Wed, 05 Jan
 2022 09:36:07 -0800 (PST)
X-Received: by 2002:a05:622a:34a:: with SMTP id r10mr1227082qtw.454.1641404166680;
        Wed, 05 Jan 2022 09:36:06 -0800 (PST)
Date: Wed, 5 Jan 2022 09:36:06 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
In-Reply-To: <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
 <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
Subject: Re: Help Needed Regarding Virtio IVSHMEM
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_660_1158373646.1641404166102"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_660_1158373646.1641404166102
Content-Type: multipart/alternative; 
	boundary="----=_Part_661_1645246565.1641404166102"

------=_Part_661_1645246565.1641404166102
Content-Type: text/plain; charset="UTF-8"

Hi, 
I faced this problem on BCM2711 RPi4, my mistake was missing kernel 
configuration flags:
CONFIG_IVSHMEM_NET=y 
CONFIG_UIO_IVSHMEM=y 
So, if they are missing from your configuration, I advise you to see the 
defconfig from jailhouse-images. 
Moustafa Noufale

On Wednesday, 5 January 2022 at 16:49:32 UTC+1 anmol.k...@gmail.com wrote:

> Hi,
>
> Thank you for your response, that problem is now resolved, now I am facing 
> this issue:
>
> When executing(after `modprobe uio_ivshmem`):
> `
> ``
>
> root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
> ./virtio-ivshmem-console: cannot open /sys/class/uio/uio0/maps/map2/size: 
> No such file or directory
>
> ```
>
> I am facing the above issue, please let me know how should I resolve this?
>
> Thanks and Regards,
> Anmol
> On Wednesday, December 15, 2021 at 2:57:18 PM UTC+5:30 
> j.kiszka...@gmail.com wrote:
>
>> On 13.12.21 16:48, Anmol wrote: 
>> > Hi, 
>> > 
>> > I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(arm64) 
>> > board. 
>> > 
>> > Things I have prepared/setup: 
>> > -> Collected the patches of virtio-ivshmem from `queues/jailhouse-5.14` 
>> > and applied them to the `xilinx_rebase_v5.4`. 
>> > 
>> > These patches includes: 
>> >  - uio: Enable read-only mappings (with some modifications, as xilinx 
>> > `renamed uio.c -> uio_core.c & unified into uio.ko`) 
>> >         - WIP-ivshmem-Add-header-file 
>> >         - WIP-virtio-Add-virtio-over-ivshmem-transport-driver 
>> >         - WIP-uio-Add-driver-for-inter-VM-shared-memory-device 
>> >         - WIP-tools-Add-virtio-ivshmem-console-demo 
>> >         - WIP-tools-Add-virtio-ivshmem-block-demo 
>> >  - virtio: ivshmem: check peer_state early 
>> > 
>> > -> Cross-Compiled `virtio-ivshmem-{console, block}`. 
>> > -> Added common shared PCI devices to the root and non-root cell. 
>> > -> Root cell contains (`uio_ivshmem` driver) 
>> > -> I can see `/dev/uio0`. 
>> > -> Non-root cells contain (contain `virtio_ivshmem`). 
>> > 
>> > -> Also, after loading the jailhouse it's showing PCI devices I have 
>> added: 
>> > 
>> > ``` 
>> > Adding virtual PCI device 00:0c.0 to cell "ZynqMP-ZCU102" 
>> > Adding virtual PCI device 00:0d.0 to cell "ZynqMP-ZCU102" 
>> > 
>> > ``` 
>> > 
>> > After testing it, I am getting this(even after cross compiling the 
>> > application):, 
>> > 
>> > root:~# ./virtio-ivshmem-console /dev/uio0 disk.img 
>> > -sh: ./virtio-ivshmem-console: cannot execute binary file: Exec format 
>> error 
>> > 
>> > I am a little confused here, please let me know about anything I am 
>> missing. 
>> > 
>>
>> Double-check with "file virtio-ivshmem-console" if that binary is really 
>> of the right type. Also use "ldd virtio-ivshmem-console" on the target 
>> to see if it lacks some dependencies there (due to mismatch in 
>> toolchains). 
>>
>> Jan 
>>
>> -- 
>> Siemens AG, T RDA IOT 
>> Corporate Competence Center Embedded Linux 
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04690e24-6aed-4856-aa81-f56f493821e0n%40googlegroups.com.

------=_Part_661_1645246565.1641404166102
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<div>I faced this problem on BCM2711 RPi4, my mistake was missing =
kernel configuration flags:<br>CONFIG_IVSHMEM_NET=3Dy&nbsp;<div>
CONFIG_UIO_IVSHMEM=3Dy&nbsp;</div><div>So, if they are missing from your co=
nfiguration, I advise you to see the defconfig from jailhouse-images.&nbsp;=
<br>Moustafa Noufale<br><br></div></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Wednesday, 5 January 2022 at 16:49:32 UTC=
+1 anmol.k...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote" =
style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pa=
dding-left: 1ex;"><div>Hi,<br><br>Thank you for your response, that problem=
 is now resolved, now I am facing this issue:<br><br>When executing(after `=
modprobe uio_ivshmem`):<br>`</div><div>``</div><div><br>root:~# ./virtio-iv=
shmem-console /dev/uio0 disk.img<br></div><div>./virtio-ivshmem-console: ca=
nnot open /sys/class/uio/uio0/maps/map2/size: No such file or directory<br>=
<br></div><div>```</div><div><br>I am facing the above issue, please let me=
 know how should I resolve this?<br><br>Thanks and Regards,<br>Anmol<br></d=
iv><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Wed=
nesday, December 15, 2021 at 2:57:18 PM UTC+5:30 <a href data-email-masked =
rel=3D"nofollow">j.kiszka...@gmail.com</a> wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 13.12.21 16:48, Anmol wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(a=
rm64)
<br>&gt; board.
<br>&gt;=20
<br>&gt; Things I have prepared/setup:
<br>&gt; -&gt; Collected the patches of virtio-ivshmem from `queues/jailhou=
se-5.14`
<br>&gt; and applied them to the `xilinx_rebase_v5.4`.
<br>&gt;=20
<br>&gt; These patches includes:
<br>&gt; =C2=A0- uio: Enable read-only mappings (with some modifications, a=
s xilinx
<br>&gt; `renamed uio.c -&gt; uio_core.c &amp; unified into uio.ko`)
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-ivshmem-Add-header-file
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-virtio-Add-virtio-over-ivshmem-t=
ransport-driver
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-uio-Add-driver-for-inter-VM-shar=
ed-memory-device
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-tools-Add-virtio-ivshmem-console=
-demo
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - WIP-tools-Add-virtio-ivshmem-block-d=
emo
<br>&gt; =C2=A0- virtio: ivshmem: check peer_state early
<br>&gt;=20
<br>&gt; -&gt; Cross-Compiled `virtio-ivshmem-{console, block}`.
<br>&gt; -&gt; Added common shared PCI devices to the root and non-root cel=
l.
<br>&gt; -&gt; Root cell contains (`uio_ivshmem` driver)
<br>&gt; -&gt; I can see `/dev/uio0`.
<br>&gt; -&gt; Non-root cells contain (contain `virtio_ivshmem`).
<br>&gt;=20
<br>&gt; -&gt; Also, after loading the jailhouse it&#39;s showing PCI devic=
es I have added:
<br>&gt;=20
<br>&gt; ```
<br>&gt; Adding virtual PCI device 00:0c.0 to cell &quot;ZynqMP-ZCU102&quot=
;
<br>&gt; Adding virtual PCI device 00:0d.0 to cell &quot;ZynqMP-ZCU102&quot=
;
<br>&gt;=20
<br>&gt; ```
<br>&gt;=20
<br>&gt; After testing it, I am getting this(even after cross compiling the
<br>&gt; application):,
<br>&gt;=20
<br>&gt; root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
<br>&gt; -sh: ./virtio-ivshmem-console: cannot execute binary file: Exec fo=
rmat error
<br>&gt;=20
<br>&gt; I am a little confused here, please let me know about anything I a=
m missing.
<br>&gt;=20
<br>
<br>Double-check with &quot;file virtio-ivshmem-console&quot; if that binar=
y is really
<br>of the right type. Also use &quot;ldd virtio-ivshmem-console&quot; on t=
he target
<br>to see if it lacks some dependencies there (due to mismatch in toolchai=
ns).
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/04690e24-6aed-4856-aa81-f56f493821e0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/04690e24-6aed-4856-aa81-f56f493821e0n%40googlegroups.co=
m</a>.<br />

------=_Part_661_1645246565.1641404166102--

------=_Part_660_1158373646.1641404166102--
