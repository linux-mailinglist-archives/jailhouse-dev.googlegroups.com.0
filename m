Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZOAZ3ZAKGQEFDEMUOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389316A37C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 11:07:34 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id z1sf1701424wrs.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 02:07:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582538854; cv=pass;
        d=google.com; s=arc-20160816;
        b=yYpOE0b+BMro5HYe9D3TMfHCYGtf5qhgi5CV8MBkaL8g2dHkbFmwHNiv0d5H0bVuTc
         uUsEAHm2mJRZ2SIueQ6NHQfDLD4iFQooWOnKyQw4KIha1srczClUa6vqdHBbAnBq4Zfh
         wPx4OX35rKYf2xgl/jBaCZv7BeZCZAJUUpWGQL5GhpznFc5IGA7F7scl7JnYNFSZCMfA
         yJPXLIK3sFwAq2QHUL4uLTRmQd7/XhNln8ovFLWPiSreek0CocMnvPmiaRrNX7OJ9bTk
         opPGeAry+q4b4jXOHLYljABvBzWnpdBXBYlB4V6BHNM2c6gxR/6z6bY3qGtKl52mkN0s
         Yc/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tlh5Wn/7YDOwcWOG0WnBrxrjhD4A6fIEZdVJUjf1KRE=;
        b=D2qW/Zz6RIwNyo7Zivdx/2aDlm1A9HjEfcFaoPWu5ZYO1XdkUIqtriY67a8VN60iqd
         OjeyfF6h1fip9kvvY1hQ92ocBCq0ZP+Rm4U1Z8iHx//vZeBt2hdOflX86dSXAcxqB3cT
         5jbnUUEvc5PHXB2EkhJNXUxcJe1C4/7aBAA+M6ohxV/NcoxLjJ8utauGwx9SSZlwf0uC
         MDdDauN9e8F+NWuY06TV7AaZexopjFnqHf+TVgdP+E88ruxrfIqYCOyxys+ZrhdbxM+D
         nNmajkIi5gW0tfe9qw0nOtr0YMLEdgDy1JEIbgb1Vo93n38Y2UoikJVJbYW6KFj/2TBZ
         lTCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tlh5Wn/7YDOwcWOG0WnBrxrjhD4A6fIEZdVJUjf1KRE=;
        b=kHpeZDNtH0afsKH9B7/Klu4vKMN3neCGEJm7T0sUaKOSxAHDaN0JoNtwbbWTxg7XRu
         0Pn+jPBamJSYePgOUDfOQs40nwtegfkWoVkPt9q7UVkzU7yjmcE9KcNWFAvPjX8hr9Y0
         Xc9OxkHv4FMN5/DGOEw1q5cVBx1aGVvD+sf3fSqdwL0GbCnTRmSOxlC4B51vbnU0SKxW
         Ubc5tGEFlbCGnXGeuqB1V3haWMhQI5AxEzyyRdl7pQnw3gWbdRXP3klbxfnhf2y5vunw
         vDSlcHcoFNoKLZ0fLyouoaEewwx2JPnVLG8tldBr0iajawq3kCyhEubxhrA6X+kXfsDM
         bwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tlh5Wn/7YDOwcWOG0WnBrxrjhD4A6fIEZdVJUjf1KRE=;
        b=Cglu36ZvTMt/FJZCMw1+MDvSNOZkh/PLzjf6L6wUgZmZui7mxAskjp0SFCLTP+AOYl
         FX/kWbbHhQnMAonXb71an+KYbfe3OVKzs5pN5Q4AFG7gkqy67syyFLJIxArxiAi0fumy
         4qT1zJgYiLk/LWvS2vNj2CAtbkPnJEPg395Ugnxp5ncIv1fysHCKsC6l/9aqV/dT6Na8
         BhzcLB2h3My+X+05Clab4PLeuQnXVQ1vf3tJIHlU3PLbSJ/flopHF8dZsUZZdjlfZorE
         SE4namjuCenCJsWLszQN6Ly89YOL0Y1hLSq5tIFjj1hX0pbZTcNNe21mcBQrbrl9HKLl
         Sxhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4H2l3oX+2uaRBWhSiM0qCJOqKGGscgqlCGBnSBEX8pimxZyvy
	F0Htx5xNUwiAEtXGOepaStM=
