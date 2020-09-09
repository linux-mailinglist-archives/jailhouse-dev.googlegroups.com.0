Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKVI4P5AKGQEI2AOTFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 532AC262EEF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 15:10:03 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id qn7sf1271986ejb.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 06:10:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599657003; cv=pass;
        d=google.com; s=arc-20160816;
        b=KTAc4Ew1xZLDSj0WR5kx0ViHBP69OkuwZWFAN+eaN6WGI63WwE+vDlz8MvXA5fH3p+
         2uxLc2+gUnxp7GcTySK2iyIIpzvun/RExg3aG4v5HjzcrJClnuwtkI9uF6rrXp3TOad2
         Ib3tH8UwyHFYVar/20uV20S9RQ32SQF8wT/o7CAYRNYIjJ8oW25sBhUX1rqe28a3uM6I
         XOUGXDTMyxJaKYX20PAlP8F5FBv7GFa2n3Z6JNk/EQPHq8+k6SDiHWig4GOCO4aELBGt
         muNZKDqOt1ZtbJ492x2NmkFYiPNLEliMcALnQskaPRw0XiMeldeKJ8ofa8/uIgwnGtSj
         CkoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=/RvqzSYZ9b1rfHO7RUVRqKZUQAZLqRzUJTyZPe0RJvA=;
        b=eiWnxipf9yrBw7PYml4sGv34o/0+09MrphBq0JZeZZWMMTLNAwNU6XF4ymBOtesJ6E
         +p8HpP+yCLGI5WGZHx59kHsxtPxwz4TygjIY+pg8OBmwgMZfhWwHuHmtcx3oTNhVGsdS
         JpiGnvd7m92AM+PReCKa3uAcecmealDpIhypxTh1TWNML+YSZbcCYBGrUw6HuX2YpKEO
         Rx15MmQ6kAy7QIo6bh10EkeZwAE8xyd2okg8IDmpUPts9c8uwbHJF/PERGf9GOGPZ+DP
         VjmPob+J+2QtKrDmTCj01tEILbVZny4Ktdp3tuduvgFepLxXFZZB6aq/NtajKeVj60s3
         H3Xg==
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
        bh=/RvqzSYZ9b1rfHO7RUVRqKZUQAZLqRzUJTyZPe0RJvA=;
        b=HGWWpg8eRC17fdosByyNPmvYoIzvQ1hhwPQ9HvhE7XwlFU8mE8jVHoNUCvKdcrDzrB
         Q/GS3EecBytjyq+WYEZASQQ/Sb5kH7fZ6BZLok+8FN89WU3v/pTdftFkA8VVn1Wctw2M
         Wh6bypB+dcTr5G0mKSFtFm+hT8+NfsMQA2/lhCXOQp/mmQJKsH23OnYg2OCncNjXAo1u
         YTkixjNFvzIQRk3DxMFI1/QFx/k+qNvFHntrzvCViwGni1yTtMzygrjeXvbCuYseu6sN
         +Rzv4AypDWBVIfGY3WjekosL/2gHPQlHP3l2f0cSYArIN89fi447urciKUMf08IIveDE
         TW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/RvqzSYZ9b1rfHO7RUVRqKZUQAZLqRzUJTyZPe0RJvA=;
        b=jL6A05/GVIbnEmu9rjZ8jdJT8HObYtTn1ZYycjbjTl7BX9tvWdEVtnpNYq3sxGaNBz
         baVU9ElTFPB+Rpvb4hDDd0DqdksBqriEY4wk9Qv1S9sF73QyOtn8obalgqOReKOONO9Z
         f0oTulIBzWRW/43Sdb89u7okqWXq+hplbrFlImx8gemOaOWAYmuilOY0dLQEi3B8nn8h
         9pSHW/55RqK82wgJmLQJBlj9fd7w9AVtK7/gmx9Y4ETrzh7rHwNyBQIEjID5IWbk2wFp
         l4jQzrc/BlKitT2NKGgM9vQmpEL1SiTUpKYkP7pl2RP9msWzhfRB/TwFHAwsuXlOjC6W
         Wlrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532BID3ifnUCSDD9DODJxQeH7SAlblqj8DdG8ZfsYa93nmSg5eyv
	MO0/tmhoc3TuG0ZRYv/X13c=
