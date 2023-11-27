Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZVUSKVQMGQEF4ULLEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1117FA120
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Nov 2023 14:32:24 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id 4fb4d7f45d1cf-54366567af4sf5339292a12.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Nov 2023 05:32:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701091944; cv=pass;
        d=google.com; s=arc-20160816;
        b=RdqQ3lCJOxED265f65h5pb3Hv38aLNIxnUdx0m7zaTkp4yOHM+DpozQJgqh24R53iW
         A9tSa7sBIRiYjPtMgPX0lHu5r9GjOd7iUEZ+sQJGyWFLGAKJjUcQpWQ3mnHZxIrXkHKA
         TQyPfbbiYgYIpOO6aLFm7CRnpYu5wySTzmJUpSSEUTFfwKbf7KoiKNXCzbdTwfF476B8
         cQPeRCnWHhLvyxB0pI7Li3oiSMDc1bGDSueYVbcT6LF31uuy27thEK+ba69FoHsWG6ZM
         N6kwT3qiwfSq+E1eykHSZLtpABTqdHEfTyfdjco5xIzSj89WDbCsyF0wA+6fIOFufNXA
         qHPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Az1H2oAWKEfwzQmuAOe51l1ne1be8siwuDTIQPDJr34=;
        fh=ZvBLHYJdR3VpExSo8GystPkILtg3nxe9mRDpjtESnRg=;
        b=dQHqHxiegIwImE2Do5HRqWsb53sHmMwBWXq7REhwvihgXOfbriNJhUCyRHBAKkshrR
         3yAp0XUPY9Kjxbz+q2HdZuhwbmXWWbYjaDM2EeMiLwKvN+HBd8FUTrdn7kyU0Us/D6Eo
         i7AQYA2OkUnx43YQqTrAwIFQb8/AqRHmebfaVbREqjNM+BmNa9FsF+R3yYo5cEOeqa1B
         IKRIU5+DxtlwkW0p3NFa/JJk4Ju84HpivtRHf7K4ACvtBwJshxRQQjRZaLcEMYqjeIfs
         jTl1jJw3B58rdMEX6LDDtVlnM1AFGIwEBn5r6Gdly76qlzT5XJU8+mhV/LhA8+r58uPr
         Dc8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=n1nDAQS+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701091944; x=1701696744; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Az1H2oAWKEfwzQmuAOe51l1ne1be8siwuDTIQPDJr34=;
        b=QI2P+7JV+4fb7s3y5A5ZPCQswAgzbgBRHHp/uRpS9mOruP2q/isDp7tOifz9Y83Ovc
         D9B2ebVgqV8lSLfrR07xT0AUAAw/HN/VyDinBPD0Bm3JU+FoeS1Er6uMel8CeiyKoVc7
         Ynk+9XD1A72+3yMVzngTPzS6nlcIMTxoPAkkXcsmUZhghc0iGErk/6Vbm+vzrAHMq0Nl
         2g28vnjHowhgfMhekLItPqDigBFsGQjlELPLfhlE0wOJLkF8rYH9tw4mCq4PERfaJi90
         OjOzY0OqSjr0dYEg4sX0fghsz3rxjFinWQN2Lln4An2IfxiZXvd2oKHZJLGrna/NQj7N
         cx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701091944; x=1701696744;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az1H2oAWKEfwzQmuAOe51l1ne1be8siwuDTIQPDJr34=;
        b=N4goTIF9Gz7vis2OPDOhK9pEXwflTKLjspAwfJORnm6pJxraq7aGQgw9q9BC8ytdKc
         O4hjeWE4sjnJ1eZdEno9ziFwwmObMPeLbTdrPqS123IsdS1Re5oqoW4jtCtA8HDh6aGB
         uMAQrU8erzQX9JnISTcDKAztR35kNxAotgI9ga36WPEcWfM+SPMvZcFUDoOsHZH3/ym+
         rkhBVNEr79jiRwFGTmIR1PYNhQt308YlR5OkddFMsslcYbqugVkEVeq44tE2wlQTO3eV
         A3ziCGozaLHtAYMClDxprBFVPaJ0b59H4nIzq0/arLCEcGnVoOWnhUsA4N1XYg05A1IU
         1C5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yykr3/1tsALOrnR5ecjOo+GiJ4OR8EqM+zgSobXc2uFv2PEiGdg
	h6BL3Iqx4zODZ4K794AlBZM=
X-Google-Smtp-Source: AGHT+IEf+ZfNB68DI19/86vo4pQG9Ew3RdpVWbekvwxGzSuTjO+yPRJkXc6FMsepMG1F82G8bmsmIg==
X-Received: by 2002:a05:6402:3481:b0:54b:6786:3f74 with SMTP id v1-20020a056402348100b0054b67863f74mr3274558edc.11.1701091943444;
        Mon, 27 Nov 2023 05:32:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:3223:b0:54b:50bf:aff5 with SMTP id
 g35-20020a056402322300b0054b50bfaff5ls279452eda.1.-pod-prod-00-eu; Mon, 27
 Nov 2023 05:32:21 -0800 (PST)
