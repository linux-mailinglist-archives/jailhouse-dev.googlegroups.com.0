Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZO3YTYQKGQEF3A73SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109F14C6BA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 08:01:58 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id y15sf2943799ljh.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 23:01:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580281318; cv=pass;
        d=google.com; s=arc-20160816;
        b=XS+BarYDVWeToQRA67P8uSphTbKIW05aUF86Qv3KRb5HAK5ndrX3My8xBqaCHLCHZv
         W56C+q7nXjnqTB0xKZWeMUClSNtfELCSqYkfEucY/+OF+/Y5pEFzLOiIQrpEvMdAX8HK
         Rgrs8MFVQbO8z9mgpsM7jZ6OKrfeWdxVR6iu5JH1zBaqL+0MnYtFmHrJ9ZKnJK18vDdL
         xS2OSVveG9Mo7enkQXy44LqalKjffCFGudkB82SorWTGtqobXdExjJmZrBn6lUHsf+L1
         hzEENbdKvi3oBBQER+aPxLIJP8pFmfcy64U5lgcM684ZYA4rukWLmivKon6zulU4sWnn
         K15Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=2NYXkWaxwi12rDmaVuBKxZ3Jy6q6DFFEY+yhaAI5I5w=;
        b=IwTnnrLM8wF2Aud9S8XMt7PFMhEc4wy5omt32ZKcblYRSLiPmTXS7sZMF4cGqYTeK+
         VI08lkGEr19BBBZqZJVVDwFTD6CvWrVXyWx18bFwioKQB5SRsJVFoqC43QuCEi0uNME8
         7Qa7YDXG/JtZm4HKlMHJ4dQQHyKST1/uq/fXxecz8gRwA7E4lHlY1BRQc7LnJMVr0Bti
         slLsajG3ujxVSYATbdIlz5ZHLTsslSZ2Unc7CiDAkcOXFivHoG//fR9Or2D7jeCkNMvz
         L6cOAdefgQJwzI90uSCATZwZLY3oPq1/3Yp10RUizKWmyKUC+2heIQTbraBhWkpy3tph
         Q9vQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2NYXkWaxwi12rDmaVuBKxZ3Jy6q6DFFEY+yhaAI5I5w=;
        b=KDQQDeHMwF5lTg27jV5W57Iz3HBIaVRuzf7AlnXe+Y0bklhY/GJcx0xVpUUS0rWQrr
         aljIanT6C1odeWRML5UZRaytrlwGBLbWBYrn/N6jkVI8iTEM+1zrdCBFyrPyPKNlU5Ct
         2iPSpfSG4OXGn5BhqsQtq7vux+I3LM4hnBOqumo4zkI2e4WJCiPRRlOFr+Jb0fgNLSgc
         ooSQ+tJyVmzwIyi6HzWNflRebibQDjgFRUctD4cEIJs5G5FwmfTpWCJ6GbARkb4La5Sz
         wm/ywfybStAd51rxtOKRb8zPCHNTfyiIkmQOEKDmP9vqbm8jMlRD8nji5OofzmOujKqf
         H9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2NYXkWaxwi12rDmaVuBKxZ3Jy6q6DFFEY+yhaAI5I5w=;
        b=eMxeiOAmIEaL3deKmrI8wDJb7A0E9MPcd8ftq0SDx0NIOkHWmjC/+DK1KrKNIwQn6j
         b2tuPDnjVUX43FiI3kDe2Sa6sdSi0tFj617pMwyjgFKIoLGqL7q5OfseTyTdyDuC6EPc
         jNVIXIzVfMQC3PmAuyzzAviOBs1akSiR9j3xnY6VRjzeK2Vkj4A4D1QCaCtz+4HoY2iO
         AFh30NLC2O0ry8HiYR5/emIJrg3O+eI6O4CuRRBPjNMdCYRs1CfC3C63KNDLwqRX/1Uv
         fjgQ8reh9nE7AZ1eYN2b/RWrCyv/W7Vrc2xABfkRJ4LMjt/x10utcaQiBifX5DJ395Aa
         D94w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyfyPDj5T/3Vu8yeAgODekJOefbNrgJLgop3P71eMMCpRemaLO
	qGg08Zh5OTZMebZDrBi+noU=
X-Google-Smtp-Source: APXvYqyXjkQ6iLN/XbE5kJRcMFg4tdIkd1NWqPb2ihxKDgY3MMHp16ncNHTdeklVP1/ffEPI6qoPuA==
X-Received: by 2002:a19:c1c9:: with SMTP id r192mr4812194lff.28.1580281317808;
        Tue, 28 Jan 2020 23:01:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:532f:: with SMTP id f15ls2181592lfh.9.gmail; Tue, 28 Jan
 2020 23:01:56 -0800 (PST)
