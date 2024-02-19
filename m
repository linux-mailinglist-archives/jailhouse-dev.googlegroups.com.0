Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQ4HZ2XAMGQE4Z674XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425D85A909
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Feb 2024 17:37:25 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id 5b1f17b1804b1-410d0660929sf22158055e9.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Feb 2024 08:37:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708360645; cv=pass;
        d=google.com; s=arc-20160816;
        b=TGlNPFSjhOQmnRit/0eW1h7Cvp7F7KBfLWtGYcdc5baRRooh7GXHYYF8sCx58safnc
         iF3BdJ29gGx/P5Q81vBaYssHb7HWKsaK+w97w5PaxszJguspABfRZILVgBqh7xvc/TnI
         B4qSK+H+SUZ78oSI3l5qiep7oC0NkIslgqnct1vj3BdVKVF6or6okQZoQUZzihjTZfX8
         Kg1WAj6Ig2jeQvdKJVsVZYAqs3zZ4PEShh+ThvecNZu1cS3gpcOTcZrrPJJWU+30OXio
         X/MeqhRs3sFuDZlzfYVegno8hwGAfPRrCvHEAY3fPQr9Hi7yOsukafg3pyovcNAvT8c5
         l+qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=W+AYLN1D34d4OmICXDhvxLiA00M/wY9Fagg5uWo1PzQ=;
        fh=OXJA/0rXE0IpKfMTDJ8rAmBf9y137ICSI8FxvyiK0EI=;
        b=FKLuV1PG1JPCn0zp8gtcjEuv+Q6P+H3qR5wHbv9x4axcuciICYrtkoun4h2HxGCzA6
         AO2+UqKbeaMkmFyz/0AUdo9FMI+EZiM9n1npVIw6woYcLQcxR1Xb510dXrU9hrHCv/lv
         FgZOQ0G2Mlyv1kEjk5ywR73xIzttnkKkhYU9ApHe+RX351r3OHK07irObjwhvGr51xuQ
         KC1pQgpPqfeRgy6IAChzSiUv2UNUAq8Pmu1YxxyuOrLoNHZXBv4DRHEcMdReYoW+n5FF
         +AiXjLxHIyTmMmBq52pGB3ZSA7Gfx3GPPBSd/SKLLsG5n5nGJnt0wv8PqmrWKqmrqAai
         ecAQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P77UBLww;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1708360645; x=1708965445; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:content-language:references:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+AYLN1D34d4OmICXDhvxLiA00M/wY9Fagg5uWo1PzQ=;
        b=OkCIA4iZqEGY71CXYdv5EI3PyNHs2WSgmS+7Xk2Yf24O3+1kFoiTgu82RMTMeNo47c
         CSo7mcbZklfqqO8JHhm6AK3mzY7UmwB6xfVYHv2AmNnh1HK96RO6dzl27+WJNJSvTFAT
         7DatkSpY92zEoiIqsj8SEZljsqV8pnYeHuZCC9yNxWd9pevqW1NpxdokCVwpffywBlHa
         OzNVZ2Wi87sGLN9gztot6pd4E/zFrjIJh4d/Y1ekHSwJcgljK2csEvxlgTAAEC/R+fY5
         Af2r+58Ua4NULqamkvNKY7OVnOTTC01HsIc5l464hlGHEDcUeXdDFgPkgb8h1ItdPpr0
         6aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708360645; x=1708965445;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+AYLN1D34d4OmICXDhvxLiA00M/wY9Fagg5uWo1PzQ=;
        b=m0IIaQ/1Bp8d0ZZvy5UmA8kt0tl+nXUzNN8SKdxr8SL6Et3yL1Px27D8yi+4tuqFWi
         PE68qIUPs9cxWISUofm3KEuakQO8aaK5YKnXB5mVH50u+qn92+4G9Ikz6n4XIkS84oDH
         nRyOWRCdUSFK/2bJk1AW/+iVBxtbCeEWMr+DT4iBvNDU6X9i//UxkruGnmkRJjzt9xMF
         1iwMjYBzIdF9GCKSp/I8veeXCJEE1iELi1dp/Im/Qum3yfJCx1GQhrTvHeSiqr28eVEf
         MYmRmKl4eFUA6ZYlN6LRZvpcnJFP8cOPds4e7ABBWpP58LxEoHdVZhNaVFru62k4ulCE
         K7Dw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVK1vcUvzCYTfD7/X+cd/7CYAx9kYZpLNVfDhUAc4UoE4elkCl6mCLYnp6XtzAEqhA382Npd/LVnJeOZsfKd0fUT6d/QL75paPPfpo=
X-Gm-Message-State: AOJu0YwbYawuIimc6If7O5mRsCTX5NhWOZ9TJDG8cQlB0ZXb5t3VpxEO
	+RD+iJ2QSeuBhTRN8sDd4dR2GgEY2FcdlYUUASxiZ8D/bImc6A0P
