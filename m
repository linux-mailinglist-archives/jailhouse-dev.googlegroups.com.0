Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFVS7P4AKGQEMT4U3CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id A240B22ED9D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 15:39:34 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id p23sf829321wmc.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 06:39:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595857174; cv=pass;
        d=google.com; s=arc-20160816;
        b=iGEbdSiovUQmRzoGRJduvIWo4inqW1a6oWmNPpT4GTDITZdfplUM4aRh+Jjv+7q+zm
         AaUZUWhxNuUtb63N0u0YVA6l7xnDMrf7KsQ6FGLsSRoxf+BKBf8b+siNRMf9uLS10S8G
         dHhFDRcdhIU2AdtkDVfVM4Yh2iKcXy1V1kLlP/VjHfzuh1+OR2A1S9ITvyT4YOB1q/21
         lsUwll8Qs8h8vqAwFoj7gTPT0E9HCS7GdfXEGcnfMkLaN4CLRMJN6d/ql466KMqv1PEM
         z7Jb0uDQJkDqx+XiPqLE4RujXIFesU99MwNg/Uj0YGw1W0bzI4C4XUx3jmsBOnHJeEBY
         JWdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=n5/B9gzm+zWp35ym8bSphbvHKY3Sj+3wY5LNFHrnroY=;
        b=CQFa2/YmstdOuJnqo3Bj6v4+NkQoP6LEVAR+i/mJ/+Oyjpj3kzT6+fvA3t93fLTaKt
         xMT0/7lZxzv4fJ2lCYw6nG40SQAwtBcYiiL0THejnOwCV0+3MITZmBA4AB0CZ0Z1Xtay
         wOophA4pwg3hI9A8j7yOs7Jm+XAjDKYkDLI7bPrOqFSo5ENjX18nrmb1rV/ZowvAMjoY
         unKZj0EsObmNYYzi7hL+R0sEBbGO60LSxNunzFRUWAjDBIVrFoMtUKN1x/sXLc6Q5XKH
         877O1ZvXqw8iv9nuwM4bg7E8qyOi2MbxPC8Qxq9jPaZLdYffZ/42GpNP5BQpDRSuZVoQ
         AJtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n5/B9gzm+zWp35ym8bSphbvHKY3Sj+3wY5LNFHrnroY=;
        b=FBJtgZTX8wIGfmoQ6jv3jKnQVue15fclM4ebYAWbwmF2UZa5Hl2proV0Db+GNOJtXF
         mypZTMLwcMiIwPR1i4WjFgncXgHq8fPixB6hbtJVKPwkjLiBxY1ysq8vQSKqd3kUaheB
         ipsCwLrqdm4qcONoQxABP0cm0sc9/lXzSY+FD6ge2unaRvIozaOm/Y3e9VBLEQbUsIn4
         3perR+V/bFYfi3setaREGNGDRLno7yI3nGf5071GfTMdPcNCnxWFob5pFS1GWvoxldVN
         S0lWRvNW110eIG0BILN03osJIN/lxqKI2azyziRL2rMkt2MwmJVuvITly6KWQiF7FSSt
         LbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=n5/B9gzm+zWp35ym8bSphbvHKY3Sj+3wY5LNFHrnroY=;
        b=SzXWDBcQO7o246qBkP5ARk66oozijLIoR19RqP6yFEA4Mt4LA6T6FMLCMakmIieY5A
         8Jm/67ZF6NQeNIfGR3RPnv9hhGRxpP/tQUrQUFZzIJq0JhzhjPUQyJxyVqlCokYBsLX3
         ldxeeaEBUqcvzBxrL2Q89MsHRA0JxmQOqJxQDzllNeVhJPX+q/GbYT0BQ7DCFplviYhs
         XQNKEXPHqQKqIVr6xtyQ7RVN/0BCn5G9ogKnd0+Br6Ijh1gggDUI15j2wS/CJT2FOW8K
         3UJKErAyvvZYNvPu1FPpfRKT18ZAc89RXv4Lx0SJdSoCbVXo1Lyx9wKk8SLx5i7nir8c
         OcPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5310nNGqoBt+cwwLFK5bmZeXeF7+T3cQrcDR9em4Tu5zedR++mX8
	9nvQOfSDAfjWt8x/7eL1zs8=
