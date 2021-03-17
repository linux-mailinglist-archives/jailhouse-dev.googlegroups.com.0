Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB67KY2BAMGQEWPSUPRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99A33EAD3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 08:53:31 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id b6sf2645306wrq.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 00:53:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1615967611; cv=pass;
        d=google.com; s=arc-20160816;
        b=FscHdbLoXAXzJadXMZ/Fb4z5ojfMAJdfjSmwiqsW5iykc0muvj5DDIeqCtiwSrNj7m
         MrAFGCzr8cJL+d006nWPSQk/QifqkZax/nHZ6dL3rImYpmODwvFomNkG0naQa3IDPgei
         igEntK2bfUslibmuyTEobcZ4oHrO/cFfUc275CKeWAV1EPDYtLcNIsazh2cHEpvkQ6gb
         mbyh3chyVJfNV+MIwEPgKLOjlbnyLBhz9n+KRaIWs4/gLvSdfKUMSQFk68zQ7wdjiQUY
         iIwAqpkAx/DbwLw/gb8JmZ5pisF70/6g/O9AWGVNl6msAa43a8pgFSwafZnigLjHDkNz
         waFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Agax48VqEjjdjI37/B5wfuaO4t97a4wywbZ4ZvaYaeg=;
        b=oLPGQyqNMWkAZi54nE1zywVOXMTXcP8d3P8/4efd4KvG12M/JIl6p18n2fYrXJwVJ0
         Lm3XMPPia/EvhXwd8z4sL/cWpt0T486FCYqlvE2Ew/7lQkwZ04aRlWnQflq5dHZUFEwr
         PpLk+jX6K3NQK9WUO3CcTYvMz5RdRBzYPUFuNowDRaHzM9s/0K52qsAGZdrG30iAMEJW
         5qCtVaED3g3LWmNtmA5+RCRe8962LVfkZqCDOJvZmcdYJWe5RkOMgIbLyriBo3YzFqdg
         0tVguGSYpRzEuknSv6xk7Q8D56OttmQaDwB2avUqz30uMFaMa0rqpaFPfJ9PTrhXf9Ht
         S4Ow==
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
        bh=Agax48VqEjjdjI37/B5wfuaO4t97a4wywbZ4ZvaYaeg=;
        b=RyIEYbYByNvPIEbOzQfJ84OL3/aUmp1sK61CaxhGmDF3U2NsLgYR8Rd2yMzOv7pSHr
         b6fR2gg35ze4fw6fsLpTgWDUwc2JOvghEIqIt8YBU9lXSkgENTQtFaOMX2AMCtyotRzD
         qYc9znOLtgQMYJP657+lrCn/ZH2AaIK6gzjvJkMq1HxEHqmXXg5oN0ZcduBkEVXU+AyH
         ta0qixn77X8DkVx3Y1JyEPUa9b1RWSbDD8w/6UV5u10gGI5Peoq2CF7l/tLD3U4MGyDY
         WRcJWgvcGH4FxsUM1xRFFu5XiI3owvEcZpVeaiOPmWfQV7IlIxEgcNGxa/RhWnnQsZ3z
         UapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Agax48VqEjjdjI37/B5wfuaO4t97a4wywbZ4ZvaYaeg=;
        b=q92TxpVfFDH6ZVF8QDu0Opi6i2ASgoDKxiqu5DarCA8v15v+t+9dFwtBaGjcF+Dg96
         Wns4EL9r8vb/Ufg6wUTyOOVuPS4McDBcoNKGntJONiwMOWd6TPOSsHB7gZ7/ddSbHma6
         dmWoSzdm06x8h/yboNhZWogSnE8vRpCoypoMdKOQQA69pBUgGrm3H9Zpi9AQYy2zkoCc
         1/tW/kWGcltDPis9aQxREAEgkUIqGGlIXjMLnXRkEP73prIjlYBfjpUbqRx8t+BdHSo9
         YmunxZEERd1ctEYSxxbK6hnR72X5dLFqQu+gW2plsLUrXVBcKi8DoHTQZH0NnVzOS0y2
         jqmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339ADmTRACDiJ49RrCzt8Lj43KPxeoOgs9NBeiB8HFSaOP3YIvE
	tMeZhMZXZd0YATzWCPCsS4o=
