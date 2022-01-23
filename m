Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBR6CWWHQMGQETL4ADIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C694971D9
	for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 15:08:07 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id s190-20020a1ca9c7000000b00347c6c39d9asf9197658wme.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jan 2022 06:08:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1642946887; cv=pass;
        d=google.com; s=arc-20160816;
        b=GRfsjwDz5fj0jo4d8X691vwYWQK7c1m52drEMNsMzPPC/bspjehzIgFew/NRpoOrKm
         CbxhEjeDGmAha33icBnbTE+tYELMnBwG/qHSalpBg/IIUBgz0eswiC/Swu8BZCxGvAYx
         DLjWbpbPLBUJc5XAxPmBqWWPBzxYo5GVMM1QocbTpB5ERLHiazwc3gjxyGtGOpEucrGU
         N8t0lTqHdm/OH5EVamnC4DHyVhFPp7XFEfb3T0Fu9lgOnJGRTN4b2lP/9IDCO37NYbOD
         C0IF9ddCxFCpdZ7A46+LQD6VtIOithxkx6vGVcvgr7RdvC8ennTDibmq+kDfQE/bL89A
         Nm6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=sMjdOc80YSlNoY5B7vG176WM7jYVlvfkchB3Tsudl7Y=;
        b=sNlfmF7dpmWoRyAh0ISHOYOOGxnIj/lHoPEMf1kQxa19C54jlia5GNZ56oC6QNaJIE
         sD/eP4KBGg9Rqkb4cahCSPQppF4h0uIjbe0JPW4bVR4ZyCvhaQtdtxExy8Q0o0nXZCCp
         oJcKOGbHjC4zR8y9OGrzVs9ergIM6APdeqwYMkm/UQLx8RewNFlB6TIKm6DPPOXrbam5
         E795Qc4kS2EmdX7jwLVzjv5oQgsR1R9vlHfX++qz+spYP9lgsc8a8ssHki+pGSpYuksr
         GfqlKBAbcTzBJ4Xg2Q5cL/GBiJ4/+Mw4qml1CN1SMyOogSZYpndDJdgScW0cm5Hc5ZJS
         FZGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c2ADLU3Q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sMjdOc80YSlNoY5B7vG176WM7jYVlvfkchB3Tsudl7Y=;
        b=adEAh21NCWA7+Chrt1mA0i8d1LozTdcamGqye8fP2eQhfcnbSJ+jS5wXt+a88MZxB1
         3Jv6GDOVKtG90bJPKtLN+nsVyzvQv+tUbbzH+Uo00oDTxhE8KYz+NtSiH6TWtZlMSzt2
         K0BgFDRmOKno+95HuNrKmzZqB+ZiK1LavqPqYUtdu+xhuTkYKUMLj/Ivz6rUKLEtVCqd
         btw3FeK54AgHilWBFjrpnV3yk1oigBW76NpmrdUUH0paCaMKfvoj3cky/fYpYc5Nk+qn
         JMq4Zos1aNSLSCFrIab2YpaEd5kXvMTpS5L9/ze1gfxtZR50wKAkbikT0nS/I+LYelNP
         2obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sMjdOc80YSlNoY5B7vG176WM7jYVlvfkchB3Tsudl7Y=;
        b=15ncRt6oP1xlGvoZ9PrFd/Cef02C4Mw3+Nr+A7ykgcQuzMUBmZiKzPO3IshHsstipz
         K6ZwMyuq/KRqptmRjtfx2TdxnHc0P1+IPpbvORcLLCauhpUBZY5Zht12hDr9R6+xaVgN
         x3TL4Gq6fkCgbeJWYsHPp86WYGaYt7poGX0w3Fdf5pnMdWmP9eBVGgiVzSwcBqRE7gV7
         c59jhuN+lX3rUQ0pt0LEMZ1e3FD7d+iWF9h0x34nutuKcDkcBmdtV21FL5yLahPHgKrt
         hxmqPMmDxKdq4vwZ0aw5NT73lJI0HCOghMzhUw7+8g+Tt51D51yi+9eXT9aqBAYuI/l8
         DZUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313iOFFcKCkvbNbyLUz4qZ/Pfb8HmGWthWXvaO0FfrUmtBQxQQ9
	Z/r+eTXxO1tLwpJTv85S55U=
