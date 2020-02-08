Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5HV7HYQKGQEPQTJW3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B315638B
	for <lists+jailhouse-dev@lfdr.de>; Sat,  8 Feb 2020 10:10:12 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id dd24sf1582947edb.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 08 Feb 2020 01:10:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581153012; cv=pass;
        d=google.com; s=arc-20160816;
        b=JYBXcpnGEpF/Der0InH0VqNuWYqhHHC9u4bzYb3jl6T5uiKbNuPSmnP0WQDKAxxtRn
         pmLZu9lSpOxPxHl7HdROWAFXGDUVT4Qk/yaLgD7h+FhDGTNstHXIVrPZPSGWY3z4E/99
         4hJxcyXEu4oRMkFuxrjzb+VWMtjLJFjjLIU40y+s1pPCuZ1edMqGktAmMFBc7DyS+8Bk
         qrz2biLEY1dfmDbzLtJrAO4+KT8CmbeRmb84K9P7OEzdsAm05URT3kxK1mC2/2YaR+8U
         +fx1RObvSg5NmDVnSR+J7ol6U/wpV4ExQXE2g3rjDWbfCMKBUA82iNxSN+wWGdGBTplf
         UqXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=SdLFbdp2RW/YsLF3REa2tVIXTWobAnhABBWr6UFFxJE=;
        b=VtX2XboMRKC+Z9h9BgCaj2STteC349wCtXTHKNLgEGFwRBraCI6kBb6qGf/PS1QfRX
         yCxL8qcb8unLxOnfrK0tjqtMFv1X2jF7JDJCLDgum0VzbSAqqeCpCHhaqyliDDJXDzCU
         poQO0O0yR55DHrZn1/+2fHzLbezmH2vXnTmakHLfPSlxHLoaMsnHJu/CYcXiUEaT4Xp8
         U8WyrZCOtDxnhNrRzsUzRDwBJOqsPfkKn4ZMfFFP+P5wZWL/eAJxHqmocz0kwXkhF14I
         IAxvykmBNmHr3539w7bgeOnqkjZ5xExZXcIj8fZwnFpUV72aJgkpiDWBkBJ7ohMzAw2V
         MnqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c3SWoj7n;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SdLFbdp2RW/YsLF3REa2tVIXTWobAnhABBWr6UFFxJE=;
        b=D+8duTz+AUHlWXsG6r4yfeshmNlJAsQ7S/0b6AZ7xlf4KqX+Tu8KquCU4ctORgP6kB
         uxL8hwDbu1VwwU0U2bwFCoCzeCC3yUL2yNt8BYW8WyKe1tGh6Fpr+GsOP7QUphKDxBXP
         EbLFk23GB23td/81nGlTetWU5BHAdeOIy+3tqySDMcScBk6pFcGj8s6ya88orxXOJB0F
         leF7/LpYayCrMUAJEXNJkkcvw4SJnANTzpgvcmtBdsjE2tv322K+uNSga9HXVgQfb6UH
         y68IF+zyZ9tb4hdOJr+tAQwUAFsHQ0GwMxPS2PmCwxrqcaNUesUA185LR8bacY1jgHIX
         4hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SdLFbdp2RW/YsLF3REa2tVIXTWobAnhABBWr6UFFxJE=;
        b=lx2QZLPTri3xzE44Y7+DoIjkYiq7eKXf5wmQhs0G6R6luvdKOcPI4xNEanbHNqt6Iv
         mDNTCeT0g2+X08wHWI04UAjGdfBbj7YrU93QiZtR/BiM2hmU7k7cunSbJqUnfnErRMPA
         h352unczonjjQ/+K882mLsrQ+ZZN4Si6tvtHvFP5bm88X7bqTOMHGFqmsRoN2X1wWK2f
         Q4r9rV7cHLhD98x1eH7kA94yBIrYMZKhE6JUZfbLKW+C4ii+vIw5PZxLYcAutpSagUZN
         HsyOfwobTdG6zf9z4PnmPVmhmJzLwrHS7IKiamN378gELwjMIglX7QTblwYI3wKbyyve
         fwoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV1e8vHapRTbV4voENXz+lxfgZ5CeNVqGgWRcbvqTKQSPWFhK+y
	fIQSvl5yudwnz/cXD95g4aI=
X-Google-Smtp-Source: APXvYqxMV12Ij+Seaf5XC2smjLFDgsOUFkjJbr5Skfch3MFaRfobrJ6DJ6gFu7AVGb5MIgYU/V8YOg==
X-Received: by 2002:a05:6402:1347:: with SMTP id y7mr2772444edw.140.1581153012577;
        Sat, 08 Feb 2020 01:10:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1b06:: with SMTP id by6ls1087147edb.1.gmail; Sat,
 08 Feb 2020 01:10:11 -0800 (PST)
