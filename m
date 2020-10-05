Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2NO5T5QKGQE4D23UZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ADD2835F0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 14:54:02 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id j7sf93641ejy.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 05:54:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601902442; cv=pass;
        d=google.com; s=arc-20160816;
        b=goRddmQjsEFTPHtXBCTFUIXttkxJ0myPyjaOEzL1GqcRg7IrKUV43396WGwBDF4keK
         rKS4aAcb0jb0i+iQ/PWn5KYjmA01uDnGi8k3Y6XtlG830SHKx6FIeor6HwYoXEb17ywA
         Rf4E2fko+FZyV3IyIxNRF9HrN9I+7PtsAUL59AXlqCRFe9BDvbZoNnefok0FVv7XRaf4
         1lJRPQIgDBHXQo0X6PQyu5Ff6egL8sTRPKnoRq9maXLE6tdZoHpdGOBs/xwGNSP2jGO0
         L7xYJB3wGgc8cyuAhJ5W5xbVJ5zdZqBDyzqNDSx0kn0YJcIKEzlIQ8byS52Fg/uhg8HQ
         K9zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=9Tg9Vd+9M5C8Uz4SIBwshDQy3e46G2p1R9zlFlgWq8o=;
        b=JQD+rYTg7j1XG+X79Ka8cTTj1F1pkjZ1UzOOpXyeW5iLsKgziOO6PNDHLbJ0Y0y1vT
         1y3NZMOJi1YcEed84794/qMBQa77SWY3zyEaHGVGz8Ll0qaH3UgzO97kV4Q1G+Gbx2YA
         rM6+0qp0zVYEOQglSVwdpi4WT3tT/2Ny5nraJinrCaGNuf9ynYOS9psmjSjNLQ3E/+iL
         js9SMHSRKLhGicHJL451dBBqshhLsuUd/QgyC3lthILNaSYhJeHi54tv+Fif3Zk6HBlo
         fh5i4ukdnknv/Epzl3+rnIAq7ESrFfpwM6HCERm+/iuvl5Q3f3r9I8NTZ9qad1eoLoT6
         DYmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Sigy3q4D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Tg9Vd+9M5C8Uz4SIBwshDQy3e46G2p1R9zlFlgWq8o=;
        b=A9XFssBzY4YpbFwTeqvPof8uicMoS7u/fbbDWVzT1TCOmlSox7lP3T0N9k9Q8jY0tJ
         xRZ5Lfr72ymlG6qU4NIpD7LOajDnH/AdOKZcg26cj1hT2bArGgI2uwWocUDI25Xngqus
         8OooF2fKaHi/udEwSxD/pw3CBncXE685obTZSFH0Gw9q7KUwpAHLkHaNETdpmC90o41B
         SjcuoqN2nusuNpUHe/MFaPdh8L/amiFZtVBKgapHndM3+xhRsTR8+cp2XIUvusf46RGk
         2Zt2mftF0sFDxLDBYJMdKlDI0Ijrp4iOHxcOfeVtalno9sTLvuxrwO8Hda/hwK6mLV8c
         nYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Tg9Vd+9M5C8Uz4SIBwshDQy3e46G2p1R9zlFlgWq8o=;
        b=MWUymOtzQ3qJKaoRLcYBNZSma8ocA92cD1P4D85/VN1NDprKTPT5j8u8ZLftOsT+aq
         +v3KVsb1ZWwTwXxczt+OsSNOt2Je0AiWmC3aPzz97LDaNS+O6Dag0lIfF5MI0RJ386ar
         iGjzGyzwMGEV9vFatp/ykhsiX8JGtPgkx5JF7zJq/muOXj/ZGT8+dqU6B+D+bDmPEwOC
         I6k+VTmW5rLKDv+hgfC3T1ocD3CTLmuVCY1cWrfWh9CiVlHflzb+/fBV1SLXkwP/+PiU
         wJYKy/uIUiPZ4ieYcR/8nURHvglMxCLsXD/ceWqLBqLu5V9a6uHHdDXuv7xBNxuEmW/k
         bZ3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530U1CzmU/N16IClFNI6OVS1ykC5DtyhYCqTwF7GJFxSUm5Ls2Zo
	17XOiCjgCIeATP+RoJRQ5lE=
