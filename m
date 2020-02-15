Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBHECUDZAKGQEIZZQO6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97915FEDD
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 15:33:00 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id 50sf5835553wrc.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 06:33:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581777180; cv=pass;
        d=google.com; s=arc-20160816;
        b=GkIlgjR1MEe7HC2jzYOqJswXbtl57onX5E45cNsCLbNvx/Hybf2Wwf7m6Om4D7gCOV
         gJgO3xIlTs7Pd1Vpw8sDy73diO9oAccFXORwhDOq4hmGkXtfkXBqtsF/XBwRFTdRK3D+
         FelXYGBDtRY8byai7wiUkRXYDCRWs8yf+gUjbs55cJrw+9rkW/YrrU8yv59IsiRHllw7
         DfAhH1BWYq/k6NEu01u8Mbyko45yWjHogYJQoFwIQSpKQ6bLAb/ilabB8JbZNvwUyG6h
         oUS+rhmKyfhZ/AG8Uomrlf4IfP6Hw9uUHwlK8xC0pnwXNBzmZCgGbJyYWh5UVf8RdF5D
         ydNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=cTKKzUmXLTyR6gCAD4ef6MIdX8nB2viziR98RT83yxY=;
        b=a4d4qhbqQ8JLzx//QA5plANeM7R0hIMA6cYmq0rnTzPl3D709Xb287EV3hj6/VA39x
         IlC3fGnlqoTgjoVGm3L7FjHA/bOEa02EE96XaOSDXtrXC08wue1Jhb8/4SdynKCUlLkO
         yK934hg0sYXmJDcyxFxPntH7xlV8WNzwozjlytuwo3qYI48pToLPP+3nBuGk6NvJ9D/J
         H72E1okdvIsGDJAyVB7lsC4HlHSjEb8xfpaZXpV8kpGPrQnOa9mH3+jysgyvJZgMmuwj
         /QSt9PfKVSb//I+KUS/wwRd78uMaBbsssrV4QxNnSJYKOXoxnUP3cmlHJPh7IWfoOMKy
         FnRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J5Vc+opb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cTKKzUmXLTyR6gCAD4ef6MIdX8nB2viziR98RT83yxY=;
        b=Z2SaovAjXWav9OvMhclkkTxOSjy9EzE4NsWUQEuzBxneV5OJIml5bpl8LA8LwaHycL
         6/eK1YfiGb3iq9vs2VE4K6WA1kngi2uLVDYr244uKYJTCI/G5vDYnlO8UI8j91ttjtYu
         BhdDWoh42Nmf2s61tVXg1zvpJAHQhbewdLIG8pb+rb2YB1i9l9Tqi+vMyMxXn4PY0MFn
         /DZU3PpIU/j/NzeJthHND0Nz+nlCGxGnAm8K6XIDCFRmr9vw1VCTBU8e1hnzwUfqkMCd
         HgkREj6+3hFR6UoxOyN6dAkWBysywdFkHtOSqI5Qugia7RTCEgdBfkFzN9tllcRJ6uwj
         0aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cTKKzUmXLTyR6gCAD4ef6MIdX8nB2viziR98RT83yxY=;
        b=GKdDB87Bq0kGs+oRt7iKQxq4QHJ0nuYDx04/U8xgbxzcKnB6rdaXv6Kj0woux7njlg
         e86yJpSAwRWe2JZqCZyNo86PSw/kvNXoSdp6TczI402eUPRtW+TdMJYJCuGOWXw5hPpp
         gpYzcICQ05Lk09D7LKPJsz7SqnwaTT7h776whWv0E1bW6GBC+7XE3uRK63N/Uxer9iME
         j1akhzClQNzyElhjaddLmXLBwZQUk1XlaOnck3AjhUyDL5Pf8sIbosgo48KAkLTvqr2z
         qH7yy4Bj8V9w4J9zkMuzHPoAGy4krF80EH84L/tuxVUE8eDqrr+rNX1S5S/Ym64PQYaM
         1qpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWCYSfpsq0hakHKDTj/xjQnWvpi0RlFqq2ARIenPhHaodAeB3N1
	aGwPKV3um+R23/eXAfb1rOM=
X-Google-Smtp-Source: APXvYqzbwF27amjtPnkWboJPN9RgTQxDotA70/cgxUf6QaBP48tDzbJLX1DBIGMe5unBllbV8TISkg==
X-Received: by 2002:adf:afd2:: with SMTP id y18mr10690001wrd.90.1581777180670;
        Sat, 15 Feb 2020 06:33:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d13:: with SMTP id g19ls3170782wme.1.gmail; Sat, 15 Feb
 2020 06:32:59 -0800 (PST)