X-Google-Smtp-Source: APXvYqz2ZFsjYjj0K+RLpeotv59uMEfVJ3Q5JaUosSvdQV1YQdHR4u0uJh9qGwgy3q0749/rrmeI9Q==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr68552520wra.390.1582538854078;
        Mon, 24 Feb 2020 02:07:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c6:: with SMTP id g6ls4422534wmk.0.canary-gmail; Mon,
 24 Feb 2020 02:07:33 -0800 (PST)
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr22304847wmm.82.1582538853003;
        Mon, 24 Feb 2020 02:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582538852; cv=none;
        d=google.com; s=arc-20160816;
        b=ju6Y5d33gvWGPkicD5wkZl5jVXxrLXHF1HV289dsVdROahcSyqS9pQ97iAuxOQSjPT
         2gUWnxs7kgo+8iktM3AWjw1rwgOuMVq7YZoYYuiLhmMhmRz2ZVIT8kYgf51r3d9rn+t3
         WUaKlzhvN3NwYzVFD5sz+IfsUSeoeY6EJs9FHersfwdIjhgkwp55PkkQkiNOz3EmFXus
         DC4s9DgepnV5Pbt5Qh9iKUIuEn15LiuowGtyZF8L7ue40nQ1V64S9Z8UH6DHa4/TLekV
         /Y6sh+057xOkx870FvP4krk1gWazgjNTK6FERxtb/zlBu047RIEBPuZyAxITqEK9kEZG
         MbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JAe5IwnvdgZEF8NHEZ8/9Vt2o3ASHKtdSLjWUgWqBuU=;
        b=lYwKOhx+GvsZOzYLRxxSzkyPJRGV+y0aaG5h34lOPgomolufrjIiKKM/P3qpgpe8mi
         qEJoVxH7MFulClFwHeWUMbirYXyul/cWSzSxp5KD7iWw9rxV4YjjlO5DQwSiu1V31W+R
         kVCUzWmXaA/XCdNVIA2pS+hsxX6C/6CuCyClDAhWU0k4ISZSrwFpPsEoD9Ji1EnZvOa1
         C2agw7Lsiz9v9c4mDT4e5DK+dUXVomYUIL5WMYzx6CZqyeTdkeXNwrm0d9Pt9miDgQ8/
         GwZijbheHEHWssXOfj+6QEo0Mg0WmXj84hCS27ugbpXuxbEewwBVKzW1UKLJ5DxTVeHv
         qPhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d14si745162wru.1.2020.02.24.02.07.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Feb 2020 02:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01OA7W8m000504
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2020 11:07:32 +0100
Received: from [167.87.8.230] ([167.87.8.230])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 01OA7V2M010679;
	Mon, 24 Feb 2020 11:07:32 +0100
Subject: Re: Linux non-rootcell with IVSHMEM
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
 <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
 <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7557bc16-d8c7-7b60-7aaa-6914d9effc51@siemens.com>