X-Google-Smtp-Source: ABdhPJywvos6iHhV1ZFrG3QP6apb10qCfR6v8JqjyKaVI0xjC98DLbRYNGJ+SrSxV8QqiObd1DB30g==
X-Received: by 2002:adf:d238:: with SMTP id k24mr10811744wrh.516.1642946887682;
        Sun, 23 Jan 2022 06:08:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e390:: with SMTP id e16ls47972wrm.0.gmail; Sun, 23 Jan
 2022 06:08:06 -0800 (PST)
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr11007428wrs.498.1642946886521;
        Sun, 23 Jan 2022 06:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642946886; cv=none;
        d=google.com; s=arc-20160816;
        b=XOputdbkRLPh4icIY6B0FMl9ERgBqQkN09fFyHzgpHcZMm2SvbLcMkd31Tk6cvYnBK
         nD+5vtX43rDEJw708oTqBjDOnPnF1rJRn3z04ehu4MzGvupxPssMKCmkiOeg2WTr0q2u
         QL+bL2WA25tzYoZq+kSfVxHWiFGhyshT26rUuFqkIVrASwE8ZxNGgsWb+hmOP+HYPUmm
         BmgjdCrd3PKxnrVn/jmCQI/vKst/a0pm3q/IlHUHhSuZBuau+Ba1Ql5Maj83Itgrha6t
         Oz3ebpVDaC1e+i2nqx5oH5gay2Oz/asZjtg1+EeJOGF2dmVF0qG2MdeslDG1c5QmShJ+
         FKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GhB4LHqgJpj6Fj2XDRPEynwYw26iYt73Iqz954WG6S4=;
        b=QyO7jLTMpvrXY2SoG4w9EMR60hSBYny1k4VNc9A7Sxo0usBOIoAaK9QNwPwbmXMFlM
         9t0bfEhmjryRGEOrAnFG9OU6L5yhHj1BOf5lQIZa4cl7r75uBqp315uan6HtoiLJ46tU
         VmUIoCBvclO/9SYY/4PC793W5YtudMBkt3+57QtKe4Apy9xuvNfqkQf8V2htULHUhVrH
         M/gBKs+zv13abmX3E6V9Qrbxum+n3vEZT5xF53vmWnguM9FwCuX8zgef8nvG5g95izu4
         QCSfxuz4DZmMGeG1n5H+k0BnzSOFEZcGWrYBKH1e/ebq+jALjzoHghRNm8ejUKWrE69A
         HUfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c2ADLU3Q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id l24si502764wmg.1.2022.01.23.06.08.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 06:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3Xjd-1mCLqw1NdT-010fx5; Sun, 23
 Jan 2022 15:08:05 +0100
Message-ID: <a7d42f4a-9491-9530-8892-121c31fef3f3@web.de>
Date: Sun, 23 Jan 2022 15:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Help Needed Regarding Virtio IVSHMEM
Content-Language: en-US
To: Anmol <anmol.karan123@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
 <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
 <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
 <CAC+yH-ZsR5AqLjCuK+y5ePczmiMK7upnkh3O+ppq8nEzC=j1TA@mail.gmail.com>
 <5f6add41-9c0a-0403-979f-19f4702dd45c@web.de>
 <391b2878-029d-4a31-b811-29d78749924an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <391b2878-029d-4a31-b811-29d78749924an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x2aJBPRui6qYlTTobxn5ffZHVPNEaEwXj1nzugtVCWcxUdxLmtz
 F0e97/obocWWjHkLGY5nWIXwl5Xck5HKedTg0Kp6zQCQtN7OjVSRo/tygjIQu1VJ5dmbKM3
 SUmUZWr0lc4TpW4q9iyGMJ1+WYJYtWed10HfLZGTV3r/4lduIzXgyS2kS8KyAa7D5364+Vp
 ZkCFDZL3M2v0dSvzn1K/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rLbqL/bXJKI=:zVAW5ohG6YZLR5O3ofww+w
 VZgiM2daw01tSDQHxbhFdHFAcdhpjWOoM6VqqL97+NsqlWfWyYcsqXee1LqP3liLkbKYED1On
 M9nDRTJ84nYPipyAWxc9eRcoNFmOxibODUrQr1w+oJ/QzcA2fKFJiCtmtnGQNC371t9Tvext4
 EoxqRl03nXkemI87hu/ixXHgGXKIlgM1jEc5sD+fx+yZ7ffTEavHSXUO7DPmfjhhggLUdSZfm
 E1tXtr5Dw3X7IptYCU6+KU4fNwZHgx3qOaxDpX2uJxuXaffCy9r89eEoKkNc/kS2l+l5rRKOg
 tbI0Jsb+3PB+m0A3S/vf/M+A6mmNGSuGUkPZyg2Mqclaf1KsGaQk1RI7r64XvoeuC68UNyhqh
 J0nLwk9Rr2jqbWFKdaQ0V/AlIOSAXdQPNap3+RDsBxRfdDkuJOHZIxlEAVq3FgFitF4tDNIch
 VPxPJ408WV0E9kPcVY/tPJUTBrb/ftzvhYsqt2MikLUEtR+Fl2hefwejyonhxN9nmabKiEqlO
 XVe54UAyrHrUbVCr8beELlw+byc/x0eajb+PyPZzuvrQwQ7W/Ped1qQTjqHx91LxPyjfMlNGn
 l+Me39dhyP8m+GJRnAcn0hFbJEzaybhvl9OL53y85a72Wpk0wtJNv6gNX9vfnGYneikjD2EHV
 kiFnikJslJLytkYnyEETxuM6p0Hmvj5uA2oLIvv32R91L94nAPh54HvIsmsirNQxkUAg4aALB
 VtjwDbC2UbI66rzaU6nTF1RdjA0toN3U0UnTB8wlKR5cETPyMh0dLmL4r4gFlW6hFTum8eO/0
 3IOwFz2Z6Svigw3S5ROR5OgVxU6GBtPjER96jYyjiThn50TG3/H6+thlRDwplw+dPq0jgzy7E
 DAYuz19fTwVGbBIDVGsgoCWcK8ZI8TPtt0sfOQlqhwWD3TpODhZAOb3PIM40nm6cNunDr3KQQ
 PypGPDTTaocyCofm+6cwkMW6GmHYEf2po3Meypp2pYAuYdnYKyLVrq6pWcBruJzJLDnkLp/Ah
 BDDtybmK2wWWToI3p14dHBUNnL/pcPAP1sJMN51m6t324TftkEpgdzL8YQCEVC8JG8vk++qNS
 Won18N7dcYsLR4=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=c2ADLU3Q;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 19.01.22 10:40, Anmol wrote:
