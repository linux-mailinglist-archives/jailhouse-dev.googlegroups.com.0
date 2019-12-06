Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBROAVHXQKGQEUIRFLVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E11151E5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Dec 2019 15:05:57 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id y125sf5458241wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Dec 2019 06:05:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575641157; cv=pass;
        d=google.com; s=arc-20160816;
        b=axAeN85EO3utYAbtdzpLgvENixUzYEYPqAsL3091Wqoyuud83BiWF31ftQ61Yk70GD
         y9IkfPiUj9UsrgBC1nclxTqGQI6ReBmNpROMbwVT02YQZuMlgB5fOPFgyWgnTAOnEFeS
         /PirMNcjHGBvay9icuIpJtWvAGn5HbuGeYBgbXpFMsiZC5+/tbR1oyjPKncycFceozaR
         q5KbSlIq2CcSIWFTxpNgU4bJ4KC0Gx+56Fxg1kzR61JZZZp32QgDsULKUNu1Mmx6yX2U
         7Xfi9THfT31Yru8xqQUGBHWxRbvcA9DyfLEgd27EM4mxef13nNZQK9tgD9e5wJhcqGGY
         bATg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yZEevvATeyx4ZSaN3FdanyYz5VyC3TH1Hpg2H4adZxs=;
        b=CYULwPaYvV9cRETqKX1i8IhIEtX8ef9GGDLq3hMRSUhnwzA44eQSX7XOalYji/h9VY
         2V1L/WkXxOCdrId9nXMsDfD6qBjI0Q8c06GCmRgAMn0QYgC3NbJvrEYHoYpAhVsV1uKn
         gDPn+pHrugobsLua4BojfVJg7BCTDpLOwdNhqwMcQyKJnCvOYGIo1waZUuZ3k5sIY2f6
         EiGzgbpQwTxmbLlhh27ZP/dOqSqtZ5Zz72JMom0gSb5v5mt3YTltLZOGv+0FeHOg12A4
         X3MaMej/MA2ySPkwrPzttcHO9+OV0Jgq+dRWitxJ2g523HMzRNHW2Z1TPyrVWk+V9T0Q
         Jjzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yZEevvATeyx4ZSaN3FdanyYz5VyC3TH1Hpg2H4adZxs=;
        b=tQ4nEWvl3Q/mzCBKJ9vW024ZJXXTaMB+fTw+OU/lqcSwWhfhyuCyxgDvlduA3CcyeK
         0kefb9TrvCM/ut7c+05tCmjttSk8wHSv3+PhHArLD6LswrXuJyD1u3l9Ii2SnKwnIeWw
         8tSjdfQ3vRPaRODvv5V7I8UGJIy8ObPcF9j7EKHvXIUqaRShFM6JFoJcjcpTEynMBS+H
         RyHeobK3wOEmC7c32SE0eKN4aJ7irbmgjGSOtDN5H5p1a0Lat29e3oZw1/byLYRzacOc
         UUBoiC3WTftp+joh16VDx4k4nAEinFVxibxmTjCyE7gRCnJeKl2KgJznvhQ3MeKFvAw0
         ZNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yZEevvATeyx4ZSaN3FdanyYz5VyC3TH1Hpg2H4adZxs=;
        b=UUlkRq1vN/u4ao93GlO13Pow1qAEceLF4t+F1VvcgQLcQwp+I5A2IcDqFAzvjWvYL+
         9saNx4rVLGsT9DuCO8coza5Mj+Tx4vH7iPXIxe7+rK35rZW8Tu4sToXZflRmgKW9n+MN
         qelVGaf0L5ykkb1LVnbvH6Ufp+M3DEu2t6RMzXdI5l2UfYVq/8rKNMH+tjVr3sNusz5q
         JGd+nqFnX9S0JHoMppI9btc64d2Qf/BmimCKmGu3l14/JEKcgST9iJbhZ5w2tC765wM+
         PGOEq2pvgx46W+qLwnk7FsJ/UJmZfZRVhJZusAiPBSNmnClT3NDbcDsg7z+R6ZC2CW1j
         4Rzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0Le07m7bDPs8nyuEmuS0Sym0zQea1wVtokGYde46oHUqH7OkN
	K+pYionWTxB3KFyd0WjgUO8=
