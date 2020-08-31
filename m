Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYP2WX5AKGQEJI42OSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDD25842D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 00:44:50 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id 3sf3764332wrm.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 15:44:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598913889; cv=pass;
        d=google.com; s=arc-20160816;
        b=QE6wzFMfAJkP5zwOuvflniaUmtRTj+tVwHamtvw+y2BZHJJBtr/9Y2tPwxHoXPTMRk
         f4aQjFJUyPTrta/dMaKp93GRChyXNArXUTPJi4xa/lPrLQLLiQc7EKYA1zszoDoP8VNT
         bla61F9tRPpvvcdE+b8pNlVILY3+UT8p1ENvHjh/t9hv/zK6MIhzDEpwUfJFxwBH5ERX
         ggaXkebm45CRq1MyK6te2o70xfoCNnIWYmK8rw5S3A5d6G9hmm0pkvuZ8bvLSTpsS9pQ
         UwA1HYkBrcvt4OJ7ScZOYMA+2t8c0bBB7TPMweuXYQR7ryW5fsJi60jsD8gnlF3rn3ae
         /BwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=E704u1P0PoecHPsu4I+SuDyvM0kBHudEQ30azGFzT4Y=;
        b=01JMXx/MA2H6+Xhm286kU/DH9MnOjUz9PwDGoJHycHZcWkLQ31p1p/Zg2cMJdDwMpt
         GjfZuv0o1vK2Tzmh+wYrPyDS8hPQSedwKzdIV06duXa8TVXbfZ8c3lvL8Em4toX9KB+Q
         Fdb9ToehV63sg5WrmfiYscDCyNJHvs8KhvnrmAW6ckUOpmH/fXl5KpDrZdsSBXxbomn3
         1ffeKvH/iol7uI4tKNGtPrpWNJVbbi8UuRM1L0BJxPzJQGTqSMM4GahzQXdywAHRiq5T
         /xk0I34KzQue69TtRO56HzU0svYxMHuk/ADjNb7eSimsydqM0qXEZaVIVjn7u+i0SXQQ
         730g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E704u1P0PoecHPsu4I+SuDyvM0kBHudEQ30azGFzT4Y=;
        b=g2K/mvbt9Y3wiFTTQMAo74/s4ShntmbtD85N320GGS1EZqZn014ycaNqxAwHJ/AMSg
         mlERUBXGNwqsI3AqCp2W9BxS8C0iHmdENwCTRPlMfPgwJb1BrfP6sxPehYmOnohibN5p
         uXxxf8iqZcYJfaydOboGFHvb4N9MqSyyVSi5aq6C+yA53VFu10n0dm/SeIT7YOqziETs
         YAfaUF6ohz+OWg50907IoIIl21jw3dPYWIdl2bvrSZhXgsP0pGVFk6uz2W33wN4giXeR
         Zrf9rQ67X3whhTNMEel04upijV8hMoma7WmhIMQtnCaMoBFQPfCm+zT/9eetVYbv0ZVy
         5lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=E704u1P0PoecHPsu4I+SuDyvM0kBHudEQ30azGFzT4Y=;
        b=rbXp6EH9TDxXyCDz9QQjgnNx2ePbhhlpu3IpiocsaVkee5Y6nOwl7L/7RJcgMbNByx
         y+btLrTHafbXvIpo/DJl21m8lNnWvskALVvm7aZNEaTXaeE1Pp/Lb3H0dwsyvmXTKihT
         gRh5uO1/QDv7Aae/pXTY7919OE0LeYO4H2aa/ujurRuvY6LGTFBL9Q9HRlfpJ6q3PPKq
         oiin83KJ1AZ1XtSYQAqk6lJq910JACiOP1dcA+UdUGiQM/Non+O5ZOModAZQOb5r4bup
         tvVuMxjOGyKPPqVk1MGsNNuQYNf8/Vq9pUK4E4iWqFBAWv1FQbrawtCT39OygoFV5LmG
         GdhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/XxH1w60WOG2ImchHsH+ql+b7V9jYoY95zgzMEcqrBUHw5EDa
	IEHlgPsSi2GkTa4g2S09i38=
X-Google-Smtp-Source: ABdhPJzkdygWImmVzb4/0eX7wuEDbT+CoWnksQGj5t6Fe5yVYEJRymlekJ8tDa2GzOxbjoV2f6VWzQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr1374310wmb.5.1598913889769;
        Mon, 31 Aug 2020 15:44:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls530251wrm.2.gmail; Mon, 31 Aug
 2020 15:44:48 -0700 (PDT)