X-Received: by 2002:a05:6402:947:: with SMTP id h7mr2721078edz.218.1581153011692;
        Sat, 08 Feb 2020 01:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581153011; cv=none;
        d=google.com; s=arc-20160816;
        b=FHFZCoxJEJQCgBbUJmoZkxUfWHUlEyS3vJFMf3lZCW2rNIsG3yCsIF7t1R8TEY42KV
         1L3Q4s/c4l65kvrakm5Cd78RkrInVIJARjhq7qGIWGKqONSjIM2aFKqqZIhFrUjHze7s
         8BbNq1KUV0NIKzyHwxJfodc70S38Qg0Ed5MBRl/1PbinGW9dArqySnfNHlx2ZtGMDg6u
         co+0H21odwxqXJ9NXisT13wgy8AXFPcY/+CpOdSEGUS1a/v6M32mCdbn3Pu+LtNVT/iY
         ZBpkkVmqdRHGA1oBsIYTTUOw+wVS0uO5Mzn2MEWkdUcEihomiHGPkq3+vb65y+sRm+8Z
         y/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=i4Iefa3u3x37uBqWfstjzkVFqkFgYZQwLJJ76ciTp08=;
        b=kwoGLWyq5EYeirlSr/q4dHqsYcY7udUoqdxWJULCFz6XhczeGK4F3Paoh3wlTrL+t/
         R5xIgggLHgNIUj7vt2KqAS6ncBgkKHSA/fHKWxXvTzsmCclVzz9ikksgBTicA0ZM2qOB
         PT8idusw/7Xkoou7OEwSgiynV3CXKgw48RnjH/v0wjcvrb+r4A6K8galyAu5ElVQHozZ
         7QspS5Z9Zb83VyuqQWcDWppSiQ6NDu6Yg+G5UWD0xchvnspFW4Ot8dLSlRiy3XiUBMiz
         jhPVOaNTCPAby0GQzZ6BOw57Y1jTrN91AHwGxptWD2WH6h9thHX679sWJLJxuCCNYAF2
         SMgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c3SWoj7n;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id n1si82414edw.4.2020.02.08.01.10.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Feb 2020 01:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M57dy-1jiwnM1lXi-00zDCH; Sat, 08
 Feb 2020 10:10:10 +0100
