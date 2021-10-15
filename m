Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCURU2FQMGQE3KPUT3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88842F47A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 15 Oct 2021 15:56:26 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id v10-20020a1cf70a000000b00318203a6bd1sf868256wmh.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 15 Oct 2021 06:56:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634306186; cv=pass;
        d=google.com; s=arc-20160816;
        b=LAx1xDy0k+hUcgRRnW3bxRcb9jE/9r6u/Tg2ZfDYe1inMgzroEqzO3K0dD2WLrvZBY
         oyyg9Lh1czSkOkwrhu/O/mCAuDWzIIW2K2JMcv9OZ9j5+Q+6ndoLRMT9rJ5+1uP/SMb7
         iE7Mbc6ZcRVefwgIBgpoRZtZru4VXKUXTNi8Bdz5vgMywSGCyzeWXLEsPXtWHpCc17mk
         FOi6gmBblJFRcGBv98APPF9dHZ26qf8JxvsyZKwTQYy3OnZp45ehQuDLXvANNLv5TmVH
         ffTi4gRkQMmt9yEm7XWJIjtRBDOOzk+ZQ9H5i9/0lzRUnJpoR7MBFY7kNOAB8kliz5Hr
         i4rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4Zmw0jLvFQeXnHM+VDmounaJ16PSXQSEoYtZIWNxRWo=;
        b=Q01Mvqp3G62gQrFtBDsFfOOLvXGpl/xEpXYHKMFHJZWacbNjb1EnDqOPFKASszZETo
         9zF+mp5XYVUdefQcq0QQgcX1jvwp3cllxxiQ43BPhlN8nQviL8+n2Ix32ivX7rIA6+KJ
         DrMoniKNdlQ9rYj2SH/oy3qcGTYAK9Hi5ULXXxz1J5xnI8cOhVDR+ZXRa5TsHA9n8bN4
         QR3RTJWKsH3fo320OEBJfiev7plmnrcM0Njbc4wyElzuGyf5Iww7t29y+loTJi5YmpIY
         7oySWbPtgP2r1c1Lv9xbgyRXThjEwO9C6PkOIR5owz4xDN41WNBp+EKPGQMMuUTJZLMt
         VZvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zmw0jLvFQeXnHM+VDmounaJ16PSXQSEoYtZIWNxRWo=;
        b=rKO6UtHWNtfrOaT9sbRhNl5gLGnC1JQNtmN3iQY+8QQcdMFPpNFflw2iHQAxmLgnrh
         HklNKV3OhKcnv7/mdbYydrTLGQQV3DIkHjgogKn2uQ9rSp0fbH4EvE8A7eIMp84/hINv
         fhz5lEygqN7pV/qQHYvcotrLLVUCSwv13d2aYDf4RXbFYB4udtRuVUU1G5LOJzbzkRNp
         W4Jf6Ja6D/tDACIBPyaRlSIU8FLs0Oh2HWP6vPWgqZJ8QTVdczdsXu6bXhaowQwvEh6s
         MyB4A1ot2rkktDPO4MU1dvY9uyQFRvAkZVrwhGFY8jzDX6pX43LCL/W3Vm6RJ//4rsiV
         Un1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zmw0jLvFQeXnHM+VDmounaJ16PSXQSEoYtZIWNxRWo=;
        b=BVewjsRJYLn9V/ZMsv9a/utwbpYip65Bej70HGCZZjxYwLAm8i/ThlAgwIUvKrRtVK
         HYrOjcFLDC6Et9mW+k7t2bYkJKV0yqRdSMVsVUitVoSWC6+TRPVkm6SgnO1bz061pI//
         sskDaN9G+eeJu63oJ/AZuCj5ExeHFCmOsrlcrAm3k8gqYBPHNhW0eGS1lNj16M1gSvE0
         8x4IilVZYjSEpiFnTrXH2k1LpR2MZUYUMEyIGZ5h+A3ga/CEnkH3nuJ7HbXOq+13r83X
         HNlKbxw2pq6PCEAWt2wGv2MBJcdrR+gb94DnA5hJe5oEgl24CqDoFjsPjBGUR+Y07Wv9
         6j+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533t1e2th6GMYC63KfEmRxdiycjn9lBxzme14od83NgrhJLypzmU
	3bfNBdL61TMSUb9XFm2RKow=