X-Received: by 2002:aa7:d653:0:b0:54b:3f0c:7fe0 with SMTP id v19-20020aa7d653000000b0054b3f0c7fe0mr4092625edr.6.1701091940603;
        Mon, 27 Nov 2023 05:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701091940; cv=none;
        d=google.com; s=arc-20160816;
        b=F0KR5lKse6yScjKodvHyWYLbNeRhqOMB4FT5h/jKbj/nqrJzWNFji9h0rgylvPD/Ux
         Y+UOMvIZ18/D7J/T+6sPQmv1m/KkCg0mk0Yb/8PkKFgTuKTUOoexi3CaE7XtbknXxuOg
         Goihia4gsiAdpTRMbaMXv1TXDvVxFI75YliL5msa7e4G6EpC5XQsZwq0F7uTDWF4gZ8s
         0RNqOsSNvgwHjPkHvg+JjGzBrDGXE7lN7Mwg1j5Zh8Ojp5TDERx3SBkl8bNH66hgGrwg
         +8tp7Bb7fEYPu3QRXQ6rEMbFfuLGgvowTjlR+/s4Qbp4luzp5JPBeZTHjbOmIWkyCw4V
         HEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ge1dwzB8vcGjPENgWV5gIZrdZ1CMhBYuNTs4g16pZzw=;
        fh=ZvBLHYJdR3VpExSo8GystPkILtg3nxe9mRDpjtESnRg=;
        b=gN7YbXUkVoXbcorhc6XgO0z9dS44b1K+7KMqAmG6uECkqhZFTm8fBby/9y37SiYtZW
         pIyTElu7E7Y5KWQfJp0aRhzIKgWK/XUXaFS9X6Yp91dsh5C/CqXCgDQJVS7JNQXrJx1M
         ahPvuesRmts3F5pHsc1krVqlR1Njn3gf//q4I9xb4ac4vCMG6MKgdlRCj9uV8I8m+R/S
         ZpDtjVg8vkVfvGv5mrRMyWXOybgqRVY4gcxFxA5j6dTJgJ62S44AcCGFcxNVy1KYxI3p
         lXooc2nFyGVRRuY7VhHdDb+ljZpA8EOmtDWNt1L5f4p0w5YnvfX8Wau+rHy2zLJLXuzJ
         L67g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=n1nDAQS+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id er26-20020a056402449a00b005489dbe8653si484986edb.2.2023.11.27.05.32.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [194.95.104.11])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 0CD693E00EA;
	Mon, 27 Nov 2023 14:32:19 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Sf62V5WrvzxsS;
	Mon, 27 Nov 2023 14:32:18 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 Nov
 2023 14:32:18 +0100
Message-ID: <cccc15df-cb50-4153-b0f0-5a058042a41b@oth-regensburg.de>
Date: Mon, 27 Nov 2023 14:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse on OKMX8mq--C , "unable to open an initial console"
Content-Language: en-US
To: =?UTF-8?B?5p2o56uj6L22?= <prodigyyanng@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <893f2e46-c438-4182-859f-1f65af16f8d4n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <893f2e46-c438-4182-859f-1f65af16f8d4n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=n1nDAQS+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 25/11/2023 07:57, =E6=9D=A8=E7=AB=A3=E8=BD=B6 wrote:
> I'm using a OKMX8MQ-C which from imx8, now i can boot the root cell and=
=20
> some simple demp such as gic-demo. But when boot the non-root linux=20
> cell, i face some problem.
>=20
> I only use initramfs to boot non-root linux. Furthermore, my initramfs=20
> only contains a helloworld and a console device. [I cannot use busybox=20
> to build initramfs because my toolchain does not allow me to compile=20
> it]. My ramfs directory is as follows=EF=BC=9A=E6=88=AA=E5=B1=8F2023-11-2=
5 14.49.49.png
>=20
> Then my startup command is as follows:
>=20
> *cd /home/root/imx_jailhouse *
> *insmod driver/jailhouse.ko *
> *export PATH=3D/home/root/imx_jailhouse/tools:$PATH *
> *jailhouse enable configs/arm64/imx8mq-veth.cell
> *
> *jailhouse cell linux configs/arm64/imx8mq-linux-demo.cell \ *
> *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/Image2 -d \ *
> *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~/imx8mq-evk-inmate.dtb -i =
\ *
> *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~/rootfs.cpio.gz \ *
> *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c "clk_ignore_unused=20
> console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=
=20
> root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw " *

try to add console=3Dtty0 here. Further, did you set stdout-path in yor=20
non root's device tree correctly?

 > console=3Dttymxc0,30860000,115200
Are you sure that this line is correct? Why do you encode the address here?

Please try:
console=3Dttymxc0,115200 console=3Dtty0

   Ralf

