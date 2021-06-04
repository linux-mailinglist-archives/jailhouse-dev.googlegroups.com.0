Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKUB5GCQMGQEJTPCZ3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BA39BB5B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 17:03:08 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id r1-20020ac85c810000b02901fa9798cdb5sf5359457qta.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 08:03:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622818987; cv=pass;
        d=google.com; s=arc-20160816;
        b=vi4V917lpgatHiHWk5mVgDjH+bI+EgGMICbhXgSG3ft+BfztM+pBRowl1fpEmTylg1
         5V/96BgTnWAX9MTmY5+uJFxwY+1A8v0nwB9XA4a0f88S/8gs/uZpBRZYkWw4hKUY1K5M
         l0bQ5MX1UVmhWMhOAe6TYMrFKQKqBLn1pnNfUdUAgm/oAkuVjzZhyAafnufo6N7Elc/T
         4QVY4mH1jkTHAkchFc2DunNW5TNSIN0dnL8uNelXQZ92pwnOzfI5SuSzLrQlJ/m6DD5g
         VYvVxz/BMv98hKicml0YQFT8ckZS+elo6yboZqCY3V8I2g5fFn4yZAANpdtC2yXUBbhS
         qGhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=iJgSwJsCGE0PFIlxCoser++isVNkZSzollx0eSz2yKk=;
        b=dz6cv7lkdYz8qnvsMsJkDes/oYzKzGk8pAGBasL4t6DnXcX3xeIWaiT6F+BngQ2i8r
         vtYkZ6zp2Pb/IhA+JncYbPx97lCjbuk59eNwBRiP9GR5uxn3Ty9vYDxN+mxDzeZOz2o5
         s6+8icN0svlSP5xQnd4bCDx5uNdkS/Hot0q8Uk0hxtoMEGeNBhcWfXT1xpRtaTeFpIpR
         UTAg7quBEsWg7iMP39wHxC0HFV8GpSc26NfwmMk5GqjJkuYuPUzmiQQV6N3aVJLTbNtf
         8OAxTVBGGsk5UchV9C+TI4ey8PioTc5j0zBqHeVR7dTqpRx8FuhEE+GOPqORnERExQn8
         gTdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iJgSwJsCGE0PFIlxCoser++isVNkZSzollx0eSz2yKk=;
        b=AG3kKKZPpzfp6KBTPI3Eo+IzDuAOpmjsXpJn65NZJaQa0deI8xzA99QRkwDJUy3pKZ
         Os2xHuapZbYhwLpVDblYLn4vbUMs+ZPuZW0bsIOpw1Lsqba1kcrQ7BCwebHyj81Na81W
         B9GmsBKrktxeNtCaX3kR5dPSbXzRycbewEBfuSPYjzwgtADJe746nxaSdFPmJKfabd7v
         NMIc6926Pkf6h9c7DDyVFemnzH4/bh7JSldDRR9oVsNuvkRzSZc9zM7xEXBNt5MmF5HU
         e4HZeeWTsV2gSWw4doJI+OFeemIYr67J6Wau6pKBMfW/2nxT54mC3RqZNDJVIJM1UeER
         bBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iJgSwJsCGE0PFIlxCoser++isVNkZSzollx0eSz2yKk=;
        b=ox0u7yhac2YvcUqF17OyhNq2vbbeROAIzPDi2Q/MkxD/4J4UH8hW2pdespyhAyFzgw
         VYEjzUaq2jLz9+RjLjbepXTDLV9IkqI+TITr/Ez0QnLQ08DCim/PA9T7ArpAxygyaO0F
         Q7JjOTxs9Qncbn74YCvA0IdaNyPTv6GW/rjFPXYRl7cxPOlLl/5qe7Ydr/m+H/wqKYgF
         zn9/GtDYDk1sCU7gD5h8T5lOOXQ6B7yPrljSLo+BRco2c8oUig4zLNQ3NK19vyLHSBAQ
         /bsI7GtSMshODY2qZV1cEllQ3T58n0ZbN2lB+RR2sUy6kfmgClm7tH2LVvFw6SUblQ85
         NDpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TM4lP64pSlWO7qCyRY+hLc2ls4GIJeiSebESb+HPgwyWN+9Kz
	TU9Bebg71G3dL3wMo+EiMYo=
