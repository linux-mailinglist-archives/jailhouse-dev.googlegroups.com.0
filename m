Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ6MSP7AKGQEF2XMP5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6B2C8424
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 13:31:36 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id b184sf1020358wmh.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 04:31:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606739496; cv=pass;
        d=google.com; s=arc-20160816;
        b=az0+CBRYuQbALOt48YPvkDw8jzq6Nk0uSUJEwW/rqI0lvRxz+qbIFIGeT//xtn+5/G
         PkUzyN1mPGXb1Ne5sl3AfG/ewTYMn5LBds7Il3Sf2ifHelbeZKWaCUI7kzAQNFyvh91o
         zuBDV3TozOCeGkq5+O/4nLQusNjl1u5psSGkQIz3ZLCV9d57qSYjrvycoj4jYuA8tLRW
         D7O5x+44U65eGh2gUpDMA4kIW99H8k/H4GJbwlmyDdiZvfqVHXEV3qIr8G3DZ2YoOLSD
         ONvaGXajyH5fH7QHUj/yhmOEPA2i6o5lDXShzHOtpK72EG4/Iq8gcparGSLNYXKgqLD9
         wHpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ft3vrS5b+Gau30r95EjHrjU4vVjZVeMKvEY9hDmuRNk=;
        b=EbqW06KmbchurM+NoNRuUJQIoljBbQpGvfNfa9kVQ7izR08gtI7Ljylyz8yTgCjcYV
         C8h6eR2jGjtwAJFEr7eAmjaHNI4TPXLMZ+RRSS28sQvjl539wvADm3Kof6JGXFJo4Ge2
         nUuh+n1wbSE9lraSjnSDnip+L1Iteaonm9/d4dXr3p4xy6M7f5GR+Ma9Vuk7edZyN7RQ
         f3htCXxzCSQ4yeVuSpaLtSX2s5MGxYEuTqe2d04hKzSUa0TZ/2KaMdtZFHc5EzXoxAdD
         XNlofeHtrzQyQme/aFai44MlP/Ue1PyJRiICgt8ujB3BYFXLem/nvOwD40RQ1Vox/6MS
         gF9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ft3vrS5b+Gau30r95EjHrjU4vVjZVeMKvEY9hDmuRNk=;
        b=WSRxDfUgWb5JH1sUSOw8v58oIkg4LeQD1lpG51g7FZRHmvo9CgRcrdtSWJR3yL0xrA
         43qnIhrMaqcXK0/AVLIEPsXyMbYtMRHWeufbf6ykhObk6gDcDgs4i9F5mhfFWqjao5zH
         xpL7k36Rwnng1vczz22ahsA7rYJafQ1sgo9NyKHW1CXSrv9R88GH7CmgnbP2PDJhUv4B
         Jf4VrWZJr4sj3zdEfSd2yYcE/OMMk3ScRYxFM/1FJgzISWVrqFasXIh9rtgBjUv+Q4ca
         Zvc3+4Pk3VsdZH4kWVE906nB6qU5iRsxgiXI5GwvyOwRQiDffuGj09QwjrEfa64fFokW
         5u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ft3vrS5b+Gau30r95EjHrjU4vVjZVeMKvEY9hDmuRNk=;
        b=ul7XD5IJejRV7GZJ1A6RUGiacV1r2M+g5Lvpryrr98BNSygoo0x2yfdgrvxN3h/V4D
         YrevquHNvEmUeaJxl4uRUAiebgFXWDTvp0u0EW+GmR7qIRhVEnz+apAOCKhZ/JxjYN+M
         EF+uDma9SjRi3yaSYsKiKykpTIeTYTW/awD/FRTVDnOlt6ZcSt9+HPLgspLoUc7Fb6bf
         d69w8It6eyYgtWUk5q4ynoabsJ5m0GAYWMuGCco3BYRXjWTW6ZdFG0I9yvdIEIP3m/K2
         H6yv9OsLk4SKqJqx8fJcl9SR0PYiRPsK1CENg/h8RRxeblPWgOyhNfm/K6PK71jXUdmF
         7gGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530krq/omLYDyptE0I1B8ZXJCzE9K8XLM1GkxU8heJ1bONOK5WSF
	g0TRRGEE9Tbx83NmkonuH4o=