> *
> *
> Eventually, I got the following output=EF=BC=9A*
> *
> root@imx8mqevk:~/imx_jailhouse# jailhouse cell linux=20
> configs/arm64/imx8mq-linux-demo.cell \
> _unused console=3Dttymxc0,30860000,115200=20
> earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D1000=
0000=20
> rdinit=3D/hello rootwait rw "
>  > =C2=A0 =C2=A0 =C2=A0~/Image2 -d \
>  > =C2=A0 =C2=A0 ~/imx8mq-evk-inmate.dtb -i \
>  > =C2=A0 =C2=A0 =C2=A0~/rootfs.cpio.gz \
>  > =C2=A0-c "clk_ignore_unused console=3Dttymxc0,30860000,115200=20
> earlycon=3Dec_imx6q,0x30860000,115200 root=3D/dev/ram ramdisk_size=3D1000=
0000=20
> rdinit=3D/hello rootwait rw "
> [ =C2=A0567.018158] Ready to search binary handler...
> [ =C2=A0567.023161] Finish search binary handler, ret=3D0...
> [ =C2=A0567.029032] Ready to search binary handler...
> [ =C2=A0567.033683] Finish search binary handler, ret=3D0...
> [ =C2=A0567.039395] Ready to search binary handler...
> [ =C2=A0567.044092] Finish search binary handler, ret=3D0...
>=20
>=20
> [ =C2=A0567.365079] IRQ231: set affinity failed(-22).
> [ =C2=A0567.365091] IRQ232: set affinity failed(-22).
> [ =C2=A0567.365646] CPU2: shutdown
> [ =C2=A0567.377126] psci: CPU2 killed.
> [ =C2=A0567.424984] IRQ231: set affinity failed(-22).
> [ =C2=A0567.424991] IRQ232: set affinity failed(-22).
> [ =C2=A0567.425300] CPU3: shutdown
> [ =C2=A0567.436789] psci: CPU3 killed.
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
> iommu_config_commit linux-inmate-demo
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 111/995, remap 144/131072
> [ =C2=A0567.473937] Created Jailhouse cell "linux-inmate-demo"
> Cell "linux-inmate-demo" can be loaded
>=20
> Started cell "linux-inmate-demo"
>=20
> [ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0000000002 [0x41=
0fd034]
> [ =C2=A0 =C2=A00.000000] Linux version 5.4.3 (azureuser@junyiyang-test) (=
gcc=20
> version 9.2.0 (GCC)) #46 SMP PREEMPT Fri Nov 24 09:06:54 UTC 2023
> [ =C2=A0 =C2=A00.000000] Machine model: Freescale i.MX8MQ EVK
> [ =C2=A0 =C2=A00.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (=
options=20
> '115200')
> [ =C2=A0 =C2=A00.000000] printk: bootconsole [ec_imx6q0] enabled
> [ =C2=A0 =C2=A00.000000] efi: Getting EFI parameters from FDT:
> [ =C2=A0 =C2=A00.000000] efi: UEFI not found.
> [ =C2=A0 =C2=A00.000000] cma: Reserved 320 MiB at 0x00000000e4000000
> root@imx8mqevk:~/imx_jailhouse#
> root@imx8mqevk:~/imx_jailhouse#
> [ =C2=A0 =C2=A00.000000] NUMA: No NUMA configuration found
> [ =C2=A0 =C2=A00.000000] NUMA: Faking a node at [mem=20
> 0x00000000d0000000-0x00000000f9bfffff]
> [ =C2=A0 =C2=A00.000000] NUMA: NODE_DATA [mem 0xf9a97500-0xf9a98fff]
> [ =C2=A0 =C2=A00.000000] Zone ranges:
> [ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x00000000d000000=
0-0x00000000f9bfffff]
> [ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 empty
> [ =C2=A0 =C2=A00.000000] Movable zone start for each node
> [ =C2=A0 =C2=A00.000000] Early memory node ranges
> [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000d0000000-0x=
00000000f9bfffff]
> [ =C2=A0 =C2=A00.000000] Initmem setup node 0 [mem=20
> 0x00000000d0000000-0x00000000f9bfffff]
> root@imx8mqevk:~/imx_jailhouse#
> [ =C2=A0 =C2=A00.000000] psci: probing for conduit method from DT.
> [ =C2=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.
> [ =C2=A0 =C2=A00.000000] psci: Using standard PSCI v0.2 function IDs
> [ =C2=A0 =C2=A00.000000] psci: MIGRATE_INFO_TYPE not supported.
> [ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention v1.1
> [ =C2=A0 =C2=A00.000000] percpu: Embedded 24 pages/cpu s58968 r8192 d3114=
4 u98304
> [ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on CPU0
> [ =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 845719
> [ =C2=A0 =C2=A00.000000] CPU features: detected: GIC system register CPU =
interface
> [ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on. =C2=A0T=
otal pages: 168336
> [ =C2=A0 =C2=A00.000000] Policy zone: DMA32
> [ =C2=A0 =C2=A00.000000] Kernel command line: clk_ignore_unused=20
> console=3Dttymxc0,30860000,115200 earlycon=3Dec_imx6q,0x30860000,115200=
=20
> root=3D/dev/ram ramdisk_size=3D10000000 rdinit=3D/hello rootwait rw
> [ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 131072 (order: =
8,=20
> 1048576 bytes, linear)
> [ =C2=A0 =C2=A00.000000] Inode-cache hash table entries: 65536 (order: 7,=
 524288=20
> bytes, linear)
> [ =C2=A0 =C2=A00.000000] mem auto-init: stack:off, heap alloc:off, heap f=
ree:off
> root@imx8mqevk:~/imx_jailhouse#
> [ =C2=A0 =C2=A00.000000] Memory: 307980K/684032K available (16508K kernel=
 code,=20
> 1370K rwdata, 6456K rodata, 2944K init, 1039K bss, 48372K reserved,=20
> 327680K cma-reserved)
> [ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0,=
 CPUs=3D2, Nodes=3D1
> [ =C2=A0 =C2=A00.000000] rcu: Preemptible hierarchical RCU implementation=
.
> [ =C2=A0 =C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_=
CPUS=3D256 to=20
> nr_cpu_ids=3D2.
> [ =C2=A0 =C2=A00.000000] =C2=A0Tasks RCU enabled.
> [ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of scheduler-enlistmen=
t delay=20
> is 25 jiffies.
> [ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16=
, nr_cpu_ids=3D2
> [ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [ =C2=A0 =C2=A00.000000] GICv3: 128 SPIs implemented
> [ =C2=A0 =C2=A00.000000] GICv3: 0 Extended SPIs implemented
> [ =C2=A0 =C2=A00.000000] GICv3: Distributor has no Range Selector support
> [ =C2=A0 =C2=A00.000000] GICv3: 16 PPIs implemented
> [ =C2=A0 =C2=A00.000000] GICv3: no VLPI support, no direct LPI support
> [ =C2=A0 =C2=A00.000000] GICv3: CPU0: found redistributor 2 region=20
> 0:0x00000000388c0000
> [ =C2=A0 =C2=A00.000000] ITS: No ITS available, not enabling LPIs
> [ =C2=A0 =C2=A00.000000] random: get_random_bytes called from=20
> start_kernel+0x2b8/0x44c with crng_init=3D0
> [ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s) running at 8.33MHz (vi=
rt).
> [ =C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0xfffffffff=
fffff=20
> max_cycles: 0x1ec0311ec, max_idle_ns: 440795202152 ns
> [ =C2=A0 =C2=A00.000005] sched_clock: 56 bits at 8MHz, resolution 120ns, =
wraps=20
> every 2199023255541ns
> [ =C2=A0 =C2=A00.008316] Console: colour dummy device 80x25
> [ =C2=A0 =C2=A00.012477] Calibrating delay loop (skipped), value calculat=
ed using=20
> timer frequency.. 16.66 BogoMIPS (lpj=3D33333)
> [ =C2=A0 =C2=A00.022666] pid_max: default: 32768 minimum: 301
> [ =C2=A0 =C2=A00.027356] LSM: Security Framework initializing
> [ =C2=A0 =C2=A00.031897] SELinux: =C2=A0Initializing.
> [ =C2=A0 =C2=A00.035422] Mount-cache hash table entries: 2048 (order: 2, =
16384=20
> bytes, linear)
> [ =C2=A0 =C2=A00.042725] Mountpoint-cache hash table entries: 2048 (order=
: 2,=20
> 16384 bytes, linear)
> [ =C2=A0 =C2=A00.051555] init thread pid check: 1...
> root@imx8mqevk:~/imx_jailhouse#
> root@imx8mqevk:~/imx_jailhouse# [ =C2=A0 =C2=A00.074633] ASID allocator=
=20
> initialised with 32768 entries
> [ =C2=A0 =C2=A00.082633] rcu: Hierarchical SRCU implementation.
> [ =C2=A0 =C2=A00.091290] EFI services will not be available.
> [ =C2=A0 =C2=A00.098677] smp: Bringing up secondary CPUs ...
> [ =C2=A0 =C2=A00.130824] Detected VIPT I-cache on CPU1
> [ =C2=A0 =C2=A00.130870] GICv3: CPU1: found redistributor 3 region=20
> 0:0x00000000388e0000
> [ =C2=A0 =C2=A00.130914] CPU1: Booted secondary processor 0x0000000003 [0=
x410fd034]
> [ =C2=A0 =C2=A00.131020] smp: Brought up 1 node, 2 CPUs
> [ =C2=A0 =C2=A00.149632] SMP: Total of 2 processors activated.
> [ =C2=A0 =C2=A00.154314] CPU features: detected: 32-bit EL0 Support
> [ =C2=A0 =C2=A00.159450] CPU features: detected: CRC32 instructions
> [ =C2=A0 =C2=A00.177838] CPU: All CPU(s) started at EL1
> [ =C2=A0 =C2=A00.179087] alternatives: patching kernel code
> [ =C2=A0 =C2=A00.184973] devtmpfs: initialized
> [ =C2=A0 =C2=A00.192187] clocksource: jiffies: mask: 0xffffffff max_cycle=
s:=20
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [ =C2=A0 =C2=A00.199073] futex hash table entries: 512 (order: 3, 32768 b=
ytes, linear)
> [ =C2=A0 =C2=A00.217026] pinctrl core: initialized pinctrl subsystem
> [ =C2=A0 =C2=A00.220270] DMI not present or invalid.
> [ =C2=A0 =C2=A00.223548] NET: Registered protocol family 16
> [ =C2=A0 =C2=A00.243512] DMA: preallocated 256 KiB pool for atomic alloca=
tions
> [ =C2=A0 =C2=A00.246762] audit: initializing netlink subsys (disabled)
> [ =C2=A0 =C2=A00.252330] audit: type=3D2000 audit(0.212:1): state=3Diniti=
alized=20
> audit_enabled=3D0 res=3D1
> [ =C2=A0 =C2=A00.259890] cpuidle: using governor menu
> [ =C2=A0 =C2=A00.264391] hw-breakpoint: found 6 breakpoint and 4 watchpoi=
nt registers.
> [ =C2=A0 =C2=A00.271261] Serial: AMBA PL011 UART driver
> [ =C2=A0 =C2=A00.274699] imx mu driver is registered.
> [ =C2=A0 =C2=A00.278539] imx rpmsg driver is registered.
> [ =C2=A0 =C2=A00.304587] HugeTLB registered 1.00 GiB page size, pre-alloc=
ated 0 pages
> [ =C2=A0 =C2=A00.308453] HugeTLB registered 32.0 MiB page size, pre-alloc=
ated 0 pages
> [ =C2=A0 =C2=A00.315123] HugeTLB registered 2.00 MiB page size, pre-alloc=
ated 0 pages
> [ =C2=A0 =C2=A00.321805] HugeTLB registered 64.0 KiB page size, pre-alloc=
ated 0 pages
> [ =C2=A0 =C2=A00.331139] cryptd: max_cpu_qlen set to 1000
> [ =C2=A0 =C2=A00.339367] ACPI: Interpreter disabled.
> [ =C2=A0 =C2=A00.340820] iommu: Default domain type: Translated
> [ =C2=A0 =C2=A00.345428] vgaarb: loaded
> [ =C2=A0 =C2=A00.348260] SCSI subsystem initialized
> [ =C2=A0 =C2=A00.352060] usbcore: registered new interface driver usbfs
> [ =C2=A0 =C2=A00.357446] usbcore: registered new interface driver hub
> [ =C2=A0 =C2=A00.362457] usbcore: registered new device driver usb
> [ =C2=A0 =C2=A00.367753] mc: Linux media interface: v0.10
> [ =C2=A0 =C2=A00.371747] videodev: Linux video capture interface: v2.00
> [ =C2=A0 =C2=A00.377234] pps_core: LinuxPPS API ver. 1 registered
> [ =C2=A0 =C2=A00.382104] pps_core: Software ver. 5.3.6 - Copyright 2005-2=
007=20
> Rodolfo Giometti <giometti@linux.it>
> [ =C2=A0 =C2=A00.391236] PTP clock support registered
> [ =C2=A0 =C2=A00.395188] EDAC MC: Ver: 3.0.0
> [ =C2=A0 =C2=A00.398960] No BMan portals available!
> [ =C2=A0 =C2=A00.402252] QMan: Allocated lookup table at (____ptrval____)=
, entry=20
> count 65537
> [ =C2=A0 =C2=A00.409524] No QMan portals available!
> [ =C2=A0 =C2=A00.413314] No USDPAA memory, no 'fsl,usdpaa-mem' in device-=
tree
> [ =C2=A0 =C2=A00.419312] FPGA manager framework
> [ =C2=A0 =C2=A00.422483] Advanced Linux Sound Architecture Driver Initial=
ized.
> [ =C2=A0 =C2=A00.428969] Bluetooth: Core ver 2.22
> [ =C2=A0 =C2=A00.432033] NET: Registered protocol family 31
> [ =C2=A0 =C2=A00.436445] Bluetooth: HCI device and connection manager ini=
tialized
> [ =C2=A0 =C2=A00.442785] Bluetooth: HCI socket layer initialized
> [ =C2=A0 =C2=A00.447644] Bluetooth: L2CAP socket layer initialized
> [ =C2=A0 =C2=A00.452688] Bluetooth: SCO socket layer initialized
> [ =C2=A0 =C2=A00.458289] clocksource: Switched to clocksource arch_sys_co=
unter
> [ =C2=A0 =C2=A00.463791] VFS: Disk quotas dquot_6.6.0
> [ =C2=A0 =C2=A00.467580] VFS: Dquot-cache hash table entries: 512 (order =
0, 4096=20
> bytes)
> [ =C2=A0 =C2=A00.474589] pnp: PnP ACPI: disabled
> [ =C2=A0 =C2=A00.486097] thermal_sys: Registered thermal governor 'step_w=
ise'
> [ =C2=A0 =C2=A00.486100] thermal_sys: Registered thermal governor 'power_=
allocator'
> [ =C2=A0 =C2=A00.489479] NET: Registered protocol family 2
> [ =C2=A0 =C2=A00.500595] tcp_listen_portaddr_hash hash table entries: 512=
 (order:=20
> 1, 8192 bytes, linear)
> [ =C2=A0 =C2=A00.508479] TCP established hash table entries: 8192 (order:=
 4, 65536=20
> bytes, linear)
> [ =C2=A0 =C2=A00.516248] TCP bind hash table entries: 8192 (order: 5, 131=
072=20
> bytes, linear)
> [ =C2=A0 =C2=A00.523523] TCP: Hash tables configured (established 8192 bi=
nd 8192)
> [ =C2=A0 =C2=A00.529790] UDP hash table entries: 512 (order: 2, 16384 byt=
es, linear)
> [ =C2=A0 =C2=A00.536336] UDP-Lite hash table entries: 512 (order: 2, 1638=
4 bytes,=20
> linear)
> [ =C2=A0 =C2=A00.543469] NET: Registered protocol family 1
> [ =C2=A0 =C2=A00.548165] RPC: Registered named UNIX socket transport modu=
le.
> [ =C2=A0 =C2=A00.553581] RPC: Registered udp transport module.
> [ =C2=A0 =C2=A00.558262] RPC: Registered tcp transport module.
> [ =C2=A0 =C2=A00.562952] RPC: Registered tcp NFSv4.1 backchannel transpor=
t module.
> [ =C2=A0 =C2=A00.569831] PCI: CLS 0 bytes, default 64
> [ =C2=A0 =C2=A00.573504] Trying to unpack rootfs image as initramfs...
> [ =C2=A0 =C2=A00.578681] Compressed data magic: 0x1f 0x8b
> [ =C2=A0 =C2=A00.604372] Freeing initrd memory: 372K
> [ =C2=A0 =C2=A00.606046] kvm [1]: HYP mode not available
> [ =C2=A0 =C2=A00.616895] Initialise system trusted keyrings
> [ =C2=A0 =C2=A00.618624] workingset: timestamp_bits=3D44 max_order=3D18 b=
ucket_order=3D0
> [ =C2=A0 =C2=A00.633665] squashfs: version 4.0 (2009/01/31) Phillip Lough=
er
> [ =C2=A0 =C2=A00.637392] NFS: Registering the id_resolver key type
> [ =C2=A0 =C2=A00.641713] Key type id_resolver registered
> [ =C2=A0 =C2=A00.645848] Key type id_legacy registered
> [ =C2=A0 =C2=A00.649848] nfs4filelayout_init: NFSv4 File Layout Driver Re=
gistering...
> [ =C2=A0 =C2=A00.656543] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red =
Hat, Inc.
> [ =C2=A0 =C2=A00.663102] 9p: Installing v9fs 9p2000 file system support
> [ =C2=A0 =C2=A00.688300] Key type asymmetric registered
> [ =C2=A0 =C2=A00.689534] Asymmetric key parser 'x509' registered
> [ =C2=A0 =C2=A00.694461] Block layer SCSI generic (bsg) driver version 0.=
4 loaded=20
> (major 244)
> [ =C2=A0 =C2=A00.701900] io scheduler mq-deadline registered
> [ =C2=A0 =C2=A00.706301] io scheduler kyber registered
> [ =C2=A0 =C2=A00.711544] pci-host-generic bfb00000.pci: host bridge /pci@=
bfb00000=20
> ranges:
> [ =C2=A0 =C2=A00.717352] pci-host-generic bfb00000.pci: =C2=A0 MEM=20
> 0x10000000..0x1000ffff -> 0x10000000
> [ =C2=A0 =C2=A00.725202] pci-host-generic bfb00000.pci: ECAM at [mem=20
> 0xbfb00000-0xbfbfffff] for [bus 00]
> [ =C2=A0 =C2=A00.733608] pci-host-generic bfb00000.pci: PCI host bridge t=
o bus 0000:00
> [ =C2=A0 =C2=A00.740249] pci_bus 0000:00: root bus resource [bus 00]
> [ =C2=A0 =C2=A00.745450] pci_bus 0000:00: root bus resource [mem=20
> 0x10000000-0x1000ffff]
> [ =C2=A0 =C2=A00.752335] pci 0000:00:00.0: [1af4:1110] type 00 class 0xff=
0100
> [ =C2=A0 =C2=A00.758324] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x00=
0000ff 64bit]
> [ =C2=A0 =C2=A00.766848] pci 0000:00:00.0: BAR 0: assigned [mem=20
> 0x10000000-0x100000ff 64bit]
> [ =C2=A0 =C2=A00.773175] EINJ: ACPI disabled.
> [ =C2=A0 =C2=A00.776584] Bus freq driver module loaded
> [ =C2=A0 =C2=A00.780120] virtio-pci 0000:00:00.0: enabling device (0000 -=
> 0002)
> [ =C2=A0 =C2=A00.789667] Serial: 8250/16550 driver, 4 ports, IRQ sharing =
enabled
> [ =C2=A0 =C2=A00.794841] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq=
 =3D 5,=20
> base_baud =3D 1562500) is a IMX
> [ =C2=A0 =C2=A00.812412] brd: module loaded
> [ =C2=A0 =C2=A00.820118] loop: module loaded
> [ =C2=A0 =C2=A00.822089] imx ahci driver is registered.
> [ =C2=A0 =C2=A00.826835] libphy: Fixed MDIO Bus: probed
> [ =C2=A0 =C2=A00.829601] tun: Universal TUN/TAP device driver, 1.6
> [ =C2=A0 =C2=A00.833815] CAN device driver interface
> [ =C2=A0 =C2=A00.837738] thunder_xcv, ver 1.0
> [ =C2=A0 =C2=A00.840680] thunder_bgx, ver 1.0
> [ =C2=A0 =C2=A00.843893] nicpf, ver 1.0
> [ =C2=A0 =C2=A00.846753] Freescale FM module, FMD API version 21.1.0
> [ =C2=A0 =C2=A00.851814] Freescale FM Ports module
> [ =C2=A0 =C2=A00.855392] fsl_mac: fsl_mac: FSL FMan MAC API based driver
> [ =C2=A0 =C2=A00.861005] fsl_dpa: FSL DPAA Ethernet driver
> [ =C2=A0 =C2=A00.865334] fsl_advanced: FSL DPAA Advanced drivers:
> [ =C2=A0 =C2=A00.870234] fsl_proxy: FSL DPAA Proxy initialization driver
> [ =C2=A0 =C2=A00.875835] fsl_oh: FSL FMan Offline Parsing port driver
> [ =C2=A0 =C2=A00.881572] hclge is initializing
> [ =C2=A0 =C2=A00.884388] hns3: Hisilicon Ethernet Network Driver for Hip0=
8 Family=20
> - version
> [ =C2=A0 =C2=A00.891589] hns3: Copyright (c) 2017 Huawei Corporation.
> [ =C2=A0 =C2=A00.896938] e1000: Intel(R) PRO/1000 Network Driver - versio=
n=20
> 7.3.21-k8-NAPI
> [ =C2=A0 =C2=A00.903916] e1000: Copyright (c) 1999-2006 Intel Corporation=
.
> [ =C2=A0 =C2=A00.909688] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6=
-k
> [ =C2=A0 =C2=A00.915505] e1000e: Copyright(c) 1999 - 2015 Intel Corporati=
on.
> [ =C2=A0 =C2=A00.921425] igb: Intel(R) Gigabit Ethernet Network Driver - =
version=20
> 5.6.0-k
> [ =C2=A0 =C2=A00.928314] igb: Copyright (c) 2007-2014 Intel Corporation.
> [ =C2=A0 =C2=A00.933910] igbvf: Intel(R) Gigabit Virtual Function Network=
 Driver -=20
> version 2.4.0-k
> [ =C2=A0 =C2=A00.941683] igbvf: Copyright (c) 2009 - 2012 Intel Corporati=
on.
> [ =C2=A0 =C2=A00.947685] sky2: driver version 1.30
> [ =C2=A0 =C2=A00.951424] usbcore: registered new interface driver asix
> [ =C2=A0 =C2=A00.956652] usbcore: registered new interface driver ax88179=
_178a
> [ =C2=A0 =C2=A00.962722] usbcore: registered new interface driver cdc_eth=
er
> [ =C2=A0 =C2=A00.968534] usbcore: registered new interface driver net1080
> [ =C2=A0 =C2=A00.974179] usbcore: registered new interface driver cdc_sub=
set
> [ =C2=A0 =C2=A00.980082] usbcore: registered new interface driver zaurus
> [ =C2=A0 =C2=A00.985654] usbcore: registered new interface driver cdc_ncm
> [ =C2=A0 =C2=A00.991279] usbcore: registered new interface driver huawei_=
cdc_ncm
> [ =C2=A0 =C2=A00.997535] usbcore: registered new interface driver qmi_wwa=
n_q
> [ =C2=A0 =C2=A01.003641] VFIO - User Level meta-driver version: 0.3
> [ =C2=A0 =C2=A01.009455] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EH=
CI) Driver
> [ =C2=A0 =C2=A01.015039] ehci-pci: EHCI PCI platform driver
> [ =C2=A0 =C2=A01.019496] ehci-platform: EHCI generic platform driver
> [ =C2=A0 =C2=A01.024722] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) =
Driver
> [ =C2=A0 =C2=A01.030839] ohci-pci: OHCI PCI platform driver
> [ =C2=A0 =C2=A01.035296] ohci-platform: OHCI generic platform driver
> [ =C2=A0 =C2=A01.040695] usbcore: registered new interface driver cdc_wdm
> [ =C2=A0 =C2=A01.046156] usbcore: registered new interface driver usb-sto=
rage
> [ =C2=A0 =C2=A01.052184] usbcore: registered new interface driver usbseri=
al_generic
> [ =C2=A0 =C2=A01.058636] usbserial: USB Serial support registered for gen=
eric
> [ =C2=A0 =C2=A01.064625] usbcore: registered new interface driver option
> [ =C2=A0 =C2=A01.070174] usbserial: USB Serial support registered for GSM=
 modem=20
> (1-port)
> [ =C2=A0 =C2=A01.078254] <<-GTP-INFO->> GTP driver installing...
> [ =C2=A0 =C2=A01.082821] i2c /dev entries driver
> [ =C2=A0 =C2=A01.086604] Bluetooth: HCI UART driver ver 2.3
> [ =C2=A0 =C2=A01.089846] Bluetooth: HCI UART protocol H4 registered
> [ =C2=A0 =C2=A01.094981] Bluetooth: HCI UART protocol BCSP registered
> [ =C2=A0 =C2=A01.100305] Bluetooth: HCI UART protocol LL registered
> [ =C2=A0 =C2=A01.105394] Bluetooth: HCI UART protocol ATH3K registered
> [ =C2=A0 =C2=A01.110796] Bluetooth: HCI UART protocol Three-wire (H5) reg=
istered
> [ =C2=A0 =C2=A01.117092] Bluetooth: HCI UART protocol Broadcom registered
> [ =C2=A0 =C2=A01.122689] Bluetooth: HCI UART protocol QCA registered
> [ =C2=A0 =C2=A01.128079] imx-cpufreq-dt: probe of imx-cpufreq-dt failed w=
ith error -2
> [ =C2=A0 =C2=A01.135773] sdhci: Secure Digital Host Controller Interface =
driver
> [ =C2=A0 =C2=A01.140731] sdhci: Copyright(c) Pierre Ossman
> [ =C2=A0 =C2=A01.145172] Synopsys Designware Multimedia Card Interface Dr=
iver
> [ =C2=A0 =C2=A01.151282] sdhci-pltfm: SDHCI platform and OF driver helper
> [ =C2=A0 =C2=A01.157247] ledtrig-cpu: registered to indicate activity on =
CPUs
> [ =C2=A0 =C2=A01.163670] usbcore: registered new interface driver usbhid
> [ =C2=A0 =C2=A01.168242] usbhid: USB HID core driver
> [ =C2=A0 =C2=A01.172978] No fsl,qman node
> [ =C2=A0 =C2=A01.174928] Freescale USDPAA process driver
> [ =C2=A0 =C2=A01.179087] fsl-usdpaa: no region found
> [ =C2=A0 =C2=A01.182907] Freescale USDPAA process IRQ driver
> [ =C2=A0 =C2=A01.191715] NET: Registered protocol family 26
> [ =C2=A0 =C2=A01.193427] Initializing XFRM netlink socket
> [ =C2=A0 =C2=A01.198204] NET: Registered protocol family 10
> [ =C2=A0 =C2=A01.202897] Segment Routing with IPv6
> [ =C2=A0 =C2=A01.205680] NET: Registered protocol family 17
> [ =C2=A0 =C2=A01.210087] can: controller area network core (rev 20170425 =
abi 9)
> [ =C2=A0 =C2=A01.216272] NET: Registered protocol family 29
> [ =C2=A0 =C2=A01.220654] can: raw protocol (rev 20170425)
> [ =C2=A0 =C2=A01.224903] can: broadcast manager protocol (rev 20170425 t)
> [ =C2=A0 =C2=A01.230548] can: netlink gateway (rev 20190810) max_hops=3D1
> [ =C2=A0 =C2=A01.236247] Bluetooth: RFCOMM TTY layer initialized
> [ =C2=A0 =C2=A01.240894] Bluetooth: RFCOMM socket layer initialized
> [ =C2=A0 =C2=A01.246020] Bluetooth: RFCOMM ver 1.11
> [ =C2=A0 =C2=A01.249739] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [ =C2=A0 =C2=A01.255024] Bluetooth: BNEP filters: protocol multicast
> [ =C2=A0 =C2=A01.260238] Bluetooth: BNEP socket layer initialized
> [ =C2=A0 =C2=A01.265180] Bluetooth: HIDP (Human Interface Emulation) ver =
1.2
> [ =C2=A0 =C2=A01.271085] Bluetooth: HIDP socket layer initialized
> [ =C2=A0 =C2=A01.276074] 8021q: 802.1Q VLAN Support v1.8
> [ =C2=A0 =C2=A01.280216] lib80211: common routines for IEEE802.11 drivers
> [ =C2=A0 =C2=A01.285980] 9pnet: Installing 9P2000 support
> [ =C2=A0 =C2=A01.290126] tsn generic netlink module v1 init...
> [ =C2=A0 =C2=A01.294849] Key type dns_resolver registered
> [ =C2=A0 =C2=A01.299721] registered taskstats version 1
> [ =C2=A0 =C2=A01.303120] Loading compiled-in X.509 certificates
> [ =C2=A0 =C2=A01.310428] hctosys: unable to open rtc device (rtc0)
> [ =C2=A0 =C2=A01.313111] cfg80211: Loading compiled-in X.509 certificates=
 for=20
> regulatory database
> [ =C2=A0 =C2=A01.322641] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf4=
7aef9cea7'
> [ =C2=A0 =C2=A01.327262] platform regulatory.0: Direct firmware load for=
=20
> regulatory.db failed with error -2
> [ =C2=A0 =C2=A01.330307] clk: Not disabling unused clocks
> [ =C2=A0 =C2=A01.335778] platform regulatory.0: Falling back to sysfs fal=
lback=20
> for: regulatory.db
> [ =C2=A0 =C2=A01.340026] ALSA device list:
> [ =C2=A0 =C2=A01.350686] =C2=A0 No soundcards found.
> [ =C2=A0 =C2=A01.354101] The error code is -2
> *[ =C2=A0 =C2=A01.357282] Warning: unable to open an initial console.*
> [ =C2=A0 =C2=A01.363973] Freeing unused kernel memory: 2944K
> [ =C2=A0 =C2=A01.382376] Run /hello as init process
> [ =C2=A0 =C2=A01.383398] Ready to search binary handler...
> [ =C2=A0 =C2=A01.387791] Finish search binary handler, ret=3D0...
>=20
>=20
> My console cannot output the printf code in the helloworld program. I=20
> can't solve this problem anyway. Can you help me solve it?
>=20
> imx8mq-evk-inmate.dts: (for non-root-cell linux)
> &uart2 {
> clocks =3D <&osc_25m>,
> <&osc_25m>;
> clock-names =3D "ipg", "per";
> /delete-property/ dmas;
> /delete-property/ dmas-names;
> status =3D "okay";
> };
>=20
> ok8mq-evk-root.dts (for root cell )
> &uart1 {
> /* uart2 is used by the 2nd OS, so configure pin and clk */
> pinctrl-0 =3D <&pinctrl_uart1>, <&pinctrl_uart2>;
> assigned-clocks =3D <&clk IMX8MQ_CLK_UART1>,
> <&clk IMX8MQ_CLK_UART2>;
> assigned-clock-parents =3D <&clk IMX8MQ_CLK_25M>,
> <&clk IMX8MQ_CLK_25M>;
> };
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/893f2e46-c438-4182-859f-1=
f65af16f8d4n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/893f2e46-c438-4182-859f-1f65af16f8d4n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cccc15df-cb50-4153-b0f0-5a058042a41b%40oth-regensburg.de.