X-Google-Smtp-Source: ABdhPJxeRFmKfcKkmo6pT5a52o1zbHshXR1LbLkx0AseZzp9v213lUHb3NJmF2+IqsKNGtJyHzm+hw==
X-Received: by 2002:a05:6402:142c:: with SMTP id c12mr17572509edx.41.1601902442283;
        Mon, 05 Oct 2020 05:54:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4c8c:: with SMTP id q12ls4253417eju.2.gmail; Mon, 05
 Oct 2020 05:54:01 -0700 (PDT)
X-Received: by 2002:a17:906:d8b6:: with SMTP id qc22mr15754930ejb.196.1601902441156;
        Mon, 05 Oct 2020 05:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601902441; cv=none;
        d=google.com; s=arc-20160816;
        b=taw3faXOcUXWLxXFducmZhdt7Hmx5r9MPRKtu0PSWcIcrKzK/SvhE3NTJgjv/NDU+v
         WHWivRWlk74YHL7aVu5OlhqwiGJoMyl2ziFQh3hg+UHN/RwwNTP7tqmLqsx6/kTRAhkf
         FV2CFAqUmm4VwALL2UgBA9Bcc5iIkV/MOLtAFnlmozYfZ8TW0PqxoeqEdL1J5Gml7UgD
         axNE16LkmkMVEoqECLJCHsp15eDWrZZmO8zuiMl4pVjVLV/ZEBC9FQSjDMOHkNX63NSw
         JaFopo498IS1gu17UAvrg2sJ/sI9aBN9RFVCGop4iXskoxzib/TxXIoujyso+I2hV+JA
         L/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:dkim-signature;
        bh=ZQO99z3Fi2Tq9F/O6RcPACqcIn+wnUhCiiqVoWgv2qs=;
        b=JkZeHFODvJVW+HtiNrvhFBXPYGaBm/gdB92wo6S+BZDzQ6eGTLTxJakOp9v+AKvNuX
         VCcLk4TQ3mhSHnB3Saryok5A7f6YpU5BRE8Qrf9/1O+DoMdyNi+m+98UV29ahdaYSIkC
         l2lLXMYv+/SLEaOL4kr1C2zpXNIWqXe/IJsejAslvYa2hSeKQ/MuJP87TBYkfB9gB/b1
         Z5QIvpTlmdggCPETkSMYeP32AxAGik06RZZdZ7OfIAHIydICdngu2aFxuMH8DtFlUyJR
         5XWi4PgKGpc28/Kso+hyfWHcpegZgsKeCyjkX+81w8cR5O058lsQpy1Oq7qg2NLPIMqT
         UAlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Sigy3q4D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id dk15si347414edb.2.2020.10.05.05.54.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 05:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4C4gX84CrZzxpk;
	Mon,  5 Oct 2020 14:54:00 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 5 Oct 2020
 14:54:00 +0200
Subject: Re: [jh-images][PATCH 00/19] Add Ultra96 v2, refactor/update TF-A
 integration
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Vijai Kumar K
	<vijaikumar.kanagarajan@gmail.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <f13614cc-920a-e8f9-8a36-e6992b736698@oth-regensburg.de>
Date: Mon, 5 Oct 2020 14:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
Content-Type: multipart/mixed;
	boundary="------------4EB1AF95151F8BB480FD6C45"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Sigy3q4D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

--------------4EB1AF95151F8BB480FD6C45
Content-Type: text/plain; charset="UTF-8"



On 05/10/2020 07:39, Jan Kiszka wrote:
> The primary functional enhancement of this series is support for the
> newer Ultra96 v2.
> 
> In addition, the series refactors the Trusted Firmware A integration,
> using a soon to-be-upstreamed Isar patch. The refactoring also bumps the
> version of TF-A and U-Boot on affected boards, namely Ultra96, RPi4,
> Pine64+, MACCHIATObin. For the last two, I'd need some test feedback as
> I do not have them in reach.

For the MACCHIATObin, please find the log attached. Early stage
bootloaders seem to run, while u-boot gets some abt while trying to load
the device tree.

