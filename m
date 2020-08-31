Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB442W35AKGQEMOPJ2MA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id A3391258490
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:53:24 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id u11sf63992lfk.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:53:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598918004; cv=pass;
        d=google.com; s=arc-20160816;
        b=CW9lPK4YhGxObg0POjXPpb/fdymdO8Qb4G6Vt5Y/4AeufmhtZoPh66MNcEnbI1rigj
         cUbMy9a+jhwG3dq/bkLsOk9SOAEEpRGGm2V4aNzcEyxo8bZGSlRDlTzo2wF+ulMe6JhT
         kq6iOk1GgmSd/Ib0rwOTSjWySxv9720EWel1YonpljY5yzn5ERuxsSPd+6gHg0gTiH0J
         KnbF86gSbUbBXSysrifC97m5zI3htkVk7BrjKQKfkoYosYi/Upq1gKpMtrQLoMOQ5ppQ
         tet1MLIEQ89BSzO7t/41Go8jtMO/hk/JUo7gXe6RPDllopLorWJhM+rM/2ihrblgf9q3
         iqLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=cesEbSrLuEbDdzSQDFuYUXGqSG0vTpzP4vRpGZ3fY78=;
        b=PaA6JrrZ1TjYXMl85z5xaG2WbI3UFeYoAI0dF26ri9DAX64ZAMxEn9VlgB5sFOlTxt
         rp70fiPLw9b//hr9Kb4Ru4TOhoVKaCHuC9lBbdPeXQxfI6A3EK69nLdq25ogiL+2LBmb
         XC9156/Vu2XAi7NePTp5Toi15VR4ZtNiuH2ijMiPgNIrMmqBjIs59ttDpYWHOFcdJQir
         /GVVkYz6qN0hA5oMnUoQ5oQrQamPawHWmfpPtT3kmDSuJspQsJxZDvThZkO1iokcyN9E
         f/h6O5AB95TSsQwUeR5D2t21n7x1aUYtNbtnkIa4y/lKX0b29sPgNHuIOyUlKQWkXSRR
         imAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cesEbSrLuEbDdzSQDFuYUXGqSG0vTpzP4vRpGZ3fY78=;
        b=HoXSvSsm4xUe0AUdLiqROahf1EMBsqLjQKm2D1A+h5EGraF9tNSGHd6ajoDVDWIYUB
         0Y5FFkPFpiu8P/sB74DACO2R++/IWNYG+jrVOA0vKiNFdX0dw1RWCKyE1kUPiZZPcqQq
         DvsGUarfdHpyyI4JM6gKp8soSYTlBwrZGufbMMpOqKoobLPsSBgn+aogkxm3Y7WTW2ND
         Jh6FLEaz56+wH9Zx2VjHhsY8dxf7HwmVpT2e7eE2Mv4wiiuL5vU3XM1/B975mnARmzww
         rkpJTL9G/nOpNkiVA6nplNLAOSs6DXpDUUu+TUqI0TkzgVmYMhp47VPFs7vlkRs84/ZC
         FIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cesEbSrLuEbDdzSQDFuYUXGqSG0vTpzP4vRpGZ3fY78=;
        b=NAb3KgjIoOOG0hw00ifXIX9/2GU3BnIDZZe9FEBkesClb23uAfnKvz/N1TuhKduBjE
         2iBrSlM9Sc+zqnms5MiJkXUtgtgbMrwhi2Dr71Il2DennHVD1eXnIX/pG2gdM8fpFMDz
         sg7mK0f9cQE379SsN2Z15Mx+7iOP50zD/OPpbeYlz88JmKZRttelD7Gn65QpXr9e6tp8
         qyw+WRA781UvrR5AMCqr/aZ8dKDlSfm0Ad7w5yQKsOOlcpoXYTPBrKGG8+UT90FuPVi4
         L+q9zaYXFrbYbr3xGGz/dn1Mq2SNLqy4VwiNQVL/iCNA/dDzWV2stX5k38ru5wveEr5o
         e1VA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Njue/TP222dSyw1grDl9OjeYTyR8hxBBnK4AFj5AQ64j8kWUp
	fQmMvZyWs5iktRkXt3Py6w8=
X-Google-Smtp-Source: ABdhPJwo7Xq3XySd/DuX2WGbSjSqZgYpkqGOk4F8DsgmEcX5XSZO2XsxnI6tilYyVGy2KYc6ac8+iQ==
X-Received: by 2002:a2e:9d04:: with SMTP id t4mr1767829lji.293.1598918004190;
        Mon, 31 Aug 2020 16:53:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1780214lff.0.gmail; Mon, 31
 Aug 2020 16:53:23 -0700 (PDT)
