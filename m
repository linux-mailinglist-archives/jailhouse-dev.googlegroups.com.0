Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUNPT2GQMGQEKELGECA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CE4651EA
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 16:42:09 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id 30-20020a508e5e000000b003f02e458b17sf13922971edx.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Dec 2021 07:42:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638373329; cv=pass;
        d=google.com; s=arc-20160816;
        b=deZWPAdkAAtegCg/M0juYLSiqDkxc0wnZVG018RtpYIg47veNMhQpCilAbrpOQiL0q
         LeRJJaHvNeTSEJbuM3M0C1iNLQl9z6iEi4eNkNH3PXBtctGz+0ilBuOBlKaNLq7cO05U
         RyQ65TneeA18Vxh3+N8wxRzmd6nnaXqyWSiNwtmtDFutie4Z1PxapHcNERbwtLquxG43
         B1xOzmDaVv3Dzb6f+AE/UgGysgbkTkYCnYXe7rY70jPEPwHuuY9Ea0Ctd2XZmScX5KjG
         zJvlKPLXq2/MIs/UBK+2TKtuAyaxH3pWaccQ3+KswXFO49HcT+TCEM4jJjjjlQjkR/US
         SXig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=OCezCIk8pL+wYJyroIbQ87e9MTEwun3jMBBLZIj9t6o=;
        b=Lggjch6iJTZHjo6EggVOQmY4ubP4rZbdEMak8n6QLhjdlbgkQSqayamjGhheKoC67M
         hCAB/yvyviZFRw2O5hXMRr0xOHKHaeGFyW88uzs9iqcE5yAmo1c5lXu3savsl16DTe9X
         CQUfheJAXpOx5JCkJVllS1fiX63+DyZCxA0l3L2HDbaPuyqShg0cAobj+u5uMcNsFfhG
         fnKBaJiJGiANI9uylSa9wpE4vaKqC03D6doVUVtyyxZhF60KZuYYYpXCe0Vp3WJByAzz
         V3TAmViWVmjHn6kR37lIm6zL5/GZxnD4ylooXpL2jtlgdnPwmm5uxoydBn1EN0jaI/Mq
         pPhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Q1T2lOQl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OCezCIk8pL+wYJyroIbQ87e9MTEwun3jMBBLZIj9t6o=;
        b=Ej9WEc5Zkb8tGx0HLHiN0bbGMjeO4ifnKRvXrgYClOMCZvQO6WFbYXeUOSRgApsRP7
         yuST74y06eGhWJ3sa20noAsxVQB6g2EEPjtflaEMt1GPeMjSZ7rx6gqZo6i7RGVV3LKn
         ENtKHEeZXIyREdBdDCXWEE/HSEWQbfVPTYDZOreEQYZChoo66Dmu7jgFQI+GzktDXT/V
         T1i9Yb4JGxSz8qHOpSn1sJUaGAKmnd1/YSkqz4VcBQpjqh1IqTfjYNlx8nwXzkBmQc6Z
         WCpJhMTkQh3xDFliQBw722Menxp9FGy/t/IHo8NfdUafZtT204CG1bP85FqxsFPoeqYd
         F2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OCezCIk8pL+wYJyroIbQ87e9MTEwun3jMBBLZIj9t6o=;
        b=qHgYm0rG+N7jC95g/TVL0u55HgRCf4zSH6Xc2o9TQANKiQQM0N9IlRcjwdFiLb6EaZ
         HqHxCae4yomTMZGatSz2/K0gqvYMUp/iNjjElUvFp4xlc0pbPcYtP+UJEjGqRLKWLXZQ
         z3K1Oc4RudWGp0zlfyHTv2ll5FNKM18Uqv+yZTQ6HOlmy2xD5+F5P39G1m8vK1v/UN+g
         m4JYgBOIlZHeumJJ/GvaVWXHGfzGbKlyu2Fi+g0+MWKWmAd5Re1iPsYpJvecUqTxwjSj
         9HVJnSuHBnsCOgdpIkt104/llMEOcLXN6WtcO2A8cjt+lGH+iKwPLU5iyvSmITYQu7m1
         NPWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532kYWqkUsjQxWoTVvCpZYRBLbbHMvVtVQ1pgSCHDygsejuxIFN1
	SYyDKWevxKCHytyKqClzdLw=
X-Google-Smtp-Source: ABdhPJyl8lOaEb3W1S3uYhIB9E86fYnJS53s9lbpS1+IJo1zbYdUmKN1zqHptni+SRr2cOby4V6WIA==
X-Received: by 2002:aa7:dd56:: with SMTP id o22mr9562528edw.73.1638373329770;
        Wed, 01 Dec 2021 07:42:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7f0b:: with SMTP id qf11ls1217028ejc.7.gmail; Wed,
 01 Dec 2021 07:42:08 -0800 (PST)