X-Google-Smtp-Source: ABdhPJyZIKM4gAzOvfecG2m1mj/lAXWDJPGlMWY2Qzp0PpPhKCp2+dSZeZpEP0OaIwoce2I05cWpGA==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr27954025wrj.328.1606739496147;
        Mon, 30 Nov 2020 04:31:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls9381978wrc.2.gmail; Mon, 30 Nov
 2020 04:31:35 -0800 (PST)
X-Received: by 2002:adf:9b85:: with SMTP id d5mr28221955wrc.9.1606739495086;
        Mon, 30 Nov 2020 04:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606739495; cv=none;
        d=google.com; s=arc-20160816;
        b=vs2TPo5/3iihr5OXiJLf5OQ5Jqr6RJXYCJQy8NjikCBBMw+5otH7w4BBD7edql2Fre
         G0OclpkctVYWeP45xgCyDRia6OE+4tX0tR2zIaFAeMaAmf8Vu8bj10NvMqvQlb4EjI1d
         /gZCe0A8aKIrnk/nlvYGyNRlWP8MT7/Lk/EQpr+yLAqro1IJukMf8QahFWgUhb/6jc/q
         r1HfD/AxTAe5GjuEI/pJwJHm8z92mGWHbl5hFEdhCM3dnP89ZBbkm7cIdc9T/slJ+uuz
         I4bRk5FTAyLs/tO5NAWzepNP/t30T/DYukli6KI9cT0OlShvbEQsPNxN6efwxCnvzQjF
         4ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Quujv9/8v6xWP/nC6pBiTos7TaDmb2FDtfaxbQiFm60=;
        b=vIA1TIhpilx1QN3uruDhK0TED0rMga9b0HIbWokUeo/VVV7D2qwbxxe8lIMHzIeumt
         eADzU8Fj5eF+MJkvphrBe4xVO2LoxrKpK+F9QKtC9BrD38p9PN7r3HFSiKZ4lz4QdcXI
         wsvB1R275Uk4a1K0BZNzyG1Lij/EUavJ3AzknVfhj2piBILovK+2udPkBpaVBLnkofcz
         T+Pl/IiJFesy09pmSQLiuhpveRHCWocXsE/y9dn/dyCJ7ahRTqqhPE5ESYA7E/bOo4O3
         xxEE/Uk34yo/QZVSYBVb++//NFx4KP43L7WqUf4EtD0JkPY9Ptk823hCC3DcszukU5c/
         Wvyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z83si821120wmc.3.2020.11.30.04.31.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 04:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AUCVYeY005158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Nov 2020 13:31:34 +0100
Received: from [167.87.39.132] ([167.87.39.132])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AUCVXrS000368;
	Mon, 30 Nov 2020 13:31:34 +0100
Subject: Re: jailhouse: request_mem_region failed for hypervisor memory
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
Date: Mon, 30 Nov 2020 13:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 30.11.20 11:31, Sainz Markel wrote:
> Hi all,
>=20
> =C2=A0
>=20
> After being able to compile all the elements, when I try to enable the
> cell, I get the following error:
>=20
> =C2=A0
>=20
> / # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
>=20
> [=C2=A0 142.758697] jailhouse: request_mem_region failed for hypervisor m=
emory.
>=20
> [=C2=A0 142.760507] jailhouse: Did you reserve the memory with "memmap=3D=
" or
> "mem=3D"?
>=20
> JAILHOUSE_ENABLE: Invalid argument
>=20
> =C2=A0
>=20
> I=E2=80=99ve appended to the kernel the line =E2=80=9Croot=3D/dev/sda int=
el_iommu=3Doff
> memmap=3D0x5200000\$0x3a000000 vga=3D0x305=E2=80=9D
>=20

Does that show up without the "\" escape in /proc/cmdline?

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
jailhouse-dev/b2243b44-31d8-5e2a-5080-6658b5d1ffe4%40siemens.com.