Test on jailhouse-images/next, 6d797f1f59d.

  Ralf

> 
> There is still some room for improvement, but none that should delay the
> first integration:
>  - revision-specific PMU firmware for Ultra96 (primarily changes the
>    power button IIUC)
>  - wilc3000 wifi driver clean-up (lengthy story, but I'd like to move
>    closerto the official downstream repo, which should move us closer to
>    a potential upstreamed one (wilc1000 is already in 5.9)
> 
> Jan
> 
> 
> CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> CC: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> 
> Jan Kiszka (19):
>   ultra96: Rename to ultra96-v1
>   u-boot-ultra96: Set fsbl config explicitly
>   u-boot: Add specifics for Ultra96-v2
>   linux-jailhouse: Drop unused patch
>   linux-jailhouse: Add patches for Ultra96-v2
>   wilc: Add out-of-tree wifi driver for Ultra96-v2
>   customizations: Add Ultra96-v2
>   Hook up Ultra96-v2 support
>   README: Add Ultra96-v2 support
>   ultra96: Disable initrd usage
>   ultra96: Add rootwait kernel parameter
>   pine64-plus: Disable initrd
>   Consolidate PREFERRED_PROVIDER_u-boot
>   Add new TF-A build infrastructure
>   rpi4: Convert to stand-alone TF-A recipe and update to 2.3
>   pine64: Convert to stand-alone TF-A recipe and update versions
>   ultra96: Convert to stand-alone TF-A recipe and update versions
>   macchiatobin: Convert to stand-alone TF-A recipe and update versions
>   arm-trusted-firmware: Remove now unused artifacts
> 
>  README.md                                     |  10 +-
>  conf/distro/jailhouse-demo.conf               |   5 +-
>  conf/machine/macchiatobin.conf                |   6 +-
>  conf/machine/pine64-plus.conf                 |   1 -
>  conf/machine/rpi4.conf                        |   4 +-
>  .../ultra96-v1.conf}                          |   6 +-
>  .../ultra96-v2.conf}                          |   8 +-
>  conf/machine/{ultra96.conf => ultra96.inc}    |  11 +-
>  ...mo.conf => ultra96-v1-jailhouse-demo.conf} |   2 +-
>  ...mo.conf => ultra96-v2-jailhouse-demo.conf} |   2 +-
>  images.list                                   |   3 +-
>  ...de-for-building-custom-Trusted-Firmw.patch | 127 ++++++++
>  kas.yml                                       |   4 +
>  .../arm-trusted-firmware-rpi4_2.2.bb          |  28 --
>  .../arm-trusted-firmware_2.2.inc              |  20 --
>  ...-Prepare-for-skipping-initialisation.patch | 127 --------
>  ...2-plat-rpi4-Skip-UART-initialisation.patch | 109 -------
>  ...pi3-4-Add-support-for-offlining-CPUs.patch |  47 ---
>  .../arm-trusted-firmware/files/rpi-rules      |  23 --
>  ...se-abspath-to-dereference-BUILD_BASE.patch | 144 ++++++++
>  ...-fix-gcc-warning-about-uninitialized.patch |   0
>  .../trusted-firmware-a-macchiatobin_2.3.bb    |  34 ++
>  .../trusted-firmware-a-pine64-plus_2.3.bb     |   6 +-
>  .../trusted-firmware-a-rpi4_2.3.bb            |   6 +-
>  .../trusted-firmware-a-ultra96_2.3.bb         |  17 +
>  .../trusted-firmware-a_2.3.inc                |  19 ++
>  ...efile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch |  31 --
>  recipes-bsp/u-boot/files/macchiatobin-rules   |  40 ---
>  recipes-bsp/u-boot/files/pine64-plus-rules    |  10 +-
>  recipes-bsp/u-boot/files/ultra96-rules        |   5 +-
>  ...a96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} | Bin
>  .../{ultra96.bit.xz => ultra96-v1.bit.xz}     | Bin
>  .../u-boot/files/ultra96-v2-fsbl.elf.xz       | Bin 0 -> 44040 bytes
>  recipes-bsp/u-boot/files/ultra96-v2.bit.xz    | Bin 0 -> 58072 bytes
>  ...lf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} |   0
>  ...a96.bit.LICENSE => ultra96-vX.bit.LICENSE} |   0
>  recipes-bsp/u-boot/files/ultra96.bif.tmpl     |   7 +-
>  recipes-bsp/u-boot/u-boot-2020.07.inc         |  17 +
>  .../u-boot-macchiatobin_2019.10-atf2.2.bb     |  43 ---
>  .../u-boot/u-boot-macchiatobin_2020.07.bb     |   7 +-
>  .../u-boot-pine64-plus_2019.10-atf2.2.bb      |  33 --
>  .../u-boot/u-boot-pine64-plus_2020.07.bb      |  25 ++
>  .../u-boot/u-boot-ultra96-v1_2020.07.bb       |  40 +++
>  .../u-boot/u-boot-ultra96-v2_2020.07.bb       |   1 +
>  .../u-boot/u-boot-ultra96_2019.10-atf2.2.bb   |  43 ---
>  ...story-ultra96 => .bash_history-ultra96-v1} |   0
>  .../files/.bash_history-ultra96-v2            |   1 +
>  .../{postinst-ultra96 => postinst-ultra96-v1} |   0
>  .../customizations/files/postinst-ultra96-v2  |   1 +
>  ...-revC-Give-wifi-some-time-after-powe.patch |  38 ---
>  ...san-Separate-out-clk-related-data-to.patch |  99 ++++++
>  ...san-Add-sampling-clock-for-a-phy-to-.patch | 232 +++++++++++++
>  ...03-arm64-zynqmp-Add-firmware-DT-node.patch |  37 +++
>  ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch | 109 +++++++
>  ...san-Add-support-to-set-clock-phase-d.patch | 160 +++++++++
>  ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |  44 +++
>  ...san-Add-support-for-ZynqMP-Platform-.patch | 308 ++++++++++++++++++
>  ...irmware-xilinx-Add-DLL-reset-support.patch |  57 ++++
>  ...san-Add-support-for-DLL-reset-for-Zy.patch |  99 ++++++
>  ...p-Add-ZynqMP-SDHCI-compatible-string.patch |  52 +++
>  ...san-Modified-SD-default-speed-to-19M.patch |  64 ++++
>  ...support-for-Avnet-Ultra96-rev2-board.patch |  83 +++++
>  .../linux/files/arm64_defconfig_5.4           |   2 +-
>  recipes-kernel/linux/linux-jailhouse_5.4.inc  |  12 +
>  recipes-kernel/wilc/files/debian/wilc.install |   1 +
>  recipes-kernel/wilc/wilc_15.2-avnet.bb        |  33 ++
>  wic/macchiatobin.wks                          |   2 +-
>  wic/pine64-plus.wks                           |   2 +-
>  wic/ultra96.wks                               |   4 +-
>  69 files changed, 1877 insertions(+), 634 deletions(-)
>  copy conf/{multiconfig/ultra96-jailhouse-demo.conf => machine/ultra96-v1.conf} (64%)
>  copy conf/{multiconfig/ultra96-jailhouse-demo.conf => machine/ultra96-v2.conf} (54%)
>  rename conf/machine/{ultra96.conf => ultra96.inc} (52%)
>  copy conf/multiconfig/{ultra96-jailhouse-demo.conf => ultra96-v1-jailhouse-demo.conf} (89%)
>  copy conf/multiconfig/{ultra96-jailhouse-demo.conf => ultra96-v2-jailhouse-demo.conf} (89%)
>  create mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
>  delete mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
>  create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
>  rename recipes-bsp/{u-boot => trusted-firmware-a}/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch (100%)
>  create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-macchiatobin_2.3.bb
>  copy conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb (58%)
>  copy conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb (59%)
>  create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.3.bb
>  create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
>  delete mode 100644 recipes-bsp/u-boot/files/0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch
>  delete mode 100644 recipes-bsp/u-boot/files/macchiatobin-rules
>  rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.xz => ultra96-v1-fsbl.elf.xz} (100%)
>  rename recipes-bsp/u-boot/files/{ultra96.bit.xz => ultra96-v1.bit.xz} (100%)
>  create mode 100644 recipes-bsp/u-boot/files/ultra96-v2-fsbl.elf.xz
>  create mode 100644 recipes-bsp/u-boot/files/ultra96-v2.bit.xz
>  rename recipes-bsp/u-boot/files/{ultra96-fsbl.elf.LICENSE => ultra96-vX-fsbl.elf.LICENSE} (100%)
>  rename recipes-bsp/u-boot/files/{ultra96.bit.LICENSE => ultra96-vX.bit.LICENSE} (100%)
>  create mode 100644 recipes-bsp/u-boot/u-boot-2020.07.inc
>  delete mode 100644 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb
>  rename conf/multiconfig/ultra96-jailhouse-demo.conf => recipes-bsp/u-boot/u-boot-macchiatobin_2020.07.bb (51%)
>  delete mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
>  create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb
>  create mode 100644 recipes-bsp/u-boot/u-boot-ultra96-v1_2020.07.bb
>  create mode 120000 recipes-bsp/u-boot/u-boot-ultra96-v2_2020.07.bb
>  delete mode 100644 recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb
>  rename recipes-core/customizations/files/{.bash_history-ultra96 => .bash_history-ultra96-v1} (100%)
>  create mode 120000 recipes-core/customizations/files/.bash_history-ultra96-v2
>  rename recipes-core/customizations/files/{postinst-ultra96 => postinst-ultra96-v1} (100%)
>  create mode 120000 recipes-core/customizations/files/postinst-ultra96-v2
>  delete mode 100644 recipes-kernel/linux/files/0001-arm64-dts-zcu100-revC-Give-wifi-some-time-after-powe.patch
>  create mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
>  create mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
>  create mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
>  create mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
>  create mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
>  create mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
>  create mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
>  create mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
>  create mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
>  create mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
>  create mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
>  create mode 100644 recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch
>  create mode 100644 recipes-kernel/wilc/files/debian/wilc.install
>  create mode 100644 recipes-kernel/wilc/wilc_15.2-avnet.bb
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f13614cc-920a-e8f9-8a36-e6992b736698%40oth-regensburg.de.