X-Received: by 2002:adf:e989:: with SMTP id h9mr3825523wrm.38.1598913888854;
        Mon, 31 Aug 2020 15:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598913888; cv=none;
        d=google.com; s=arc-20160816;
        b=aoDYQ34o6p4XTqrN/FyMtp6wgmZhudKJdOOHvpaoB9cVEn2iOQcL7KYSkJHvVd5hUy
         vnen8oK5UmSGBFC7fiOjEeP6TDCuRN3cppiebcLH0PYI/qhdezYH1S5ul5n3+9kIt75L
         g/TTzGHVOEr2B4Uv5jl4PHy+0zvdx23U95/aTyts/QN+Gi1BCEpal8+5CTOjTRJ6i5PN
         jlLscWQla/ZZF+4jNAx34QuXH+GwGJApeNBc7dapn4FnWyGtqI1eFxtdhfVj+Y6ktnJg
         GKN3LljYii0acdw2/Cq11ZNZ9R/mmViXSQxcFp/recQX6CTXTgiVyUXzr/gcxe4u8K19
         TN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=z++/h/mnnp9g+51u67kBPsriqzhwq6Fzfx4JE/mCEBM=;
        b=n3KzD/ivvD+/KJFPo36eCsOkOxhc8HiMd/XOUGncXa46es2l2fajKoTyq+B95MOMSe
         IXBHxrXmZLZ3uIiFqJrtduPX7cb03mVVoTAXjqUSBx5kVYV5kPBCmvUbaCtr4rHMYGa3
         +c3cJkQZRhji6ciy9nvdTvTnUhZrL/j5ojOA1UoV5J276jFK9dxszYJACYN1v0TrKYpM
         ZlJFhebiChnliJQFoYfc5g3HaB/ehNfwf7Nz23zHfgTswnA4ClM6mVy6QJ88Blpawspr
         PxJSbofJn8h0skDFH8He0a6ZyzSlZ/XuppwrRN7S/qmn52lNk/7Gp/Ht75MPI1w5IaId
         lBDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i11si327374wra.3.2020.08.31.15.44.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VMimFG015700
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 00:44:48 +0200
Received: from [167.87.240.215] ([167.87.240.215])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VMilmd005058;
	Tue, 1 Sep 2020 00:44:48 +0200
Subject: Re: [jh-images][PATCH 5/5] rpi-firmware: Switch to overlay-based RAM
 reservation to support all variants
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1598871229.git.jan.kiszka@siemens.com>
 <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
 <46dbf0c0-68a1-7a62-8cc2-13a5b95d449c@siemens.com>
 <CAGdCPwvhkChVGGkr-fe=Q4WYEr2f1tQ0+GSHDnKRpfWWsYSp1A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a01043f1-4db6-dd1b-6730-4c9ee9e309f7@siemens.com>
Date: Tue, 1 Sep 2020 00:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwvhkChVGGkr-fe=Q4WYEr2f1tQ0+GSHDnKRpfWWsYSp1A@mail.gmail.com>
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

On 31.08.20 23:47, Jakub Lu=C5=BEn=C3=BD wrote:
> On Mon, 31 Aug 2020 at 12:55, Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>=20
>     Jakub, could you help with validating this? I don't have RPi4 variant=
s
>     with 2 or 4 GB in reach ATM.
>=20
>=20
> Verified with 2G, 4G and 8G board. Boots up, sees all the memory and
> runs the non-root Linux cell fine. But I had to update the rpi-firmware

Ah, also 8G - need to adjust the doc.

> to the latest version (20200819). Without that, the boards were hanging
> up waiting for /dev/mmcblk0p2 with some errors earlier in the log
> (attached).=20

Will update and validate also on the 1G version. I had such issues
before, in fact, after updating the kernel - inside its stable series...

>=20
> By the way, for some reason the ivshmem-net is showing up as eth1 in the
> -next build and thus is not being configured automatically.

That was fine here. I specifically tested this path as it exposed the
GICv2 bug in Jailhouse. Will double-check after updating the firmware.

Thanks,
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
jailhouse-dev/a01043f1-4db6-dd1b-6730-4c9ee9e309f7%40siemens.com.
