Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS75XCGAMGQEM3LVARI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3644E46F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Nov 2021 11:15:40 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id s20-20020a05620a0bd400b0045e893f2ed8sf6062466qki.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Nov 2021 02:15:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636712139; cv=pass;
        d=google.com; s=arc-20160816;
        b=woUZM3f0ho3IeLS4WrX+ynN1+cdh6fg7inK9dijuyStAVyGtEEFJn2BYyWxQr8dSLG
         6wxtmOW0oNlFdLNTQa4178kYvuO2edtOKv2c8adokajB4vsYTTUmoLLagnH3l2Xi+UQ8
         EgHydtcq3dgPMUhKvvjNaioXw/kOyFuK8mTVP612vM0gfgyd0IoR817v5x33KYIkvVyS
         i7OWPfhZV0xwn/v8XvGCMzIQaE4CfhV2bDpJuQdr6WUozUXt0xd3Q/RmJNJ25kHTMKtH
         dxT29tT+XkyCF1obwpbqbP5CudnQFmDGvHNfRboNh9UMqFhEa2avfLTm4vwC8S+2fKbd
         b5Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XgkkbdFRlHSovv0mMxUy3IHV7hcOpZyK6MT4swbnJlg=;
        b=r0NS/DEfgPU1KWnZykaGqcFjswtyDndOOAmr1A50CTVFBfjTwUZxfxWRr+l2QhaUSR
         9acsjsqpGYPQzJFsBCY+jnxKal/ZGgQQPCU8vv42gj2Ske1e/+mGg0LL6i3NHy3yCGF5
         HT64pBSVc3vl1OP//6qea05MQ3IY59ADRSdhWKJzfTXSrM6Y+N1goV4sAR5NPSNEg8cW
         QFUSjmbCGjAYhg0/OWfxsYpny1cIeB7La9tNwKPnNEFzR5EUKcGvq819WQKbegLbCDLg
         twjaYOE1qnjhV2PBPrDeFOXO1+sjEC3dFLK7qcg/caj16hsvEcrH9/3kVYYIIjh6SpKV
         Y6KQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XgkkbdFRlHSovv0mMxUy3IHV7hcOpZyK6MT4swbnJlg=;
        b=eLUGQiT/8i+9ofJsPiBf4BijtkwIW6kRPGi9OA3XIhNDoc2HwPBUX2poTRdApabczO
         XDUSxcUleNmHOoHKX6n0uDE3+2lGvCT7rwoga0DwunEncr778t00DqRZeC6W9gBHg6Ls
         d9OKz3kh1B0n8dSVntu0MoaeJXMvXYEbFZ7qKRQjP1gPcDEoeqEG4b9T7/V/f9sOQC+m
         Cg/7ic3UpoEnXvR63/omfCbtSqj8e0gRpL/sM8Olhp6K2bG0EFBld/WPRwSFmpxYntn3
         PH0mPaLYAgTnoVVjH7eS4Ra7Vhl9C4/CkWBCLWCtrS7rw2v6z9mD8YHZkqEwtjiKZQGR
         0bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XgkkbdFRlHSovv0mMxUy3IHV7hcOpZyK6MT4swbnJlg=;
        b=lhU9nxXI7kgZQCCeGPGSCfpdk/Nj7xK0Ls8KQSjY7xvdzFM7jR3rN+uhs6s4AoTCXY
         2yBFlphMsZbns8pXCKuPM4G484srqCp/VY/Atd/KeVQLMqk3NHpF1ToqoKh0WKyOLBmS
         fm65bQUXKVjsmtPt4UFdaMo3MkXE44IHlMDxJu7vsEQvpX8YrqiYyjuzeQAjX9Osq873
         xcMGbPma+X46P2k46s1f03lYQ35gI5+xPg4Hg9sM6yBN1nhr5UPctnSN03S06p6CTxvT
         hK1EOqLyxVawnAii8s3hjTg5gb6WnbN1UYrDDaLkrJfIAF9ja4VCdmvAvamXA7hyn7xL
         C2/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53229xu8zqbmZrPsPJRsYWF3bBYZQei8Xkyz3zfR4s/Tv2TsBFnX
	5t81BB3DLUJSb8DT0TNZqqI=
