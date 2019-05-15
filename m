Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAEU6DTAKGQE3DQIM2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBE1F4B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 14:45:53 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id p14sf3703602edc.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 05:45:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557924352; cv=pass;
        d=google.com; s=arc-20160816;
        b=wlu7Jts6oQKDLYIEtp3qYFsrQvRB/J3qQoZ2oto1DK6OcCG/LHBOiUGVauFHuPXSnx
         3/X8DR1OpufNweHYNyMmxdvTGYhFqEL+IBWZYSDaLb+QqzuLGLRB0q94Q1Skths7/Ybc
         BUFn1XeJKk7MNotbmfJkbaHrUmrltd2uGwQvUwLkOT/dupyMw1dwQXWjEtydWUGYqQyE
         8DKuncEhEm4ClBaZtmgre0hn5MIjDgqHZUc9eIO2r6PXYQxZONN5wzVle9jhnFfhaoSf
         3NBvDSMICbalyelZ6QjOtkOkx0WUSZy+WEHBz+Mmd3N4hbsreqFixZxjEQRXn8cP86Ks
         XSUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=zOf/26r71yTwvo4P6XLP77i4TolU8zOFnrddk5fQymA=;
        b=l7MfSKZrvTPGHmc2rqMbf1KI8o6aqPNRqMnPVYShK//OjQUkP/AFY/MI9wy/J4Midq
         CGbierohhUc32ypv/McCD59KeAdCjDdznRezNIcJUeLh3yw5GwmyGnKu1fLVrd/2gJ73
         1Eb9z2gB0pP/IVl/yJCLvKw7Lsmq94jtXRBNtsxP09nRfnSDDtGG74eKC4uwDfqQmht3
         F++FHKO0ZsSPSl2avd2h/kHmbcYlRn5e62DdBIhnDICvZauQFlXgnUmOjPaxDLSqaQf/
         jbJx6eBqXxW3qM3s2QZvkQZvzBO5Sw4ZfRTINKmrbSgTRsCDBs1po+PfKrWov2TuorFN
         XgWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bVIemmit;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zOf/26r71yTwvo4P6XLP77i4TolU8zOFnrddk5fQymA=;
        b=bs3JABCy/ZJFsb5Eae9Za1bITiRQxQJYSeMGZOvDwVIEIps3zDFJU8W4hGl3ujJlFO
         sDPoNoSpPPvMONk8t/5+ow98VYL5Qv8LKRNvg5nlGoLD9cwEAOZ03lIqwTYqM89YHQof
         naHUpAeqcExk0iGxZo0e42iVUiXJTUEUrwY0R9h9iw4lEXXGDNECEtGzVwb93LGj/bQH
         VJCwpI7HTN82Qq8O3nFd9eP8sMLA9ayW1ZUoIbE2CVvxBofL6xixphhpq5+3mKC3bblL
         g1CFKmkTTtZpoD3OEA7A1Ui6oMCg9oUIc12rNis11hDxPiTX4BxXXrTxbNYX7vfmExID
         7iZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zOf/26r71yTwvo4P6XLP77i4TolU8zOFnrddk5fQymA=;
        b=B27WBCdWnV28ZFapP+TLa3TIEjskPyeZ6BeOKzPhmhiiuIEA+ZzVOHPJ9kHT86W3XO
         +t3SRB2LhJ/mPrHZFz210ZU6CX2uQi3+QdBxLayZPPp3h4+6dWogmrm3YvgvmaLsPdTI
         yT5Wo2rO3bxh9qM+EEgmShhoGrfGkn1QERUvvkF4UlEhqYbtxj5nMi43DMStEBnDWKq1
         0tWR0TAQj5rmDMkCanR9gfA83ftqcQNAZEHe5+Ud74uEDEutdq8zkotKXJjSN/urt26I
         O0XKzz6YqVJ9oP7l+rLtBPIhs2krf/+sDBtUr3/ShTNGnvO0UT4xnf0+yMKZP25F2JDX
         YcDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRqSjDDFTD17s/AJXV80699/JMD2RxmfcOiuGzAv1okC8f+4ww
	v8PKbiTcj/Q3zLV9uZqH+bc=
X-Google-Smtp-Source: APXvYqzPzlyJ0yxG4fyzT5RtwQiDn2nTAb8lE2ukOLV64g2pyqZfF/Q1Xz7lFbZeA1VlQhH/EWQRBA==
X-Received: by 2002:a50:885b:: with SMTP id c27mr42761806edc.155.1557924352828;
        Wed, 15 May 2019 05:45:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:443:: with SMTP id e3ls519173eja.0.gmail; Wed, 15
 May 2019 05:45:52 -0700 (PDT)