> Hi,
>
> I have tried to figure it and resolved the "PCI devices not showing",
> and devices are showing now(`c` and `d`):
>
> ```
> Activating hypervisor
> [ =C2=A0 73.183592] pci-host-generic fc000000.pci: host bridge /pci@0 ran=
ges:
> [ =C2=A0 73.199132] pci-host-generic fc000000.pci: =C2=A0 MEM
> 0xfc100000..0xfc103fff -> 0xfc100000
> [ =C2=A0 73.208489] pci-host-generic fc000000.pci: ECAM at [mem
> 0xfc000000-0xfc0fffff] for [bus 00]
> [ =C2=A0 73.218012] pci-host-generic fc000000.pci: PCI host bridge to bus=
 0001:00
> [ =C2=A0 73.226675] pci_bus 0001:00: root bus resource [bus 00]
> [ =C2=A0 73.233239] pci_bus 0001:00: root bus resource [mem
> 0xfc100000-0xfc103fff]
> [ =C2=A0 73.245689] pci 0001:00:0c.0: [110a:4106] type 00 class 0xffc002
> [ =C2=A0 73.255187] pci 0001:00:0c.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0 73.268934] pci 0001:00:0d.0: [110a:4106] type 00 class 0xffc003
> [ =C2=A0 73.275920] pci 0001:00:0d.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0 73.333292] pci 0001:00:0c.0: BAR 0: assigned [mem 0xfc100000-0xf=
c100fff]
> [ =C2=A0 73.350022] pci 0001:00:0d.0: BAR 0: assigned [mem 0xfc101000-0xf=
c101fff]
> [ =C2=A0 73.365843] The Jailhouse is opening.
> [ =C2=A0 73.379727] xilinx-dp-snd-card
> fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to init link
> xilinx-dp0: -517
> ```
> but after doing this,
>
> ```
> root:~# modprobe uio_ivshmem
>
> root:~# echo "110a 4106 110a 4106 ffc002 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id
> [ =C2=A0448.468251] uio_ivshmem 0001:00:0c.0: enabling device (0000 -> 00=
02)
> [ =C2=A0448.479735] uio_ivshmem 0001:00:0c.0: state_table at
> 0x0000000050400000, size 0x0000000000001000
> [ =C2=A0448.487710] uio_ivshmem 0001:00:0c.0: rw_section at
> 0x0000000050401000, size 0x00000000000df000
> [ =C2=A0448.504564] xilinx-dp-snd-card
> fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to init link
> xilinx-dp0: -517
>
> root:~# ./virtio-ivshmem-block /dev/uio0 disk.img
> ./virtio-ivshmem-block: cannot open /sys/class/uio/uio0/maps/map2/size:
> No such file or directory
> ```
> It's still not able to detect the required device.
>

Did you check what is listed under /sys/class/uio/uio0, which element is
actually missing in that path?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a7d42f4a-9491-9530-8892-121c31fef3f3%40web.de.