X-Google-Smtp-Source: ABdhPJzopS4pLSnwo1wSHv3gC5/hP8SJ1vbAfxwSWQ8occ4UwQN32d9FRn8vDW6DWEL/J4KqIk7NyQ==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr5727922wrq.309.1634306186670;
        Fri, 15 Oct 2021 06:56:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4ed1:: with SMTP id g17ls6324330wmq.1.canary-gmail;
 Fri, 15 Oct 2021 06:56:25 -0700 (PDT)
X-Received: by 2002:a1c:a558:: with SMTP id o85mr12922397wme.110.1634306185437;
        Fri, 15 Oct 2021 06:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634306185; cv=none;
        d=google.com; s=arc-20160816;
        b=0/abO7X9klmVl5ChWaVG65ZxGb58IGkAe/pRtj+YgcoVPJsnR5Nox7DfZhwR7LkSIe
         0yagURx/VrFHmfRFy5Ab3Goa8Isv3kV3++GGKZkUqORept2QMUsQXNlI2HC+oKh346lW
         JTEHAju1JKXcpMVrQjOf2Y8D95ef6wxa1IXXYGsH4vxl53P5343O8elE9gKLNszhcK/I
         eGtXN5+aW96saS6xMLjHjviMV/pn9Huz8OD5yKJmXFU22xqi309y2eUbidEO4wpTuzmv
         4uldgUOU/Qtns5X8767V2izAVLmOXcfgnpRyc+PXQ+UTVtUYZ5LiIO7QGu2C+IopZYDY
         cxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1/nnAFE4TexPmyG3VCpM6akciyNB22GtMb3kEpGHr74=;
        b=LVdBtxrPzA1AevLSUoR+zrCt08R+RdWdQnnb1PoJ+FWWiZwHAwuUzik7CxgIMF9+dN
         iM8UvB72Ec7gNxtsqtva4fr3sibW6cnZpdJXMX3WGBDBTBOyKsSFDI0fTfwzuP+MMDp6
         IgxEwdHS8mDEC2Ed/iFROTyIOR50cyJjPIamrDYWuyUNobnJazMrmNXBW/foqAFNP/mV
         LVoLqjqBpFW7H6EGmx+Vg4jhAMtgWZKMQHFeGaI8LTHnIYGGRffC8yZeJSHpHGefERrg
         KdJwO6nK9dP9rjfKx8wWHLU/TgH2OTEutVLkddeBLUg4FizZWZ4Oy7i0eFQP12yezSmS
         mhOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a11si296804wrh.5.2021.10.15.06.56.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Oct 2021 06:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 19FDuOVZ001046
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Oct 2021 15:56:24 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19FDuNjv023531;
	Fri, 15 Oct 2021 15:56:24 +0200
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
To: Changming Huang <huangcm.huang@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
Date: Fri, 15 Oct 2021 15:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 15.10.21 14:25, Changming Huang wrote:
> hi, guys,
> I have=C2=A0 Arm64 platform (GIC-V3 is used) which integrates one real PC=
Ie
> network device.
> This PCIe network device just supports MSI-X, and it works fine in
> root-cell Linux.
> I want to enable this PCIe network device in cell (cell runs Linux, too).
> I can disable this PCIe device in root-cell by removing its node in DTS
> file.
> I added the PCIe network device node into cell DTS (like root-cell DTS)
> But I got the error "MSIX alloc failed" during booting cell Linux.
> Appreciate for the clue for this issue!
>=20
> I checked the jailhouse source and document, and I didn't find the
> description about the real PCIe device with MSI-X.
>=20

MSI-X is tricky on ARM. The complete IRQ path, as it is also taken on
the root cell, needs to be available in the non-root cell. By default,
Jailhouse only manages GICD sharing. How are MSI-X vectors translated
into interrupt numbers normally on your platform?

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
jailhouse-dev/e282cac2-2939-b868-afef-7b266b251e50%40siemens.com.
