Return-Path: <jailhouse-dev+bncBCOOP4VF5IDRBG7A7D3AKGQEYCUZT4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EA1F18D1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 14:33:32 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id o19sf13421110pfp.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 05:33:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591619611; cv=pass;
        d=google.com; s=arc-20160816;
        b=NZ1QIgLabAnCuBUl3NJHlhkjgDspbtOjmgRL9NtOJuqnbsu2o814Z8DzYFmJ2eLsRE
         MIBiOoyW7iERbY9PDsPInfgE5OiC9I3S4vn61xDteK2P2gn0bOtVLlDRGSa7lBB2pXqM
         zigK22sV8MWduA5OHDnP4F2xnS7DDnHm3nGG2M/TLNf69EhF5iHGi7pqgeA7FX0Buz6w
         iL3kpqYnuJZTyRuo4FrKYOO0EYeNneW0uemnetRHmp0K7sG3BQ0d0FJWEvATJLIa50Sg
         6mjxAFSQkO0UUfb50f22tSSkFgf+EV/rxvwmYxcnfgbi2Yh4jCBcBZsMSaj84ybXa9+7
         cHJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=CmUbnhqtJ9OVN2qQrbqWQXVB2HntY0DTjz8x7cm7dBU=;
        b=ZmWdN3nQ9cdG4LaQE9RFBX8v7TCMLBhHKeNdKFc452NfjRw3bOIlxpnncnsxzoWFme
         JWY4sQ18ajZB3MRT4REhjqNlsaWnMe0Bo9WDftLrWrl0XsYrAWHBeKSZZn/aZmo5zzwy
         mN4/A9vUSy020XeHr1SI1TjoAE899gZafZHncbzrGrBY0xrB5AaipZQs9MgZyplB7FXA
         +hgH43zjqmsc8fnZHqMRc/RS/FDmjpejd5b1TRxpVMG7u5FjiEQvtUp2Szd997fATfTa
         sXlClFN9NgCdFePyCTtLX1wHUKmEXb0cKRX8yhVNNTPUO7t0AgHfjqP9+ZFsAwXRvJCn
         H5Eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XS5OXtFJ;
       spf=pass (google.com: domain of kishon@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=kishon@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=CmUbnhqtJ9OVN2qQrbqWQXVB2HntY0DTjz8x7cm7dBU=;
        b=LJXDWcsPrcnEbWnT8H+qs9lV9uQsvKEdIfh12Vi4R85f5KdYghsHB9ModRH06auUvE
         YR1HYs638oTnTIaz65vw9h1TabcB3OAXb3hBhHBmxVQ7KMnij/yKT/qseteQOfXev38T
         oSJddt3f/ylrWDzut/XrZxK+l4cSZKyrtukHyZUDZGfVnrLiu6/mncUecggWNQ3hSuKw
         xF7xvAq/q33Kqh4ikfICUnyYk/SY8hnnNI8wV+0EkUytXk+E0Bk73IeR+QFjGmY+YRih
         UluWeSje5FfnmHXnR167bfvN6UNsCX1xaRL/NglZvzAm1CZgrADf1DHJe3l7X4aDcDSG
         P4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CmUbnhqtJ9OVN2qQrbqWQXVB2HntY0DTjz8x7cm7dBU=;
        b=czSFTQaPp/qjnNqXBleJNGSLn/CPBiAcDWaLS5a++woqzr1+qnFgBcpB55VyIvkFNO
         oS/vIKR9VxXqHQjbILHpzRX/K8v2R0a8OR0v3PSpMl0xMlbE1T6yasQ2qrYlcZ98g+eg
         4x/VK8b2uh05x/vacEdG87nTqvmJVDkF1gz2FFg6vAtsxhCKmjA/PGKLLYDRhFhgaXt1
         G8p56zM3KUNPc6A/pkg9A0aLoR0xNdJ645hK6k9sl/T9sdu19BM85gNaFtP82CQ27eQC
         q99PUoO9Sb3gY79dlIhyb8N9RXnTiU7cZVeBrVaBikjbEkClD5woffue4jdBsJze9Ojj
         4l+w==
X-Gm-Message-State: AOAM531rt5HBdsSyiD2ilNOA9dTkrfSZ7hGI6eMr47wFmiUJOyrnPC1i
	hRbzgWWKV4g08sIELjgu0bo=
X-Google-Smtp-Source: ABdhPJyqARISO2H25crdDUvO2TH9vWiJ2xKP6Z5sm3Psd9hUz+Wjdp935sRAg5bgvoCzp5NSNhTSaw==
X-Received: by 2002:a63:3c53:: with SMTP id i19mr19755700pgn.147.1591619611607;
        Mon, 08 Jun 2020 05:33:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:6b02:: with SMTP id o2ls6166217plk.7.gmail; Mon, 08
 Jun 2020 05:33:31 -0700 (PDT)
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr17912427pjz.172.1591619611025;
        Mon, 08 Jun 2020 05:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591619611; cv=none;
        d=google.com; s=arc-20160816;
        b=R4j2pcW55d6LfIM6o8+j79ZUZsD8wQrc3BSJhrY8jysXmjNk6dRs1WTabMOr01ds6I
         KNIPbZAoTh7vCK94Z6UHavomSGc15Wlnymrm+hrVxh/K27zIIDV5pVSz40ey5wTRkNre
         sEbvs+RTE+zEf9x5uCM1A6z9qOxVJJ/LWfQJQAlO5/CsVEOOFWV2NcEwJOwZXxtABlOX
         4r6Tar/FgxOXCL8ScY8ZNIiMnuyzn56MGMddUH1jmmyFRez/Rqq9yHIFUtlzlM7CB8mV
         uSXuPHD4N4DTB5jBz7mjXlE+fZnAq/AROrhgDEO5nh2rOpXUGb6tpK+wWoQayYpERWdh
         km7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=dcFsWBS6PXCV+UnpeC5ThU0dphDA+UQzx10JAcZ1VZM=;
        b=aRcM+Wiyz3kBuM/6vjBktZN8oD2f7OE7m8g5Ea+0GwGHojHiqyi4h/h47/rzdpp+8c
         JRKzrnAYnZJVfNvZdzoUhIgF6X1OAWmVAhZf4fUONxdXW36Dqvd2lIpy/pNI2o8gacAZ
         wNCeSdYxka8Q8lv5f70vSuPXRhoJwJN4MFGXDM82MYFJDfzxaxoEHQHl4F6qdERL9lxh
         aaKDhEkBv6WAsnU621pZowzzWznj+Uvy1BA+G7Ttkx668nUlsiDXsJRZT7hcEP3mOIuv
         UbAkwdv9HJCBPTByBx6UFimYAxd72Pm9QwLjFCy0DfdVWHd76lw1zVfFwcMIJHXvNcwO
         0ydQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XS5OXtFJ;
       spf=pass (google.com: domain of kishon@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=kishon@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id kb2si813261pjb.1.2020.06.08.05.33.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 05:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kishon@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AOrri080999;
	Mon, 8 Jun 2020 05:24:53 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AOrNx022062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:24:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:24:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:24:53 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AOp5u004841;
	Mon, 8 Jun 2020 05:24:51 -0500
Subject: Re: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with
 PCIe
To: Nikhil Devshatwar <nikhil.nd@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <20200527122358.14723-6-nikhil.nd@ti.com>
 <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
 <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
From: "'Kishon Vijay Abraham I' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <3947221e-c8a1-66fe-4f6c-21edda8b5ef1@ti.com>
Date: Mon, 8 Jun 2020 15:54:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: kishon@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=XS5OXtFJ;       spf=pass
 (google.com: domain of kishon@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=kishon@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Kishon Vijay Abraham I <kishon@ti.com>
Reply-To: Kishon Vijay Abraham I <kishon@ti.com>
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

Nikhil,

On 5/27/2020 7:16 PM, Nikhil Devshatwar wrote:
> 
> 
> On 27/05/20 7:01 pm, Jan Kiszka wrote:
>> On 27.05.20 14:23, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> PCI kernel framework requires that all the instances in the
>>> device tree either specify the PCIe domain or none does.
>>>
>>> Currently, Jailhouse dynamic overlay describes the PCI domain
>>> which causes problems because root cell DTS does not describe
>>> this.
>>>
>>> Fix this by not specifying the domain in root cell config.
>>> Also, fix the size of the PCI target region to match with the
>>> correct description in TRM.
>>>
>>
>> Please rather patch your DTs to use the domain ID (upstream). This here
>> means that you will get a new domain ID on every Jailhouse start.
> 
> +Kishon,
> 
> Can you please let me know why are we not using hard coded domains for PCIe
> device for J721e?

Linux PCIe core itself assigns a unique domain number for each of the PCIe
controller instances. J721E SoC itself has 4 PCIe instances which can be
configured in RC mode or EP mode. Hardcoding would mean users will see holes in
assigned domain numbers if a particular PCIe instance is configured in EP mode
or a particular PCIe instance is not enabled at all. It'll also need users to
manually add a domain number which is not necessary.

There is no real usecase in J721E to hard code domain numbers.

Thanks
Kishon

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3947221e-c8a1-66fe-4f6c-21edda8b5ef1%40ti.com.