X-Received: by 2002:a7b:c652:: with SMTP id q18mr10972431wmk.123.1581777179812;
        Sat, 15 Feb 2020 06:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581777179; cv=none;
        d=google.com; s=arc-20160816;
        b=VlC4rGueVxfY/jVnCxJ9hjUgw0B3s70hSUWospUeJr0drZv9RfUH+Z+z8QsuVvNiA1
         UUs+H8sEgrWJMju2bFU8VV2AKaQH+Jk3GXC9DSbo5eERCwv64XafbiYMZthaidAx6qG4
         8g3oEkIf/Gc4SDLeHND0UXHF8SSkJd4uTtPKwqRLb9T8H+ewN+L9CBe+cGqaqf169RvQ
         HpJajpdH5jnCWZD5b/RUckfuGdWfKMaMxaWuv8DDbc+1ebO7NbNMNmchfLSwFkbBabaj
         E3I2hYur6gGDleBCboxP9puYa3u8FbfC7NpflxSDDqNcCr3zdhsct/R2riVhB9zEHjp/
         blHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=NsYVMh7+qVU6dbNZYxbK2hvEBysIA4GDCt+mqizWtvo=;
        b=zLmpFp5ZPGpYneqceKJCk7qYJeLWuTbQDmSB1QjUNqpnu7tpKJnPAIuhqj4y8C/hqV
         IIxQw3EDYBojCUKDkjtqZ+3FiMpYTCv3Wlh/IQF19Uo8yh6b3UQ4uSKYZhtzp9UjCfoa
         RNy+ZViaWgaFzuZuMuUgJTqPVnzQ+RIGQ0dRIMXTWn9OlDhA4DOWs+W5XFBzHiyEG6r4
         p2vZ0rDfQX7YtuFB4GxZmxoJZC89Dr4odq25tho+NGSdGEvvE7Ehknnrtwa49tXvlBGZ
         1/iZxFxpFjllETbnV08bVoHJspui8tk6Cwg94tVzQz+X8ler6Po5Pbd5WOhPmJ/FVf4A
         soPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J5Vc+opb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id d16si136498wrv.4.2020.02.15.06.32.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 06:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MHGN9-1jH3GL43gR-00E2cZ; Sat, 15
 Feb 2020 15:32:59 +0100
Subject: Re: [PATCH v2 4/4] Enable pine64-plus support
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
 <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
 <20200214162440.27509-4-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c7a38ec3-253d-23a2-c470-19b6ca2ee22d@web.de>