X-Received: by 2002:a17:906:b51:: with SMTP id v17mr8324052ejg.262.1638373328762;
        Wed, 01 Dec 2021 07:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638373328; cv=none;
        d=google.com; s=arc-20160816;
        b=i1RXn+M7Fine+gWjThtJn+2YSuCxW3Pm/YSS8PughMDcgm09RjydPPzw6M499A8h4g
         iGg5jFKAfN38gyjEYT1U8VlW5GMoZWV++qwRrygVeuXIzTDESFwiI6SCUCTw/0gSiYfx
         H+o8dcbs93s3aNIN0Zww+PO8iRXOmteAdWS/wZ9lGjJZLAFhXy3CKo5rk6i+/x03XSYs
         l8JGjLrnLx3wePUOj15HvT8GmxkRfiutq09M1rHxF7KfEHFFLgxMIGodlhgA+n3KjlpO
         kvFanOTbPCSlV00atvQdsZnhR9bP1SEYpc3TuOl2Qidy+BBhmJYlQ1m5y6g0Ho9W6Ple
         VgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=meobGWItTGH+DgCyXTlojADSpGEFEYK5Org36JSgrCU=;
        b=OZaGxZK44GV/aVkcXvT+XXfjNHcaKFfsWz5sHVPuxxY2stq9B4mo3oD5Gy6JXKv9O0
         EmZj8iKW1k+5sQ/VbDi62oEG9aficoP6AeS72eikEtOerO/cRJQvjEE7swORaAVYFwEh
         wdts5i3rb6ozDl4neBBSwdrK7oR9Gf5pn4mzrab0nSnLZ1NteFdIPgFYqbZiyYIwch4x
         Zo11R9dJYXIUywkk7YqTlioV/S99YsvOLH96PlLxjCilUbwlNi/Ge/NvEOY+i+3Rvesc
         bILJKWhaVpFxQ5wCP984JlbHu6QYSONBJ3+bPVRGBV3EL4bxIhOeRxE4uPZ7fGZotC8U
         ednQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Q1T2lOQl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id fl21si15695ejc.0.2021.12.01.07.42.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Dec 2021 07:42:08 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4J43HN1qRkzxsq;
	Wed,  1 Dec 2021 16:42:08 +0100 (CET)
Received: from [192.168.179.73] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 16:42:08 +0100
Message-ID: <d53d89b2-1896-8bff-02ae-3d4c3ba312ca@oth-regensburg.de>
Date: Wed, 1 Dec 2021 16:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [EXT] [PATCH v2 1/2] [RFC] configs: Introduce helper files to
 create inmate cell config
Content-Language: en-US
To: Stephane Viau <stephane.viau@oss.nxp.com>,
	<jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: Stephane Viau <stephane.viau@nxp.com>
References: <20211130232013.395-1-stephane.viau@oss.nxp.com>
 <20211130232013.395-2-stephane.viau@oss.nxp.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20211130232013.395-2-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Q1T2lOQl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Stephane,

On 01/12/2021 00:20, Stephane Viau wrote:
> +/* Memory & peripherals */
> +#define CONFIG_INMATE_REGIONS_NUM	(1)
> +#define CONFIG_INMATE_REGIONS		\
> +	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)),   /* RAM */    \

just picking out this aspect here. I found a way how we can even get rid 
of CONFIG_INMATE_REGIONS_NUM.

The problem is, we need to know the storage size in advance, in order to 
declare the array. This is why you have CONFIG_INMATE_REGIONS_NUM 
definition.

But with your new macros, we have the definition inside 
CONFIG_INMATE_REGIONS, and we can easily reuse it: We can first use it 
for calculating the storage size, and later we can use it inside the 
definition. Have a look at the following snippet. The compiler eats it. 
I guess you should get the basic idea:

----8<----

#include <stdio.h>

struct foo {
         int a;
         int b;
};

#define MEMBER(A, B)    \
         {       .a = A, \
                 .b = B, \
         }

#define MEMBERS \
         MEMBER(1, 2),   \
         MEMBER(3, 4),   \
         MEMBER(5, 6),

#define MEMBERS_NUM \
         (sizeof((struct foo[]){MEMBERS}) / sizeof(struct foo))

struct foo asd[MEMBERS_NUM] = {
         MEMBERS
};

int main(void)
{
         printf("%u\n", MEMBERS_NUM);
}


----8<----

This way, we could get rid of all the *_NUM-macros, and have the values 
calculated automatically (and correctly). What do you think?

Thanks
   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d53d89b2-1896-8bff-02ae-3d4c3ba312ca%40oth-regensburg.de.