X-Google-Smtp-Source: ABdhPJxX1bfq1Wz6hzAmcv7jXOjuTzLrtNIY+WcqePB8gfF1A7ANddsm7GM+IJZwlzZCJdIBhIz/2g==
X-Received: by 2002:a50:e78f:: with SMTP id b15mr4054459edn.104.1599657003005;
        Wed, 09 Sep 2020 06:10:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a20b:: with SMTP id r11ls1370354ejy.4.gmail; Wed, 09
 Sep 2020 06:10:01 -0700 (PDT)
X-Received: by 2002:a17:906:ca8f:: with SMTP id js15mr3709038ejb.175.1599657001815;
        Wed, 09 Sep 2020 06:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599657001; cv=none;
        d=google.com; s=arc-20160816;
        b=c3PqfGaqRA6WzYO5+cnSS34z4uhkRD04KHWz6VCQD1s3t3V8DuRj2Wsgv61DGkR6pu
         +qybyG2m3p0EhlTxhgaPW9fGRZaXqA8lZ9/WdU0Bgl80LnVuzx80Y024eFxMRIPVuIDr
         UBUhdG77twNUGtEWTJyxV6H0cu9/bDkNdKw1KaBje03+dJtpB6PZdnolCsetsL3f0yRw
         wrmJtb4/L+FS3Mo1afB92UOPIN+JCWWXDZEC56whC5q8hxcr8HMVFLTtUNk69dsEZpjq
         h56fsjgMK/WuKxvVzyP03+mqz8OGCtTX8koqSnISjDvuiNuoZ6McfqCC6qMC1m2bb7yk
         Em0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=f7B2oCZ/sHehGPyIJnROFoby2U0WyIqCXzcOXbevS1k=;
        b=Qiptdo/kRV3BwaGuJvcRXSjAGyQpJ3A+rtVsAmXrKky6l0MPUizaqW+ZUDnLPJPeRg
         vzxXb8YIYJaekO/oLPG8Y6DcPjcvmq3Drk1P8mPs7V6qQrxo9nXdqD4jThJYb3MkiFSX
         Wgf0vXHJwc7a6A/8MXTl83yppc3d5sOq04hqqq5JLTcFm1ifMypq6VLafWmDAkp+lNfm
         YQAnPXfbQta5ukmZTK7rypW5cxW7BwRwo4mswtU8VjKlL4IdCn3OFY4NA/pmTUlqIbvP
         57Csxsa9w1cUpNJymBxqlBAIiO2QG6s3WyU+cWsmsQuT2jMSm9rwgBkCzbAIAKAQJatb
         zeRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id ca8si74377ejb.0.2020.09.09.06.10.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 06:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 089DA03Z026650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2020 15:10:00 +0200
Received: from [139.22.116.238] ([139.22.116.238])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 089DA0Z7021552;
	Wed, 9 Sep 2020 15:10:00 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
Date: Wed, 9 Sep 2020 15:10:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 09.09.20 14:58, Jan-Marc Stranz wrote:
> I have good news.
> I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
>=20
> The hardware check of Jalihouse works and I was able to create a
> configuration for the root cell with "jailhouse config create nuc8i7.c".
> (I've attached this configuration.)
> I inserted this cell configuration into the Yocto build system and the
> file "nuc8i7.cell" is created and installed under
> "/usr/share/jailhouse/cells".
>=20
> In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I
> extended the Linux command line with:
> intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
>=20
> I took the entry "memmap =3D ..." from the generated configuration "nuc8i=
7.c".
>=20
> While re-booting the system it gets stuck with the following message:
> Kernel panic - System is deadlocked on memory
>=20
> The kernel parameter=C2=A0 "memmap =3D ..." should actually work, because=
 82M
> of the following area is reserved:
>=20
> /* MemRegion: 00100000-39ffffff : System RAM */
> {
> =C2=A0=C2=A0 =C2=A0 .phys_start =3D 0x100000,
> =C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000,
> =C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x39f00000,
> =C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |
> =C2=A0=C2=A0 =C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> }
>=20
> What could I do?
>=20

Most probably, that "$" in the kernel command line is prematurely
resolved as "$0" or so and the resulting kernel command line is invalid.
Depending in how you inject the parameter, make sure quoting or escaping
("\$", or even more) is correctly done and validate the output of the
kernel.

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
jailhouse-dev/0845ad7a-09a3-c366-91c3-b4f1b6725c56%40siemens.com.
