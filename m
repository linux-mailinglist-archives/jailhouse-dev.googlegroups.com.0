Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVPD4D2QKGQELJZHP6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 815531CCC6E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 18:54:46 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id m11sf2511947lfo.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 May 2020 09:54:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589129686; cv=pass;
        d=google.com; s=arc-20160816;
        b=tI2FYf0WOSUNLmJvHAdbbV8AKwW355vZszmhiekKheTvm5oAR53gUv46Dd1eCCfG65
         L2+COsDh7uv8zhHxEYN9xV2zdYdSea6AH15Xsk8X4E2Sv7SI7ZbzODzCjz6CpuebibtH
         HD6KcJsp2mdVJokuGhzSAdm7KrhGO4n6cG2SMczAvzMrDJt2bPdd03pIhxEuY0RkOwjq
         /hQlhUt9erSqgpXE+UIOQRNJV3orYrWbs2lQyZrrvrRDKL44nXnwjfHT2y0FfnQeZvFz
         CQOyYvmZUERiTapvvbHVM4Vx7UYdLAm2wjcapAIUdNTeExz2alF01WXgvM4W0Gi1zJEI
         R0TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=nk9C0bdrOpVvV7m9eeilxuDfXgoaKj+6jvQo+t0g8Eg=;
        b=a1k+7TST0vf6wqTTrCnWWQYS3ZeCY/6hsAhmuI1jRCk9D/EBgG3EN3AaqMYHCsy2lK
         PqZpHpfePDCW3W9EHUqFV5VLCcVx7UOr2yTJHj7ZvHD/34AL2hIK0UdJcDoFoZPOesWY
         3bWw238TVNkYGq+nCPI08hoo3HHLAxcguro4nHhcTvSf5HQh0HvXxx0DYJ5NeaDXbplK
         EMsNblMZ3m4GI2Ni90rDc72ApeHox1k9PGzcSO8fKlCeXkL33BGaY8IRV6GTq52N3FSN
         eRMm5/0siq8Q8vTLcV+HSJIjV6n6EX4fhcumEHu8KV5XMQNamXjFs/6ThTwI9ol+qrX4
         EpAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TK5RwYFQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nk9C0bdrOpVvV7m9eeilxuDfXgoaKj+6jvQo+t0g8Eg=;
        b=DF39+X//w2v7wyCvtAcT4WoJAq4rX6xaqek96JKI0S982RGMa1u9V+2Hsg6EzIQA5e
         GMmU0YvTSCVwZgJPV7LEicoTLhs1esdvZTmpi4i43r1O2C21/qC6e+D0mW2/hF32xIbs
         SwXZIcxCuiVl+s7PQIsWTgxM5ScYrL1C9RUDwyq3Mw1lGFpmBuClNtnjpkQU9a61+pOQ
         NqgYDwXjzYd80acKNP2eJ8yYP2+jt5miz0o6jwctzFrI2CLOMaT+c9mY/kXHCb/7OlLa
         fVIvod1kMgMWfB9tYIGZMv5q7ktwqhrOBl29zUgpj4rbIkd2dAKDzzB322ES2kIooISk
         E/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nk9C0bdrOpVvV7m9eeilxuDfXgoaKj+6jvQo+t0g8Eg=;
        b=ON7yGlaCKAvWgDp8xhLmnWyrPOyT06bsxtY/ZrPLx+lNr46KjmZJ/+e8ObysGUy0Nf
         2bRU1VHerAsJPicPIHhmChZVkTLw9Q5afqAMS5x9s8Rpatt6UNEziiCAh0GfSlUzIqzU
         IoQA0r4qMSgwQOFG0fpAI1mAhU0b6OPvw/6XYYtfmNxj3o7FICtakI0e6Rh+tiuJMyyD
         0BDdD0b4TbOlx4quUy7y01Oe3GdXk17kv6FXkUmQuiR0lnp58e1n9RrALJhCOBUDDotW
         IMQGyVxteEvLV/JxU04l8PzsfdgwgKa4+IyzrXbyB6LfMXalVqnsyKjIu89PEsyQprNd
         zRyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hpkRdpwHrg7DK0D8ecuuI8/Xkb6WHNSvBx8DsynIURPLyAUHv
	9WCi2m5s92wra65zZq9708o=
