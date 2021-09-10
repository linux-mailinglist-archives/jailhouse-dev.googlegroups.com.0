Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6X65SEQMGQEDPX7O3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D5406AA6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 13:20:27 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id v2-20020a2e5042000000b001def54ff19esf753264ljd.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 04:20:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631272827; cv=pass;
        d=google.com; s=arc-20160816;
        b=hr7JrDWmkrDtJurWfKbfJ8hFr9neyse3jMZEjq54B19OSk+Y3BPJ7bN98IsLgSIUuy
         P05GmYsUGdkymFhVDz/87QpRT7SneEvoP0RfLhtEj7cjcbw38T7ayOXE2969Bylx1BRO
         TePgz00RUbzTTyJA+zSz3d4fTv75vcbfqloVCFshgkuUXoW36xzHJpHedswmHhDHhyKt
         AST9iz27vAGOjXop8WOTCqdt4TwOEDId6/mvHAWjqQDiskpxGan6HliSNWA71E++a/PE
         OsyiJ/d0b9uT88hGu+ryPeuEzxf23MXGS23RZMGo4SlKB/f7BamR21xGSjHWYRLkpE97
         nF2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=SiXC90W0DBl/UY9uDBg2gkQO8rN0bX3wO6OJ7Xu6oGQ=;
        b=WuGx9Wq4Xj7G+nC1fWLkdhuHOaG3ExX9umAoOoCjP+vT95T1gXc6NY64K6gQSarz5N
         mgCFy7g0GWVmezFfSBFwBwJYEgoiY5wgSq2tUZiAQuFMKdRrKxy01aMxnYpeNsHj7ddV
         cIOK/mkRYJQEZN5ctf0NTzzcDUW8063Et8vf52q142esvO3/jyChsAP1uUNm8/sQOFfx
         CY41DttJZJsvigNf+L279GV3vS9mvmbZyWYWlZdiSmw+0CjJoG3j429ixCSOXRo1OSya
         Zpqc/DRZt8Z1y7ptb4GGed/ZaXru5AzdtUSgHZn7C7aNiK/jH/Jzci9FeiRYMe1vy4ae
         9kyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SiXC90W0DBl/UY9uDBg2gkQO8rN0bX3wO6OJ7Xu6oGQ=;
        b=C2zhjyiNSNvmHxmX6Lu58Qu7xWGSz7Bp5wHZM4yRDwdHdM8XBwUGf9hsVclSikB74t
         AdHTjE5738uJWSz3n60YZAYxyWVm8ovpWFSCiFuMiN7sNh+j81UjJQfq2u40UnFsraxA
         jVWuv7UIG958bo84CQQIlbbi9xlHMLPBO8NAqnds0h72bUFbuWxfARgotSFN31NzSHCT
         YX1gH3DijPdgZbIIYZx65oggkLij/BMPLm9C15F2ApTy0VyvCUMt13ozKokVc/SXFLxL
         MtafuE+JOKOFrS3Hsj/Q3u0iLhq9RZcvdzX7Hx4y2/Fd4neG1QZPOBznangtmhBt+80z
         Q2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SiXC90W0DBl/UY9uDBg2gkQO8rN0bX3wO6OJ7Xu6oGQ=;
        b=Bj/uCsVkaizycW1HD41QleiuXYKEbqyKN1bGrC3pzQLNexT5RQnW9R03qxRSj5t+W0
         3CWbqHvSYOJ5l+uf1/82qSfpbClXXMrTLKayRvqMLVbYS2b2YmwGZN3IMPJsn8N74EoB
         4k2pKboK05NtvmVzP2L79+X9+4Bhp1oPQ+v5BlOb1qmiTtoPtagN5oz1WhWMN7G3c5GS
         VkSILLaCQx/xgNqiriCdRMH+aLDd61M2B0o5E/xhnoEFEu9EB/desINbhVDGBwbnrA5i
         Tn37DczB5/c4zWG0tpLASYFX0HuaWA3X2MQLYbBmtIL1/UIJZBC0hGZ14imoGq0NPd8L
         gatQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qqcMuSRvO5pQ7WXdt6pJHX36+sjwkImFK6A6qiI4jlmlM3ADL
	+FsJuQb8BaaARhk9Qd6Y6Fc=
X-Google-Smtp-Source: ABdhPJxrJmg1fzNNnVuGgSHQTvwi3S62O5lzw/WtD5TnYxWnALCw76EkPJGKdglLn7aIkcqHf9B+xA==
X-Received: by 2002:a2e:555:: with SMTP id 82mr3660121ljf.245.1631272827046;
        Fri, 10 Sep 2021 04:20:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:85cf:: with SMTP id h15ls1130353ljj.10.gmail; Fri, 10
 Sep 2021 04:20:25 -0700 (PDT)
