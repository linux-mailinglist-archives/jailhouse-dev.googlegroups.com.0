Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBDP422HAMGQEVHNQNVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F348562F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jan 2022 16:49:34 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id y24-20020a37e318000000b0047687b4d282sf16082539qki.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jan 2022 07:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9FnFfyLllBxoVdFB0e1LHtzLATqgYjswpk6aXS5WMoI=;
        b=s5Bq53fQxezI11xVkxNSsOzFOvc+56/4JjVWZaDdQpD7qeBjfM7RmjzV5gF6IlCeOq
         kQCPVKtasmjXUEfwTAyGNp+J26KUVIRfBF1wWPzeHsmjDAAO8Kvp4fh+cyzMGbNPrQW1
         NyrM+K0dWekjhBEVmHHwD/HBXYwFFdPJ8djNEFr6EzCceYii84NklLVmWl/TlE4mr2C3
         JM1pUgqCCBF4DuS+n4dPaB+1si7oSujs1NOebBQaWlhnPBy42x1xi9mlaEQo0rCvNNhV
         Q/S1O2lWXj4MR6WjLVZubYymjtMa1Su0NKA4R06WVUrVBZm316znD6nh1MqQW34COaoO
         CGeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9FnFfyLllBxoVdFB0e1LHtzLATqgYjswpk6aXS5WMoI=;
        b=kXHSY5ACH+MGwhR2O+oXPeLkuuugiU/GjNht3c9ofstkue5ksH9dGyxbyaFKwv1u33
         wEh2xXAVU1DqysYRNiLLQ77h/FunBIWFzOu8d+exqk855jOOL2EZyTenrMaFCu78BYsC
         AedQh17DNAko6/Gov1/cJPBi8iixhBWNgj9MO0/wKa+VXXy92HFMwOfpY+lfanmNJlXA
         pelPRnAUWcfRIm/o/pUBw2cucZzSgt6SzdR/TEI65CHTM1LYTCRy+89XbhMxPMwkKS+Q
         k3hAueaDNsdz+PdU3lM4R1rdmRPv6a/NYk6W2rlPQOba2IHIJqKSRfE3dLBR0QOVeJnc
         o5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9FnFfyLllBxoVdFB0e1LHtzLATqgYjswpk6aXS5WMoI=;
        b=1XlEWw5pc37zC1qW/D8KJBiWbsCNZJpZSmSfQdHKZ9+Uz8TTPQhSKosL6jJTSI2/JE
         ZMr9MyoH7hyUTCrX4M8GF76t5tFRz2bj1dtttDbhOStDMaeTCiFPblmH8JDH217qaiLe
         W2YHq99ZSKi5b0vNlgq8cmvTTgrAKLs5uN34Q6ILmlqzjPJxYfUPQ9KD8deEb+Gxfosy
         tdBTj06TSCYwUkiDn7tBJgQJXWTv+N3GYRMemebOJVFGNrfRA5vvZG0k0LwXGnAEzWe6
         p17RmZyqZIMsy9YjLLvmi1qsvNf8BjGHkKR8XggRqfkNjNKJF2fk3mB2aDbopn1bXs3T
         pu+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HJymd0JSYoE/41UIOpGn51MdJs4idsYCK3vHPcK899K7mLLly
	bAXaw0OsQFV54vM2VEmbRw4=
X-Google-Smtp-Source: ABdhPJzVNiFMOQ/wCUd+GRCseZhWhP4gRJ2z9J7xC5+OZ/HuotkUsEXQjkyLicG1qlqQzd+JUCEVEQ==
X-Received: by 2002:a05:620a:25c8:: with SMTP id y8mr37979621qko.3.1641397773755;
        Wed, 05 Jan 2022 07:49:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:ca90:: with SMTP id a16ls17886026qvk.7.gmail; Wed, 05
 Jan 2022 07:49:33 -0800 (PST)
X-Received: by 2002:a05:6214:c65:: with SMTP id t5mr50677848qvj.111.1641397772973;
        Wed, 05 Jan 2022 07:49:32 -0800 (PST)
Date: Wed, 5 Jan 2022 07:49:32 -0800 (PST)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
In-Reply-To: <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
Subject: Re: Help Needed Regarding Virtio IVSHMEM
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_40763_940928465.1641397772349"
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

