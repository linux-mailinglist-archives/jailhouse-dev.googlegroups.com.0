Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWEQXOUQMGQEKF6EC4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372E7CCA15
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 19:46:02 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 38308e7fff4ca-2c5032ab59esf46492811fa.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 10:46:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1697564762; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+TesOjERZsOU4/w5T0Ir/m9fFO8I0tXWzRypMGc5kkHWPmQl1bx619+ByLDAoE6Ve
         T7WNL3QYLK0m8RcmG9h0T16a//KyROWJ1v0Hb/8kOBV1BCDz3T8wHnv2681sOXvMwGbB
         wUg7K5I8Y/h10zdIP90gpqwm91HNp9k/9dh9h+0iUZs2hYDtn7/RAu0G9cwOItj9wc+i
         fE04vkUePcoutFQYEA/NKOswwnCgt50HgmvIj/h4V9chYm4Q2E0rweFXfEbOmF2PyDoT
         oCeC4XKkPrJZgcnyAAi/JOsicnZlJ+L1ea60kLgk1dI2/dUZrbBOTVTznjhxfVREcKV6
         pUiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=cpdlP20dAP2fUkdMsjs/Bs6U3121lOLDJTZAWl90Hr0=;
        fh=tlpKaXzmTFzNAchb0XU2ZkxIE1viUVT68SEQhlw28ig=;
        b=g20QFl9dM9lUCGMsVns/3t2fCvAFl8NS3Sn+lCq4qclzVvG9J0yoQLXgqYzbKhJz2W
         aK/ZkAJrgHN8Pw9r7nfvn3Dmqca58v9q69jsA9K8j4cd2O4w7zxATU6yh6sf3T82D7ho
         rzMoLvBh3ehNYi3Lfj90O/uzKdxVJIYXVqqMnoYw1gy/b7JN0MYZlox52W0KkudY9lqd
         QNxWwTF5QNLFiNAkpR/VrIQxvVXA3l6RmiRGsP2s33Z6WzcS/C4R37YEERBtpgczqaP0
         Oy/4u+9YC5pbDMY0Fe9iypN9LrA3yc/EBBuJ/jnrRmeQl4M7sNpe/vZfL6Rmq5gy/iyB
         0zQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=MfKZFvMD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697564762; x=1698169562; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cpdlP20dAP2fUkdMsjs/Bs6U3121lOLDJTZAWl90Hr0=;
        b=XgDenIQKpvIQZyYzh4ZyoMTkmE0N+OMZid83nvHLKzRvq7nDPRMEuBdsHBy4FPmNH6
         gC8M0OwtJneNWHSo2zzLGkGBLpDqNEPdw6B8ZDNV1dqbOK1lmI3xtvyKTEJ8r6aukZlC
         dUXLP0+UBCuWAJGHHczUrCo+kWoh5u+2GNqf+1z/jI0vJiKTYwkCOlqBQKfGCUMmVY1D
         KjYbFKUSVDQhuCBbVmcvVnOg84hvf8GGP3UIraHklFIU5CSk44bUvV+hakpZetHFI4CO
         BGfxCEfb9wqlZ1pOD0UP81LGjlRE1wcZVL3ahnwtcwRsxqzgfWTTbcMSJIn7t+JDqW7K
         WuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697564762; x=1698169562;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpdlP20dAP2fUkdMsjs/Bs6U3121lOLDJTZAWl90Hr0=;
        b=iiHu5pvAQOTuiBfY1P3EOnjOjBnlTXI29oUNWh34G2pTQcN7msjCu0bPUb68CA56FH
         5FTML3iN8OuPLh/P0QFLVx1rlPj3v20srP0ewPkEAobgTCFNrTMU2nUw7bxmdAXlen7m
         N+7Itcjl18H89cSI5gc2JvdOClAkHXA7oeOhEe+/aqx5rI5zY9n3Z1nX6Nb3k4bLZdWA
         JuZYYgVX6MNuUDczrOM4ahDMlgcjW0xrlgZnle0oGJIgGvc8yZVTiD7MCZJZQ1jla+J1
         +Q1IZYCIz5xvy5+zDrqjAOqH2eKKR8KC72aXWj04eRWf3W3ZDPq888yf9YbbRQBulUTA
         GxBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyHeniCSakSgJVmiMOR2YLU94PwROLgR69LppWkBPJYDl0Lr94D
	GC80Li1tqPltIRAFjzsfw2Q=
X-Google-Smtp-Source: AGHT+IHRUQmnVvpefT4wL23Gda3CSJN0J43vDTq8/YTXoDJi5X+uQBYp6HyxkzCW9PE5LnwJWrRpZw==
X-Received: by 2002:a05:651c:1063:b0:2bf:e61b:c980 with SMTP id y3-20020a05651c106300b002bfe61bc980mr2024919ljm.8.1697564761527;
        Tue, 17 Oct 2023 10:46:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95c7:0:b0:2c0:d63:6f2 with SMTP id y7-20020a2e95c7000000b002c00d6306f2ls744170ljh.1.-pod-prod-01-eu;
 Tue, 17 Oct 2023 10:45:59 -0700 (PDT)