Date: Sat, 15 Feb 2020 15:32:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214162440.27509-4-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:G3uww3712/ctb3DWGaIT3HAaYgO/3sWNloyAHiLaQVXgXZootV3
 +OalfJDb9e4IM/Vmv2KSP71XEPHeQPpTr6oHZcs8r8DouI85cOnHnrLUOl24S6vef/y7sVH
 6C3M93OM9T8FOMZ1nOe1r5DgpYkKptx0naeVUdX16ZRSPzckfvDlUuClO8ZkXA7u7JuiicJ
 GMA51NHeMY0wBMz/h1sBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+5kiVF2ct94=:mWq2uv/Jalq/8w2H1cgLHz
 oUEzeD+Q2LbRdRAwi108Xs5UYgDLfc/xXEkSZ+zDMGOtJQEofkQmFR6okQBnILK0IyeQchbIn
 cVekzFyq9U+9pZuEwySH73FC0kS7euoTcIkN3YgxL0GtK7xHzzZ8A3kC6cWvmXyHDJRE0jFPa
 ZBMV6QKEL1AkbqFhcWorm/ddyX6U3mhWhGS6x0g2L4SGfalHJp6HqmaaS2YBPRmDwDIEV4CmW
 /7RbUz99T4RhmRHTzYq1QMDdMzkkIqj2J9hve5iOi0gATBi2FVcSOEJBeLt56NYQ/sg37d72h
 R5EfOPWYQ071MwaIakLHfBHKGrMB8U2OGRazk3kX8L0U+Ef2LBfdAUvt9QLkGXfvNCVC+H2bR
 TCDkseCJ6zjh8KMy7kNmyfnrVwSLXX4EL31JAFIQ6nlWuS3E5BSRbw6FtGWBKUPuwN3e3u1Vm
 0h9i8+pRbI6c2TMSy2e4KBSuymc1VjAS0yExbxbvBQGIirnbeB2L7EaVGGj1SoLk7NCjJkvxd
 R1pJyKTbxhVgQS+PwOwPTt2l0nNKMTTxLoMP2S33kZ73ty5cRsUfSZ9C9N1dznbE+Fd69TOQc
 39hfDOeOrEfXFcRwTH97ZeebKIUwnhQRXJ7OefI/TMzXy8cB+ox9Dod2/IFIiOS7xQgszFq4o
 LTP+KbFZL3PaZmJYvgjyhIBewdPTiFeOg3sDzeEo58e3S68ft+D3b94alRpl6R52STv4mlNSE
 OsdOP868+djxINmVq5w2E5v/7qBxAOmuLSEPQ1al/pYC4dsOkCfGdckavoerp3jaOk+F6oIqX
 EVtvibWT+w0Ag09f2k2hE60NouySIgPMbc9Kck6yc2SwjmTWO0X4sHciSkUs7X/kY3ePSnRml
 TaMS4F92mn42Adk91r8nPPQSCsKuIl1S/2T+miVEJb0JIRx0TA4kwXegX72VoIgWt2XvE0yt5
 KcwcSDAVfIDQhK7/JzmRTWSDGLTjMPJEuRbbQpT/YGwZsUFQSGxP7CLfMjnkjg1WVEcJHeYfo
 1xwtFkWpFM8Z6Y3uDuJ/pyHBDj94sYK9aSob8Bii1pURy3VSAwt4qkn+xsTJVL6MtdC+nWXvb
 ojkQO7xVG/JM7xWGBH7tXUk+SlEp3tOMel/971dmaorzYY/4fR/4l6HhcZidQp1MzOGlPUzeU
 fTAWitJHBdRYGy+L33zh6ZYncCw8peG7SfJMkcwU4PgUtomHYufpsPqSsadXbmLx7dJNnbjwO
 QskdV+11o5eqJ9qy3
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=J5Vc+opb;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 14.02.20 17:24, Vijai Kumar K wrote:
> - Add the necessary machine, multiconfig and wks file.
> - Add entry in images list.
> - Add info in README.
>
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   README.md                                     |  6 ++++++
>   conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++
>   .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++
>   images.list                                   |  1 +
>   wic/pine64-plus.wks                           | 16 ++++++++++++++++
>   5 files changed, 56 insertions(+)
>   create mode 100644 conf/machine/pine64-plus.conf
>   create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf
>   create mode 100644 wic/pine64-plus.wks
>
> diff --git a/README.md b/README.md
> index 8841513..99d9f0d 100644
> --- a/README.md
> +++ b/README.md
> @@ -115,6 +115,12 @@ is support. You can boot the board directly from the generated SD card image.
>   The mini UART on the GPIO header (pin 6/8/10: Ground/TXD/RXD) is used as serial
>   console.
>
> +## Pine64+
> +
> +The [Pine64+](https://www.pine64.org/devices/single-board-computers/pine-a64/)
> +with Allwinner A64 is supported with its 2GB edition. You can boot the board
> +directly from the generated SD card image. UART0 available via EXP 10 connector
> +(pin 7/8/9: TXD/RXD/GND) is used as serial console. For details refer [here](https://linux-sunxi.org/Pine64#Serial_port_.2F_UART).
>
>   Community Resources
>   -------------------
> diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.conf
> new file mode 100644
> index 0000000..0949ab4
> --- /dev/null
> +++ b/conf/machine/pine64-plus.conf
> @@ -0,0 +1,19 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +DISTRO_ARCH = "arm64"
> +
> +IMAGE_TYPE = "wic-img"
> +IMAGER_INSTALL += "u-boot-pine64-plus"
> +IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
> +PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
> +
> +IMAGE_INSTALL += "u-boot-script"
> diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> new file mode 100644
> index 0000000..5e66c94
> --- /dev/null
> +++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> @@ -0,0 +1,14 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +#
> +MACHINE = "pine64-plus"
> +
> +DISTRO = "jailhouse-demo"
> diff --git a/images.list b/images.list
> index 26a802d..b794d85 100644
> --- a/images.list
> +++ b/images.list
> @@ -7,3 +7,4 @@ macchiatobin	Marvell MACCHIATObin
>   hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
>   ultra96		Avnet Ultra96
>   rpi4		Raspberry Pi 4 (1 GB edition)
> +pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
> diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
> new file mode 100644
> index 0000000..aacca04
> --- /dev/null
> +++ b/wic/pine64-plus.wks
> @@ -0,0 +1,16 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
> +
> +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
> +
> +bootloader --append "rootwait mem=1792M"
>

Thanks, I've merged all 4 to next. But we need some tuning: The config
files only come via --latest, not via the default 0.12 release build. We
can either carry the backported patches from upstream in the 0.12 recipe
or describe the limitation in the documentation until the next release
is out.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c7a38ec3-253d-23a2-c470-19b6ca2ee22d%40web.de.
