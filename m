Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHOS2OAQMGQE5J2DPYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6B322992
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 12:38:05 +0100 (CET)
Received: by mail-ej1-x63f.google.com with SMTP id p6sf1720050ejw.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 03:38:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614080285; cv=pass;
        d=google.com; s=arc-20160816;
        b=XBS76KPGViS+9D3LgP7FOErelY41ifN5YTolgJ4BbywZSWfw9nseryBnsFBBuMn6sw
         MVm3zryZB3B3CFKf0tJrRmrhTszKhowf2iA7CvTsbe94SDzoLqbdL57Ito+vmtFfqG34
         eDN1gdfM2+jMpWVpHwVxjFDcD796GlQPyjchBluUYBR32hk5v7JSCFK/ftnCf+tdQ44n
         2Y1LhkBVXYsqasuQdsYJauwbl1skboHvQlchsdyVdBbtW7teaUIoGL1cIvCAOCOqigtV
         bsmfF6isCmOpqxsu/+x5JL1+BsuyDcbNdk+1ORo1JsdR9K2Ylxuk3o0BRrkvz3gAdrXO
         qJ7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/im7SnfZYhPv0uS6Cwmwnb8DNaud5yt7l6jCpayS0Qc=;
        b=w31FsS7w0GVVih+2bGwixgQqhqkCnDLPJaCidR5w1Akzi80LXqpluFcnEev4EaYE1a
         ZIAxoINNzNdQga7Ncb6tep7hhxOXeeMcdpX6a15tKHHESRS8dog3G23LNUgvjd57liro
         O5oaa+9ycqOci0dAqvOBAPk2MvkGqlrX+ky+Rk56l0oM1ESkzuId5u6kWHXWvZdMOz52
         2vZRJF2tZTxABLPVPl+qSqeXvVgaz6g+dVU+it3nmH0r9Xmvd/PCafffhsxUaLAfISNO
         EKawXHUULSRKsDVORltxbLRnEjd6cwsmmevmk0XTB45fYRZd4jD8YgOEzXWJc4uGqxrP
         ZuEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/im7SnfZYhPv0uS6Cwmwnb8DNaud5yt7l6jCpayS0Qc=;
        b=ALp53Y2mhCRO9txRY9Kcnp8CyKoas7qP4HWkH43tepV9R8jGgb4TtRma4wvdekhgPi
         4lOdIbec3+fbyP48fp3tfKh6sMIDlZWayOrYvfVxHZO9YgLMP/Vio23QRlVcjfa6v9zE
         z7wq5TsgMLVDG2dy/53qS7Ek+cGhTp6q2+1+MykAHhQa6vB2AUbu0ihS2QSgSOsLK1OI
         dwGpwuxMymC4ttiKx5lyDC48Fgxj+v+RpgPEBh3SONfCldSvVZBiBljQB03BATUQnxIk
         gC/ruj0XlTuHTyI/nmcwGWLwSSdErF0/LEK874npqa8DGetHBYNsOsU5bO2h5hMiQtTl
         OSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/im7SnfZYhPv0uS6Cwmwnb8DNaud5yt7l6jCpayS0Qc=;
        b=f8QiTNMjJJj/JTQi0nkaQFr7dNYb0GMOxhawMhVO0uU99Op/0QYIYSDa/6lFzqLAh4
         5gVEBPLCoLWzOvTiXP1hItdTF0quluizLB3YSYQnbA0Bc1Ds/HBAXTi5k+3Y70+bO+L2
         Gv/JgCr4kwz2MgnvnOSrS/D4RAQSYwPhzZi5SsrVQjccQu1yk+pc0f4rtDa1fgeVLrlw
         H835vmo74oqzqxQppyIwbNvm9wMkmwfg/nj07A/OFERW71eBbJ7DRChBK19ql+eCDYNV
         dyGtGazsZxAWvoO0oEvlQd0l0tfrk00lhjZfYpAWeMhHp9Fy9iaKgspqHVps8C9nSxVD
         49sA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533W7bld7h4RJTQJtDxPQ9YXwIKJefuY3ZkMqRjPsfqZ6iKTk97d
	bZPY4XAqeFt+XLOtKqyeMu4=
