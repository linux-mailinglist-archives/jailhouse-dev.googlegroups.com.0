Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2U667YAKGQENQSXZEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D775413AC46
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:25:46 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id d8sf6505470wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:25:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579011946; cv=pass;
        d=google.com; s=arc-20160816;
        b=j4s8rQaac7ndHhUxagrnWjv8F5UzuWgAtHjvbIQj0x7hV8d+EOAkCYroy2O6LcFHzx
         Qm1z+EpljjhOV4LIZTF7zuKBn36HXBHUJJc2quuI4MWSqq7ltA5OK3prngrlovlvK2Kw
         LVuwSWJyCkvmUCFz+BQxkR+meq37RbxBT6x4U1mZyd6LjCraCpMbkvKTuHZsQWmPQStu
         /uXKJdiptPt8Kxlo3lvT56Kuz/b5SPo5qJpNjNgabe6KDcvlqCzbcx0KZ09qYeTOZ0lP
         qBWaBZ/T72RiKZtPoiroxwpQlxRTQBuhd+3eU/W2NkpoLji5ksA01igRwATG3t2KLG+c
         +kBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=PrFMQKs7fbUkhvjCqFZirPQ/7J2LwZN2V9fXOVGdbPQ=;
        b=q0KaPw+9VJiH+Dw9ykBIrcTbOWw4rjduqyg+sGXoXVeM8YFCGr93Lh/QI/S/FgeSN0
         zHoYI6wyPds6qqyTiMSV+ndLbz7LVE3tWIgXUWVAUxgZcaHEq0t0Nnvt265y7Ds0S4Ou
         wsC8cYmNDSqO+74jULOQOcsaMyxPCaD3VP4uVV/DS1dGYgxbHHB+6We/SjMlRc+pkZiD
         yY80FVYIcmBQVk0/lOWOZ8/Qfhj4mjXFHX2rlFuJ5QNJBf78yziITOUs3aQWp748hJsc
         mSZ5LJ+v+UxbOt77E3Qu8ApFzNb3hnqYFDNrAus3A/HPoU+P+zSrZ31jr4Y/3aWai0iD
         6L9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mgQ+xyb7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PrFMQKs7fbUkhvjCqFZirPQ/7J2LwZN2V9fXOVGdbPQ=;
        b=BrDi9aajELfOV+sxuNsJ+aX53vhOhmkkumw73P4GLb6ATNFXa1AUErE9e/s8VsfaxK
         FHUoFWTT3aEy/v1pZfE/Ci+Lr3GNdKnB4pW8vGrF9aIN4IvnGcA4j3LHHRWd6CYPfFiq
         V7AFitgE9qEWt3mJWRfoJmV14O8WqUREV02DRJOJjHVBUHUN5CSDxYZu2HU6S3joASks
         znieKogQxjd3YwY9Y8iiHt40qz3TFvW9gx8iyXZ40t5MTXky+/lMNbAkIvZBTKm6HH/P
         L2fluSe3+s5obxWQiHD+eUPNpaNB1VEpJmn+6VwHllPXQsgwBWBdgUpdbjcEoxfbpiWb
         FW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PrFMQKs7fbUkhvjCqFZirPQ/7J2LwZN2V9fXOVGdbPQ=;
        b=rRtgaTiuaySNzxzMO6dyI4Re2M9FGKO4ARhoqRKPnzzuQcHGbPcOmKGqqQyGEt2Pj3
         q7n7R4xxZ/1kpAn3qqsio9ruBX4Th0Lb5Dhv8lHVEmVdTK6VzT1wdY9y0JcyjQI4Csg/
         +CWqodHnL/SHwMH2Q0bTV59jHLSlpfgjuJdR/el97M6zYp+33kYe0OZOjzotpwBskVJs
         MDuepMBBpxdzojnaK7DcWQO5JfICsBFSpiyH/3GRB04C+fzpBk+h/0eMX9KY+w5xyxSG
         uDj6mAtOVTJEZ5MHcAFUBPQoy6TAAKu71DLf8/U0Ys8TCUBAZCHvuiweM+8BQrziVXyg
         zHrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVwPmoSKh3iZGhBS1f2rxn0D56gSMyi2+a6CnAMGen9goOH1Pb0
	fL1SCe3KRGwlIH7RpF2g5E4=
