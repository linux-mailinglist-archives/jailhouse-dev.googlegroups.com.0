Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDGXQWEAMGQEADGROXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D33D90C6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Jul 2021 16:37:01 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id a25-20020a05600c2259b02902540009f03csf282823wmm.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Jul 2021 07:37:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627483021; cv=pass;
        d=google.com; s=arc-20160816;
        b=qvt6jK/23tWYHn7kbCQqax1wN0LmfT7H3p8gRkzQ7VlsZri6zMAuUNl8Qicj0CF3Ko
         ximhul1oxNvpOlJXplTggX/XudNu3le8sFcAXHV06fjIkPrb3GwLjBQmJGdCn+FH4En7
         pgdQeMJBh5Ql2fEE/89BU/t+cUQ25l9AvqGkJfQDKneirl4qnGlglV6zCUx7Qm6K95Lc
         kWhfbenwvesYu5t0yvg6tB91xLTNGeZHAIvZSoaaWxqhrpbV0Xstq+Sjkb3uMtv750Lv
         vL+UMOKSU8EwmNQtMjfu5W/TQkHmDrZHJ9YxXEoxS31mH7nrq8UpshWPQJ7SHn2MM9BO
         rmqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=nfNqEfxD4lP7Rl25Tz5zDk/SrFiW/PJy31Bk0Syoih8=;
        b=Ifl94lhpSDozAJooMBMr0jQzyXtEqByqLSpzQoBxdlVzaJW49k+nSx4NY4CEM5Tisd
         ORFeYAgn/6fmU976mYbdyedoEysJugyjpPTs3CAK2D3WNsYDrnKGQPR4boWGWNdOvuGH
         NmHLvQRFZCiqq0Wwuct3m/KctCN0zFnVTDtCrLcaqQ+EtaWMmhIFT//CL7mkmFCjlFee
         KknfBb9Lqyqg9ny9EX/jeZOP2DListul450DjcanYCzeUa/JpdGaGmY19bQjuteyBxyU
         fTYXspfudiLT0Qni0zgW6PDpFwY+dQJTdLYn9qMgFDc1Xeiv3Ot6t6xNP67e2Gv392V6
         QrPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nfNqEfxD4lP7Rl25Tz5zDk/SrFiW/PJy31Bk0Syoih8=;
        b=D///p6piQDTsCD9r3bX7H5Qc1I+rmA6cJf/uTVPG2+/XTt0OwyCapSS3KM7hxNhJtG
         Cz4eXdJr1siH+CJh/WNOeC/R4BIGiWdRMC98UGWtIv+WYyXp9rI7IRuVEXrZBSieFggv
         7cp4ULBoZJnSP4vpmW0TdgQxb55V4/qgo6Vq3AXaGqJoBDiI7gqTE8yH9A/tIdsWpQbL
         OXFFMopBessLraaiDvgbHo12xOdXCgOW5e0W8+dgJDLnKdk1A2ePsAwHRMTifz2zTfhi
         JmUNuQx2t7OxmnLRJK0ep6pm5k2EulLCqlw30lwDujxpXWaejHOIeRNllO/v9ChA05u/
         EGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nfNqEfxD4lP7Rl25Tz5zDk/SrFiW/PJy31Bk0Syoih8=;
        b=PUDQWW3bqsotWnKTw+MBkQ6isjyp9rG8mOsiK6XAyk6it1Qa9VPd/8s5ZcjGCa4TZj
         BnASq2bqJJ6ONriRxLQVw28nVYJPpcra6aKIC8onQ1hMg0P+2TLWoNIs0OLcgthup0no
         ENRfF7UQ/BBOLa/SHh3cAbhjntrlKQeo9afApqfKo0wnlR79VajDoNPwaUIrR/xfYT0i
         +E+tJP1Xv//OZ7Ux8QqF+yFow21ZkQjx5c7ub0tdlm593h0qEGf06OXQOdGNypAVOMvW
         YpH4S48y90+S4IwyVv9oak9bjJ8HDd6VvX/Y9bT3Hhny3jJu5zDiWjsILYCe1EVRwLvL
         w7mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UsG14w8KAM/3pL8dSCP9to6zxImjshcwZ3Yo6FlNZQAer0Ie4
	7kgMxO0g2IP2JXvG1KJxccY=