X-Google-Smtp-Source: ABdhPJz/bPeLFcBEBh4gB9qn+YwdgnWa/4TA8PqL4xnZCSfhrL9Ct+rl/h8wp0TTnh27M+XIFuY8dg==
X-Received: by 2002:a2e:5746:: with SMTP id r6mr7573065ljd.15.1589129685950;
        Sun, 10 May 2020 09:54:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:81d6:: with SMTP id s22ls1853613ljg.0.gmail; Sun, 10 May
 2020 09:54:45 -0700 (PDT)
X-Received: by 2002:a05:651c:3c6:: with SMTP id f6mr7691712ljp.229.1589129685290;
        Sun, 10 May 2020 09:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589129685; cv=none;
        d=google.com; s=arc-20160816;
        b=k6xg1dt+jWM/1d8szQ/YI231byjA+iGB6ny9Ogx+K9bFkMazYMCZ5/GOeRni+5vabR
         I3lYbU1BawbBkpXwHcr/ZA7/B6HqfVwPX1So7eguNFR2hjSKWCXRlqN0JD3ofnsGwBWI
         CySCTPjCTtnruGh3D0PkVakOKVqMUYLmOMjBhFVFOEpxZnj4R2k14UVWnCPUZ0CNTNKC
         IVFDDGkfWdxJ1P+twI+mgZVpQgO1JWUFqnYL0rlu7XSDIY2T89DeyNjZGhkYIbQ4NPX1
         EEtH0CjNFdxvMkBJEstlUVxIqpRiICqRwtnazFdS5+SIIsoazDPLmWqQY0Pz8P2fOcKf
         kMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=PvLNrEZt94fyoAy7ll6NS7h6gAOIfyXemfGRgZptqeA=;
        b=yZRsSmfWsbdhndHs+s0oudK7ZpVlSdMEXUHJG4WmZzujNkx0Ez1PX/uCgqc5eWmrfD
         9bYt8Mo8qx4MEc93QESpOUKkm14HA99SzRCyqfmZ/a1SMnu7LcJi7ZRg+wavc6qnvrWA
         ThQJVgox6wM+ZKl/gtTcZlkiescllNdhbx4d/ehzIz1zX1k5gw3lsJZGZAHQrepTG1vc
         +9yROLAq/qeR7ofjaJmBrxa+4w+25tZibFSjDuw+wxSVHTrukbmK3+aeWFmDN4fOYcY0
         3ALfMXA1TzjJfbNjOqfn/80OPhDWCXz0YAxXenaiHWgjz6zxAyY+PN2lqMhl5+2uUvk0
         K7bA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TK5RwYFQ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id 186si427220lfj.5.2020.05.10.09.54.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 09:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MIL4K-1jLg993m2G-00EOct; Sun, 10
 May 2020 18:54:43 +0200
