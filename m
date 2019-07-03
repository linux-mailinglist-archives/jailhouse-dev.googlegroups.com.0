Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZHS6HUAKGQEWOWQSMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A995E149
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 11:46:13 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id e8sf831509wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 02:46:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562147173; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jqzs8ThymAOSjjj12TCrOEc+8gArLJ2X2vPSI9Z+ma7AUGgQH6pq+wnzNakZZrTYW8
         TOb5H0bDqFF4Aph4JOlFqZY7edBvuqCSbEsbmbiYPQePooRdUkFOrUU6Gi9GA4XdMRiW
         poXHba1Cjy+WD/wkJQjjbrjHGzfWZtNAEoR4mF0HAuUhglH035FKa2dU93WJw0vugIFM
         22qFWYXO36LUerycAy/Wvpr12/rcbDFSzS3XonOCUM9f11DlSjg9l784miis+hHJ4KoF
         JT07+7yXpR6epnhk5X+/TAjw8ezLkamg6nEB6gaxKn7H85EWXxKqVD+8kI0ylhDhcuoG
         DGaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Yx+AWZbFEL3L24y5sfqGZH8cXcL0o2cfZwtm1NURvuY=;
        b=hSot0jzQtB+Jga4urJUgWvAQq/4tPJN7Dde00gygkgWqrA7qJ/zQ7XOX4bqMUDJqjz
         aS4ullNab+X2s3jnMBSs8yE7vrGpEIc/UiEyZDYK4JiKI0wAqTJBDd66dVXP2QDbwxNo
         XSJoN4wyRjf3rDeDYxE0obfk3CfPJEFNL4opC0F/OPX+lqCPzsq5YJk29glTCz4pmtXk
         wNWzOybj5GMo4He/0tFvFVEqCfHrL5BYoHl4IUoHnUp9IRYS2ShiNnY/kTwzzxA+WpL0
         Ogm04235CPY/iyQ3Ric/JjsOOE/LDFcw4qvUP4WSllPgexr0hq6rBwSPwLR4hA4w49HO
         FdOA==
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
        bh=Yx+AWZbFEL3L24y5sfqGZH8cXcL0o2cfZwtm1NURvuY=;
        b=gZE6ynMp5PApzYJSyAbtMDUkwBTn22hbXFyDDQiNqGoPdywqTH4WF3kP4weekEjvww
         3rl/7LXf/Oa8WyUMEo1IgRF6bAmbOXz2h4CAe6bST2nxvLlGum9TRdl0WY7LHXceIDbL
         tnSZT/xUJdJ6RCVIxmMNYoUUGwd7zoXsJOES5ocp+o6a7hWGJ0A/Lqz4VMIOxQUVtsPS
         Z3d89SdqOIWZ8NuvgbxkHGhLnxCDtjJUtstPDp6Eut6C5v03qFRrBdODlQFqfAhk4XOP
         Xa1sSgu5ngrSjPAm4qdWl7Lkn0y29ON5LSV5wMGkKkxb+HQvJwFvUx1yZnG57HEifzYT
         1DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Yx+AWZbFEL3L24y5sfqGZH8cXcL0o2cfZwtm1NURvuY=;
        b=KShjjG79Rss0UpsWevJJDM+MNYPbD2ZNcCptUsbQZZpLk/YqGCOJKXjpoRCgV1T9BI
         MIx7FUsxPLs9o0oGcVo8Wku9ip6vUPQt4dNiAmuRzcwQiN4eNhu5Sce1pMGiYFQN+Go3
         Zx5cdUyR38i9DS/Dc43CyDOF0tAnVtZxJnGcJMlTPt7tFJL3/S22efG8enqe7U/LL86a
         GyZxMzsAM1XLmcGjPBjHi1fy8uWgVVKMT/4wbAqoDVDW26oueGEwP3Ik3f4Cm1rlX1UV
         130vIz179V76vtbkxJ6gmByItyLb4G5cwzczgaIyhlGNmP5Ub2AlX7b61DnxCfsVc+Ej
         ZVxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXpMah3weFWqErn3xuZG/FFxkUywF75DQy2hQwIxDrwDJMYPXOi
	z6XpLz/xBEFG+NqCDZXXyv4=
X-Google-Smtp-Source: APXvYqy8pMkHhjc5DyA799Si78HYYsyV/U1MBVujVmG4Xsmnj7MJ4a4No5Sk6Hqjz+JQCRfKpSr80Q==
X-Received: by 2002:a05:600c:2503:: with SMTP id d3mr2049824wma.41.1562147173011;
        Wed, 03 Jul 2019 02:46:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls507390wme.1.gmail; Wed, 03 Jul
 2019 02:46:12 -0700 (PDT)
