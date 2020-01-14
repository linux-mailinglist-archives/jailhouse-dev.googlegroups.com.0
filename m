Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB5B67YAKGQEWLKILNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D113AC51
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:30:32 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id 90sf6496900wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:30:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579012231; cv=pass;
        d=google.com; s=arc-20160816;
        b=aMNTr3O+NIVjULq2qG3bMUItP8hZMSn76xzqf+cmfp9Ag7pPtCmD8vQyp/lkAuY3T8
         F1tB3xw4qjm8nKA0WQA27lMCa/SnVVrs6BgsZW6ka4ZOwp5oxjVWCgYtN/jYLQG+YOg3
         fYmohtTslbPBgIsGe5HuEldY+iKmtIsIVpm3wyprSg2meM77568Tc4UGU+cWd5MPzkQr
         dkQhbeoYQ6+xyo8QBq31gewIWLLNYWNb7Mg2ljoQ5Fz2c0fVir3Hwoebhw/6AA7MzWAl
         CprEksfbq/AOJ4AM1XXNeU1sIKS0RtFb/39X9tQTaaZBTGs9pkCg6LwU9GzARviz2CCv
         zrZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=UQ8AFfAyZDTbPmvWvZhIEBEQQeZn/mxUYzeqVirhAYA=;
        b=eSLZu75AResYmL2eDbfESyrpVSFGCcS9jnBRFL6dmqXoU2WLdYaXhT4KKNuE+FX95e
         OvObB+iuBu07eeVRMmPbgKSimlEVIKn9NjsDDHqplpHT+sFDG95GG9q+aw25bqrDXDU8
         ph0/+/NtotMTbZkNCkAzTdITQzm6qEN/LsAsFw8BehcEy91nlTnNNEuFD/GRmyWch1MA
         cuCFZv5fdauNUCVwShaAYL1umRsPmCskrr8ePZIwIjg3ad8z8K+M5n7snY3HQK+S2yJ0
         16clO7AoBAW08S0Wf1qCsGXwJMRMtTB5x0bscgpEtaSIqVXMvAoJnqgJtgH8Igb+hiDC
         nIdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UQ8AFfAyZDTbPmvWvZhIEBEQQeZn/mxUYzeqVirhAYA=;
        b=BXD1b2jx2UJUKX77dIE8Z6TimLTs/NULixxBYKHTDw3jtUuR6w25zsG/fhphHPkZDs
         I3JDMYDJIkxKaQQZlbhce+S7hatm+fToKIeORVNtYnyHaxlzHMSwJw6o5t6zgfvC5zwj
         BusPddPjYMdDlg+Psk/lYMyDAlICCiK2hLEA18jDMaKIW8jczg9Glyej/7HEY2RjKx1S
         IZQQ8Xvwxy//pSG6j6dEnmyT11ciBG0BUXt+we8SjjcAWJzWbG9KUoML+VOM5XSLjHnt
         Ili2/DnTTE1Xg03cYTc88OqR/NO44C8FtAARmK2IkQB3GqLoLBIRqWKHETfcH7STK/mn
         Qc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UQ8AFfAyZDTbPmvWvZhIEBEQQeZn/mxUYzeqVirhAYA=;
        b=BL55QWx3fiZ8gZHg7Z9vX3tYKFpTaYYPjmAuFgdiqrp81Bs4lyVcA99i0S0ROhD8c8
         BAqCTLh3Ut7oTOASLXfIG7NpGdtydeZ4p9S7zOdHchSsMUYiCXrJaENwLVi9q0zvYTEw
         oPCGWps4chM6Xn9fkawo2gLADGeLG4Rc7T/svpXUKlJoHNuh80skkegiLl0bs4QeS2Ul
         2sCEGCfJ1Ao6ZMKA4YYxXuxUbUnTz4gow65KpJ8vm6J0zBZ7hqRcjCfR/PqBp5kXl5g+
         nycTokK35lz9gjRZKwZeGvWsyEakgk1BAVh/pGdMVmBFPSQFXe2F3iMHphPODLTncmCb
         gkNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0aBFLSI17VjS0HRMpMU81TDNTxB83dpOlxV8M++3kQALJjLwP
	yJQx8UTWqyoELs3F7AEz4Uo=
X-Google-Smtp-Source: APXvYqyLlE0DZMNV7GICDgX067HF/uRIRZ9rd4pfYUsAi1vBr6KFG5eTVtdwDyTvD/0+CiNVyYtKLw==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr26980901wmj.75.1579012231543;
        Tue, 14 Jan 2020 06:30:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9dd4:: with SMTP id g203ls7610398wme.1.gmail; Tue, 14
 Jan 2020 06:30:30 -0800 (PST)