Subject: Re: On the question of virtualization performance loss
To: zhengjun zhang <zhangzhengjunhust@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
References: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <36ef5525-5dc8-1463-14a4-1ff6837c23e4@web.de>
Date: Sun, 10 May 2020 18:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b54b7357-842b-47d2-8a0f-19084d90717d@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aNrTi5MTwElEfjfwgFApf3tJAN924E3pw98dfChqczljjJsEBb7
 aI3OqWIveUzlzZi3kaSq/4zIDjR9Bc0mva9FLtaQPWxgkXbWD3qoVk3Wu3RW7iPs8DnB1XL
 lKQ4eyfSMYrFA2tgSnFm9peA2tsWHYkRuhK5+43iTxci+hm5FnY9QbGTCbhZQTMSqE3vddr
 Nl88i15u8lR8gdgHgXakw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YblMP3iKrZU=:7khGgmk3Y3Rd714mSv5MhD
 JgIaKJ+L5zelf8lvEKGMg8sb5V5SEuhrnIekLHkN87eg+wXdOVOsNjNSlKwDWyipoiV66+7Hl
 rggD3VkYwzMYKVel8JP26vmcJO+EjhYp5O0iK/oZPleQRgRs6iM20jD+ziyTa+bZTalho49To
 cl7SM638C1dBXssa4AG1FWvk2+4IR+grsuUKt4einOMse6MJAVI2DoDdOTMZgnXVEr+8TRH0z
 COh/RRxDgXDn3p16g8QsDNmnYGBc9FTcuhKveh2huiLmY21YroHTQ5N/qoQ9Lv9Nr0r/tZpxT
 IbfvlAWgE/4wkbU4rJdT4g9LgNQwyhrs01zzZJw/TWHpgE9W9FLuODto5v36GivMSW5dUKO2F
 DE+db7FzN++lKAfY3BnvYb+XummJkb2W8vVT+oDznSclf9rTHH5JudjK3vO9IJtxwrX4ciSRq
 904hljVA/+OkzhsldpPFL0XWFMkJUt5MlWz5WZZIq+4Ps2ndrGGsIwHOheuVbRaVfGwO6Y7Ue
 vi2xP5TVrNRV3B93b44OhR9dUdyyTeYuj8yx4BErFP6UQzHA3EhZ7MNdUU+U6enEeWQc/LRil
 IKlv8bHi09sGf6rA03UiR2Urq6+VuldWTl3TNlsSG6nPmeYJshUMyk6+9EgTC8MUWt7u9R3LQ
 8gJe0nv1zTxEp4SG4Rd0PjuqO2gUdQNt64aUdvP4xiYyb7KRnQ5J6x9/vHMamexM1PXMFXe6+
 6JptKJCfsfs5J0sUhc1aG25Dn1jVUifbbiw7t/vi88ULhuEgGYXoUZhgK9228BjpeGNKrW6nU
 bwCUSIZPgllERX79zNibxwUqo/riL3AohpINXFaAaeRqUyslDvjOzVnbF6IxPvjFhHGzfR8aE
 zBlBkGEFh+GD40h1eZUVNEtZr+jwkMK0DBXOQ0UlkQk/7oxGpaHVEPuhhkNLDC6hHbWt3qLoz
 eFO8iRFiy1VIZd2lhWb1Kq7CH4+nxQo2+vF1N5Mnd+DFNiJZ2z2QZHmRShX6BmqrjZFyQXDCZ
 lhJ+8r50iBDBKOOy2WTkxWhfu3dZELgdESPBA5gnNVrYPqfAh37qqYmx2+GYDoRWPcyTPzjnU
 IMbIdu6/GizvwZBgIAYCSQ3JKrPOEw79oJ7MOt59UYTwYd/ooTVfKFq37bpF4k+kp+elxvIMX
 hZHg7wu7OFf51a6n2G6dsSkW0384Kjz6h8Qya0xCfMHOwYnOq0UaX+MeUL+Zt4JnZ/j5zgNGS
 VrwMEf/Qc7ZWxfGD2
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TK5RwYFQ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 10.05.20 17:26, zhengjun zhang wrote:
>
> Hi~
> I recently tested the loss of virtualization performance in jailhouse on
> the i.MX 8MQuad, using the testing tools sysbench and super_pi.
> I used the same Linux image (imx_4.14.98_2.0.0_ga) in the Root Cell and
> inmate Cell
> Here is the jailhouse startup information
> Root $ cat /proc/cpuinfo
> processor: 0
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> processor: 1
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
> Root $ cd ~/jailhouse
> Root $ insmod jailhouse.ko
> [=C2=A0 233.063524] jailhouse: loading out-of-tree module taints kernel.
>
> Root $ ./jailhouse enable configs/imx8mq-veth.cell
>
> Initializing Jailhouse hypervisor v0.10 (66-g2217029) on CPU 1
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 1... OK
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU
> No SMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "imx8mq"
> iommu_config_commit imx8mq
> Page pool usage after late setup: mem 72/994, remap 144/131072
> Activating hypervisor
> [=C2=A0 251.213460] OF: PCI: host bridge /pci@0 ranges:
> [=C2=A0 251.218097] OF: PCI:=C2=A0 =C2=A0MEM 0xbfc00000..0xbfc01fff -> 0x=
bfc00000
> [=C2=A0 251.224313] pci-host-generic bfb00000.pci: ECAM at [mem
> 0xbfb00000-0xbfbfffff] for [bus 00]
> [=C2=A0 251.233114] pci-host-generic bfb00000.pci: PCI host bridge to bus=
 0000:00