X-Received: by 2002:a1c:d18a:: with SMTP id i132mr1539967wmg.10.1562147172223;
        Wed, 03 Jul 2019 02:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562147172; cv=none;
        d=google.com; s=arc-20160816;
        b=kjtoLProKDbCh5/+4yNP0cIbTL6MZMwIpT3JW0jeg4rPiPOnqRkoscmH43fKQZMu/I
         xzP8pyWKUOS7YEy8UPVhJbgir1nU/AoN/uzySHhRTacKwoCAeU2BDT/NvH69/z9amDl9
         3nsC7E+XpFPn1oRsjXeAQ3U+LzI4Ffaui6kvt22laoqul/Uj1psYmcKVezakaeDI04B4
         ohts+GXJe9GLaO1///fOr6mJIm6cek3AgJxUv+p338AN1m9Gc+PnJtLRFWil7bKNDQyN
         skaPFlklkZ9zJPwUC6d+QI0lYXj3oMZOkbIXik9JsjqCdEn/KiC7EkSKLK63t/s4ouAi
         YycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=KMYexhnpqV9sX/VQxAeIsNF9QA8/lLZ+tFpRkAWk4Nw=;
        b=RiJ6KjlsJlthxUQcugl4WzC5hRqRrjiTj6CVWjXg0Qdznc7p6vwZyTsJs5LcoRRO2+
         LZ9A7Bey+jT5JgiPOnUetqdsGLk3fU6yvcFXxXn0MRYqzcZ/DAB6zZ0m11x6Ex+vbTu1
         61pjjHZrxizekM8lAluivTTUoptTQTHin3mYqdnxhTsjDsN6Qsasf1X+V9Memhem0Zlh
         HSxXVidOG1kF1zxshB+xwy4ZG4oa86PxdZdPiylRVMOnmiyEPO7+dlHqMDL4okhou6Wb
         ji/1ANSnHz/Z62+CigO+uxUUyapX1hVW5kw0DOnMpVxJpdcl0n9wBQjAhCy2uDO7SU03
         gMyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p15si103200wmb.0.2019.07.03.02.46.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x639kBnU024905
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 11:46:11 +0200
Received: from [167.87.3.140] ([167.87.3.140])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x639kAsp012180;
	Wed, 3 Jul 2019 11:46:10 +0200
Subject: Re: [PATCH 5/6] core: Move unit initialization after memory
 initialization
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-6-p-yadav1@ti.com>
 <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
 <7d39456a-9797-e83c-1cba-63d21b374e51@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ca098d37-5a46-882b-e295-d8a2cdf093f9@siemens.com>
Date: Wed, 3 Jul 2019 11:46:10 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <7d39456a-9797-e83c-1cba-63d21b374e51@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 03.07.19 11:12, Pratyush Yadav wrote:
>=20
>=20
> On 02/07/19 9:18 PM, Jan Kiszka wrote:
>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>> The SMMU driver needs access to guest paging structures, so they need t=
o
>>> be initialized before we can initialize the driver.
>>
>> No signed-off - because you were not sure if this is ready? ;)
>=20
> Quite the opposite. I was so sure this simple change was correct, I didn'=
t double-check the patch and missed the signed-off.
>=20
>> The bad news: it isn't. The x86 IOMMUs have to be initialized prior to c=
alling arch_map_memory_region because that calls iommu_map_memory_region.
>>
>> Can you describe in more details why the SMMU driver needs that guest pa=
ging access during init, and why that can't be solved by hooking into ARM's=
 arch_map_memory_region?
>=20
> SMMU's init doesn't need guest paging access, but arm_smmuv3_cell_init() =
does. Linux might have already initialised some stream table entries before=
 Jailhouse was enabled. We need to copy those entries in the hypervisor's s=
tream table. This is done in arm_smmuv3_cell_init(). But for some reason, c=
ell_init() is not called for the root cell. So I call it from arm_smmuv3_in=
it().
>
> This seemed like a simple enough change to work around the problem. Calli=
ng cell_init() from a later point works just as fine. Any particular reason=
 why cell_init() is not called for the root cell? I see a lot of drivers (i=
oapic, vtd, etc) calling it in their init functions.

I suppose you mean the cell_init unit callback (cell_init() is called alrea=
dy=20
during early_init()): That is called on cell_create only. We could also cal=
l the=20
cell_init callbacks after unit initialization from init_late(), but that=20
requires some careful checks if there are ordering issue. However, that wou=
ldn't=20
solve your issue.

But your problem is not that different from vtd.c e.g. It also needs to acc=
ess=20
the guest pages in order to transfer interrupt remapping information into t=
he=20
new IR table. That is done during config_commit, and you should just do the=
 same.

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
jailhouse-dev/ca098d37-5a46-882b-e295-d8a2cdf093f9%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
