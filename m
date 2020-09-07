Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTFG3D5AKGQEOU2KEQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC325F8FB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 13:02:36 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id g6sf5604893wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 04:02:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599476556; cv=pass;
        d=google.com; s=arc-20160816;
        b=qlI9Sn3dATVMzSBQFYSodd7TaS/s+MZeTbj/U6uZPGfC0NrL4tr3CfWDHqtDToLFPw
         U/WwmYlqTo3v17SXTWwSy+4A6vMIfZtPYesgbiLV5GbBfHgMbpyfQX00UUHYkOpcWFHP
         KP2CDTtmSPQc/m+95Xxy2w4YTUXP1Nfh5mt+YarrK/6S7JTd4+hUnS+NGkcNiL/VJUN1
         MDCCSR3ot7ezvpuFjNl97qOTAD4nqI9rk7F7zSNoU3FOK1n+sHibLphp5ejHr7bHHUYp
         h/uffCDej30FZtoWv/Stb9c9qThLkearoZpD3JdLpT3vFN4rNn3NznOMmXJPrgWEy8PG
         dlVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=c8hlqS1FAqLMK012Bu3LGsgCRTjpjGXDemhFFKshU58=;
        b=SbMgdNiyiIWHST9zOtW9ORczQVFe8jvZ63mioYhfesr7vmjfdTu2sa8tYG2BjKFBMV
         PkdOm0a++LYiRTDNEzJtiu/hPc4RAfs/oUdiN0WKKt1TYnwRh6Mx0zk6Uch87Fq7NbZP
         wvzqx7AbWoctj8WTv4nii53dZnVjDnUI3AAP4o0Qh+fW8fiJf0zPU/1XogEKJDnct0Sx
         b4CKUjD5vryoyqdslsQfdhBvTDxM+2YXh9uGA7bOO5t6L3Gqt5a2jcenFV7pK8jh9iKR
         k3NCXrzmC8eGDtWifDKvbwdbRyPZDXRpAH/qxyeMZqTiffdr5pD8jX/Ea+DSlzpjNBAY
         X6/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c8hlqS1FAqLMK012Bu3LGsgCRTjpjGXDemhFFKshU58=;
        b=Y3ZjcdE1CAsGjiXPi5/5hvNRqxPHraCD5qvdAYB/JLApcQwGeiFl5rE8kert3ou/Rl
         ODQrUl3liPpa0Ci+KISX9T1UBBRrPiSIXkDdLT0M/fmQf8My0dZZJp7nPXvCcNdKvOs6
         blkNKXfSBhs4JUrKWJYrIym/w/68mWH1P3XyZld7AUnLhSAwrYAAhsxWoytYiJKOk9S4
         ORyrkjUiTWbg7pvAK2j5yC8a0EA2RehZNrsIlt6bvoqjBVveQkszz7G5kIJ7oXQMCuOx
         CtZT6v9n3EMVK1eL7xfvbW7POwoMPtj/MkEQ/CQSuSg23YKzqHi4fo7upUpQ+h/zeJXB
         flHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c8hlqS1FAqLMK012Bu3LGsgCRTjpjGXDemhFFKshU58=;
        b=SY5YFEvMHr0UcrXrA/2ABb7vPMX/CQVYyew0WL2n+usWnobJkZMd0rujzcGQp1yHNm
         E26nZ0QqetsPz02M/y+7nXxAZtbLfD+aKCg9dpVr4PL6Q/4SHbT0T9qipn8y52bCRzG1
         yenG79KOLG+tBgp+C7VT8ij9U5IQAsdJD6vWzc8h2hjWZQI3L7Ek2b+ioTjau29qkIdz
         vmk5qS1+BLUBezqXqNcP0Z1iP76AdgPHAfEXgSkEgf5w7jYe9ZXuZZVzZm0eOPtvTb4+
         rxXKPCJdzlJGkV4WU+2eANgnP30bd2J6giHllrUfRcG6kvWuN4FjNKLV7IZwsMyhg0W0
         S8nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Pq/6I3KtB4WLIPVhY+A8wI8D+VAxe71oWVpzlVxzXGTZ/vziW
	QBqrhz1cEwBDwYW0Jw/VjHs=
X-Google-Smtp-Source: ABdhPJy3NLxK1HgQejSsGv3BailxF9Oc9Sm5LwkZBxJCmnL428IknPooV7uvBU6V4VRS7XOJeZrg2w==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr21837655wrj.92.1599476556367;
        Mon, 07 Sep 2020 04:02:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls9417073wrm.1.gmail; Mon, 07 Sep
 2020 04:02:35 -0700 (PDT)
X-Received: by 2002:adf:82d5:: with SMTP id 79mr17060602wrc.60.1599476555604;
        Mon, 07 Sep 2020 04:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599476555; cv=none;
        d=google.com; s=arc-20160816;
        b=gx0ZDoqY+r+07thw+8VUHcY7T+SkpJ3bGGuUPKrjIIKAiSwPiTh7Hzc59J40O82h7b
         LQqjVe/xGZXvMUfMFK+TCTUuYxe78HMe2xkmBNU6wNfMQJr8qy0N5E/qA+gZeR6BxKaS
         rC1ZxhdstxokXRk6Y03892wGZJYIhBbb5AlMfGXswLtjpLBMOwW0HZUk9qSQnbrbJ/TG
         IReOjMyB1lZT4aGiE5lOi9nFkLtfiqbDXtREohS1g7ZAzAGr6BvLqy8jtzUVEcuvLXJp
         RYFA4Ho6paQ+EJNguaWkLctuwa9Kv5ujbP8Q6+0I8kkTLEHB2S4YiJZidqE9XNcsk7iL
         WG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GFni3l3+rPxIbz/tJCrfxP7AP6Y+WFlpx1HRHMIIa/c=;
        b=Bzg8Lx4sRaPQyFEYCgV6zZP1kxhtIKtpBzWblBLFf5zfz4R+uwASKUfW6vNQABZ/Ja
         Vhe/LWVEtzT3sFfnoaw0cxks6+2NJ7EHHKIwgcecjUebKjv6Yw94lwrQL7Nifd+vBnaJ
         bJTUelg3USBjKfNicmHIB1kJoNF86aLfe40fSGyZyqAGlEGZUXnISaunbL7oCVLVcfcf
         6Y2Z/RrrhwRlk2zusU57NmJwNiR4wA2WPAzG5P32uTe0uQPCeHeghno2/LHucVg3uZQz
         XbFcW5QA/6er38scPOkQaSxLCHS4sPtWoHXuxiE38y9v6VbWbl6Qohm4WfEfprhsGn87
         nhOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d19si54825wmd.0.2020.09.07.04.02.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 04:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087B2YsO031119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Sep 2020 13:02:34 +0200
Received: from [167.87.17.27] ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087B2YBf032344;
	Mon, 7 Sep 2020 13:02:34 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
Date: Mon, 7 Sep 2020 13:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 07.09.20 12:51, Jan-Marc Stranz wrote:
> Running
>=20
> # python
>>>> from mako.template import Template
>=20
> I get a lot of traceback messages.
> The last message is "ModuleNotFoundError: not module named 'json'".
> This message comes from
> "/usr/lib/python3.7/site-packages/mako/compat.py" (line 140: "import
> json=C2=A0 # noqa").
>=20

The python-mako package is likely missing a dependency, or it was not
properly converted to python3. Yocto bug.

Note also that warrior is a bit old. Maybe you do not have the latest
2.7.4, or maybe this was never fixed in that series.

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
jailhouse-dev/0e52381f-15b2-e833-7717-6335ddcc5f35%40siemens.com.
