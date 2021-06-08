Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBREY7WCQMGQEZQGRRDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46B39F452
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 12:53:57 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id p42-20020a056a000a2ab02902f33d81f23fsf17613pfh.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 03:53:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623149636; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y3wIG0brnXf0S4zdfudr1dr3l42+f/HMTZev+cotRqh0XoPsMbcP1HariSg0XsBw9t
         q1Cc4SelR4fkmfphYiLYGnmTBKYEpHTpq0D6fzGT0GX3TZZBUgk1TwWqaWDU0BjS9M6x
         bXf/7O9Bb3qnR2/h6LkLEUosRLqmo1bddRV3e0AHh5VWt8GS4fd1qoM8OlLnkJBAtMLC
         m3Ahq/7I/kz4eNd/YV+NeUe1WKW13RlorOoT5fZDIYo3ZJ6rYzAu4NNBbumjDIRB8jgg
         fJsayV8+Q1ivHcpoV4lPmHf2K5nNTnMHFClQQg1BLUP2tRjQU0F29SSA63JO+chygamn
         i1cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=yflfVYOYSQtbrJcjSERHiNwN7nojRhz59Lt7V4r+RoA=;
        b=oxQwJMpupfVoLz4L6yTV99DYfNfK3+8Ztg3B7Ewy1d/pX37O7E29xXgQUy4Ls7j57R
         k2U5R2Avh015koAYMCTeQ5USplITBOYfSX19u6kGAwNiNJJgxKqC81lHR3PmrOlMgsQ4
         pL30dsXkWMz9ca6WQ7sDGs4Pk7nyn/omVuIsnzsXF/xav/2QYTl7WPXx0VT3tMbb5xl4
         nz062MMko2DyqqdTwDLt3uvy+zHu4D2t6DqKozwaJxlXvuY7FCscfoZrC2NjFhLiCGGt
         6tRcE6JB8E6oHBCcSUYnZKKfSAk1JVn7xp/FgngIzGhnUc46lHsDI2m7Bcin85feYudO
         8K6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yflfVYOYSQtbrJcjSERHiNwN7nojRhz59Lt7V4r+RoA=;
        b=nNMs3zU3I2zgYZqV7K/CdE+97o6yR6+/lF2ud23idc0VyQSBanAr1sTfokNRxY628T
         TO315fVt5Df3A5r3I0ifA79nFet8tE3TDTF2jMHmXzy2qUIFuMxwFhn2oy+pCyhogkeQ
         rOPjTNM62ZhRFDOy4WhWS5bOLUV2pf/6jNyH77T+68ZGthQN+6YH6EfCojuPZnlrOj7R
         gypk7I8GzqAs1Cl3GJH/n34j9vZQ+VvQIMDYD9tMcj8xAEqgUZGyTfwydjo/fUTi0ksm
         I7n5J00OdKaCDj40UCtn/d+uobBMlGhAtmjy31w6pXSSdOG0iVI5vcVKjD6wZtfa0Qpd
         8c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yflfVYOYSQtbrJcjSERHiNwN7nojRhz59Lt7V4r+RoA=;
        b=e51UnlxJEf26sW9tlT7/Zp/JC0WuQ2H03KSTnou96GWXTIzN3vicB8KgLK3+7nAg3S
         oozaH5TSTxQDa9/VTVwU7sifsuTzFAzjtyngLY2XJdGa5ssaNtfG+36AsvHGrOwrzp4m
         Vs2H9rEDjpXVMJTV+2CoLO1zi1D7Nltsa+z8f353ZPCYE8+uyIf1oM3iOj+d1ZQzxeig
         D2PvJDX7AiUmIBuFEd59ZGuZU47/utRqeXrgu5XgCa4BSziujaV07WrtTaJtsHGQezdg
         OTRGlEGTpPNiXoPT0NyyLdr4+ZB/c+BVLCC8GgyDE+XcJc+LJUVNGgIF58PeaFQvp6at
         oIOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532iXZHU+tt+O+tp4fjYKn21hSbd3I1Lm0OSnqg50BoQlGDccJYc
	h6IKYjOHR0p20oF6+yAYoWk=
