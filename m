Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT6CYT5AKGQEVWBK5HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7381625C7BE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 19:01:04 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c3sf1557197edm.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 10:01:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599152464; cv=pass;
        d=google.com; s=arc-20160816;
        b=jg3RWclDBs4FhWKNFe9JhoRQ0IVYCcM+AlLDvJWSzfechEkYTkQFhlBi+xKEKSAQRD
         N8UkePEMkS7rSUzvJ4JvAsPhvW2ffjhEMTfNyXkcI4lf4HIofVeTvtm9YIEzsDAeXMGy
         aVIVVqMhdJczN9MS8LAop27yX02oCeUB5u1zIYV0lV1Nyne3P9h7aNb3pXqcZgdGFEPD
         IGqRdYQLDKj41YkPXnn0lFw1D54EpbdtCjXWAPcHvoeEv5vDEdZuc0599p7aHt/k/Aub
         kd6bkE2fjI8gMlu6hEJ8FjM795wnRsVUQvDhk81GYL2RZbRqh3UIzbzHzymCa2bgb8fM
         qcgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=PhO4oBHjgbCNBcN5b9toUk858lS4XHj6q+g+98FNgKw=;
        b=xyIdqpCiaKi7jGGqKXBXRKDC9Q8E/kQaA2hHh9u7pl7NqC3gjMQZAGMcGzyaxFFcGX
         /XuwFfj/QvMhtsbJ82pQWLufhWw3eoJ9S8ZuQtQWgaCM71PpIL6wkALVFuuv+MjgL8x0
         GdljWJkGyQuR0Xx9IkH7XtKEcil2nnc+nBAZbAMmLAbkJZgYinudmauLsukcgTKuO3Lr
         tjg1Wav0mP3w84+SGsGq61oRNpdL8fPIVzltHihgO+omA4KBN3/adzA54T1MDxHmot7s
         Ydg5rcBz8kGhqCsP0w+cVJGs4wYaokPqc2yYk3GLN9fy34kqtVaXxDIvtyKQ+rki8XZi
         2VVw==
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
        bh=PhO4oBHjgbCNBcN5b9toUk858lS4XHj6q+g+98FNgKw=;
        b=avnAOshOm7ecwAg6gxtCNl7dOCRiPzoT85gTwiQoWE+Eob2v5wiQ/769+lDUsGUtkR
         JOaY4wnoZ43/lRwAgOgPrFN4VE4/NSrgrYzUW5wlmrj0uSVyaJTBse9G/q+GqKFrQi7M
         ky/alyikN4IEhjq+rq2aPvfwKtunNOvALf5v8g3xd/oMFy7XzLWGuSX7A4M2zjsPJz0c
         Iu3b4xmj+BUCy2Ylq1xsfxFKgMVmSn5PFjoHiVbCB+EFKOY85asWPYlhb6qP6WtHPSJf
         /2+w+Lw+NhWZnaRBTOGV6jy06ThX/nLGtnavBafRRWxP6VkDOenjXEINWndljX9PJt/p
         siTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PhO4oBHjgbCNBcN5b9toUk858lS4XHj6q+g+98FNgKw=;
        b=LZMjnTXCg0koPECIiJvY5XYzLXH3kZ04T7CnYPk/zACbsyPUZ3a6e73WJL82itedZs
         rUyZwO3r6QXYBPBSPIw9EdsIajl9YFZW92fpaD5GFeem9e2TkWY3vMf/Mp9Wlv1J38he
         yBqx/Aq+qmwwSR/Ha9dVcK5q/f7ANBfrM7rs6pGDRvu4uctOC2GoJ5Azn3+elR9cMFxm
         0yYUD4+G3JHuL7MeOqPfGefOfZ/DTSDFXCfcAEewz1sdPbBol8rmbzkb/3Jhk/eE/YM/
         4GFfPnw+vJWynIb1V3R99miwXBUgMf7ElFo333HaPXb5HdRhfqcDF2UAnARAwppe3Mu5
         6qyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333fLfVYM54hmz7He8MZgQ9Lk8bLGREviw+cYhyhY6l0K9pZx2u
	jjR9igsq45pxTDKjnuqYv7Q=