X-Google-Smtp-Source: ABdhPJx2YVt2en4Xi2Ud/9RXor5iG1deSWK4/mxCP7b5LAseWd0bYFEaxNJQJFsyFxm14Hh7etR0xA==
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr11866076qkf.48.1636712139639;
        Fri, 12 Nov 2021 02:15:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f306:: with SMTP id j6ls1968163qvl.5.gmail; Fri, 12 Nov
 2021 02:15:39 -0800 (PST)
X-Received: by 2002:a0c:fec4:: with SMTP id z4mr13434416qvs.32.1636712139235;
        Fri, 12 Nov 2021 02:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636712139; cv=none;
        d=google.com; s=arc-20160816;
        b=MoCaeAZR4rMBCgoj1dV2BevE12sqPECi8Wb55w3n+0yvmcohO+n9p6f3+zszi0mwxG
         QtPq2m0HalvWHzBDc0IVJoS/pAUh2uuaOeJI2ihQ+RtQ3zfaqq0fJfaTpYwun6kSyoPo
         CxUeJn4LJo/7B3mQypx4vGZLl+jBkZ1zEcy1iaXuApnW9rXjkTqFVwjk/FVGBYLZL0/S
         U07VqctG4pqb9oQAK0X7cYOLhHr0kBKpAQY6YXH+MRUtSvS/uNRvrqhXxw9WX3LzpsVj
         f2znM/WyesRniIZgTXVeRaIncN+1NCo8WCR+gnq5gqqnc+AwgXtSOVpVmjFJuceXlHJs
         iNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aCb3nimznCixPbe/dhNVJTb0/KqJsgn+bxZkiU8/iNo=;
        b=n7j0zEavFZfAilnYXRHRlHYgg79c37NrElsPA5ykuomldQiOmt8YfZ+Jd/Dwgiknxd
         nVCqF9hIExM0w/Xe7QpILBot02A1RYu8b1e6EVB9x9CWDwoqUB/XyRizQBorEPT451MN
         f9MhlUYdCfKok1zwrLvRK+7/Dn+ohSJq/sTvaaQAda2B4XVEYxzOw4Z9b+akeoJY28AJ
         JxmpapRfX+fjzuf37cpaZ6skS13oz/l8DdTF9hQcjPDmIcBBaySry88NoeERDqBLuca8
         gAlrtTIDnmYDjrYgtz5eSVQx+VI6qeZZ1XMXonwdzVljbBCMwlZR/Sd+IG5Hc4NP7E9y
         Zhiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id n2si1078937qkp.4.2021.11.12.02.15.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1ACAFYv4023963
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Nov 2021 11:15:35 +0100
Received: from [167.87.32.54] ([167.87.32.54])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1ACAFYfs024311;
	Fri, 12 Nov 2021 11:15:34 +0100
Subject: Re: Jailhouse cell linux
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
Date: Fri, 12 Nov 2021 11:15:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
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

On 12.11.21 10:34, Moustafa Nofal wrote:
>     >You are targeting RPi4, right? Again, jailhouse-images has
>     everything to
>     >get the ball rolling. From there, start exchanging pieces that you
>     want
>     >to have in a different flavor.=20
>=20
> =C2=A0
> I used the configuration file from Jailhouse-images, I got error on 5.10
> kernel:
> =C2=A0__get_vm_area_caller
> =C2=A0ioremap_page_range
> =C2=A0__hyp_stub_vectors
> are undefined, so what may be missing here?=20

The kernel sources that jailhouse-images is using. There are a few
patches on top of 5.10-lts.

>=20
>     >Regarding the concrete question:
>     > either a support physical PCI host controller (so far only worked
>     >with the old Seattle board)
>     >or a virtual PCI controller configured in the root cell config (see
>     >configs/arm64/rpi4.c)
>     >support for CONFIG_PCI_HOST_GENERIC and CONFIG_OF_OVERLAY
>=20
> Back to 5.4, I added support, but I got another error:=C2=A0
> lspci: sysfs_scan: Invalid domain ffffffff
> So, where shall i continue?

That is unusual, don't recall a concrete reason. Did you set
platform_info.pci_domain in the root cell config? Make sure it does not
collide with already existing (physical) PCI host controller domains.

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
jailhouse-dev/595778e6-5066-2fc7-ce1d-15bb30b24cde%40siemens.com.