Subject: Re: jailhouse compilation error (no include path)
To: Saroj Sapkota <samirroj2016@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c6de1284-fa93-cb9c-44b2-552f851a5470@web.de>
Date: Sat, 8 Feb 2020 10:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K5zAZLH3OYpEzd9VS+21m5mAuzEc51dYqSVS1aGdGavNVAAZXyh
 lUZS8KnFfqYhdNdtpXe4r9v08tqu+ZNdBsScOKSN4p6IJmL7xS0LIPICOp2Y/Ej/73D30iJ
 +7wNVynXfkwcf9qgtgHShK13TuipQMxC7Hv4+ZOVztRJqiIysD2mrqm6myaOWt2vHf9rYAc
 6xIsSC2RbUupZ9HjhcMYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oqsTmlVLuXA=:LA1qaTCafyZwya4sqkULV0
 4GP/Y6cNsSqPypGawDVnVq+lNIwltH94ekUB7ojGiqXebUDPknNFLAdKlAH+NBN7i2aDY5HEA
 Mf6sQCL6dvCqGiH22LEWfyfDTsIpj8NIQr9Qv2WU5ZWSoTsZ7Tfn1chpAZlhbb7z+mOrskmnz
 Wc5yQkab1AKX7sw4Ofy4q2Iv6h3FVaRX8qUYIp4yZGpiZgXIaU5RScqFXM0a1cPU/4tRXRPCs
 0pr4oP7oVxpGEM4dZmMATfaKXBTUOh1cfoS2YTx4Vr60PuVUSRaOK1xHSzRnYJ1Gf+W3WV9+E
 HKCelC/s2QBn2jmfWucKmaeUFyyqyMP7XKnpP8n2V1Qz3ekkzfh9pLdG2HAxELmfcriw86Ati
 T/O8bbZY42nmNBL+GBgwdD/vJEInDdnaaLrT22clGxjNbO59myh3jYZVH50Y3E68mWWivhK9H
 GroH40RVtTNPQwnVTE8Qhcj/lgT3S+q4YVxeZPvjyA1IRbUFyDhNERWkVZ08NUK735Rghop+2
 SPSki0xjgalLZ3REOQRth7v2WT3ChYKPVzZdFSBHqkOp1/HYrB3U29osXNHXMR5DlXwp/LPLd
 l1WzIxzBJE4K7J/rfknOrzuTXbgi70dtzyhkIK/GYKuvpaLTmoORFBYBt5fo7t0dkXRcho6iv
 J+v6fsJy0XSqwZni7ZH1q0CEqflO+XfcZuwFDYmdo/mliQaKVNV9/1Rh/atYxftwQJ4znA77M
 v4ePolToCK4fhBHHb+4b6aOOAGjB6wuxtAMQkTx9rgf4QVRKvjtssG6cdVdz9rz01aiOh7Up+
 /QshYKQ5WBOAM1Pf7NuzwRdoFgVqxvleLflgDusFgpUn+KY0HXiR5Xve5IyWGdkkWf8hNzVuQ
 Z6ysJyX5cPCqo4R8Ab18V39MbbjXVfUamoSuybau0SYRC0yYXWxoPcRSMzZF/tgHAjc1QYzYO
 csvPnZMUnYbw7mwWppc3HXRMIOcyKRm9grm9rox1bNjMxI6bP+ZeIagvmbp57sYcZ2W7qiDpV
 HYpnjgO1iEKmfIDSNrldrTysxU+mYPDsWKxQsVsLO+J45r4ZHlLmmcUQxeSVlOnZFO+cw/2yC
 96xujIlD48HfYy3NZeuBtsElcUoo0uzFLI8AU+OR/uvfV3orM9MBjPExf/rE5z2wqrGllsBDN
 msWzXq5A/6x7yWiu0IdXLOYK6Ja2EQBV1xlG0qGgD6q1emCrzECFvnaQgNOdT2gAGp76ONQtr
 8ikR5QzBPiKT34SSK
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=c3SWoj7n;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 07.02.20 23:55, Saroj Sapkota wrote:
> While trying to built on jailhouse(master version) on jetson tx2 board I
> get the following=C2=A0 error:
> kernel version-4.9--tegra
> nvidia@jetson-0320218169735:~/jailhouse$ sudo make:
>  =C2=A0CHK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/hyperviso=
r/include/generated/config.mk
>  =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/hypervisor/inc=
lude/generated/config.mk
>  =C2=A0CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/ar=
m64/amd-seattle-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-d=
emo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/amd-seattle-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-de=
mo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/amd-seattle.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/espressobin-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-d=
emo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/espressobin-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin-linux-de=
mo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/espressobin.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/foundation-v8-inmate-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/foundation-v8-linux-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/foundation-v8.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/hikey-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.ce=
ll
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/hikey-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.cel=
l
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/hikey.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/imx8mq-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.c=
ell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/imx8mq.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/jetson-tx1-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-de=
mo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/jetson-tx1-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-dem=
o.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/jetson-tx1.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/jetson-tx2-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-de=
mo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/jetson-tx2.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-am654-idk-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-d=
emo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-am654-idk.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-am654-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo=
.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-j721e-evm-inmate-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-j721e-evm-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-d=
emo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/k3-j721e-evm.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/macchiatobin-inmate-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/macchiatobin-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-d=
emo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/macchiatobin.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin.cell
>  =C2=A0 CC
> /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell
>  =C2=A0 CC
> /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/miriac-sbc-ls1046a.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.c=
ell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/qemu-arm64-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-de=
mo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/qemu-arm64-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-dem=
o.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/qemu-arm64.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/rpi4-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.cel=
l
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/rpi4-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/rpi4.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/ultra96-inmate-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.=
cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/ultra96-linux-demo.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.c=
ell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/ultra96.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/zynqmp-zcu102-inmate-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/zynqmp-zcu102-linux-demo-2.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/zynqmp-zcu102-linux-demo.o
>  =C2=A0 OBJCOPY
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell
>  =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/a=
rm64/zynqmp-zcu102.o
>  =C2=A0 OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.cell
>  =C2=A0 DTC=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/configs/arm64/=
dts/inmate-amd-seattle.dtb
>
> /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:
> error: no include path in which to search for
> dt-bindings/interrupt-controller/arm-gic.h
> scripts/Makefile.lib:291: recipe for target
> '/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb' failed
> make[3]: ***
> [/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 1
> scripts/Makefile.build:479: recipe for target
> '/home/nvidia/jailhouse/configs' failed
> make[2]: *** [/home/nvidia/jailhouse/configs] Error 2
> Makefile:1429: recipe for target '_module_/home/nvidia/jailhouse' failed
> make[1]: *** [_module_/home/nvidia/jailhouse] Error 2
> Makefile:40: recipe for target 'modules' failed
> make: *** [modules] Error 2
> I also tried it cross compiling in host machine and I got the same
> error. (i also tried cross compiling in different x86 machine one with
> kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu 18.04) but
> same error as above pops up)

Then it is likely an issue with that downstream NVIDIA kernel. Jailhouse
builds fine against upstream v4.9.213 (although that is surely no longer
a recommended version for it). Maybe NVIDIA fixed that in newer versions
of their SDK.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c6de1284-fa93-cb9c-44b2-552f851a5470%40web.de.