X-Received: by 2002:a19:ca59:: with SMTP id h25mr4726350lfj.27.1580281316649;
        Tue, 28 Jan 2020 23:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580281316; cv=none;
        d=google.com; s=arc-20160816;
        b=pDipU1rJWdP7S55pd2fa6thox4SgqjLmxWXmlOfpWNjYnUA4ApMxF31Hv2qgrJOgfH
         zO3ZYwxRUy+UFAmYAsMSxL6wsF05+6XTFbDojYLTUoJHKKCkKx60wzzSGDWolZk3nyB+
         pmN5DS1th9gKgSrbiVwT8oHC8Dy1QzVIJIfjabfkRFHJIHuV3xItnABWn4NMR8AA6PmF
         wM8kFpSOJMIEDaJWjIp1cnxH9hPaZSqFTBJuOCAn5yCS92lQszUg0vrY5SAoiwaSc7E7
         4kENjOJzeCt3GlmCFSR7Z8KWshUI/SdtY3whDkPCSKtxf2/Nut1NWNrldWQDXRXkikjq
         1h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=92nNQGYT2pVOo9n6Ve5gqn1o5xHXVt6bM/1pKsh98d8=;
        b=D3eHs2xlnTtHOyhyxMFor4X++zIcBhIj1Vs7bjUYEwCWKWa7zCj3mVo43E/TiP8jGi
         8xuffNYPWZhW2J+vWdttMPIaA7XcqrTNVKZys54Ef15Js7loYXuK8VtTybzQ0nduI8DG
         t4JPS39YccGSD/pNOc8LfmjSHdXt5+fYFAjyMH0OVf7rCVLi4f7SFVyDSPnavNpTnm+C
         Eb11UgVH9/uokqYqxxT/ipdUmluoh07X0X4QpR9zbLyWJ+/zmNdcPHkgkTJl1CDN1apV
         v7XCcTik9w0xxFZWy8hUPbPTX+hcKK6QVzwDTEGf1Ayqbe6Q1CjuJ88B0om+kf6bC5SO
         p05A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 68si40777lfi.3.2020.01.28.23.01.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 23:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00T71tfp000394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2020 08:01:55 +0100
Received: from [167.87.12.131] ([167.87.12.131])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00T71saV009771;
	Wed, 29 Jan 2020 08:01:54 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
Date: Wed, 29 Jan 2020 08:01:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 28.01.20 22:50, Saroj Sapkota wrote:
> I'm trying to run jailhouse on Jetson tx2 kit. I downloaded the=20
> jailhouse and compiled it and run the command
>=20
> =3D>sudo insmod Downloads/linux-jailhouse-jetson/driver/jailhouse.ko
>=20
> // there is no error message in terminal console
>=20
> but it gives following output on the serial console:
>=20
> tx2@tx2-desktop:~$ [=C2=A0 129.954491] jailhouse: loading out-of-tree mod=
ule=20
> taints kernel.
>=20
> After this I tried to enable jailhouse through this command
>=20
> =3D>sudo jailhouse enable Downloads/linux-jetson/configs/arm64/jetson-tx2=
.cell
> // terminal displays: JAILHOUSE_ENABLE: Invalid argument
>=20
> //and on the terminal console it displays:
>=20
> [=C2=A0 333.421533] jailhouse: mem_region_request failed for hypervisor=
=20
> memory mem_region_request failed for hypervisor memory=20
> mem_region_request failed for hypervisor memory mem_region_request=20
> failed for hypervisor memory.
> [=C2=A0 333.428303] jailhouse: Did you reserve the memory with "memmap=3D=
" or=20
> "mem=3D"?
>=20
> I have changed /boot/extlinux/extlinux.conf file as follows:
> TIMEOUT 30
> DEFAULT primary
>=20
> MENU TITLE L4T boot options
>=20
> LABEL primary
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MENU LABEL primary kernel
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX /boot/Image
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 APPEND ${cbootargs} quiet
> **mem=3D7808M vmalloc=3D512M**
> # When testing a custom kernel, it is recommended that you create a=20
> backup of
> # the original kernel and add a new entry to this file so that the=20
> device can
> # fallback to the original kernel. To do this:
> #
> # 1, Make a backup of the original kernel
> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo cp /boot/Image /boot/Image.backup
> #
> # 2, Copy your custom kernel into /boot/Image
> #
> # 3, Uncomment below menu setting lines for the original kernel
> #
> # 4, Reboot
>=20
> # LABEL backup
> #=C2=A0=C2=A0=C2=A0 MENU LABEL backup kernel
> #=C2=A0=C2=A0=C2=A0 LINUX /boot/Image.backup
> #=C2=A0=C2=A0=C2=A0 INITRD /boot/initrd
> #=C2=A0=C2=A0=C2=A0 APPEND ${cbootargs}*
> *
> *
> *
> but this change is not working. So what's the wrong in this=20
> extlinux.conf file as boot up is ignoring *mem=3D7808M vmalloc=3D512M *th=
is=20
> statement.*
> *

So, /proc/cmdline of the booted system is not containing your change?=20
Then I would say your system is using a different boot configuration=20
mechanism. Where did you get the image from? Is U-Boot involved in the=20
boot-up? What does "printenv" report about how the boot is configured?=20
Maybe you need to adjust the command line in the environment instead.

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
jailhouse-dev/6e69283d-90dd-4579-7640-c5d585a2a9ad%40siemens.com.