X-Received: by 2002:a05:651c:1198:b0:2bf:eccb:548 with SMTP id w24-20020a05651c119800b002bfeccb0548mr1887781ljo.0.1697564758779;
        Tue, 17 Oct 2023 10:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697564758; cv=none;
        d=google.com; s=arc-20160816;
        b=UFP7qYue5yAtbJjKSrY4Qu6rR9cpIlHhQGx8DdxCtBNdOoMLnlNZl6GJAPaHyiG/uh
         78oy0B1/vmaYal5jkuiyvebjFiSSJVCK/kwO03ZAqdR8hIbKgxstfcss1kaDKsLi7fbn
         dkB3fXOKU3tZWeV9Egw2P+9f4UJwNBbCX/VvxuM41t3Hic0UmF7fe+cjwOqhHtK/9Yi/
         1JptvgviaJOmccABxLX3ZxlKGwWMLKlNdrb+WXn9u+RB/L8mbgay58iV9PIJiKZJWnk0
         s9bY4aNlYs04rFKgFs6tJMYNyRHKfXhMJto3oG8aRjOqVkfY625Ld9r+K7rvcSY87w4O
         AS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tl6jRf6B3IbBBFDMA7Rf9O5Saz+kh6cX72EpeR/5Jso=;
        fh=tlpKaXzmTFzNAchb0XU2ZkxIE1viUVT68SEQhlw28ig=;
        b=QymOD5o0II1Tn+KU8fNpOljK8hSLdl0M3vKGx/ckpU5WspAmkd+li801OUxNC1u43H
         n8fK5dkI1ARPClVHd7aXWAmFiV4/MP3DDqfFxXQbwPiiHI5KIiBCgkMsVQLjiVq6gSDI
         9fNRSC8yI0Y6VTFA3C6Jeu9OP8ROAhuCMIiVkzZ7dDtprI79fL7IgxRC/oOVfTCenHhw
         fDfxd18/7/Ry+3UJ2Ih2ziNmYSbNmtp28CU+qtxFgbPGrgIhyx4FuenhSLVVXuNki4oE
         mZhFRXGpI9kv9xedAP+hDo5tINtR9Hjrr82J7jj+UtLW+EkoRoiLF2Q1r5OI9KXJGWtT
         gYRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=MfKZFvMD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id n11-20020a05600c500b00b003fe2591111dsi508686wmr.1.2023.10.17.10.45.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 10:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id B9DBA2E013B;
	Tue, 17 Oct 2023 19:45:57 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4S91c52ZPzzxsH;
	Tue, 17 Oct 2023 19:45:57 +0200 (CEST)
Received: from [172.23.3.112] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 17 Oct
 2023 19:45:57 +0200
Message-ID: <626353e4-c280-4026-9fff-3e528c8809f8@oth-regensburg.de>
Date: Tue, 17 Oct 2023 19:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can't install jailhouse on linux-6.1 arm system
Content-Language: en-US
To: Dave Marples <dave@marples.net>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
 <8753f9c0-7105-4362-9884-90a2c57fd137@marples.net>
 <bf20ebf0-f447-4e73-8d94-e82b2d8dd836n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <bf20ebf0-f447-4e73-8d94-e82b2d8dd836n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=MfKZFvMD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 17/10/2023 19:22, Dave Marples wrote:
> Grr, my build suffered User Error. Once I built it properly everthing=20
> starts to work much better. Thanks for the help!!

Ah - just wanted to mention to make sure that you booted the right=20
kernel. Excellent, good to hear!

   Ralf

>=20
> # jailhouse enable imx8mm.cell
> [ =C2=A0 57.058121] =C2=A0jailhouse: firmware: direct-loading firmware ja=
ilhouse.bin
> [ =C2=A0 57.068743] pci-host-generic bb800000.pci: host bridge /pci@0 ran=
ges:
> [ =C2=A0 57.075325] pci-host-generic bb800000.pci: =C2=A0 =C2=A0 =C2=A0ME=
M=20
> 0x00bb900000..0x00bb903fff -> 0x00bb900000
> [ =C2=A0 57.084068] pci-host-generic bb800000.pci: ECAM at [mem=20
> 0xbb800000-0xbb8fffff] for [bus 00]
> [ =C2=A0 57.092822] pci-host-generic bb800000.pci: PCI host bridge to bus=
 0001:00
> [ =C2=A0 57.099638] pci_bus 0001:00: root bus resource [bus 00]
> [ =C2=A0 57.104908] pci_bus 0001:00: root bus resource [mem=20
> 0xbb900000-0xbb903fff]
> [ =C2=A0 57.111833] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
> [ =C2=A0 57.117874] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0 57.124382] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
> [ =C2=A0 57.130430] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0 57.137880] pci 0001:00:00.0: BAR 0: assigned [mem 0xbb900000-0xb=
b900fff]
> [ =C2=A0 57.144709] pci 0001:00:01.0: BAR 0: assigned [mem 0xbb901000-0xb=
b901fff]
> [ =C2=A0 57.151711] The Jailhouse is opening.
> root@localhost:~/jailhouse/configs/arm64#
>=20
> On Tuesday, 17 October 2023 at 18:08:08 UTC+1 Dave Marples wrote:
>=20
>=20
>>>
>>>     Help still appreciated...Can't help getting the feeling I'm
>>>     missing a document somewhere whereby all this lot magically
>>>     becomes easy...
>>
>>     Did you also apply the patch that I attached? I'm pretty sure that
>>     it's missing.
>>
>     Hi Ralf,
>=20
>     Thanks for the reply. That patch was indeed missing but applying it
>     didn't change my symptoms. Just spinning up a yocto image to see
>     where the differences are.
>=20
>     Regards
>=20
>     DAVE
>=20
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/bf20ebf0-f447-4e73-8d94-e=
82b2d8dd836n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/bf20ebf0-f447-4e73-8d94-e82b2d8dd836n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/626353e4-c280-4026-9fff-3e528c8809f8%40oth-regensburg.de.