------=_Part_40763_940928465.1641397772349
Content-Type: multipart/alternative; 
	boundary="----=_Part_40764_395312793.1641397772349"

------=_Part_40764_395312793.1641397772349
Content-Type: text/plain; charset="UTF-8"

Hi,

Thank you for your response, that problem is now resolved, now I am facing 
this issue:

When executing(after `modprobe uio_ivshmem`):
`
``
root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
./virtio-ivshmem-console: cannot open /sys/class/uio/uio0/maps/map2/size: 
No such file or directory

```

I am facing the above issue, please let me know how should I resolve this?

Thanks and Regards,
Anmol
On Wednesday, December 15, 2021 at 2:57:18 PM UTC+5:30 
j.kiszka...@gmail.com wrote:

> On 13.12.21 16:48, Anmol wrote:
> > Hi,
> > 
> > I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(arm64)
> > board.
> > 
> > Things I have prepared/setup:
> > -> Collected the patches of virtio-ivshmem from `queues/jailhouse-5.14`
> > and applied them to the `xilinx_rebase_v5.4`.
> > 
> > These patches includes:
> >  - uio: Enable read-only mappings (with some modifications, as xilinx
> > `renamed uio.c -> uio_core.c & unified into uio.ko`)
> >         - WIP-ivshmem-Add-header-file
> >         - WIP-virtio-Add-virtio-over-ivshmem-transport-driver
> >         - WIP-uio-Add-driver-for-inter-VM-shared-memory-device
> >         - WIP-tools-Add-virtio-ivshmem-console-demo
> >         - WIP-tools-Add-virtio-ivshmem-block-demo
> >  - virtio: ivshmem: check peer_state early
> > 
> > -> Cross-Compiled `virtio-ivshmem-{console, block}`.
> > -> Added common shared PCI devices to the root and non-root cell.
> > -> Root cell contains (`uio_ivshmem` driver)
> > -> I can see `/dev/uio0`.
> > -> Non-root cells contain (contain `virtio_ivshmem`).
> > 
> > -> Also, after loading the jailhouse it's showing PCI devices I have 
> added:
> > 
> > ```
> > Adding virtual PCI device 00:0c.0 to cell "ZynqMP-ZCU102"
> > Adding virtual PCI device 00:0d.0 to cell "ZynqMP-ZCU102"
> > 
> > ```
> > 
> > After testing it, I am getting this(even after cross compiling the
> > application):,
> > 
> > root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
> > -sh: ./virtio-ivshmem-console: cannot execute binary file: Exec format 
> error
> > 
> > I am a little confused here, please let me know about anything I am 
> missing.
> > 
>
> Double-check with "file virtio-ivshmem-console" if that binary is really
> of the right type. Also use "ldd virtio-ivshmem-console" on the target
> to see if it lacks some dependencies there (due to mismatch in toolchains).
>
> Jan
>
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/99945765-6ae6-4efb-9fd2-bc9a461414edn%40googlegroups.com.

------=_Part_40764_395312793.1641397772349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br><br>Thank you for your response, that problem is now resolved, =
now I am facing this issue:<br><br>When executing(after `modprobe uio_ivshm=
em`):<br>`</div><div>``<br>root:~# ./virtio-ivshmem-console /dev/uio0 disk.=
img<br>./virtio-ivshmem-console: cannot open /sys/class/uio/uio0/maps/map2/=
size: No such file or directory<br><br></div><div>```</div><div><br>I am fa=
cing the above issue, please let me know how should I resolve this?<br><br>=
Thanks and Regards,<br>Anmol<br></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Wednesday, December 15, 2021 at 2:57:18 P=
M UTC+5:30 j.kiszka...@gmail.com wrote:<br/></div><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">On 13.12.21 16:48, Anmol wrote:
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
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/99945765-6ae6-4efb-9fd2-bc9a461414edn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/99945765-6ae6-4efb-9fd2-bc9a461414edn%40googlegroups.co=
m</a>.<br />

------=_Part_40764_395312793.1641397772349--

------=_Part_40763_940928465.1641397772349--