X-Google-Smtp-Source: ABdhPJw0QCMrnn1QExURU9+RKx63Ij1z6UxRXT5tMII+asuHIiGodAV/3Drh/Q5XumG5qjWShTsmRg==
X-Received: by 2002:a7b:c00a:: with SMTP id c10mr9766900wmb.100.1627483021151;
        Wed, 28 Jul 2021 07:37:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a141:: with SMTP id r1ls319998wrr.3.gmail; Wed, 28 Jul
 2021 07:36:59 -0700 (PDT)
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr30897223wrt.425.1627483019869;
        Wed, 28 Jul 2021 07:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627483019; cv=none;
        d=google.com; s=arc-20160816;
        b=jeBlYa0S/Hr9673slAN++u/3DA9AaE1Q6uWv1YOdI6Ihtf49t2I8xCzDKOS/DPCfyB
         9jY7VAqFc14o3LunwrjX8J+Sxrt9yzaPfu5A6l8pQE07ijWgVouPQW0z0jUARpb/vS1o
         VJju3RaXBvNz0ULXOuH7RAd9k9Fudy0XUef1qZAixMXwdaCp1dmEFYCsF/D+YT9C/CB2
         Sf8gI7zKi1uVoReCxTovM0UI+5Tq9TEhC/jAgkR5sJ1ZnhDZkHOlWCt3KUniPsDV7Te1
         WWBh4SdINMUiibpP6gB0P2zS/STWZRuCw9oEDeVKLEQnRIexzB8Sh5Q8YxcK8qTAmEbj
         XIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Ukcz3PcnJj/cmns1zhKFb08E+7dRcN/qBZmO1VfwAV8=;
        b=y+pdYq/C/znnv+SqrDvUi0tntIIhGHlQ1CpqeAqmS1TQ11CzflAkMHcXJqZEwVXBfD
         EB8J2a6ELpeE+Hcd7vpdBlJmXKWfWxsqbxlaCFD9asdAuk4gShZlLOzrBjNDAz++v17I
         LbFIm2MHFONVNCcGy8wHNwbNY2sahbZIBHTEQlLx9/mnXV837SbrcKPhynbURSioK3g/
         f4rYrc8p2+PvZiFgTaVCu0Nw0Vw2H2KpSvgQHM7gjECDSV9Ei9FjZe/80qMGjePVIOxu
         P0OAJ0cmJKv9WUYsCYvcTLTt4tvykNHpBnfOfbYH1sMcNMsoZLnyyenNQuGm5SIa85x2
         WDBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g145si383470wmg.1.2021.07.28.07.36.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jul 2021 07:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 16SEawtt003590
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jul 2021 16:36:58 +0200
Received: from [167.87.33.191] ([167.87.33.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16SEavdk021627;
	Wed, 28 Jul 2021 16:36:58 +0200
Subject: Re: Ivshmem-demo: root cell failed to receive interrupts
To: Huang Shihua <shihuahuang94@gmail.com>
Cc: Huang Shihua <shihua.huang@prodrive-technologies.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
 <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com>
 <6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn@googlegroups.com>
 <2d2c72b6-cae0-e210-8db2-630b33180335@siemens.com>
 <CAPKBGcn=m5f_3RGzhZ+=BF9_-v-SAN8y=xOCk5Zf8RgEm7Jz_Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <33d2aa37-d2b1-24da-5e1e-ed1eddd80239@siemens.com>
Date: Wed, 28 Jul 2021 16:36:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPKBGcn=m5f_3RGzhZ+=BF9_-v-SAN8y=xOCk5Zf8RgEm7Jz_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 28.07.21 14:10, Huang Shihua wrote:
>=20
>=20
> On Mon, Jul 26, 2021 at 8:08 PM Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     On 26.07.21 19:14, Huang Shihua wrote:
>     >
>     >
>     > On Wednesday, 21 July 2021 at 17:50:53 UTC+2 j.kiszka...@gmail.com
>     <mailto:j.kiszka...@gmail.com> wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0On 13.07.21 18:09, Huang Shihua wrote:
>     >=C2=A0 =C2=A0 =C2=A0> HI,
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Currently, I'm trying to run the ivshmem-demo =
to establish
>     >=C2=A0 =C2=A0 =C2=A0communication
>     >=C2=A0 =C2=A0 =C2=A0> between Linux root cell and one non-root cell.=
 Configuration
>     files
>     >=C2=A0 =C2=A0 =C2=A0are
>     >=C2=A0 =C2=A0 =C2=A0> attached.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Two cases were tested:
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> 1. Let the non-root cell load the ivshmem-demo=
 and then
>     target at
>     >=C2=A0 =C2=A0 =C2=A0> itself (target=3D1). _All interrupts can be se=
nt and received
>     >=C2=A0 =C2=A0 =C2=A0correctly_.
>     >=C2=A0 =C2=A0 =C2=A0> 2. Let the root cell and the non-root cell sen=
d interrupts
>     to each
>     >=C2=A0 =C2=A0 =C2=A0> other. I.e., root cell runs=C2=A0/./tools/demo=
s/ivshmem-demo -t
>     1, /while
>     >=C2=A0 =C2=A0 =C2=A0> the non-root cell load /inmates/demos/x86/ivsh=
mem-demo.bin -s
>     >=C2=A0 =C2=A0 =C2=A0> "target=3D0" -a 0x1000 /and then run. The resu=
lt turned out to
>     be,=C2=A0
>     >=C2=A0 =C2=A0 =C2=A0> * the non-root cell got the interrupts from th=
e root cell,
>     >=C2=A0 =C2=A0 =C2=A0> * _while the root cell did not receive any int=
errupt._
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> As Jan mentioned
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0
>     =C2=A0in=C2=A0https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8=
/m/ht8z51BOCgAJ
>     <https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCg=
AJ>
>     >=C2=A0 =C2=A0
>     =C2=A0<https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z=
51BOCgAJ
>     <https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCg=
AJ>>,
>     >
>     >=C2=A0 =C2=A0 =C2=A0> tuning the iommu index should do the trick.
>     >=C2=A0 =C2=A0 =C2=A0> However, unfortunately, it did not work for me=
 :c
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> There are 8 iommu units on the hardware, I tun=
ed the iommu index
>     >=C2=A0 =C2=A0 =C2=A0in the
>     >
>     >=C2=A0 =C2=A0 =C2=A0Wow, 8 units...
>     >
>     >=C2=A0 =C2=A0 =C2=A0> root cell configuration from 0 to 7. The same =
behavior, no
>     interrupts
>     >=C2=A0 =C2=A0 =C2=A0> were received by the root cell, remains when t=
uning the
>     index from
>     >=C2=A0 =C2=A0 =C2=A00 to
>     >=C2=A0 =C2=A0 =C2=A0> 6. When the iommu is set to 7, the kernel cras=
hed
>     immediately when
>     >=C2=A0 =C2=A0 =C2=A0the
>     >=C2=A0 =C2=A0 =C2=A0> demo was started on the non-root cell.=C2=A0
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Any idea regarding why the root cell always fa=
iled to receive
>     >=C2=A0 =C2=A0 =C2=A0interrupts?
>     >
>     >=C2=A0 =C2=A0 =C2=A0This may require in-detail debugging. For that, =
you would have to
>     >=C2=A0 =C2=A0 =C2=A0instrument the hypervisor along its virtual IRQ =
injection
>     path. That
>     >=C2=A0 =C2=A0 =C2=A0starts in ivshmem_trigger_interrupt() (hyperviso=
r/ivshmem.c). The
>     >=C2=A0 =C2=A0 =C2=A0sending side will call it on writing the doorbel=
l registers. Check
>     >=C2=A0 =C2=A0 =C2=A0along
>     >=C2=A0 =C2=A0 =C2=A0this call path if conditions to actually send th=
e IRQ are not met.
>     >
>     >=C2=A0 =C2=A0 =C2=A0If all are met, the hypervisor sends an IPI to a=
 target cell
>     CPU (will
>     >=C2=A0 =C2=A0 =C2=A0be directly delivered to the guest) that should =
cause the
>     normal IRQ
>     >=C2=A0 =C2=A0 =C2=A0processing there. But usually, we do not get so =
far in such cases.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Another function of interest here is
>     arch_ivshmem_update_msix() when
>     >=C2=A0 =C2=A0 =C2=A0called for the root cell while it defines where =
ivshmem IRQs
>     should go
>     >=C2=A0 =C2=A0 =C2=A0to. Possibly, Jailhouse decides that the program=
ming Linux
>     issued is
>     >=C2=A0 =C2=A0 =C2=A0not
>     >=C2=A0 =C2=A0 =C2=A0valid and therefore leaves the irq_cache that
>     >=C2=A0 =C2=A0 =C2=A0arch_ivshmem_trigger_interrupt() uses invalid. Y=
ou can also
>     check that
>     >=C2=A0 =C2=A0 =C2=A0via instrumentations (printk).=C2=A0
>     >
>     >
>     > Indeed, when .iommu is assigned as 0,1,..6,=C2=A0 irq_cache is inva=
lid.
>     I suspect
>     > the reason is that their correpsonding VT-d interrupt remappting ta=
ble
>     > entries
>     > are not for ivshmem devices, i.e., unmatched device ID.
>     > When .iommu is tuned to 7, irq_cache becomes valid.
>     >
>=20
>     OK, then we know what needs to be set. I will have to check eventuall=
y
>     if we can read out that information also from sysfs so that this
>     guessing can end.
>=20
>     > (BTW, as I mentioned before, the kernel crashed immediately when th=
e
>     > demo was started on the non-root cell. _One missing detail here
>     is_, on the=C2=A0
>     > root-cell side,=C2=A0 ./tools/demos/ivshmem-demo is running/has run=
, i.e.,=C2=A0
>     > init_control has been set to 1. If ./tools/demos/ivshmem-demo=C2=A0=
has
>     not been
>     > run on the root cell yet, then starting the demo on the non-root ce=
ll
>     > will not
>     > kill the kernel.)
>=20
>     Now we need to understand the crash. The root cell kernel oopses, rig=
ht?
>     Any logs from that?
>=20
> =C2=A0
> Activating hypervisor
> CAT: Using COS 0 with bitmask 000007ff for cell ivshmem-demo
> Adding virtual PCI device 00:0e.0 to cell "ivshmem-demo"
> Shared memory connection established, peer cells:
> =C2=A0"RootCell"
> Created cell "ivshmem-demo"
> Page pool usage after cell creation: mem 938/3534, remap 65603/131072
> Cell "ivshmem-demo" can be loaded
> CPU 1 received SIPI, vector 100
> Started cell "ivshmem-demo"
> IVSHMEM: Found device at 00:0e.0
> IVSHMEM: bar0 is at 0x00000000ff000000
> IVSHMEM: bar1 is at 0x00000000ff001000
> IVSHMEM: ID is 1
> IVSHMEM: max. peers is 3
> IVSHMEM: state table is at 0x000000003f0f0000
> IVSHMEM: R/W section is at 0x000000003f0f1000
> IVSHMEM: input sections start at 0x000000003f0fa000
> IVSHMEM: output section is at 0x000000003f0fc000
> IVSHMEM: initialized device
> state[0] =3D 0
> state[1] =3D 2
> state[2] =3D 0
> rw[0] =3D -1347440721
> rw[1] =3D 0
> rw[2] =3D -1347440721
> in@0x0000 =3D -1347440721
> in@0x2000 =3D 0
> in@0x4000 =3D -1347440721
>=20
> IVSHMEM: sending IRQ 2 to peer 2
>=20
> IVSHMEM: sending IRQ 2 to peer 2
> <---------- ./tools/demos/ivshmem-demo -t 1 (root cell)
> IVSHMEM: got interrupt 0 (#1)
> state[0] =3D 0
> state[1] =3D 2
> state[2] =3D 3
> rw[0] =3D -1347440721
> rw[1] =3D 0
> rw[2] =3D 0
> in@0x0000 =3D -1347440721
> in@0x2000 =3D 0
> in@0x4000 =3D 0
>=20
> IVSHMEM: sending IRQ 2 to peer 2
> FATAL: Unhandled VM-Exit, reason 26

Root cell is issuing a VMXOFF instruction - could come from
cpu_emergency_vmxoff().

> qualification 0
> vectoring info: 0 interrupt info: 0
> RIP: 0xffffffff8d05f6ae RSP: 0xffffafa9c0003fc0 FLAGS: 2

That RIP is likely pointing to that function in the kernel. But we
rather need a backtrace. Please try CONFIG_CRASH_CELL_ON_PANIC (see
Documentation/hypervisor-configuration.md).

> RAX: 0x00000000007626f0 RBX: 0x0000000000000000 RCX: 0x000000007ffefbff
> RDX: 0x00000000bfebfbff RSI: 0xffffafa9c0003fc8 RDI: 0xffffafa9c0003fc4
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000001fbd80a004 CR4: 0x00000000007626f0
> EFER: 0x0000000000000d01
> Parking CPU 0 (Cell: "RootCell")
>=20
> IVSHMEM: sending IRQ 2 to peer 2
> Ignoring NMI IPI to CPU 0
> Ignoring NMI IPI to CPU 2
> Ignoring NMI IPI to CPU 3
> Ignoring NMI IPI to CPU 5
> Ignoring NMI IPI to CPU 6
> Ignoring NMI IPI to CPU 7
> Ignoring NMI IPI to CPU 8
> Ignoring NMI IPI to CPU 9
> Ignoring NMI IPI to CPU 10
> Ignoring NMI IPI to CPU 11
> Ignoring NMI IPI to CPU 12
> Ignoring NMI IPI to CPU 13
> Ignoring NMI IPI to CPU 14
> Ignoring NMI IPI to CPU 15
>=20
> IVSHMEM: sending IRQ 2 to peer 2
> =C2=A0
>=20
>=20
>     And what do yo mean with init_control?
>=20
>=20
> oops, typo, should be int_control...=C2=A0
> the int_control of struct ivshm_regs in ivshmem-demo/c
> struct ivshm_regs {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t id;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t max_peer;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t int_control;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.....
> }
> _so when root cell mimo_write 1 to regs->int_control while non-root cell
> has been running, then the kernel crashes._
>=20

That write opens the gate of ivshmem interrupts for the root cell.

>=20
>     >
>     > To avoid the kernel crashing situation, I only ran the demo on the
>     > non-root cell. With .iommu being set validly, I will expect at leas=
t
>     > seeing the
>     > interrupt count increases,=C2=A0 when=C2=A0grep ivshmem /proc/inter=
rupts.
>     > But nope, _still no interrupts received on the root cell_.
>     >
>=20
>     If there is no driver registered on the root side or not opened (by t=
he
>     demo app), then the interrupt reception is disabled. We need to debug
>     the "hot" case.
>=20
>=20
> Right, after diving into the source code, I did see that as when
> ive->int_ctrl_reg=3D0,
> no interrupt will be triggered, i.e., arch_ivshmem_trigger_interrupt is
> skipped.
>=20
> I have a question regarding the code below.
> static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
> =C2=A0 =C2=A0 =C2=A0unsigned int vector)
> {
>=20
>     /*
>     * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
>     * and ivshmem_register_mmio can synchronize on the completion of the
>     * delivery.
>     */
>     spin_lock(&ive->irq_lock);
>=20
>=20
>     if (ive->int_ctrl_reg & IVSHMEM_INT_ENABLE) {
>=20
>         if (ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &
>=20
>             =C2=A0 =C2=A0IVSHMEM_CFG_ONESHOT_INT)
>=20
>             ive->int_ctrl_reg =3D 0;
>=20
>=20
>         arch_ivshmem_trigger_interrupt(ive, vector);
>=20
>     }
>=20
>=20
>     spin_unlock(&ive->irq_lock);
>=20
> }
>=20
> Q1: IVSHMEM_CFG_ONESHOT_INT means?
> Q2: What does meeting this condition mean,
> ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] & IVSHMEM_CFG_ONESHOT_INT?=20
> Q3: Why trigger_interrupt when=C2=A0ive->int_ctrl_reg =3D 0?

See Documentation/ivshmem-v2-specification.md, "one-shot interrupt mode".

> Q4: I tried to add "else" a line above=C2=A0arch_ivshmem_trigger_interrup=
t,
> i.e.,=C2=A0 arch_ivshmem_trigger_interrupt is skipped when=C2=A0
>=20

"./tools/demos/ivshmem-demo -t 1 was executed on the root cell, thus no
kernel crash,
non-root can later receive interrupt #!0 from the root cell, and :) yeah
the root cell still receives nothing."

This is not changing the fundamental issue that already a single
interrupt causes problems for the root cell.

What you could do in addition to obtaining the backtrace from Linux is
getting the details of the IPI sent to the root-cell CPU. Which APIC
parameters are use there? Or just print the content of
ive->irq_cache.msg[vector] in arch_ivshmem_trigger_interrupt.
Background: If something went wrong, we may not deliver a normal
interrupt but rather some INIT/SIPI or whatever event.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/33d2aa37-d2b1-24da-5e1e-ed1eddd80239%40siemens.com.
