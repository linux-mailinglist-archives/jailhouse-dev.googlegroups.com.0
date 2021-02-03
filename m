Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFHQ5GAAMGQEXBINW5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2203B30D732
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Feb 2021 11:16:53 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id q13sf6320985ljp.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Feb 2021 02:16:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612347412; cv=pass;
        d=google.com; s=arc-20160816;
        b=cXPB3seeWaKzIzY6GkmcaN/7+ZKbhjU2FiUhJHOfwd8qgKTZ6EsX35d7DuAlWqGJuy
         j/aV3T5H7x81EFtBM3zB3TmbS6MI3aEhjHRvAUSpgVN3mgFQpKPSgJ76vG2N1Xuu6FBg
         7ncafa0rgE6cCQDkNu0p/X6OaY5bDhBiTny6XOjStf1xXcRPkjtZ8mVwZmjds5dWwciC
         ywFSxUHQF0lMjOpGaHn1WJF3+diBmc5AfVIrU1kcySf8RTZNYnowJd6+flyEgUoPwsFk
         N/XQBBoaxNxerrwS60lGcXalFLShgKQ/CpbBMyn5g1u0MEdnsFHGnyXyqGXLarQkYv0g
         m+rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=7rIItc2skeEbCt6APxCOJMkHVH9g9pbcoQA034nUGr8=;
        b=claUcnt8Oc8rj4yDYv82M7B2sh3Cgl6UHP64rays0owVYXegyqjdJHScUDrwhg76t/
         u/9l9vSoEJZ5PE/6Fqyk2X/LWj81V4gQYqIFRQPp/rGaZoAx3CHayMN/QehK0qWkIH7k
         4JydVj0JWOMY8b/14t57JWMJT4zRXf534YAHKtcd6/SJ52h9eCh2EPRdq6Hron2wix4B
         Yq6nNnufznazfT3EEHfFskybLPuIO1blfVyQuH6mqnIJrDyKp9OiQ+ZpXCjyZA9n3ICQ
         TFo/K6skx7tWdNBLRaUd2aCczFyiBH++5f5BcE645NJQ+ZS4tEaAX13MOfNTFUNqmSnq
         vbVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7rIItc2skeEbCt6APxCOJMkHVH9g9pbcoQA034nUGr8=;
        b=dh6FLonEKTkVxLDa7cND7pT1tgPERpWL4Y9cUGqIp0RsvwbTtn950Rl5EqC6oNK0z1
         6X46C0yiJoJwUM1swXpAVs260K+D+9qgAZg9uTxXBmXLUs/tpLb9EotfZ5DhL1rBwe83
         TY8Jp3Fj8aZm+U+rFWw7sQhOdoPh6H+dVFYAVY7w2uU11TaOFYm90S8IceAYicp7qcyi
         Nlb8rBruieuDsI4aDQbcVPMUCLCCzbY3WyY9bx7FI+VEjrYmW7bGibiE/fg2Xk2npu9L
         cJ9YN4q5Vem45NGsv+CePUacFc3FgtCyTpApsZYhf5SDPR7Ioky/IZk+/matZy33cfFN
         mDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7rIItc2skeEbCt6APxCOJMkHVH9g9pbcoQA034nUGr8=;
        b=ErnW6E23U43Z0BiNnFLYlGwAScMwN7782HCvDAnTg7KXP54Sd6gRPRzfDpil3SLBuQ
         aA7Bs0TLME1ltaq0TG6ccm1oyDd9FMzdbeh1YmMAiQUnZbL6z1SATuWE0SWU/dMEcGiL
         gnejbp/MKywor+9Bq/Mp3yz9NWsJ5tD5i+6dJh01Bpb4Ox9bYDIOf1P5WoZUd06FZHUe
         5pj3t7bCSfOmcGe7ZfjsDHavf2ZB6DQYl3uRfmXvJMxxUkAuG6YiiFUXDv/AvZd5+L+e
         gyJ1En5JCEIu5Xi1uRMJ3qScqTD90B+sTdFf/OMJDWt/s7uLtnLgUMtXwNYD6i4QFj29
         9f+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kGbH/fXALGEmala2fKUTLSJ6rgKOCqClzKm0OU5YIDeovvs3J
	ikLv15T4O/bIAYmrfwrgHKk=