X-Google-Smtp-Source: ABdhPJxy+unRZGOdH2ac6j0Uqi9da8dSs7tmcNY3K9tI/5D2KTULs49Qo2P4Kf47AIWVY/ujOGEJaA==
X-Received: by 2002:a17:90a:1641:: with SMTP id x1mr4096864pje.114.1623149636426;
        Tue, 08 Jun 2021 03:53:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e804:: with SMTP id u4ls9405141plg.9.gmail; Tue, 08
 Jun 2021 03:53:55 -0700 (PDT)
X-Received: by 2002:a17:902:b209:b029:114:eb3f:f187 with SMTP id t9-20020a170902b209b0290114eb3ff187mr725602plr.69.1623149635804;
        Tue, 08 Jun 2021 03:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623149635; cv=none;
        d=google.com; s=arc-20160816;
        b=rLBTaZJKCD3q93HmoLAFRfmvt4WRWMexVdznednHKHpsgFXg4VQ6BJxxqt3rvkNA6s
         x2016HguhL7Us5Tw7kFxy5+Uga7SSkjOZnJcr16plzU7GYqixaLZxP6TOgzhbXYotrmZ
         H9dLCHqJ+nJz+dfIbj0oB3jfJp8IOcRdNn5M+8s2Uegep1bHQsb40Q5maMar6pKkLmox
         btNBR04LNH5e6w4/fSgWdnWginP/cegtsoeuMjKjuStGg0mlFT+b12SYTSbw1Tou83To
         ogr5K4jMHogDwnj4CyVJOEUahNx8CTCexb2+ZGL0w4lq1G2zx6ABga3E3i7wQjfimwDs
         h22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Hdpg1imsBr34QDCdrVB8uFlg4GCJNzOG02raRRyAxD0=;
        b=w4OpTuwNN4x4yDGFhk6LWMdTToMocPwVYiV9tFjOgRtiruLJMJ0qiE1VShQHR/mAta
         l08QLfhU4PMD3rhXicGOgX63WOx8X3yqV3yOmJiuIwbpjQoLTk40XMAEnTxo469k6Xdg
         FD015lEiA4Q/yO1Ob43QWP76zejWQjIBLwQxk56qi4Tl+MyJ8M2QUbn3C1ZLIdVxaeqF
         AqK1DSjRHOI+ldmCh0uHEO7hb1R4w3s0GVcpCfQgz0LSskoAP4rmjmel06+RHyZ5DKXc
         dxRfg2bYSaBElZrNEh3jtR/vIWifLWMEj+3HTtOo5QaTnnzIDVGncvQkI93Bts+8MK9d
         Dg4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d123si525560pfa.2.2021.06.08.03.53.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 03:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 158Arj9t006675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Jun 2021 12:53:45 +0200
Received: from [167.87.44.81] ([167.87.44.81])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 158Ao7LT032665;
	Tue, 8 Jun 2021 12:50:07 +0200
Subject: Re: Private Per-CPU Data access issue
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com,
        jan.kiszka@web.de
Cc: gengdongjiu.gdj@alibaba-inc.com
References: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f220116c-a666-5b73-9fe3-e5e4acd1583d@siemens.com>
Date: Tue, 8 Jun 2021 12:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
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

On 08.06.21 11:20, Dongjiu Geng wrote:
> Hi,
>      From the jailhouse design, the Private Per-CPU data should be not
> accessed by other CPUs except the current CPU.  But from the code[1]
> and my test, it is not. For example, the CPU1 can access the CPU0's
> private data, because hv_paging_structs already map it, and the
> per-cpu page table will link the hv_paging_structs.  is this a bug=EF=BC=
=9F I
> think the Private Per-CPU data should be not accessed by other CPUs
> except the self CPU.
>=20
> [1]:       err =3D paging_create(&hv_paging_structs,
>                             paging_hvirt2phys(&hypervisor_header),
>                             system_config->hypervisor_memory.size,
>                             (unsigned long)&hypervisor_header,
>                             PAGE_DEFAULT_FLAGS,
>                             PAGING_NON_COHERENT | PAGING_HUGE);
>=20

You are referring to
https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099f6=
eb9c657/hypervisor/paging.c#L678:
Right, the initial mapping means everything is visible for all CPUs. But
then comes
https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099f6=
eb9c657/hypervisor/setup.c#L100
which setups up an alternative mapping (installed by arch_cpu_init()).
That does not contain the private data structs of the other CPUs. You
should be able to confirm that AFTER initialization, e.g. on a first VM
exit after setup.

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
jailhouse-dev/f220116c-a666-5b73-9fe3-e5e4acd1583d%40siemens.com.