X-Google-Smtp-Source: ABdhPJxhmpc1XjPzYBOTEczBodlxOqWNQT5QDRLdFyaCgA2xG9MvJmUx/CUd45/hsNzu76nzDdc8+Q==
X-Received: by 2002:a1c:7f0e:: with SMTP id a14mr21480908wmd.21.1595857174410;
        Mon, 27 Jul 2020 06:39:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls8406845wra.2.gmail; Mon, 27 Jul
 2020 06:39:33 -0700 (PDT)
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr20672760wru.399.1595857173748;
        Mon, 27 Jul 2020 06:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595857173; cv=none;
        d=google.com; s=arc-20160816;
        b=uCS+K3Ktuvfvt22bgCIWvJeh0Q0Uq9Ve/uZ6Kxk/1F2EWrsdmN1AFn75CO2ucEY9n3
         kvvvwe/EVkp6Tqfl/ceQojfGCZ7Xxn+rZ3oVaV+knmDIXTWUKD63zKKpzGSbqWmNpnG1
         8zkJcUq2WCh9i1OtEhDQLvEsgwsAH92JDF5FzDORrVMjlbpNPeig1Ed4TRasQheXBOLn
         Y2a1n8a7QHwSMjoAvPYDb2V/pv4TMUmhuZbpcppTdCA6y8XwLWKowNcZ+tXed6ZcNx8X
         1YE+HnWeEYmsONpRHF6xztTy6Kh7fRJZyTwslDw46BhfjKft1Mg4JN0PHjVX+ec0ies9
         lJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=OdZgremJ9B5qQYjLXjyul8PP+689ZYPnjOEGyn4j2K4=;
        b=yagpNnG6nUNpAgH4v1v9XP0jxbteNdceZ5Aw//m0x5Zc3raDZVjz9nGzeJthFaETy2
         3SKzEc8ZzvEy5iFViW/GYx5tnVhvPpvjRwawSoLxAoSHJ6H5oI8+Tspirh0AEg9xWTDG
         sh/XlJfwLdDLpX5Ki+WBbMhJ8LN7/EYmsB5eUCGt9Vfp43E+iSSGFj0a9j9rmp4niDuD
         ddhbAT3SfnnBv/KaQrnxHjn1QaMIyig5P7tixFu5y3fhMfH2T+bfb1136bwxPwIHT62/
         5aZqKlceQKofpLsaP/IFiy8cbsrfhO9DHhNBZODfzKWbqyoMKKjPt0vCyiZ3TcRUln8l
         wEGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i17si462643wrw.4.2020.07.27.06.39.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06RDdXdN005941
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jul 2020 15:39:33 +0200
Received: from [167.87.246.21] ([167.87.246.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06RDdWrc023190;
	Mon, 27 Jul 2020 15:39:32 +0200
Subject: Re: [virtio-comment] Re: [RFC] ivshmem v2: Shared memory device
 specification
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        liang yan <lyan@suse.com>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200727091802-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
Date: Mon, 27 Jul 2020 15:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727091802-mutt-send-email-mst@kernel.org>
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

On 27.07.20 15:20, Michael S. Tsirkin wrote:
> On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
>> #### Vendor Specific Capability (ID 09h)
>>
>> This capability must always be present.
>>
>> | Offset | Register            | Content                                        |
>> |-------:|:--------------------|:-----------------------------------------------|
>> |    00h | ID                  | 09h                                            |
>> |    01h | Next Capability     | Pointer to next capability or 00h              |
>> |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
>> |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
>> |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
>> |    04h | State Table Size    | 32-bit size of read-only State Table           |
>> |    08h | R/W Section Size    | 64-bit size of common read/write section       |
>> |    10h | Output Section Size | 64-bit size of output sections                 |
>> |    18h | Base Address        | optional: 64-bit base address of shared memory |
>>
>> All registers are read-only. Writes are ignored, except to bit 0 of
>> the Privileged Control register.
> 
> 
> Is there value in making this follow the virtio vendor-specific
> capability format? That will cost several extra bytes - do you envision
> having many of these in the config space?

Of course, this could be modeled with via virtio_pci_cap as well. Would 
add 12 unused by bytes and one type byte. If it helps to make the device 
look more virtio'ish, but I'm afraid there are more differences at PCI 
level.

I do not see a use case for having multiple of those caps above per 
device. If someone comes around with a valid use case for having 
multiple, non-consequitive shared memory regions for one device, we 
would need to add registers for them. But that would also only work for 
non-BAR regions due to limited BARs.

> Also, do we want to define an extended capability format in case this
> is a pci extended capability?
> 

What would be the practical benefit? Do you see PCIe caps that could 
become useful in virtual setups? We don't do that for regular virtio 
devices either, do we?

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8%40siemens.com.