X-Google-Smtp-Source: APXvYqwT3j+Dz4dA3x6tz1wzoJi77PtoC3e1cat7PXJEsTfF7/YbasoudybeVQtYZa9NdcIxlWjhSw==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr10523012wmi.149.1575641157136;
        Fri, 06 Dec 2019 06:05:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls2537499wrm.11.gmail; Fri, 06 Dec
 2019 06:05:56 -0800 (PST)
X-Received: by 2002:adf:9b83:: with SMTP id d3mr16086833wrc.54.1575641156367;
        Fri, 06 Dec 2019 06:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575641156; cv=none;
        d=google.com; s=arc-20160816;
        b=YeVC8jh4/E+/1+nKt4FSXIH+cJyL+fhLMnO7pKiPtYd+SzAf4SEkdIToy854GAiSnj
         ZuRR2UKslX43pavTAjf1VabIfwIO9jAgAryiYr4GRUBuXlREE/nEKIKivD+KD9JkDDNI
         PfeiX4b1AxrUNO5iUj5im6EJVB6ShxIkMeMnEmqkkffwVH3OfIT3NoopXBAp0SMvlF01
         BWGr6h4IFGx1kyu2ITGLC6ZqFv+9yYbKF/KNM3rXzjNOUk7Bma3ibmF7T9G1abTNnh24
         KagAxXGPy4U2O4iY/zBbgL9vOhg1J58NImKhwMK7pJgPpCwlBrUoujrNvzUd4tP9qPQ3
         774Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lU6XFc8OGqQMTQSRJPYJIKWBMCA6JDRHikDIQXD3VoQ=;
        b=un9iX+Od0Hq/4IjrFDYCdWyJlRRPZEvxRkzgj8YlRlVNHg6/4CuqWIGha7DsRVvzPT
         8GMuAdQfhm2UmNCzqR+H3KRIbwl9JsIDR0e6l09rkYD7mP3YAWhmO7ahGT6F5E9Lwvzx
         aTu6wdZ/vSmiXZT9uNDd0U/4OG+JfL6FKS4nsQC0iRqeEz9ASECEdhQIWKrUtSOqiBX0
         DnuCsVTgxlbDTSpEKVuA1VlmlqfHhmKCNELDB9wk9BowUcaFIrCZMxbOUAYsLgs5fQtr
         TzYXGHgtOWJqeRKiMbSsEBHi63c7J7t+Vo8lfr4rJ+M2RNA5hfSExduqKqXsK2Pq+83Z
         juLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id m12si819721wrq.1.2019.12.06.06.05.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 06:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xB6E5tLB020432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2019 15:05:55 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xB6E5tX0005306;
	Fri, 6 Dec 2019 15:05:55 +0100
Subject: Re: How to obtain two console in order to control hypervisor smoothly
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3374d7a8-6d73-4d2d-bbee-87284dafd217@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a7c03e61-768f-6071-5ba8-9c5be601c32c@siemens.com>
Date: Fri, 6 Dec 2019 15:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3374d7a8-6d73-4d2d-bbee-87284dafd217@googlegroups.com>
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

On 06.12.19 13:16, Saroj Sapkota wrote:
> In the Bootstrapping Demo I can see that in the Qemu-Kvm mode there are
> two console one for displaying output and for controlling. I tried
> really hard to do the same how can I get two console, so that I can
> control the hypervisor easily.

In the QEMU/KVM demos, such as that built by [1], we have a virtual
graphic console for interacting with the root cell Linux, thus also the
hypervisor, and at least one virtual UART for printing hypervisor
outputs or even interacting with a secondary cell that gets that UART
assigned. Another option is to enable ssh from a second machine (can be
the host system) to the Linux instances in order to control them and the
hypervisor.

I would recommend studying the generated demo image, its config and its
startup script for details.

Jan

[1] https://github.com/siemens/jailhouse-images

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7c03e61-768f-6071-5ba8-9c5be601c32c%40siemens.com.