X-Google-Smtp-Source: AGHT+IHHZUo83hnOYjC1zLmnMhgW5Jl+5XNP5ahH9R6eTkSvz3UeJMVzM6LIc9HYU68ApaycUM/UXw==
X-Received: by 2002:a05:600c:4f91:b0:412:5f08:b508 with SMTP id n17-20020a05600c4f9100b004125f08b508mr4896588wmq.9.1708360644294;
        Mon, 19 Feb 2024 08:37:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c1e:b0:412:3dd2:4cf1 with SMTP id
 j30-20020a05600c1c1e00b004123dd24cf1ls1308559wms.2.-pod-prod-00-eu-canary;
 Mon, 19 Feb 2024 08:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV98OIJyWf08dh0WgZEDiYNWmydN7Xyi6SNq+zte+RkYYySBXppgiQxJJ/q0bEovnFLoE74+2Iv2lxNUAZx1jhbQWH6E65W9jLcb2rrVIk=
X-Received: by 2002:a05:6000:1c4:b0:33d:2ec2:f0ee with SMTP id t4-20020a05600001c400b0033d2ec2f0eemr6204598wrx.20.1708360640946;
        Mon, 19 Feb 2024 08:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708360640; cv=none;
        d=google.com; s=arc-20160816;
        b=KXl2lBYEEZN44tv/sYPXo0c2YUA6DRllZ7Ip7egYIvXGjBnHrhvnFtxIyX5eNagUO0
         SkxiKFG+6pQ/pHPtdAlFP7KFSv985nG31eOpY1RZOYcSJnt2Rc+w3Wqs/O6N0d0WWVNd
         HF8UAtXzFeZCEUhpFcUcxty2Yncqs4IJz0Auz9C+BuMstpz3alvAjGkR0LK8feIPfJgh
         DZTEeBgPcLMHKeL+ykpu8YtXAoIrgfV/v48zqZSczdI1sV1JU9tUB96Cyzv9MVYE2PPS
         3hP0oxzrtPn7O1ag+nVht4MxlOu3r/DqbiO7CZvuzp0ze59xBDtPT19VYWH7FrFsle4Z
         0wOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BOOMHUKjwJT0FFPbMxxkYKwWba2Yieeqz1UI01fvxdQ=;
        fh=PKILhLSz2K6Sqm0d1RuwATLk0aN8rkKqAXg6G47b8Bg=;
        b=B+KyBq8Ou6yC61LWRhwKHCjMtLLL2kddCEFsrEjvVCpbfrSY6SDwwtCyhnmB4z/Xvm
         Uhm4JFgzU8PjmU+v3dBiZ/PrQcNMge3GA7kjfYnuvTXWkOYf6M/IHP00iJIQMsCmCyUM
         RFVNoO7YsArCDFGroZvJPM+9uvwXt2Rj//IkBf8TwRrs93T5Jcz1jeynjWOAXPjxkito
         GN9SOe+EfnsFYC+ehdSagKAyezus5OtZSnCZRrQSvfs9Zcb8BySx8c/EMaOjqo0i1322
         OQzG5C9YTJQ+56G96EzZB+ZzDaEe8oIT2dWh2GIqWuknn+gs00k3cqm8yyy5mxyTeUzx
         nl+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P77UBLww;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id l11-20020a05600c1d0b00b004125e283926si181508wms.0.2024.02.19.08.37.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 1992F2A018F;
	Mon, 19 Feb 2024 17:37:19 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Tdp9C4l18zxt6;
	Mon, 19 Feb 2024 17:37:19 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 17:37:19 +0100
Message-ID: <07316f61-b354-4297-b364-6ed3688760d5@oth-regensburg.de>
Date: Mon, 19 Feb 2024 17:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH] configs: x86: align with recent qemu device
 model
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20240216193643.1524594-1-ralf.ramsauer@oth-regensburg.de>
 <50ceb5b9-dd2e-470b-98b4-2c3b028d534d@web.de>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <50ceb5b9-dd2e-470b-98b4-2c3b028d534d@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=P77UBLww;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 18/02/2024 12:03, Jan Kiszka wrote:
> On 16.02.24 20:36, Ralf Ramsauer wrote:
>> Devices slightly changed with recent Qemu versions. Adapt changes of
>> device topology.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>
>> Tested with jailhouse enable, create, disable + apic demo.
>>
>>   README.md              |  2 +-
>>   configs/x86/qemu-x86.c | 80 +++++++++++++++++++++---------------------
>>   2 files changed, 41 insertions(+), 41 deletions(-)
>>
>> diff --git a/README.md b/README.md
>> index 2ab2a60a..f6fe011b 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -255,7 +255,7 @@ https://github.com/siemens/jailhouse-images.
>>
>>   The included system configuration qemu-x86.c can be used to run Jailhouse in
>>   QEMU/KVM virtual machine on x86 hosts (Intel and AMD are supported). Currently
>> -it requires Linux 4.4 or newer on the host side. QEMU version 2.8 or newer is
>> +it requires Linux 4.4 or newer on the host side. QEMU version 8.2 or newer is
> 
> I'm reluctant to bump the requirements that high, given how many distros
> are on 7.2 or even 7.1. What about starting to use versioned machine
> models instead? Say, 'qemu-system-x86_64 -machine pc-q35-7.0'? Similar
> for the other archs (virt-x.y).