X-Google-Smtp-Source: ABdhPJzMssKIkQNy0vtWtPxZooW33JNH0kvG2aVMvDPYHV1QuOjhYa+zgn+L3KrFr5qzQjqYeNt3Yg==
X-Received: by 2002:a17:907:778b:: with SMTP id ky11mr12580085ejc.333.1614080285456;
        Tue, 23 Feb 2021 03:38:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3619:: with SMTP id q25ls3474284ejb.3.gmail; Tue, 23
 Feb 2021 03:38:04 -0800 (PST)
X-Received: by 2002:a17:907:7667:: with SMTP id kk7mr13668166ejc.92.1614080284543;
        Tue, 23 Feb 2021 03:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614080284; cv=none;
        d=google.com; s=arc-20160816;
        b=NxsJlMtj8+Zy+YLjp6vpptFWIfXbdJmdeiU1P95vzsaxRDOiitsG9rTQoX8N5zyQ1f
         IPoWUU6CYewxbgUih4gWCAZuilB34CJT9ZBD5Ru5perH6oJjDThBAOBv4UOFbh135MnE
         XJt5EIbECHbRV3jiS+DLlUQAeWSeegz8uXgemcKqB18cBS8YohPfNBwH7taj5lyBmZsB
         2POTZ89/du8g7jBc8l9mpve05z2i4us1ABs36sq/jshvolF4vY5juLcbtGLEg3Ku321p
         7xDGw1qLk/b8q8LwPyFnL+qizmAm6lECX7Ac+K9yJK9ETNnWieA4/kpeyq/fuNe6DVeZ
         zFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=5A8TZ6rYaq8MiBJnpEyCcCHeKmTm42P2yy7cu33Opes=;
        b=VumPXxaxKeLi/+V1+KUO4ZqWfbcMLC2MJNUbdlWx9MExk/5NyA3tD1Ytfys8a+IUZX
         tKiKypiVa9qQvdED77m/c746NWy8UuqTp6psKGI/17np4Fj4vpX6eAtyvqwuXAF+gy3A
         o5XpvC+yu5DzE3wba6+vs7S5h1a+v9v7dcWFwjRoo6EAjLJnusYlD+M/kYK10n0wqzyQ
         TAxUlw7D4mdPT0Beo+lOBNFW784xQMrulrJXt3BTMSbhl8q+sbHh17vDUxUw2EfNzcuH
         GjCCR1GnlVk9wRFoxTtuAc79F0EmratapFJ0awJ0SG5lqEgnNT5eFDQCX3tOvWDMIMtD
         ujAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id jz19si1304143ejb.0.2021.02.23.03.38.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 03:38:04 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 11NBc4WC014557
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Feb 2021 12:38:04 +0100
Received: from [167.87.244.56] ([167.87.244.56])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11NBc3bM027420;
	Tue, 23 Feb 2021 12:38:03 +0100
Subject: Re: Performance monitor counters (perf) in Jailhouse
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB666308E65BE540CAEE21862CB6809@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bd59d682-88d7-216e-2d9d-9d6e000a7896@siemens.com>
Date: Tue, 23 Feb 2021 12:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB666308E65BE540CAEE21862CB6809@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 23.02.21 12:29, Bram Hooimeijer wrote:
> Dear Jailhouse community, dear Jan, 
> 
> I am considering using the performance monitor counters in Intel CPUs while using Jailhouse. 
> Given that the counters are private to each logical core, this is a nice opportunity to get more insight in the performance of the application in the cell. 
> 
> The current implementation disables the perf counters when initializing a cell, and exits on any writes to MSR_IA32_PERF_GLOBAL_CTRL to ignore the msr write. 
> Why are these counters disabled? Is it just to omit complexity, or am I overlooking a structural reason why the use of these counters is unviable?
> I consulted the Intel SDM on perf counters, and could not find a reason not to whitelist the MSRs, so I wanted to check whether I am overlooking something. 
> 

Perf counters can be (and usually are) configured to trigger NMIs on
overflow. But NMIs are currently owned by Jailhouse only, as IPI
replacement so that we can implement exit-free interrupts.

Now, we could implement handling of NMIs coming from perf counters and
then also re-injection of them into the guests, but that was skipped so
far due to complexity considerations.

When enabling perf for guests, we would also have to consider if the
guest could gain any relevant information about the hypervisor this way
that it shouldn't. Not sure if that is a real risk, it was just never
examined.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bd59d682-88d7-216e-2d9d-9d6e000a7896%40siemens.com.