X-Google-Smtp-Source: ABdhPJwr0bOCgrbbJLZszQAP0wPofMFqBZ+0yYitDA1r4+HDJ8ZfEd06OPAJam3eWh+qEQCQH4EEIA==
X-Received: by 2002:a17:906:a441:: with SMTP id cb1mr3152715ejb.495.1599152464179;
        Thu, 03 Sep 2020 10:01:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7211:: with SMTP id dr17ls3245342ejc.4.gmail; Thu,
 03 Sep 2020 10:01:03 -0700 (PDT)
X-Received: by 2002:a17:906:5452:: with SMTP id d18mr3247603ejp.163.1599152463281;
        Thu, 03 Sep 2020 10:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599152463; cv=none;
        d=google.com; s=arc-20160816;
        b=ZR7KeAB/RO1sOtaVToYPxzv/VNGC+h3U7nbVcYmxLCnsVrwXbj3Wqo09moaqDuCZ/v
         LOuLQEN2zVQiZiQpb3bisPFZIUFZoT9nHvu2vTF4+CN70308Fd2nzmXJpEqnGQgI6qCE
         40al3p2bgNhAGR8zYucB0JCyK032crDVNl0si+JC6/F64YMcYcCAy3Q9zrLY6JQMh3QI
         2cDrOGOIzy279y1NFBrRuIF3Q/w/tI+62GGK+biY1IaRqhi3ChxV5fs8cEDRN0Jjz++r
         IQvkH5485u9OR9FUpRq2VTBO79p+R2t8nTcpTZ9/c7k7cOnJUYnEaKiXDlCQ8TfFYR7w
         dWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lJQt1zmSIEG+2CTXqJEORwZvcA69ATbkj+OxTXe9N3s=;
        b=ON3qaOJqGZK7R/gxyW5zKEyVjmQ4R7KaC7+GD4KMDcBQXb9dJ92we6dvdOeeR0j5rR
         XZKHp8IMzwkA+Bk3OIn8pTVpTxGtQk/KkdKCKRUMQNmvYdmA5ViC4HM2Ai5S3AkGvhZG
         eXohDEW3nxMsyVJZXNIVI4OAazkvgX4zbRo11UISzI234hYaQhlIvm51BXp8QraVdApE
         LiT8AOI3Yvpp4xiOO08QujUNzX4jLdyniRbQRDIzkct+FUT6EKFWNH5UQ38gR6qZahE8
         QLPzmU6F3SqZijcSJyTbkCh4tUNCPeIAuJG61ufiyXOiFUr+QmPsHEsylNQjguT9IhSB
         8EBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a16si152075ejk.1.2020.09.03.10.01.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 10:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 083H121q001491
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2020 19:01:02 +0200
Received: from [167.87.249.163] ([167.87.249.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 083H11uL032521;
	Thu, 3 Sep 2020 19:01:01 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
Date: Thu, 3 Sep 2020 19:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
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

On 03.09.20 15:07, Jan-Marc Stranz wrote:
> Hi Jan!
>=20
> I've moved to another target with "Intel Core i7-8559U".
> This CPU supports "VT-x" and "VT-d".
>=20
> Doing a hardware check I get the following messages:
>=20
> Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Availability
> ------------------------------=C2=A0 ------------------
> Number of CPUs > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ok
> Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok
> Traceback (most recent call last):
> =C2=A0 File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, =
in
> <module>
> =C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioap=
ics, dmar_regions)
> =C2=A0 File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 377, in parse_dmar
> =C2=A0=C2=A0=C2=A0 raise RuntimeError('DMAR region size cannot be identif=
ied.\n'
> RuntimeError: DMAR region size cannot be identified.
> Target Linux must run with Intel IOMMU enabled.
>=20
> I'm using Linux Kernel 5.4.61 with the patches and config options from
> "jailhouse.cfg".
>=20
> The kernel command line contains "intel_iommu=3Doff" (as specified under
> "Software requirements" at https://github.com/siemens/jailhouse).
> I've also tried "intel_iommu=3Don" but without success.
>=20
> What is the reason for this again?

I could be that your kernel does not support what is needed to check the
hardware. It may still be fine to run Jailhouse. Do not invest too much
into the checker - or use a regular distro kernel for the check (which
may also partially fail these days due to CONFIG_STRICT_DEVMEM).

> It's very difficult (at least for me) to get jailhouse up and running.

Focus on the configuration, not the checking. In fact, the checker has a
decreasing value because (x86) hardware shipped in 2020 has all features
we need, practically always.

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
jailhouse-dev/dd5c252f-516e-3758-917f-a0cd5ca0f4c4%40siemens.com.