Turns out we don't need that patch. My x86 Qemu test VM was pretty old, 
and I missed out the qemu option -device pcie-pci-bridge. With that 
option, everything seems to be fine, even with most recent versions of qemu.

   Ralf

> 
> Jan
> 
>>   required.
>>
>>   You also need a Linux guest image with a recent kernel (tested with >= 3.9) and
>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>> index cdd3dd6d..7a585bd7 100644
>> --- a/configs/x86/qemu-x86.c
>> +++ b/configs/x86/qemu-x86.c
>> @@ -179,52 +179,52 @@ struct {
>>   			.size = 0x4000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
>> +		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
>>   		{
>> -			.phys_start = 0xfea00000,
>> -			.virt_start = 0xfea00000,
>> +			.phys_start = 0xfeb40000,
>> +			.virt_start = 0xfeb40000,
>>   			.size = 0x40000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea40000-fea5ffff : e1000e */
>> +		/* MemRegion: feb80000-feb9ffff : e1000e */
>>   		{
>> -			.phys_start = 0xfea40000,
>> -			.virt_start = 0xfea40000,
>> +			.phys_start = 0xfeb80000,
>> +			.virt_start = 0xfeb80000,
>>   			.size = 0x20000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea60000-fea7ffff : e1000e */
>> +		/* MemRegion: feba0000-febbffff : e1000e */
>>   		{
>> -			.phys_start = 0xfea60000,
>> -			.virt_start = 0xfea60000,
>> +			.phys_start = 0xfeba0000,
>> +			.virt_start = 0xfeba0000,
>>   			.size = 0x20000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea91000-fea93fff : e1000e */
>> +		/* MemRegion: febd0000-febd3fff : e1000e */
>>   		{
>> -			.phys_start = 0xfea91000,
>> -			.virt_start = 0xfea91000,
>> +			.phys_start = 0xfebd0000,
>> +			.virt_start = 0xfebd0000,
>>   			.size = 0x3000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audio) */
>> +		/* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audio) */
>>   		{
>> -			.phys_start = 0xfea94000,
>> -			.virt_start = 0xfea94000,
>> +			.phys_start = 0xfebd4000,
>> +			.virt_start = 0xfebd4000,
>>   			.size = 0x4000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
>> +		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
>>   		{
>> -			.phys_start = 0xfea98000,
>> -			.virt_start = 0xfea98000,
>> +			.phys_start = 0xfebd8000,
>> +			.virt_start = 0xfebd8000,
>>   			.size = 0x1000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> -		/* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
>> +		/* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
>>   		{
>> -			.phys_start = 0xfea9a000,
>> -			.virt_start = 0xfea9a000,
>> +			.phys_start = 0xfebd9000,
>> +			.virt_start = 0xfebd9000,
>>   			.size = 0x1000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>>   		},
>> @@ -264,6 +264,24 @@ struct {
>>   	},
>>
>>   	.pci_devices = {
>> +		/* PCI bridge */
>> +		{
>> +			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
>> +			.domain = 0x0000,
>> +			.bdf = 0x0000,
>> +			.bar_mask = {
>> +				0xffffff00, 0x00000000, 0x00000000,
>> +				0x00000000, 0x00000000, 0x00000000,
>> +			},
>> +			.caps_start = 11,
>> +			.num_caps = 5,
>> +			.num_msi_vectors = 1,
>> +			.msi_64bits = 1,
>> +			.msi_maskable = 1,
>> +			.num_msix_vectors = 0,
>> +			.msix_region_size = 0x0,
>> +			.msix_address = 0x0,
>> +		},
>>   		{ /* VGA */
>>   			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>>   			.domain = 0x0000,
>> @@ -283,25 +301,7 @@ struct {
>>   			.msi_64bits = 1,
>>   			.num_msix_vectors = 5,
>>   			.msix_region_size = 0x1000,
>> -			.msix_address = 0xfea90000,
>> -		},
>> -		/* PCI bridge */
>> -		{
>> -			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
>> -			.domain = 0x0000,
>> -			.bdf = 0x0018,
>> -			.bar_mask = {
>> -				0xffffff00, 0x00000000, 0x00000000,
>> -				0x00000000, 0x00000000, 0x00000000,
>> -			},
>> -			.caps_start = 11,
>> -			.num_caps = 5,
>> -			.num_msi_vectors = 1,
>> -			.msi_64bits = 1,
>> -			.msi_maskable = 1,
>> -			.num_msix_vectors = 0,
>> -			.msix_region_size = 0x0,
>> -			.msix_address = 0x0,
>> +			.msix_address = 0xfebd0000,
>>   		},
>>   		{ /* ICH HD audio */
>>   			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07316f61-b354-4297-b364-6ed3688760d5%40oth-regensburg.de.