--------------4EB1AF95151F8BB480FD6C45
Content-Type: text/x-log; name="macchiato.log"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="macchiato.log"

KDB4MjkpCg1TRCAtIHdhaXRfZm9yX3NkX2ludGVycnVwdDogRXJyb3IgaW50ZXJydXB0IC0g
IDAwMDA4MDAwCg1TRCAtIHdhaXRfZm9yX3NkX2ludGVycnVwdDogRXJyb3IgaW50ZXJydXB0
IHN0YXR1cyAwMDAwMDAwMwoNU0QgLSBzZF9nZXRfY21kX3Jlc3BvbnNlOiBHZXQgY29tbWFu
ZCByZXNwb25zZSBmYWlsZWQuCg0KDVNEIC0gc2RfaW5pdDogRmFpbGVkIC0gcmV0ID0gMDAw
MDAwODEKDUVycm9yOiBGYWlsZWQgaW5pdGlhbGl6aW5nIGludGVyZmFjZQoNRXJyb3I6IEZh
aWxlZCBib290IGF0dGVtcHQgMDEuIGVycm9yID0gMHgwQzEKDQoNQm9vdFJPTSAtIDIuMDMK
DVN0YXJ0aW5nIENQLTAgSU9ST00gMS4wNwoNQm9vdGluZyBmcm9tIFNEIDAgKDB4MjkpCg1T
RCAtIHdhaXRfZm9yX3NkX2ludGVycnVwdDogRXJyb3IgaW50ZXJydXB0IC0gIDAwMDA4MDAw
Cg1TRCAtIHdhaXRfZm9yX3NkX2ludGVycnVwdDogRXJyb3IgaW50ZXJydXB0IHN0YXR1cyAw
MDAwMDAwMwoNU0QgLSBzZF9nZXRfY21kX3Jlc3BvbnNlOiBHZXQgY29tbWFuZCByZXNwb25z
ZSBmYWlsZWQuCg0KDVNEIC0gc2RfaW5pdDogRmFpbGVkIC0gcmV0ID0gMDAwMDAwODEKDUVy
cm9yOiBGYWlsZWQgaW5pdGlhbGl6aW5nIGludGVyZmFjZQoNRm91bmQgdmFsaWQgaW1hZ2Ug
YXQgYm9vdCBwb3N0aW9uIDB4MDAyCg1sTk9USUNFOiAgU3RhcnRpbmcgYmluYXJ5IGV4dGVu
c2lvbg0KTk9USUNFOiAgU1ZDOiBTVyBSZXZpc2lvbiAweDAuIFNWQyBpcyBub3Qgc3VwcG9y
dGVkDQptdl9kZHI6IG12X2Rkci1kZXZlbC0xOC4wOC4wLWdhODgxNDY3LWRpcnR5IChPY3Qg
MDUgMjAyMCAtIDEyOjE5OjA4KQ0KbXZfZGRyOiBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5DQpO
T1RJQ0U6ICBDb2xkIGJvb3QNCk5PVElDRTogIEJvb3RpbmcgVHJ1c3RlZCBGaXJtd2FyZQ0K
Tk9USUNFOiAgQkwxOiB2Mi4zKCk6IChNYXJ2ZWxsLWRldmVsLTE4LjEyLjApDQpOT1RJQ0U6
ICBCTDE6IEJ1aWx0IDogMTE6NDQ6MTAsIE9jdCAgNSAyMDIwDQpOT1RJQ0U6ICBCTDE6IEJv
b3RpbmcgQkwyDQpOT1RJQ0U6ICBCTDI6IHYyLjMoKTogKE1hcnZlbGwtZGV2ZWwtMTguMTIu
MCkNCk5PVElDRTogIEJMMjogQnVpbHQgOiAxMTo0NDoxMCwgT2N0ICA1IDIwMjANCk5PVElD
RTogIFNDUF9CTDIgY29udGFpbnMgNSBjb25jYXRlbmF0ZWQgaW1hZ2VzDQpOT1RJQ0U6ICBT
a2lwcGluZyBNU1MgQ1AzIHJlbGF0ZWQgaW1hZ2UNCk5PVElDRTogIFNraXBwaW5nIE1TUyBD
UDIgcmVsYXRlZCBpbWFnZQ0KTk9USUNFOiAgTG9hZCBpbWFnZSB0byBDUDEgTVNTIEFQMA0K
Tk9USUNFOiAgTG9hZGluZyBNU1MgaW1hZ2UgZnJvbSBhZGRyLiAweDQwMjY5ZjQgU2l6ZSAw
eDFjZDggdG8gTVNTIGF0IDB4ZjQyODAwMDANCk5PVElDRTogIERvbmUNCk5PVElDRTogIExv
YWQgaW1hZ2UgdG8gQ1AwIE1TUyBBUDANCk5PVElDRTogIExvYWRpbmcgTVNTIGltYWdlIGZy
b20gYWRkci4gMHg0MDI4NmNjIFNpemUgMHgxY2Q4IHRvIE1TUyBhdCAweGYyMjgwMDAwDQpO
T1RJQ0U6ICBEb25lDQpOT1RJQ0U6ICBMb2FkIGltYWdlIHRvIEFQMCBNU1MNCk5PVElDRTog
IExvYWRpbmcgTVNTIGltYWdlIGZyb20gYWRkci4gMHg0MDJhM2E0IFNpemUgMHg1NDIwIHRv
IE1TUyBhdCAweGYwNTgwMDAwDQpOT1RJQ0U6ICBEb25lDQpOT1RJQ0U6ICBTQ1AgSW1hZ2Ug
ZG9lc24ndCBjb250YWluIFBNIGZpcm13YXJlDQpOT1RJQ0U6ICBCTDE6IEJvb3RpbmcgQkwz
MQ0KbE5PVElDRTogIE1TUyBQTSBpcyBub3Qgc3VwcG9ydGVkIGluIHRoaXMgYnVpbGQNCk5P
VElDRTogIEJMMzE6IHYyLjMoKTogKE1hcnZlbGwtZGV2ZWwtMTguMTIuMCkNCk5PVElDRTog
IEJMMzE6IEJ1aWx0IDogMTE6NDQ6MTAsIE9jdCAgNSAyMDIwDQoNCg0KVS1Cb290IDIwMjAu
MDcgKEp1bCAwNiAyMDIwIC0gMTk6MjI6NTMgKzAwMDApDQoNCkRSQU06ICA0IEdpQg0KQ29t
cGh5IGNoaXAgIzA6DQpDb21waHktMDogUEVYMCAgICAgICAgIA0KQ29tcGh5LTE6IFBFWDAg
ICAgICAgICANCkNvbXBoeS0yOiBQRVgwICAgICAgICAgDQpDb21waHktMzogUEVYMCAgICAg
ICAgIA0KQ29tcGh5LTQ6IFNGSSAgICAgICAgICANCkNvbXBoeS01OiBTQVRBMSAgICAgICAg
DQpDb21waHkgY2hpcCAjMToNCkNvbXBoeS0wOiBTR01JSTEgICAgICAgIDEuMjUgR2JwcyAN
CkNvbXBoeS0xOiBTQVRBMCAgICAgICAgDQpDb21waHktMjogVVNCM19IT1NUMCAgIA0KQ29t
cGh5LTM6IFNBVEExICAgICAgICANCkNvbXBoeS00OiBTRkkgICAgICAgICAgDQpDb21waHkt
NTogVU5DT05ORUNURUQgIA0KVVRNSSBQSFkgMCBpbml0aWFsaXplZCB0byBVU0IgSG9zdDAN
ClVUTUkgUEhZIDEgaW5pdGlhbGl6ZWQgdG8gVVNCIEhvc3QxDQpVVE1JIFBIWSAyIGluaXRp
YWxpemVkIHRvIFVTQiBIb3N0MA0KU0FUQSBsaW5rIDAgdGltZW91dC4NClNBVEEgbGluayAx
IHRpbWVvdXQuDQpBSENJIDAwMDEuMDAwMCAzMiBzbG90cyAyIHBvcnRzIDYgR2JwcyAweDMg
aW1wbCBTQVRBIG1vZGUNCmZsYWdzOiA2NGJpdCBuY3EgbGVkIG9ubHkgcG1wIGZic3MgcGlv
IHNsdW0gcGFydCBzeHMgDQpQQ0lFLTA6IExpbmsgZG93bg0KTU1DOiAgIHNkaGNpQDZlMDAw
MDogMCwgc2RoY2lANzgwMDAwOiAxDQpMb2FkaW5nIEVudmlyb25tZW50IGZyb20gU1BJIEZs
YXNoLi4uIFNGOiBEZXRlY3RlZCB3MjVxMzIgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBl
cmFzZSBzaXplIDQgS2lCLCB0b3RhbCA0IE1pQg0KKioqIFdhcm5pbmcgLSBiYWQgQ1JDLCB1
c2luZyBkZWZhdWx0IGVudmlyb25tZW50DQoNCk1vZGVsOiBNQUNDSElBVE9CaW4tODA0MA0K
TmV0OiAgIA0KV2FybmluZzogbXZwcDItMSAoZXRoMCkgdXNpbmcgcmFuZG9tIE1BQyBhZGRy
ZXNzIC0gYzI6ZWU6N2E6MmY6ODk6M2QNCmV0aDA6IG12cHAyLTENCkhpdCBhbnkga2V5IHRv
IHN0b3AgYXV0b2Jvb3Q6ICAyIAgICCAxIAgICCAwIA0Kc3dpdGNoIHRvIHBhcnRpdGlvbnMg
IzAsIE9LDQptbWMxIGlzIGN1cnJlbnQgZGV2aWNlDQpTY2FubmluZyBtbWMgMToxLi4uDQpG
b3VuZCBVLUJvb3Qgc2NyaXB0IC9ib290L2Jvb3Quc2NyDQozNDIgYnl0ZXMgcmVhZCBpbiAx
NiBtcyAoMjAuNSBLaUIvcykNCiMjIEV4ZWN1dGluZyBzY3JpcHQgYXQgMDRkMDAwMDANCjMy
MTMyIGJ5dGVzIHJlYWQgaW4gNDEgbXMgKDc2NC42IEtpQi9zKQ0KMTg5NDI0NjQgYnl0ZXMg
cmVhZCBpbiAxODgzIG1zICg5LjYgTWlCL3MpDQojIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUg
YmxvYiBhdCAwNGYwMDAwMA0KICAgQm9vdGluZyB1c2luZyB0aGUgZmR0IGJsb2IgYXQgMHg0
ZjAwMDAwDQogICBMb2FkaW5nIERldmljZSBUcmVlIHRvIDAwMDAwMDAwYmZmZjUwMDAsIGVu
ZCAwMDAwMDAwMGJmZmZmZDgzIC4uLiAiU3luY2hyb25vdXMgQWJvcnQiIGhhbmRsZXIsIGVz
ciAweDk2MDAwMDQ1DQplbHI6IDAwMDAwMDAwMDAwNmI1ZGMgbHIgOiAwMDAwMDAwMDAwMDY2
NTY4IChyZWxvYykNCmVscjogMDAwMDAwMDA3ZmZhYTVkYyBsciA6IDAwMDAwMDAwN2ZmYTU1
NjgNCngwIDogZmZmZmZmZmZmZmZmZmZmZiB4MSA6IDAwMDAwMDAwYmZmZmNkODQNCngyIDog
MDAwMDAwMDAwMDAwMDAwMCB4MyA6IGZmZmZmZmZmZmZmZjgyN2INCng0IDogMDAwMDAwMDAw
NGYwN2Q4NCB4NSA6IDAwMDAwMDAwYmZmZjUwMDANCng2IDogMDAwMDAwMDBiZmZmNTAwMCB4
NyA6IDAwMDAwMDAwMDAwMDAwMGYNCng4IDogMDAwMDAwMDA3ZmIyNzBmMCB4OSA6IDAwMDAw
MDAwMDAwMDAwMDgNCngxMDogMDAwMDAwMDBiZmZmZmQ4MyB4MTE6IDAwMDAwMDAwYmZmZmZk
ODMNCngxMjogMDAwMDAwMDBjMDAwMDAwMCB4MTM6IDAwMDAwMDAwMDAwMDAwMDANCngxNDog
MDAwMDAwMDBiZmZmNTAwMCB4MTU6IDAwMDAwMDAwMDAwMDAwMTANCngxNjogMDAwMDAwMDAw
MDAwMDAyMCB4MTc6IDAwMDAwMDAwMDAwMDAwMDANCngxODogMDAwMDAwMDA3ZmIyZWRkMCB4
MTk6IDAwMDAwMDAwYmZmZjUwMDANCngyMDogMDAwMDAwMDAwNGYwMDAwMCB4MjE6IDAwMDAw
MDAwODQ3ZDAwMDANCngyMjogMDAwMDAwMDAwMDAwN2Q4NCB4MjM6IDAwMDAwMDAwMDAwMGFk
ODQNCngyNDogMDAwMDAwMDAwMDAwMDAxMCB4MjU6IDAwMDAwMDAwN2ZiMjcyYjgNCngyNjog
MDAwMDAwMDBjMDAwMDAwMCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDANCngyODogMDAwMDAwMDA3
ZmM0ZjNhMCB4Mjk6IDAwMDAwMDAwN2ZiMjcxZDANCg0KQ29kZTogNTQwMDAwNjEgYWEwNjAz
ZTAgZDY1ZjAzYzAgMzg2MDY4ODIgKDM4MjA2ODIyKSANClJlc2V0dGluZyBDUFUgLi4uDQoN
CnJlc2V0dGluZyAuLi4NCigweDI5KQoNRm91bmQgdmFsaWQgaW1hZ2UgYXQgYm9vdCBwb3N0
aW9uIDB4MDAyCg1sTk9USUNFOiAgU3RhcnRpbmcgYmluYXJ5IGV4dGVuc2lvbg0KTk9USUNF
OiAgU1ZDOiBTVyBSZXZpc2lvbiAweDAuIFNWQyBpcyBub3Qgc3VwcG9ydGVkDQptdl9kZHI6
IG12X2Rkci1kZXZlbC0xOC4wOC4wLWdhODgxNDY3LWRpcnR5IChPY3QgMDUgMjAyMCAtIDEy
OjE5OjA4KQ0K
--------------4EB1AF95151F8BB480FD6C45--
