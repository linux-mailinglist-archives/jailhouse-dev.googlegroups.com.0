Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBUUKZD2AKGQEP5QESDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4201A5337
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 19:58:43 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id a14sf1923121lfl.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 10:58:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586627922; cv=pass;
        d=google.com; s=arc-20160816;
        b=IsH+WBFxnNm4QUyjXFiOHdEh+1UF1lMZ9U2U6X0NHkLsHqojVCghq6qjTsnbkjD1bc
         EMLVb1afe7UxZvn6CLHVDi/ztnpoIhKiT1wogFzqh+i1YReiXR1kcX6EcpAaCg69bTsE
         7Uiv+F8bGg3xrzf1cPFzI+tCtuEgNtFPtW7Bu1V6q9Mn8QAsCWNhBlE9jXqMyNlBqqU2
         5vD339v6FQVz8miPiNLddBytwW2kMhy0ElOAVWh2Phg9CnEgF/JeGbiFx0r2VigBh1wI
         3D32FDY9uGqWZappgrxl5g1VB+IAm3/LmOx+ZsSHTThYMt0qZ0ARZtLbhtmMbCAagbSd
         9y3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=lD/1W1L+qoiUp/NJKPQaqe9c1ferrvFKRjy6iius3go=;
        b=mfE3GvewyWuLgbvYHA/EXmHASfHjRiYBBNrUq6EdwT+GIAanbi/gQ29fb70HzRm/kT
         V5MbtW9WuV5gPSegCUD+ly9SyfNEN2OHwFy02C3mU9RpRip+MCuuwqAtD5fKuVTy4Gie
         zWBMj8HvHHGljhLNENZhODAeXs3AfrklleZboRzcyhUnJcUQy0/9eCz+0yEJK8RvhAsz
         R7Y2SnH3q/VVGuJhcd2Qb9x/5R4R7c+0YXYsBAEjKFfvmuiQN2nHwWaiyz3xee0g5hpi
         GswhKSxS4ZJ5hZHnus1gMarSCxhRMRFsAAcNSK5ldrFsu9dg2DrvOTIb6gDpzsWXERm5
         k3bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FAYk6vfh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lD/1W1L+qoiUp/NJKPQaqe9c1ferrvFKRjy6iius3go=;
        b=givV2JIb1+fWl5Tz6deXXNvuGKx1OAbsfG2ut+4V66/L8+Ak9YbY7nemuAHdC7jI7g
         4KNjv87BgLcsnqDmfo8a5rym3otNECPq1wwVLNJCoDFE07HlV31XpuOdp/v23eR0uZSF
         1o6FyutALBoWzL6vtkjvFCgUvfvGvem0uvdwZWffQFls+LlY8i6W1QMDx64yWUU5hfjJ
         XEeji7cguYWzojJ3f1M+RXPQYh172D22CR9Agr+Qp4DaBxbTAhRXakSCJZWFACkUm8a1
         cQUVmVRExLEBQVfAbuz/fPh1yXrYizTAN09eRi+a8DJczqfrPfNsUDvm/UmxTiugo7JR
         wGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lD/1W1L+qoiUp/NJKPQaqe9c1ferrvFKRjy6iius3go=;
        b=VZg/IgM3Uqy2PKrCGd7Dfz6IpYqrt35BF82JNZbQpFlpJbvHjN5XKA9+hiDz1uRYcy
         vpJB5tbBQVd3xzyGJzlBZQiRa1sCa9t1mSOEeD0/wc3NHFNR/serlN1ioMaz2++qErqK
         adoZ6ER930BhIYaJxBC1EBPDepve3i+PxuZdKksIHeFPA1GDIwHBqLVlR7DWKgKnHocg
         PSM78WLYal4dNuo9cij6E0p5Gbb8Vs6jvrTxapRC/h7PPNhlzKRf5z1j/CYjq7N7eh78
         /wehjE8A+g1buBYwzz6B/N7yd77Ob5JbUIso/+/cWhCjbe1qgaVpM85HWDGnAyCjFYCg
         xXZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Puaghw3ZFANVPUqOx7HoWTJ+Q17ru6uOoakAZkDSNIWok4WWCoR7
	4ngGo3FDNfNz+MKFuI1gwYM=