X-Google-Smtp-Source: ABdhPJwRVEG5xDhgvaQYgMCn3lc6fRmv35EPEyIp6inBuS5a8/5TCJixy0VkVHFv4M2d4BCbsbNN+g==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr282522wrm.166.1615967611591;
        Wed, 17 Mar 2021 00:53:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls3548677wrb.1.gmail; Wed,
 17 Mar 2021 00:53:30 -0700 (PDT)
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr2840326wrw.289.1615967610665;
        Wed, 17 Mar 2021 00:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615967610; cv=none;
        d=google.com; s=arc-20160816;
        b=fY+zoya5TxBEitJDz822E1CRyO68YFfazC5VeUk76yYqD7AstSrpRElEq8K11ANDWv
         KtfMLs1W+zqleL9qpa7gBURLO1UXn42rIrvmjyanfSYHtHI35lSVBUY8vtdaEpdQTduV
         8hhfBw+ztYsneLo8Xy7fg61EoW66lH+4r2V38cXTDS64rH/sKBlfXQM8y7a7lx22J8qX
         SdnMaFV2zJCynOvmhfyOi8nNcB4KeFEasTQJDv6B/prWi1FTug+i9PNFOXMMi+YjUPvi
         yCJLYQfyyIO2MLsbI2zIys+RfqDT/7gjIFv7iWanwmpws64QUIbeUqXaLu3/L3D7hbh6
         HR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gMVrKmS42L22u2bX21Cj/46iv6W/hEP1SAiJqhkWUZM=;
        b=H/iTZNcnjSZffCDhPHJ3kx7962G5+KgQjySOvNTyVHYRAXB/cjjPHWFSUJr6QqRAJp
         t89DwxodLF/liSXCH2Ep79qLTujXHj6pZ6TQiEYBW6UttOuOwmUcrQdy+2pJRQpwJE43
         pUVTSLIWmQ2/1NBSwwLZ3cvTwmt9oOJu8SENhZuMf3BVVCrOJJ3kF8WCCrfvPz+8QNyS
         +3tf2iY4PftgxY8R5mZtF3uraGXxZhriPOmPmmuFOGz59D+j1FHJ5ROcBide/W1TSDSx
         /8ECSi0F05ulxJnkAc9EG8uWEAy6Q9dSoClQGCai2RAmiJR1cZVeooctM7SLaCD2ze4H
         WhNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h16si720557wrx.2.2021.03.17.00.53.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 00:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12H7rTFO009408
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Mar 2021 08:53:29 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12H7mTsO014108;
	Wed, 17 Mar 2021 08:48:29 +0100
Subject: Re: where can I get configuration document ?
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
Date: Wed, 17 Mar 2021 08:48:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
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

On 15.03.21 07:47, Smith li wrote:
> In=C2=A0
> https://github.com/siemens/jailhouse/blob/master/Documentation/configurat=
ion-format.md
> It only shows "To be written..." .
>=20
> I found how to write=C2=A0 right .c configuration is very important .
> For example , I want=C2=A0 add a new inmate,=C2=A0 =C2=A0a new inmate to =
run linux,=C2=A0 I
> don't know how to set the value in the document.
>=20
> The result is I can't=C2=A0 =C2=A0easily run a new=C2=A0 inmate.
> I think it's not good.
>=20
> Will=C2=A0 the document be written ?=C2=A0
> or=C2=A0
> Where=C2=A0 can=C2=A0 I found some=C2=A0 good tips=C2=A0 about=C2=A0 how =
to write a=C2=A0 right=C2=A0 .c=C2=A0
> configuration?
> Thanks very much!

Eventually, this document needs to be written, at least to describe the
binary format (which is expected to stay). The way we generate it right
now via C may change, though.

For the time being, have a look at existing configurations, in the main
tree as well as in jailhouse-images (depending on your target) and also
study the tutorial I gave a long time ago [1][2]. Some aspects have
changed since then but not essential concepts.

When details are unclear, ask questions here.

Jan

[1]
https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailh=
ouse-Tutorial.pdf
[2] https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b736e651-8add-7e49-f103-728173b0b751%40siemens.com.