X-Received: by 2002:a2e:a591:: with SMTP id m17mr3802931ljp.113.1631272825628;
        Fri, 10 Sep 2021 04:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631272825; cv=none;
        d=google.com; s=arc-20160816;
        b=nKjr/sCTexjFvpG4s199SweImrNDoXpJJkZhsIET4WDHAyBK/GsGcQZbbLFCI9jCOE
         o1z+/9zFIAmQ6dgBq2xjRUmkO+yIJTmMb8R3/8+35eT4rcPlhSEIX8ZaAsdgGh/6joqu
         XW0YRWsFj9wDceDXsGWHIKaP1qn6tanaEOG0gEY1jtkJcmcIAhlKaFYejPwqawDZK+fS
         U2+YneSfRN1xmcLGhZS9F+KtVNMIEkl7DEN5tiojoT6kmsTRwiLD0w/5kpajzilyg/qw
         zyIeGgl8GNB07CRBViajz3SGmIEfHzlmVGM4Ck8q1kBGiQTucxWWb0CROqU4vrliRWHC
         7/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=oogpCzHG0NY3FXs2TaDgksWwjncOCvDwel3ZTpE2eKA=;
        b=PWcmmeVGkeWP5cWKzJagNMXVnfEE/0JzqZQFk9qRT7oc2soZMZuOvypCfSbJXyYrZd
         Sjz0ANP/fQeDUmL/k3OD+Q/7QFN0UQHuFqpJfJ+XtqehoqRp8GpUoqZvqmadgrawMfsh
         50nxh9YIjWUsbN0cGGJ4Wo1gnQKIReGVF8OeAw/6nYUdxYLbjdloTyb/C+rWUEvgSz9n
         ohUq9ttjGCq2TD0Nz3gP22+2m6lsIvhGw3xva1n56VmeZTcTFKGy9bxfW8anCI/DBVtL
         Uz6Q6PKAmtpZIa+bl6CKJvERVcxeNZ6aeCBRyYHc1l+SS+qz3+uZjZXssu7VaUT5z0ZA
         UzFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b1si356433lfs.5.2021.09.10.04.20.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Sep 2021 04:20:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 18ABKO50010937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Sep 2021 13:20:25 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18ABKOEg015231;
	Fri, 10 Sep 2021 13:20:24 +0200
Subject: Re: FATAL: Invalid PCI config write
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663EB3E5EBA4CBBF44D1C1DB6CE9@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <5e385f8b-5af0-444b-0a4d-9904534ed719@siemens.com>
Message-ID: <ad48b412-d8fb-a250-6540-a8d33d06ef49@siemens.com>
Date: Fri, 10 Sep 2021 13:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e385f8b-5af0-444b-0a4d-9904534ed719@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.09.21 12:52, Jan Kiszka wrote:
> On 02.09.21 14:59, Bram Hooimeijer wrote:
>> Dear Jailhouse community, 
>>
>> We are currently running into an issue when using PCIe caps beyond 0x100, e.g.
>> those in the extended config space.
>>
>> We want to write to some address, say 0x480. We assign the PCI cap to the
>> non-root cell as shown below.
>>
>>> .pci_devices = {
>>>         /* PCIDevice: 3b:00.0 */
>>>         {
>>>                 .type = JAILHOUSE_PCI_TYPE_DEVICE,
>>>                 .iommu = 5,
>>>                 .domain = 0x0,
>>>                 .bdf = 0x3b00,
>>>                 .bar_mask = {
>>>                         0xff000000, 0xffffffff, 0xff000000,
>>>                         0xffffffff, 0x00000000, 0x00000000,
>>>                 },
>>>                 .caps_start = 0,
>>>                 .num_caps = 1,
>>>                 .num_msi_vectors = 0,
>>>                 .msi_64bits = 0,
>>>                 .msi_maskable = 0,
>>>                 .num_msix_vectors = 0,
>>>                 .msix_region_size = 0x0,
>>>                 .msix_address = 0x0,
>>>         },
>>> },
>>> .pci_caps = {
>>>         {
>>>                 .id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
>>>                 .start = 0x480,
>>>                 .len = 0x80,
>>>                 .flags = JAILHOUSE_PCICAPS_WRITE
>>>         },
>>> },
>>
>> If we now write to this address, we get: 
>>
>>> FATAL: Invalid PCI config write, port: 0xcfc, size: 4, address port: 0x843b0080
>>
>> Even though the address port looks correct. Diving into the hypervisor, the
>> value of address in hypervisor/pci.c:pci_cfg_write_moderate is 0x80 instead of
>> 0x480. Due to that, it cannot find the cap.
>>
>> The same happens for reads, however, with no cap these are still performed
>> apparently.
>>
>> The wrong address seems to originate from 
>> hypervisor/arch/x86/pci.c:x86_pci_config_handler, which has the following
>> snippet:
>>
>> address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
>> 		- PCI_REG_DATA_PORT;
>>
>> The extended config space, ie bits [31:24] from addr_port_val are dropped here. 
>> Hence, no config access can be done from 0x100 onwards.
>> I think this should be:
>>
>> address = (addr_port_val & PCI_ADDR_REGNUM_MASK) + port 
>> 		- PCI_REG_DATA_PORT
>> 		+ ((addr_port_val && BITMASK(31,24))>>16);
>>
>> Is this a bug, or is this intentional and did I misconfigure the PCI extended
>> capabilities? I can happily submit a patch, but given that PCIe usage is so 
>> common, I expect I have misconfigured something.
> 
> This is indeed likely a bug. Just checked the Linux code
> (arch/x86/pci/direct.c, PCI_CONF1_ADDRESS), and that also considers the
> upper 4 bits for the extended config space.
> 
> I guess I was always under the assumption that only MMCONFIG would
> permit access to extended config space, and all target configurations we
> used to far actually showed that behaviour (likely because it's the
> faster path anyway). Does your target have no MMCONFIG space? Would be
> good to understand why only your system ran into this.
> 
> That said, we could also extend the access model in
> hypervisor/arch/x86/pci.c, adding the upper bits consistently (3 places,
> as it looks like). Maybe PCI_ADDR_REGNUM_MASK should be converted into
> something that translates the register address into the address port value.
> 

I think this can be come more complicated: pci_direct_init() of the
kernel carefully looks at when to use "type 1" for raw_pci_ext_ops. We
need to be careful as well not using the wrong type - possibly even
tricked to by the guest.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ad48b412-d8fb-a250-6540-a8d33d06ef49%40siemens.com.