X-Google-Smtp-Source: ABdhPJxX1pWSLEChyVlYun4iPbz7JcNH94KxN57aawBXM+0SYySnCenLBfc2xDOYj+pNSErESXfCfQ==
X-Received: by 2002:a19:7f4d:: with SMTP id a74mr1390400lfd.618.1612347412659;
        Wed, 03 Feb 2021 02:16:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls1158561lff.1.gmail; Wed, 03
 Feb 2021 02:16:51 -0800 (PST)
X-Received: by 2002:a19:410:: with SMTP id 16mr1374213lfe.264.1612347411484;
        Wed, 03 Feb 2021 02:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612347411; cv=none;
        d=google.com; s=arc-20160816;
        b=rm07FoWA3i0siUaBLN5AWZX884hMypSf5QyuWFnf2vt3Y8eOX3YnvAhr42IUVhDwWz
         wxctIdsTApyHXK4VzRq02J5dW8GUwmlWoMKuXaFIRzT487gtThGfbw2Ge9oEkwZjIvty
         eu2uVfi2ZgBkPIoBWWr2148CZ9BnS3OViSApVtUwag87Oz5Pv5SqnbQtqKAdJ1JYw5Y1
         qilk5Og6DfqPwGrX4fAK1GGtjCrzdK8UMvuo7o9DtO5zDjNSMf4FFk/cIrkJ5p6q1PuZ
         TPYkq/uuiUhtKMX3rvCH26s6ofU31lYodu5Hv1nNMJlMsOmzsAfAQtr/NrEWmSNLeGuU
         Wtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=EipT0vGzrjC4vc2o7Lm3QrabEzcm/jqLs0vbaDtCL/g=;
        b=vMkA3LhMvwkH3kI0y5X1OvnpVqHTAOFzI/hpS7m51tABMzqZhvdm96IzrW5NgKOgO8
         13qoWPhP2Gg5ulgo2ciMV0F9jlttH8axaubEZTDldm74rxZkcHi+ifqzWSowHztEivYd
         z9FhyeIjuLXxxdTqyP5BKbZ9j0G4We+SBMNRvuE9dSw5eCgR1yja1y//8qaOvesF7qfr
         f5MFP7B6G0tXS7B0SNVKwH4VivCQEQ4E9/kBU4fnkizSBi3bJ5+XAeNyvW6R7Tu4Z65H
         TH7+h6NFUoofi/rxrpHjiuhJa4upwHVeDL685xu520RlhyykBncqGXRDse9CU7wbgYy5
         IJRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d7si76914ljj.6.2021.02.03.02.16.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 113AGnJ8008493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Feb 2021 11:16:49 +0100
Received: from [167.87.20.189] ([167.87.20.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 113AGnrQ006007;
	Wed, 3 Feb 2021 11:16:50 +0100
Subject: Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP ls1043ardb
 platform
To: hongbo.wang@nxp.com, jailhouse-dev@googlegroups.com, mingkai.hu@nxp.com,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com,
        Henning Schild <henning.schild@siemens.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
Date: Wed, 3 Feb 2021 11:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203065057.27914-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 03.02.21 07:50, hongbo.wang@nxp.com wrote:
> From: "hongbo.wang" <hongbo.wang@nxp.com>
> 
> inmate-ls1043a-rdb-fman-ucode.dtsi is fman ucode, it will be included
> in inmate-ls1043a-rdb.dts. 
> 
> hongbo.wang (3):
>   configs: ls1043a-rdb: add DPAA support in cell configure file
>   configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
>   configs: ls1043a-rdb: add DPAA fman-ucode dtsi file
> 
>  .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030 +++++++++++++++++
>  configs/arm64/dts/inmate-ls1043a-rdb.dts      |  767 +++++++++++-
>  configs/arm64/ls1043a-rdb-linux-demo.c        |   57 +-
>  3 files changed, 1843 insertions(+), 11 deletions(-)
>  create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
> 

What exactly will that allow the non-root cell to do? Own the DPAA
completely (taking it from the root cell)? Or does this enable sharing
(and then only in a cooperative way, due to architectural limitations of
the DPAAv1)?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c3290c3f-c2fe-9090-b06e-9a786496a772%40siemens.com.