X-Received: by 2002:a17:907:20ed:: with SMTP id rh13mr14332193ejb.5.1557924352336;
        Wed, 15 May 2019 05:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557924352; cv=none;
        d=google.com; s=arc-20160816;
        b=eZIHLJq7W9TV31J3Nzf12prOswjas8CPhFkOvh3IzYS70TuRy6DjZDZu3TkQhRAKJ9
         Cicu1zTNeSJrG8UPTMF8CwkYNX7XGDEAj9fBrjqYsz1MLKJWWKhtt9I6JWXeng1xDiOR
         xBTsyc+zJLkss/rIpVfmx75IcR0NnoAdjR/idXmXFKk1bUWXzHOSaL3pB8hxR3s2QJjw
         qJB40+2AZ34py3M2kraUUoWbnF0SR1jO9olXIjjzG6IrsHU0fm6J1P3MzHXg6/kveUsy
         0+O3/odb3B8xgTiw+T0bdfst7U5H2T9F46qdmvE6Gh+zqBsk70q5oykHeElI+/0dsAaH
         U6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=IRA3FWVz+ggsXxaytHhETP8U1QE6rHS9ZSeHiJyc9tM=;
        b=Zr15jd8Eu792wbdBt/UkU//axc/rltOlsEBv1RIgqYnOI7EoXusJJzKlyXOtrILnZe
         v2bL/z7xfJjHWOG4U5Yi087lgRtPjKbsYc6A1+CPhaNXWAdcAuG4/BM4DaGGUaZfekBQ
         uQGi8seqm7WMI1SiGehbt4e66x1R8W9fIIDr9v2we7uZV4FhCfhgPbua6cbAx2jakYSN
         LJ80SjrtM8AxZo8vp+x17umI4UsoT99N4ilBTrd7sL6wRQPzMyWLqVJo0MpItLi1XNB5
         CT1GeZ/5JnD6EVa3bk1W4vKhIDu+QRpVv3VhYhw+aLzayqw8pT6duhBTtF0vp0nweTpF
         MwKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bVIemmit;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id k38si394612edd.2.2019.05.15.05.45.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 05:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 453vRg5zmczyMb;
	Wed, 15 May 2019 14:45:51 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 May
 2019 14:45:51 +0200
Subject: Re: [PATCH 0/5] inmates: x86: Add exception handling and refactor
 interrupt path
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <cover.1557914551.git.jan.kiszka@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <5f9bade2-d91e-0956-c605-9716a731a5e6@oth-regensburg.de>
Date: Wed, 15 May 2019 14:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bVIemmit;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 5/15/19 12:02 PM, Jan Kiszka wrote:
> See patches for details. May conflict with your SSE work, Ralf.

yes, it does, but nothing painful. Already had a similar patch like 1/5
in the queue.

But thanks for the patches, they're probably pretty helpful for many
cases. Useful infrastructure.

Thanks
  Ralf

> 
> Jan
> 
> 
> CC: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Jan Kiszka (5):
>   configs: x86: Make Comm Region writable in all configs
>   inmates: x86: Register IDT during setup
>   inmates: x86: Refactor interrupt handler
>   inmates: x86: Add 32-bit interrupt support
>   inmates: x86: Catch and report exceptions
> 
>  configs/x86/e1000-demo.c         |   3 +-
>  configs/x86/ioapic-demo.c        |   3 +-
>  configs/x86/ivshmem-demo.c       |   3 +-
>  configs/x86/linux-x86-demo.c     |   3 +-
>  configs/x86/pci-demo.c           |   3 +-
>  configs/x86/smp-demo.c           |   3 +-
>  configs/x86/tiny-demo.c          |   3 +-
>  inmates/lib/x86/Makefile         |   4 +-
>  inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
>  inmates/lib/x86/include/inmate.h |   6 ++
>  inmates/lib/x86/int.c            |  97 ++++++++++++-----------
>  inmates/lib/x86/setup.c          |  12 +++
>  12 files changed, 250 insertions(+), 55 deletions(-)
>  create mode 100644 inmates/lib/x86/excp.c
> 
> --
> 2.16.4
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5f9bade2-d91e-0956-c605-9716a731a5e6%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