X-Google-Smtp-Source: APiQypIgEjEBi6OIp/9F7XfSDg7NAixOLGMWyA6/f3ZHUeAuNJJDhjw1kW0QShJ2byPLPlDKObqvEw==
X-Received: by 2002:ac2:4a76:: with SMTP id q22mr5729525lfp.157.1586627922675;
        Sat, 11 Apr 2020 10:58:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:55ba:: with SMTP id y26ls374640lfg.11.gmail; Sat, 11 Apr
 2020 10:58:41 -0700 (PDT)
X-Received: by 2002:a5d:5081:: with SMTP id a1mr11458024wrt.81.1586627921739;
        Sat, 11 Apr 2020 10:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586627921; cv=none;
        d=google.com; s=arc-20160816;
        b=EqQzc6TYYxj9ihxHAioCNNrFz6LAft7CXfvue0bibCN2SfEhozoYKFdPVdeXIReis1
         umcbwtPW/ftgojLa6Sm7sGP2jBVD+Rl44viNYwZE1qhE1h9m0M60/iSVByjPHuDwXWei
         myIDxT2PHmymZJcPJNHSzQ/NpfNe9wqONGGAbATp31UbZ4NUDKBKpvciovdZuk4BqrUt
         5WzfK65clnUNu7xcp7Nj9k0rb6fYWTxXLDGZpKH+foAZkmbEpxOEX/cZvW2+dcI2AmCQ
         Bsew6gze+4FaInVVgjvQUY+1us/2tagUCptEQAHFd7okbqBp2SNyBji7JAXeVQ0qu2Fa
         x5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=W0wHSx5N3Ub0V7jl2oiSs14c9frzsuWhSoyQG9wOe6U=;
        b=TM7KZahN26U1uEaH2uwbYKoAQeTE2heM1fziBKfvZGkJ0PrURJEL6n6ROQkegkuW94
         isX/YjDR8DvzOQTp3dxO05kTjYJKOBbM7whfbq+Ng3ZvrWXlJDrFfB7MO9gBFVZFT11H
         fW7rQz6jhJMJyH3GccMvEZWHf5zkzximWr2MOGcPZUUujkjV3vwBdAgxe1Ip/S0mkXSa
         tZKfRAHW7qCxK3qVNSX1SXo/7a6/9j18WIHjW/A8mbXAh9xn76JKBQPuLhlfMD1QOcvL
         KgARxAfe2f8dQTXE5SYd/b2f3gM/WsHFMeijkoDl/IeIvMAsKST0cBG15pxjoGd6xuHP
         zQiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FAYk6vfh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id g78si340094wmg.0.2020.04.11.10.58.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 Apr 2020 10:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([80.187.82.138]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MOAnY-1jK2bs45Cu-005YuX; Sat, 11
 Apr 2020 19:58:41 +0200
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>, Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
 <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
Date: Sat, 11 Apr 2020 19:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:WRLiGm5O0+n1Y7WIpMrlJeP12XwCZHgdkHX5a7AcWjhl3r5pcUM
 zTunpcKAaRqvuq0wVumIeH24cIrVPXwboLk9JtStwa3krtC1buVb+MkurPHYguhOqJIEA+k
 SagDGVKDA42krpSbC/44bkCDSjuy7kqKrhcSh2JtGpU0fAdlCVSiAqcdZ7Tck4WD0oXrJyk
 1PhCmp7yIDsoh6jq+Yw0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SbiJOGeNwpQ=:Y4dEpPrL92TUSXXyyxRCmR
 7XPXbw7D2Lj6RrLq+9NA53ZlUj1eRfNodVkX2NirsE/EvH11XK5zU0NcnW6hGrqaKj8Aonm2H
 Vzr/iQ+ObzVbGwUkGnomHTHBJizFfC3B1C5GK81YR0iuUzhzCmRk9KYthXcP7mxDGn1wGW6on
 Xly23OvTQv7sjX+/KvGcnZ+tgRjOFluK8+irnN90D6BMU8HYO5DzyWq2Y4t6VVBp/MFrmE916
 1d8s2SWmI987mNwpU7fcgxLqz5iudLm3NPtrbJwMbMpEndbdQY+YfkIcQxcsRNnCIZx+BEEkX
 SwpmnmpQnlRiWLDHQYTmQ0DViB0a8nm7uKhF29jR4+Vjp4hCkCFokcRZzHnyJwNNUi77w03Yv
 ZoRLGoPiVcDTOqm+qy7pODH9Dpztkq8JLgX/hDP4l8xDxntSjd1Vzmzbu1upfblV4sYULkIeT
 osd9X9ZdXNaPFd2TNT/RzZGrK+LrK7iq0A+JEUVX5lATX7HHUm7QU+FNeXaKVBWSpytuSGRv5
 BSt3XYfO/gu0KO9I6wYNTZMsORzxRZKvFGnPSNKCHbKyzNgFy+QOcNVnhx9HjVOT4oqlxF6SR
 kZ9ICZWUAE6aFmixK+EcniKLe1V89HAwQzBdUw5cULpfDzKB84HQ8+9s3EwoZSlpW64iBf1WG
 pYXr8QfDckOigEtrgHOE/zPFbUFK7jIjqEhyDO8Ykfh4zaSyL133mgxUHh6qklCxwrcFMH/5r
 QU2WOGg1LPzziY1lXBZ4pFJRhDfMgm0nQKjWvvaxOcKzZk6zJCtC1GY2DECRQtS+fR0FSFvos
 DL+uoGSsZDvdAZyhDg5PnABqFlvDNMPRMQJpBBdeVXJVBe45DPWuyGG36FfCw6K0j4nczJ6nc
 /TuS93UD9hHZG2kvdjq//2PW48EEb0ZapMYQX+GjBLxL8/S3sl5j0nAP69ODC5utDMDAYud98
 /au4rNzNRe9Y/7r0z1m+6unKafNX2J9xMlsAIgFh3Wl9c28ISUundGBTf6GZhAGAmke4fPfCH
 CjBxXLIIC8n8+L5Xp5ra0ApoNt4yugqOTDS86BsHWIQX3+isyARZ2+lWdAV1HPVCXClrpzp5y
 eFAx/5VniXUY24PkRoGMBx2gqWBrac2hy70BewNlaFSTvRFkpEy/ISN+oaCM/pj/5hi/OeJJJ
 H81fr6N1Lla6jRwcUDRtPDIwIcZOWz7tCrspynl9AKxkHE3eyEZVgX1SBd2iVDIzTPJNxE3UI
 E6Xu/8RJeK51NZkhk
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=FAYk6vfh;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.04.20 19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
> Hi Jan,
>
> On 11/04/20 4:31 pm, Jan Kiszka wrote:
>> From: Jan Kiszka<jan.kiszka@siemens.com>
>>
>> So far, any error returned by a function called by
>> pvu_iommu_config_commit was ignored, only reported to the console. That
>> would have resulted in an inconsistent configuration being run. Also,
>> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all, and
>> the former also returned an incorrect code then.
> This is because I have implemented all the functions with return codes.
> I have implemented the pvu_iommu_config_commit with int return type.
>
>  From the design perspective, the pvu_xxx APIs are written from any place.

Nope, they aren't, I checked that.

> It's the config_commit call which is nont returnable, So that function
> should panic.
>
> So, the only place for panic should be either in the pvu_iommu_config_commit
> Or, in the iommu_config_commit
>
> Regards,
> Nikhil D
>> We rather need to panic-stop the system in case some configuration bit
>> cannot be programmed because there is no way to roll back from a
>> config_commit by design.
>>
>> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
>> ---
>>
>> I wonder if there isn't a way - provided it's not too complex - to build
>> up the programming during cell_init/exit, validate it at that chance,
>> cache it, and only apply that state on config_commit. Would mean less
>> panic.
> I gave some thought to create the data structures before config_commit.
> But as of now, there is no way that exist.
> Following is the sequence of calls
>
> pvu_iommu_map_memory
> pvu_iommu_map_memory
> ..
> pvu_iommu_map_memory
> pvu_iommu_config_commit
>
> There is nothing that gets called from framework, and there is no way to
> figure out if the pvu_iommu_map_memory is the last call

OK, so none of the error conditions can be predicted from the given
config and current configuration due to the unknown upcoming mappings? I
don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
entries checked here come from a a cache, and that is built in
pvu_iommu_map_memory where we are able to return a proper error.

>
>> I also wonder when that error pvu_tlb_chain can actually happen, or if
>> the check was just defensive programming. Maybe you also have a better
>> error text for it.
> Yes, its defensive programming, done as part of making the pvu_xx APIs
> primitive calls.

If there is no way to trigger the case via broken configuration, we can
drop that test and the related panic. And checking the code again, I'm
inclinded to believe this.

>>   hypervisor/arch/arm64/include/asm/ti-pvu.h |  2 +-
>>   hypervisor/arch/arm64/ti-pvu.c             | 65 +++++++++++++-----------------
>>   2 files changed, 30 insertions(+), 37 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> index 2c340b3a..466b5b3f 100644
>> --- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> +++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
>> @@ -125,6 +125,6 @@ int pvu_iommu_map_memory(struct cell *cell,
>>   int pvu_iommu_unmap_memory(struct cell *cell,
>>   		const struct jailhouse_memory *mem);
>>
>> -int pvu_iommu_config_commit(struct cell *cell);
>> +void pvu_iommu_config_commit(struct cell *cell_added_removed);
>>
>>   #endif /* _IOMMMU_PVU_H_ */
>> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
>> index b06ba843..91d39848 100644
>> --- a/hypervisor/arch/arm64/ti-pvu.c
>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>> @@ -15,7 +15,7 @@
>>    * There are limitations on the number of available contexts, page sizes,
>>    * number of pages that can be mapped, etc.
>>    *
>> - * PVU is desgined to be programmed with all the memory mapping at once.
>> + * PVU is designed to be programmed with all the memory mapping at once.
>>    * Therefore, it defers the actual register programming till config_commit.
>>    * Also, it does not support unmapping of the pages at runtime.
>>    *
>> @@ -83,16 +83,18 @@ static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
>>   		return 0;
>>   }
>>
>> -static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
>> +static void pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
>>   {
>>   	struct pvu_hw_tlb *tlb;
>>
>> -	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid)
>> -		return -EINVAL;
>> +	if (tlb_next <= tlbnum || tlb_next <= dev->max_virtid) {
>> +		panic_printk("ERROR: PVU: Invalid TLB index %d for chaining\n",
>> +			     tlb_next);
>> +		panic_stop();
>> +	}
>>
>>   	tlb = (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>>   	mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, tlb_next);
>> -	return 0;
>>   }
>>
>>   static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
>> @@ -113,7 +115,8 @@ static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>>   			return i;
>>   		}
>>   	}
>> -	return 0;
>> +	panic_printk("ERROR: PVU: Not enough TLB entries\n");
>> +	panic_stop();
>>   }
>>
>>   static void pvu_tlb_flush(struct pvu_dev *dev, u16 tlbnum)
>> @@ -159,8 +162,8 @@ static void pvu_entry_enable(struct pvu_dev *dev, u16 tlbnum, u8 index)
>>   	dev->tlb_data[tlbnum] |= (1 << index);
>>   }
>>
>> -static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>> -			   struct pvu_tlb_entry *ent)
>> +static void pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>> +			    struct pvu_tlb_entry *ent)
>>   {
>>   	struct pvu_hw_tlb_entry *entry;
>>   	struct pvu_hw_tlb *tlb;
>> @@ -175,16 +178,16 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>   	}
>>
>>   	if (pgsz >= ARRAY_SIZE(pvu_page_size_bytes)) {
>> -		printk("ERROR: PVU: %s: Unsupported page size %llx\n",
>> -			__func__, ent->size);
>> -		return -EINVAL;
>> +		panic_printk("ERROR: PVU: Unsupported page size %llx\n",
>> +			     ent->size);
>> +		panic_stop();
>>   	}
>>
>>   	if (!is_aligned(ent->virt_addr, ent->size) ||
>>   	    !is_aligned(ent->phys_addr, ent->size)) {
>> -		printk("ERROR: PVU: %s: Address %llx => %llx is not aligned with size %llx\n",
>> -			__func__, ent->virt_addr, ent->phys_addr, ent->size);
>> -		return -EINVAL;
>> +		panic_printk("ERROR: PVU: Address %llx => %llx is not aligned with size %llx\n",
>> +			     ent->virt_addr, ent->phys_addr, ent->size);
>> +		panic_stop();
>>   	}
>>
>>   	mmio_write32(&entry->reg0, ent->virt_addr & 0xffffffff);
>> @@ -200,7 +203,6 @@ static int pvu_entry_write(struct pvu_dev *dev, u16 tlbnum, u8 index,
>>
>>   	/* Do we need "DSB NSH" here to make sure all writes are finised? */
>>   	pvu_entry_enable(dev, tlbnum, index);
>> -	return 0;
>>   }
>>
>>   static u32 pvu_init_device(struct pvu_dev *dev, u16 max_virtid)
>> @@ -328,17 +330,17 @@ static void pvu_entrylist_sort(struct pvu_tlb_entry *entlist, u32 num_entries)
>>   	}
>>   }
>>
>> -static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>> +static void pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>   {
>>   	unsigned int inst, i, tlbnum, idx, ent_count;
>>   	struct pvu_tlb_entry *ent, *cell_entries;
>>   	struct pvu_dev *dev;
>> -	int ret, tlb_next;
>> +	int tlb_next;
>>
>>   	cell_entries = cell->arch.iommu_pvu.entries;
>>   	ent_count = cell->arch.iommu_pvu.ent_count;
>>   	if (ent_count == 0 || cell_entries == NULL)
>> -		return 0;
>> +		return;
>>
>>   	/* Program same memory mapping for all of the instances */
>>   	for (inst = 0; inst < pvu_count; inst++) {
>> @@ -356,20 +358,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>   			if (idx == 0 && i >= dev->num_entries) {
>>   				/* Find next available TLB and chain to it */
>>   				tlb_next = pvu_tlb_alloc(dev, virtid);
>> -				if (tlb_next < 0)
>> -					return -ENOMEM;
>>   				pvu_tlb_chain(dev, tlbnum, tlb_next);
>>   				pvu_tlb_enable(dev, tlbnum);
>>   				tlbnum = tlb_next;
>>   			}
>>
>> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
>> -			if (ret)
>> -				return ret;
>> +			pvu_entry_write(dev, tlbnum, idx, ent);
>>   		}
>>   		pvu_tlb_enable(dev, tlbnum);
>>   	}
>> -	return 0;
>>   }
>>
>>   /*
>> @@ -434,13 +431,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>>   	return 0;
>>   }
>>
>> -int pvu_iommu_config_commit(struct cell *cell)
>> +void pvu_iommu_config_commit(struct cell *cell_added_removed)
>>   {
>>   	unsigned int i, virtid;
>> -	int ret = 0;
>>
>> -	if (pvu_count == 0 || !cell)
>> -		return 0;
>> +	if (pvu_count == 0 || !cell_added_removed)
>> +		return;
>>
>>   	/*
>>   	 * Chaining the TLB entries adds extra latency to translate those
>> @@ -448,20 +444,17 @@ int pvu_iommu_config_commit(struct cell *cell)
>>   	 * Sort the entries in descending order of page sizes to reduce effects
>>   	 * of chaining and thus reducing average translation latency
>>   	 */
>> -	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
>> -			   cell->arch.iommu_pvu.ent_count);
>> +	pvu_entrylist_sort(cell_added_removed->arch.iommu_pvu.entries,
>> +			   cell_added_removed->arch.iommu_pvu.ent_count);
>>
>> -	for_each_stream_id(virtid, cell->config, i) {
>> +	for_each_stream_id(virtid, cell_added_removed->config, i) {
>>   		if (virtid > MAX_VIRTID)
>>   			continue;
>>
>> -		ret = pvu_iommu_program_entries(cell, virtid);
>> -		if (ret)
>> -			return ret;
>> +		pvu_iommu_program_entries(cell_added_removed, virtid);
> panic here instead of other places

Given that all those functions are only invoked from here and that the
error codes can't be propagated beyond here, there is no point in
pushing things down.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5badd0af-e586-fa58-f3f4-9aed052fd04d%40web.de.