X-Received: by 2002:a1c:2394:: with SMTP id j142mr28304402wmj.25.1579012230820;
        Tue, 14 Jan 2020 06:30:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579012230; cv=none;
        d=google.com; s=arc-20160816;
        b=jLCAZegWxqkjoQWisCVIqthCZbUjMGZlhRn+Obr6XrHyLT1qu7lAEiWzQU9VWVHCFH
         duQUyimlsPXph5MPJD/bKRsswf/68e6eJijr9K6qaafCDDtHkS9OgYNyDbacXKNvrxTK
         /XAuoo1MRkz9hH5r91lg8PEAHi8mWYKgsuO/eu+urJ17epSFos93DR3dZBXX26bVqB2A
         5DC/RlUF4zmZBnakO8RlruW9by5fESzbeVlxptHHPb43uaZ+8b7SyldoCRd62/W8kORu
         JhFTv55A89MfhIny7acGCZ1bkWiXU5mTMtMXGdDhJtKKptk+ofihp5U6D1kGYl3LBQSU
         iaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=iNrX1yYd8g3uQ8K7ey4FdcKjwjTdAh/FlxRFULsd6x4=;
        b=moImpeDvcc9QcrhaN6zgWNTlaCiOVmz4V7TzgHLnMwT1+JCxflspPvOSqh7daSqlk7
         FNLnAq4ixtptLNxs9eNHpsG154ZgJl9CSy5qbJxH/c//ncxNrumoDm1yBull+/UiyCNe
         YcLdmZxT3SnQh5Zu5GlXtTGr7lr9ZTPndrlNBrms3GHnivFMhjZybVWDTijweHx8EwdU
         GOFpFEF8wTyQZ6IarQ3VUU/vo/yWe6xXL1PLGARiLnEBLWJCvFw3BN3CIx2F64mnXMjl
         FGGLp1bo/wP0i0CRdWpr2nTMsWQEuQt6X1JrL8fTvRKgWcvt3xImpHAt3KTKEBIaTt40
         KnPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y185si95689wmg.0.2020.01.14.06.30.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:30:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00EEUUgf008519
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2020 15:30:30 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00EEUUXX006663;
	Tue, 14 Jan 2020 15:30:30 +0100
Subject: Re: [PATCH 13/38] core: ivshmem: Use device ID from config
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <f25565207c0de2d7c07a755c386d3039f2e0144a.1578313099.git.jan.kiszka@siemens.com>
 <4044e3e3-829a-a5d6-c6e1-7995b6e320f2@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <98975fc9-aae8-653b-4d6e-18018064986a@siemens.com>
Date: Tue, 14 Jan 2020 15:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <4044e3e3-829a-a5d6-c6e1-7995b6e320f2@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 14.01.20 15:25, Ralf Ramsauer wrote:
> 
> 
> On 1/6/20 1:17 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Convert the creation order based ID assignment to the one now provided
>> by the cell configuration.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   hypervisor/include/jailhouse/ivshmem.h |  1 -
>>   hypervisor/ivshmem.c                   | 13 ++++++++-----
>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
>> index 45cd3c4b..dae67f44 100644
>> --- a/hypervisor/include/jailhouse/ivshmem.h
>> +++ b/hypervisor/include/jailhouse/ivshmem.h
>> @@ -29,7 +29,6 @@
>>   
>>   struct ivshmem_endpoint {
>>   	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
>> -	u32 id;
>>   	u32 state;
>>   	u32 ioregion[2];
>>   	struct pci_device *device;
>> diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
>> index 7bebaff4..45306b85 100644
>> --- a/hypervisor/ivshmem.c
>> +++ b/hypervisor/ivshmem.c
>> @@ -99,7 +99,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
>>   	switch (mmio->address) {
>>   	case IVSHMEM_REG_ID:
>>   		/* read-only ID */
>> -		mmio->value = ive->id;
>> +		mmio->value = ive->device->info->shmem_dev_id;
>>   		break;
>>   	case IVSHMEM_REG_MAX_PEERS:
>>   		/* read-only number of peers */
>> @@ -326,7 +326,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>>   	struct ivshmem_endpoint *ive, *remote;
>>   	struct pci_device *peer_dev;
>>   	struct ivshmem_data *iv;
>> -	unsigned int id = 0;
>> +	unsigned int id;
>>   
>>   	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
>>   	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
>> @@ -340,8 +340,12 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>>   		if (iv->bdf == dev_info->bdf)
>>   			break;
>>   
>> +	id = dev_info->shmem_dev_id;
>> +
>>   	if (iv) {
>> -		id = iv->eps[0].device ? 1 : 0;
>> +		if (id >= IVSHMEM_MAX_PEERS)
>> +			return trace_error(-EINVAL);
>> +
> 
> Shouldn't this check happen unconditionally? IOW, directly after setting
> the id from the configuration.

Good catch! Will fix on top.

Jan

> 
>    Ralf
> 
>>   		if (iv->eps[id].device)
>>   			return trace_error(-EBUSY);
>>   
>> @@ -373,7 +377,6 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
>>   
>>   	ive->device = device;
>>   	ive->shmem = mem;
>> -	ive->id = id;
>>   	device->ivshmem_endpoint = ive;
>>   	if (remote->device) {
>>   		ive->remote = remote;
>> @@ -447,7 +450,7 @@ void ivshmem_exit(struct pci_device *device)
>>   	} else {
>>   		for (ivp = &ivshmem_list; *ivp; ivp = &(*ivp)->next) {
>>   			iv = *ivp;
>> -			if (&iv->eps[ive->id] == ive) {
>> +			if (&iv->eps[ive->device->info->shmem_dev_id] == ive) {
>>   				*ivp = iv->next;
>>   				page_free(&mem_pool, iv, 1);
>>   				break;
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/98975fc9-aae8-653b-4d6e-18018064986a%40siemens.com.