X-Received: by 2002:a19:7605:: with SMTP id c5mr1788255lff.116.1598918003345;
        Mon, 31 Aug 2020 16:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598918003; cv=none;
        d=google.com; s=arc-20160816;
        b=MOgOHywK3hJevf1fMeqcZoTDJghiJHNeFMgI4hUbAs0KNMPHRYRY6cW5WykMdEVw7+
         jbU7GVgJzEbBeY6s4UqeWmRKQSWL+83Ihz+f0mNqC2fRBH8hGGE95xpa7YeOZL0SoLri
         frbL5WMb+od72/+jaJ5iHUduV1cqBdiS4GRt9dWv7zvj0IsZgkZIBGCjANa0+pUCBth/
         C9P+4eLL1I7jV1+o7b6HXaOO64xuKyBkqC+UjstYk8q+b9v5NZlbQwsFGWKMGA23DbuR
         IXeEhv3gWFXcq+aSFrHHFkjNGotxYBPHTpCOgiwQDXveux2I5FjqZI8uZZO3dNfACJDX
         upag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=Ru6sQYqbuUpEY6rTii33oF0CP4W1PwMGt3YufLPghSI=;
        b=OnfxhMS+3JNTpCwUxB8tuCjwiV0vEZhGhm7TkaYGTiijgcMTs5ssizH0lOfhzH07HC
         bDjWyDQ7Ts/EqHsmUQ7YG0Lqp72oqDzP4vlDy1nCGouX+uUDDYO4qT5qUs2uxsAgwJxN
         e675eF6hIlZDykjPV86cxKMMV98UR8Ank94huw12xYQ17e1SHI9NUAtgnZAf44dlAMP/
         rfbLPmPP+rOkJdyRqNaK1Pj1koihkgRmkajORgLk9r8Q0bQG2J8rHsbh5u+1dR6UYQdp
         OjjEaiOKOCo50TgqG7uKFH8XGEcmThgx7BwXGFEIm31sOfYSnslfGU68cnQo115KYVeO
         toxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a23si344853lji.7.2020.08.31.16.53.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VNrM8l021084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 01:53:22 +0200
Received: from [167.87.128.15] ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNrKhp007668;
	Tue, 1 Sep 2020 01:53:21 +0200
Subject: Re: [jh-images][PATCH 5/5] rpi-firmware: Switch to overlay-based RAM
 reservation to support all variants
From: Jan Kiszka <jan.kiszka@siemens.com>
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1598871229.git.jan.kiszka@siemens.com>
 <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
 <46dbf0c0-68a1-7a62-8cc2-13a5b95d449c@siemens.com>
 <CAGdCPwvhkChVGGkr-fe=Q4WYEr2f1tQ0+GSHDnKRpfWWsYSp1A@mail.gmail.com>
 <a01043f1-4db6-dd1b-6730-4c9ee9e309f7@siemens.com>
Message-ID: <ca0589ec-07b3-e577-1082-66d897022238@siemens.com>
Date: Tue, 1 Sep 2020 01:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a01043f1-4db6-dd1b-6730-4c9ee9e309f7@siemens.com>
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

On 01.09.20 00:44, Jan Kiszka wrote:
> On 31.08.20 23:47, Jakub Lu=C5=BEn=C3=BD wrote:
>> On Mon, 31 Aug 2020 at 12:55, Jan Kiszka <jan.kiszka@siemens.com
>> <mailto:jan.kiszka@siemens.com>> wrote:
>>
>>
>>     Jakub, could you help with validating this? I don't have RPi4 varian=
ts
>>     with 2 or 4 GB in reach ATM.
>>
>>
>> Verified with 2G, 4G and 8G board. Boots up, sees all the memory and
>> runs the non-root Linux cell fine. But I had to update the rpi-firmware
>=20
> Ah, also 8G - need to adjust the doc.
>=20
>> to the latest version (20200819). Without that, the boards were hanging
>> up waiting for /dev/mmcblk0p2 with some errors earlier in the log
>> (attached).=20
>=20
> Will update and validate also on the 1G version. I had such issues
> before, in fact, after updating the kernel - inside its stable series...
>=20

...and that is because the RPi kernel is downstream, and it's
dt-bindings are moving targets. As we pull the dtbs from the firmware
repo and not from the kernel build, we need to keep both in sync. Sigh.

We could more or less easily switch at least the main dtb to the kernel
build, but we would still risk to break the overlays. Maybe I will try
to align it all eventually, but for now the knowledge about the
dependency may already help on next update.

>>
>> By the way, for some reason the ivshmem-net is showing up as eth1 in the
>> -next build and thus is not being configured automatically.
>=20
> That was fine here. I specifically tested this path as it exposed the
> GICv2 bug in Jailhouse. Will double-check after updating the firmware.
>=20

RPi dropped the linux,pci-domain property from the physical pci host,
and that made our vpci config incompatible, moving it to an unexpected
domain. Fixed, please have a look at the v2 series I just sent.

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
jailhouse-dev/ca0589ec-07b3-e577-1082-66d897022238%40siemens.com.