Date: Mon, 24 Feb 2020 11:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 24.02.20 09:46, Philipp Rosenberger wrote:
> Hi Jan,
>=20
> thanks for the fast reply.
>=20
> On 21.02.20 09:31, Jan Kiszka wrote:
>>> I start the non-rootcell with the following command:
>>> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
>>> "console=3DttyS0,115200 8250_core.skip_old_serial_uarts=3D0xE
>>> earlyprintk=3DttyS0,115200 ip=3Ddhcp root=3D/dev/nfs rw
>>> nfsroot=3D10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
>>>
>>> Here is the log from the hypervisor:
>>>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>>>> Shared memory connection established, peer cells:
>>>>  =C2=A0 "RootCell"
>>>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>>>> Shared memory connection established, peer cells:
>>>>  =C2=A0 "RootCell"
>>>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>>>> Shared memory connection established, peer cells:
>>>>  =C2=A0 "RootCell"
>>>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>>>> Shared memory connection established, peer cells:
>>>>  =C2=A0 "RootCell"
>>>> Adding PCI device 02:00.0 to cell "my-inmate"
>>>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>>>> Removing PCI device 00:00.0 from cell "RootCell"
>>>> Adding PCI device 00:00.0 to cell "my-inmate"
>>>> Created cell "my-inmate"
>>>> Page pool usage after cell creation: mem 377/975, remap 65546/131072
>>>> Cell "my-inmate" can be loaded
>>>> CPU 3 received SIPI, vector 100
>>>> Started cell "my-inmate"
>>>
>>> I get no errors or anything. The cell starts without problems when I
>>> remove the IVSHMEM parts from the config.
>>>
>>> I use the following kernel:
>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues=
/jailhouse
>>>
>>>
>>> And the jailhouse from the current master branch
>>> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)
>>
>> That kernel contains support for virtio over ivshmem, and you are
>> exposing two frontend devices, likely without having the backends
>> running. Start with removing those frontends again if you are only
>> interested in ivshmem-net or custom ivshmem (via uio etc.). If you want
>> to try virtio, make sure the root cell has the backend demos running
>> (tools/virtio/ivshmem-*). See also
>> https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.jan=
.kiszka%40siemens.com.
>>
>=20
> In the end I want to run the whole ivshmem stuff including the virtio-*.
>   For now I removed everything except the SHMEM net stuff.
>=20
> The rootcell looks ok:
>> [   27.704596] jailhouse: loading out-of-tree module taints kernel.
>> [   30.266681] hpet: Lost 1859 RTC interrupts
>> [   30.266938] pci 0000:00:0f.0: [110a:4106] type 00 class 0xff0001
>> [   30.266961] pci 0000:00:0f.0: reg 0x10: [mem 0x00000000-0x00000fff]
>> [   30.266969] pci 0000:00:0f.0: reg 0x14: [mem 0x00000000-0x000001ff]
>> [   30.267208] pci 0000:00:0f.0: BAR 0: assigned [mem 0x90400000-0x90400=
fff]
>> [   30.267214] pci 0000:00:0f.0: BAR 1: assigned [mem 0x90401000-0x90401=
1ff]
>> [   30.267295] ivshmem-net 0000:00:0f.0: enabling device (0000 -> 0002)
>> [   30.267339] ivshmem-net 0000:00:0f.0: TX memory at 0x0000000100701000=
, size 0x000000000007f000
>> [   30.267342] ivshmem-net 0000:00:0f.0: RX memory at 0x0000000100780000=
, size 0x000000000007f000
>> [   30.267809] The Jailhouse is opening.
>> [   30.273553] ivshmem-net 0000:00:0f.0 enp0s15: renamed from eth0
>=20
> But when I start my non-rootcell it just hangs like before.
>=20
> my non-rootcell:
>> #include <jailhouse/types.h>
>> #include <jailhouse/cell-config.h>
>>
>> struct {
>> 	struct jailhouse_cell_desc cell;
>> 	__u64 cpus[1];
>> 	struct jailhouse_memory mem_regions[9];
>> 	struct jailhouse_cache cache_regions[1];
>> 	struct jailhouse_irqchip irqchips[1];
>> 	struct jailhouse_pio pio_regions[5];
>> 	struct jailhouse_pci_device pci_devices[3];
>> 	struct jailhouse_pci_capability pci_caps[13];
>>
>> } __attribute__((packed)) config =3D {
>> 	.cell =3D {
>> 		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
>> 		.revision =3D JAILHOUSE_CONFIG_REVISION,
>> 		.name =3D "my-inmate",
>> 		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
>> 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>>
>> 		.cpu_set_size =3D sizeof(config.cpus),
>> 		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>> 		.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
>> 		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
>> 		.num_pio_regions =3D ARRAY_SIZE(config.pio_regions),
>> 		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
>> 		.num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
>> 	},
>>
>> 	/* CPU 3 */
>> 	.cpus =3D {
>> 		0x4,
>> 	},
>>
>> 	.mem_regions =3D {
>> 		/* IVSHMEM shared memory regions (networking) */
>> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 1),
>>
>> 		/* low RAM: 1 MiB */ {
>> 			.phys_start =3D 0x100700000,

You have low RAM and ivshmem at the same location.

We really need a config checker...

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7557bc16-d8c7-7b60-7aaa-6914d9effc51%40siemens.com.