X-Google-Smtp-Source: APXvYqzT2efdb4Rywe9CpwGxZRCqPdWL+lw+MqBUNt8D9v7HGjeZC8TBseIWFU3oGjn9TiPqUa35JA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr27217538wml.3.1579011946542;
        Tue, 14 Jan 2020 06:25:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4fc2:: with SMTP id h2ls5686409wrw.2.gmail; Tue, 14 Jan
 2020 06:25:46 -0800 (PST)
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr26668484wrm.80.1579011945934;
        Tue, 14 Jan 2020 06:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579011945; cv=none;
        d=google.com; s=arc-20160816;
        b=CbvMqxkZ9Zwy+11Y0p3rPDB+KYkPgrV1MFeGOYli9PXgItCEG4BgoUpQB/jdO/LWdx
         yA1WVjTe3B7T2rjEsmlQmrfqQzfvjZ6BP8wv3YTkyqT101TjjBmQchwtuDmMeoJ6xaOL
         KZ+qitEwgCAyVx33D9uVuPR1SLm4c+GWOVADvMCgQILpzUjKo6Ls0XfvspZic7MeauDN
         j78CbV08GfDGNbQhuovXAlwKF+IPjIoc5JQSGfWVvJHD+Wbv3DHJGLBQ0iHqx2eluroG
         W0ZmcG65rvbuH8V2ryD4WaXTLcj/djQgjtQadyppoqViVO153qvJG+mkS0MUWc8aJbjI
         2Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=PJG6iJHa75LALx1vP1SEdEBDHyvUEFtNvcvlim3daeQ=;
        b=gDEzWj1Zs3YeZ6sgMd42bpeVVcHPMJd0V8in/ELzCHnefoIo2LB2u1lqXFXDCllzWS
         9zfPmeGyiqkFvwLGFEdqiOFN0JnItVp9jxEtHSF4t7MM6+QMURXJzf4mensmnuDaGrcV
         0L2MyuxTmNlErup+guc4W5KvF+ZqQBb7EK5alQjpsQu9gIiBVGKB4i6xoR7sXiJ9+Pwu
         04Z+aZqGOkTVeYL+oUqt4tm9vct2fbQh2jVa7XQczcSubG3BXVfXqrg2VdWI1ihgI8Gu
         g7J73WrMEXdobvabwak5hS+dA5v3g8IiVOBNT+PgDDbyoV5p7Wr4ny89Ag5kPx7Q9ihe
         ZSug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mgQ+xyb7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id w11si715947wmk.0.2020.01.14.06.25.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 47xt6J6X0fzxsH;
	Tue, 14 Jan 2020 15:25:44 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 14 Jan
 2020 15:25:44 +0100
Subject: Re: [PATCH 13/38] core: ivshmem: Use device ID from config
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <f25565207c0de2d7c07a755c386d3039f2e0144a.1578313099.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <4044e3e3-829a-a5d6-c6e1-7995b6e320f2@oth-regensburg.de>
Date: Tue, 14 Jan 2020 15:25:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f25565207c0de2d7c07a755c386d3039f2e0144a.1578313099.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mgQ+xyb7;
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



On 1/6/20 1:17 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Convert the creation order based ID assignment to the one now provided
> by the cell configuration.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/include/jailhouse/ivshmem.h |  1 -
>  hypervisor/ivshmem.c                   | 13 ++++++++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
> index 45cd3c4b..dae67f44 100644
> --- a/hypervisor/include/jailhouse/ivshmem.h
> +++ b/hypervisor/include/jailhouse/ivshmem.h
> @@ -29,7 +29,6 @@
>  
>  struct ivshmem_endpoint {
>  	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
> -	u32 id;
>  	u32 state;
>  	u32 ioregion[2];
>  	struct pci_device *device;
> diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
> index 7bebaff4..45306b85 100644
> --- a/hypervisor/ivshmem.c
> +++ b/hypervisor/ivshmem.c
> @@ -99,7 +99,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
>  	switch (mmio->address) {
>  	case IVSHMEM_REG_ID:
>  		/* read-only ID */
> -		mmio->value = ive->id;
> +		mmio->value = ive->device->info->shmem_dev_id;
>  		break;
>  	case IVSHMEM_REG_MAX_PEERS:
>  		/* read-only number of peers */
> @@ -326,7 +326,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>  	struct ivshmem_endpoint *ive, *remote;
>  	struct pci_device *peer_dev;
>  	struct ivshmem_data *iv;
> -	unsigned int id = 0;
> +	unsigned int id;
>  
>  	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
>  	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
> @@ -340,8 +340,12 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>  		if (iv->bdf == dev_info->bdf)
>  			break;
>  
> +	id = dev_info->shmem_dev_id;
> +
>  	if (iv) {
> -		id = iv->eps[0].device ? 1 : 0;
> +		if (id >= IVSHMEM_MAX_PEERS)
> +			return trace_error(-EINVAL);
> +

Shouldn't this check happen unconditionally? IOW, directly after setting
the id from the configuration.

  Ralf

>  		if (iv->eps[id].device)
>  			return trace_error(-EBUSY);
>  
> @@ -373,7 +377,6 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>  
>  	ive->device = device;
>  	ive->shmem = mem;
> -	ive->id = id;
>  	device->ivshmem_endpoint = ive;
>  	if (remote->device) {
>  		ive->remote = remote;
> @@ -447,7 +450,7 @@ void ivshmem_exit(struct pci_device *device)
>  	} else {
>  		for (ivp = &ivshmem_list; *ivp; ivp = &(*ivp)->next) {
>  			iv = *ivp;
> -			if (&iv->eps[ive->id] == ive) {
> +			if (&iv->eps[ive->device->info->shmem_dev_id] == ive) {
>  				*ivp = iv->next;
>  				page_free(&mem_pool, iv, 1);
>  				break;
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4044e3e3-829a-a5d6-c6e1-7995b6e320f2%40oth-regensburg.de.