X-Google-Smtp-Source: ABdhPJwUs6q1WTUoeV0I5MKEJ0VR7xA0pmnMwLQ6ShZCe1X/RcUyrABdgifUeHYsfoNUs4b5/rMmlg==
X-Received: by 2002:ac8:47c2:: with SMTP id d2mr3449052qtr.128.1622818986881;
        Fri, 04 Jun 2021 08:03:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ea15:: with SMTP id f21ls4242028qkg.7.gmail; Fri, 04 Jun
 2021 08:03:06 -0700 (PDT)
X-Received: by 2002:a37:911:: with SMTP id 17mr2415242qkj.436.1622818986384;
        Fri, 04 Jun 2021 08:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622818986; cv=none;
        d=google.com; s=arc-20160816;
        b=pqs5ljKFsI+eFycVqr2mHFiYKtvr56eXlJgdxm04yUFXLHdBWuq/HUmQYTVMGukCyl
         DW9RjOof/RgS7m3bUOHbQWr1u9Lsq2qXMgw3s805AvzJKOdgYfP5GXpd5XeeuuTp7yz5
         PLNvJTFL3E9JK7hh2id1SHIluChrmGHpP5UvNADOmT4ssMQd/EiyRxJPZPszVbArVWQr
         2qTCCphKXbg92+sLdG7F0M6BRbb4dsYCwEuEaxciwHMJHiqcb+wV7hkErXChedmINEmN
         cyYlhIuQTZjTE6utEM6qZ1OPvRoR+zEXSmb/KmM4XaH7sFG+yY57h/VDmaYogLGlN0ll
         l3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OKkDMmYnjI/HJ6FqxEWzVLrlag9gS6/4Puje/eUFhlM=;
        b=ME9MWWMslbK342MeUMjCCFctNWRzl4qKawEpvS0BMd4srunEWzAOYioySZ65Si+wvP
         11S0ZFswEwca8c0BFr6e6UCooM/OK1xLbXYTmGqY1DqtD0VWRVG78SSS0n3MoiYEbD22
         evrMKIUd8bcCa6T0BPSh1V1pYeIE/+L6g8jvmXDqs1lPcdtf8BT5g+wJmIaM3PtjwdtQ
         vQtmsfBdS3ZJn9bEawzasvTrDS3D26nxDCJSbShvQKneOKSaeALpUQ0PjW1CPzMA8o7b
         D4ZSYM4AeorcFkgsqUJLue0rmNeGuZFtKipHgQDQyRP8tNrcOaDMiA0JeJJoGQmpIoX8
         SjMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p5si612353qkj.2.2021.06.04.08.03.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 08:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 154F32f2009948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jun 2021 17:03:02 +0200
Received: from [167.87.78.199] ([167.87.78.199])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 154F31ma014709;
	Fri, 4 Jun 2021 17:03:01 +0200
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
To: Kannan Sivaraman <kannan@cimware.in>, jailhouse-dev@googlegroups.com
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
 <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
 <CALeLWRjOz=fYGsDXfHWsHuS4Rt4HeSLXCbqvGCPi8P0fDqy27g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <266fa95f-9dea-0ad7-6136-a268a32af54f@siemens.com>
Date: Fri, 4 Jun 2021 17:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CALeLWRjOz=fYGsDXfHWsHuS4Rt4HeSLXCbqvGCPi8P0fDqy27g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 03.06.21 13:00, Kannan Sivaraman wrote:
> Dear community,
> =C2=A0 =C2=A0I am also interested in implementation on arm64. Has anyone =
in this
> group deployed Jailhouse on arm64.=C2=A0I will be very helpful if you sha=
re
> the procedure.
>=20

Please do not "capture" existing threads with new topics. What is your
specific question? I'm asking because the one above reads like "does
Jailhouse run on ARM64?", which can easily be answered and even tried
out on a lot of targets.

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
jailhouse-dev/266fa95f-9dea-0ad7-6136-a268a32af54f%40siemens.com.