> [=C2=A0 251.240052] pci_bus 0000:00: root bus resource [bus 00]
> [=C2=A0 251.245533] pci_bus 0000:00: root bus resource [mem
> 0xbfc00000-0xbfc01fff]
> [=C2=A0 251.252942] pci 0000:00:00.0: BAR 0: assigned [mem
> 0xbfc00000-0xbfc000ff 64bit]
> [=C2=A0 251.260861] virtio-pci 0000:00:00.0: enabling device (0000 -> 000=
2)
> [=C2=A0 251.269478] The Jailhouse is opening.
> [=C2=A0 251.269864] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
>
> Root $ ./jailhouse cell linux configs/imx8mq-linux-demo.cell
> /run/media/mmcblk1p1/Image -d
> /run/media/mmcblk1p1/fsl-imx8mq-evk-inmate.dtb -c "clk_ignore_unused
> console=3Dttymxc1,115200 earlycon=3Dec_imx6q,0x30860000,115200
> root=3D/dev/mmcblk0p2 rootwait rw"
> [=C2=A0 315.757129] CPU2: shutdown
> [=C2=A0 315.759844] psci: CPU2 killed.
> [=C2=A0 315.804134] CPU3: shutdown
> [=C2=A0 315.806843] psci: CPU3 killed.
> Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
> Shared memory connection established: "linux-inmate-demo" <--> "imx8mq"
> iommu_config_commit linux-inmate-demo
> Created cell "linux-inmate-demo"
> Page pool usage after cell creation: mem 88/994, remap 144/131072
> [=C2=A0 315.835959] Created Jailhouse cell "linux-inmate-demo"
> Cell "linux-inmate-demo" can be loaded
> Started cell "linux-inmate-demo"
> [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x2
> [=C2=A0 =C2=A0 0.000000] Linux version 4.14.98-05985-g1175b59 (root@Devel=
op) (gcc
> version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Apr 20 11:57:19 CST 2020
> [=C2=A0 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]
> [=C2=A0 =C2=A0 0.000000] Machine model: Freescale i.MX8MQ EVK
> [=C2=A0 =C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (=
options
> '115200')
> [=C2=A0 =C2=A0 0.000000] bootconsole [ec_imx6q0] enabled
> [=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:
> [=C2=A0 =C2=A0 0.000000] efi: UEFI not found.
> [=C2=A0 =C2=A0 0.000000] cma: Reserved 320 MiB at 0x00000000e8000000
> [=C2=A0 =C2=A0 0.000000] NUMA: No NUMA configuration found
> [=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem
> 0x0000000000000000-0x00000000fdbfffff]
> [=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xfdbd7600-0xfdbd93ff]
> [=C2=A0 =C2=A0 0.000000] Zone ranges:
> [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem 0x00000=
000c0000000-0x00000000fdbfffff]
> [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty
> [=C2=A0 =C2=A0 0.000000] Movable zone start for each node
> [=C2=A0 =C2=A0 0.000000] Early memory node ranges
> [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x00000000c=
0000000-0x00000000fdbfffff]
> [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem
> 0x00000000c0000000-0x00000000fdbfffff]
> processor: 2
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> processor: 3
> BogoMIPS: 16.66
> Features: fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> CPU implementer: 0x41
> CPU architecture: 8
> CPU variant: 0x0
> CPU part: 0xd03
> CPU revision: 4
>
> I executed the same test case in bare-machine, root cell, and inmate cell=
.
> The CPU test results of sysbench in the root cell were approximately 1%
> lower than those of the bare machine, but the CPU test results of
> sysbench=C2=A0 in the inmate cell were approximately 1/3 lower than those=
 of
> the bare machine.
> The super_pi test results in the root cell were approximately 1% lower
> than those in the bare-bones machine, but the super_pi test results in
> the inmate cell were approximately 20% lower than those in the
> bare-machine.
> Jailhouse=C2=A0 is a partitioning hypervisor, why is there a significant
> decrease in CPU performance in the inmate cell?
> This result makes me very puzzled, hope to answer.
> If you need any other info let me know.
> I really appreciate any analysis.

Jailhouse does not treat non-root cells differently from root cells /wrt
performance. The reason must be in the configuration. Were you using the
very same kernel in root-cell and non-root inmate? Maybe Peng can also
point to areas that could explain performance differences.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36ef5525-5dc8-1463-14a4-1ff6837c23e4%40web.de.
