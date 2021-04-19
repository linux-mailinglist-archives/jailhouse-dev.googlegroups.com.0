Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTGH62BQMGQEBNXBRJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC10364736
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 17:37:49 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h3-20020adfa4c30000b02901027da44a81sf9172922wrb.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 08:37:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618846669; cv=pass;
        d=google.com; s=arc-20160816;
        b=qGFA51RKBvMlZC86xjmdJgZJtIR5kcZfkN3a4Y83IYlvij9hDb5fgb1MzRzO72kTXu
         ROoGVU6Wk/E+gKWtgeWZC0SwFnFrmP7ax1F6K07AKRyaGx90cA99oXovMdJtciQ9ydWc
         RIrQ8A9sZqDfGzgaw4jL6V590egIEbzZefySHpeEvoHaBcCwpwnVn6OkZyTr0UmhL0Mt
         X08OfwyvkHHNtCobarhH1xmtB+xBpx5Hp0CXFSNedlvvMY3/vOiat1gfzmBRpVTRLUCi
         sbQ3gbmCf3udeoME12N6NIXy9j3lZKcP4qUUWIrb2tQEAK02uXdQeYtXGKwh+1epv7db
         6Ncw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=nU/Pc3kSXNRR/rCybkcIPFCgXHGuyXxjU98Pl+ZQZJ8=;
        b=ZxA0Q1cmez7L99GR3Rjbu9RkQOiF/krTFwg+sjO0YnRn4m12vTHaloTXS0bkz1jR8I
         2OXNd2eXCJBVW6u122CTycxkSXEf1E8MMD5AaC9m3OEoBgsYFzulhRPbKHf5cnAkREEM
         d3AJClzboOy0Do3vDdC/2Gm8sPP8Yx84G5sorksk5unahoKg4jkwDRFwWN/JEv6y4b6r
         RQN9ni4ts/r7xVWAauZzCw86/VPzULcXlHnvRveyx8jkErRoZUjFglB1D+Mvz13Pu/sm
         XrSUIlxJVvdXd3wAT7zXxZvOk8m8Flv9dBfwCyjqcI13dFkYlgabNyk6ZM4qwo/du1+Z
         IGDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="DEs/t0Oe";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nU/Pc3kSXNRR/rCybkcIPFCgXHGuyXxjU98Pl+ZQZJ8=;
        b=RoBo3G/HIlcVs3Wp5lp19Bj4zoaK9GT5XtksP5h6YRmQCYsER2ay2azqS2AXoB9cDj
         e7jPddcRsOZ6Zy8KmoDCBfEjSlEAMJbEtpUhrUa9N1y4+OSb++GkEnHwUq0bI/ZwIkTj
         QaieIVmQNMrPSM2Ba3KyEywbC2gUYEF2FXNPH0nuLcz51E+PPjpQoHcntgzZ91aM4tOs
         mDYGo5YmjwejujOWGcaTSw/NpfeCZgD6DkwkxBVbrpcycUTJ4QryCuTqWvNuKVOzdWac
         x9kfRZ1s0qQmM+rcT+6Es2bXthNMXvvFdbMxakgq0XhsTtFBlENwXvjrfYhH8Gj4g8qK
         bIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nU/Pc3kSXNRR/rCybkcIPFCgXHGuyXxjU98Pl+ZQZJ8=;
        b=V9pMqhovAWmTTzl+T2UgTxLDR0v3IQFvJnSANPU16kVe52bWoJEhchF8LiwPxkqDx7
         Jm0PtFKK84SSNL41mWX6SOxL1TreZ7MVsENKajeZQZxwDoOkCmYGQOy2UvbDNzxAcksZ
         48m10/yAkOHnguX+fkfFvy+QoCKPCAteGkBc2LhxLHNEQ87RQCogMvKzO8LmXtBUjN8e
         iCrtTjXTI4pF8t3Uyoed/4eOGSJQdRs9+DHpjHg2QTlVIHIz6KnCOIvPXHD+ExWvXOQu
         oUkCbWtjUQNCWvwDW/IuZbpU6URq8QTtMUHSAl2SCwYbV46VT3H5ZwUK2wqnLt6hNewK
         ntig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/k7hhuJkZag1bdPfWniDQVjZ/4wHYUQ5yJyaM+LgVhYvZg6WG
	edTO9/TcQJK2BfMTHf7gaGo=
X-Google-Smtp-Source: ABdhPJxzIFLTnaIHlRwgrSN9BEudeqHx5ha9G82Nkgn5toYO3ZElSiyEsMKVVg8G5ZcxkUWJJUjAWw==
X-Received: by 2002:a5d:58f3:: with SMTP id f19mr15207131wrd.133.1618846668626;
        Mon, 19 Apr 2021 08:37:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c1c3:: with SMTP id a3ls8137796wmj.0.gmail; Mon, 19 Apr
 2021 08:37:47 -0700 (PDT)
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr22217559wmi.69.1618846667450;
        Mon, 19 Apr 2021 08:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618846667; cv=none;
        d=google.com; s=arc-20160816;
        b=mHUXBs/TE1QT/gBLY8glS3kJ3kR/Bjctz8G3/y8fwGUViRmqPF4NPEr0DB+41Ki+t1
         sCHTwppbnercs2TpKbDajbqmnMjZT0t4QtG+z+CbbHA6E6dZUNBOS7N12QCo/1qkWUOn
         JFypGLAnalzA0l3dQcWAyOpRGxFLFgrirGVS4paI7hn6QA0f3cRe8PRs7eBgUv+dHZb1
         MU/qr036bDRt1Cezz3jiat08wmgVsp2PlLlTKW9rlE/BJ5NNidPSymGRCpVWbCDkpsTu
         fah+rLLXkreX/XEi+aWUlcYNW6dz6fAcWtPX2Dm9R7rX6Yc9tdCsXc3mmv7LIyngbvvF
         e1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Wv4Mm/9l//uqi+up9O83+gMOUZL7o2u32slerDcb8zU=;
        b=eTAWD5NAGdaPNwZAssdDSEueFl/FxLHxhdEHjVrG/ec0MDCSEougl+IStd6wDqLwUh
         qY9tacr7MC+aCjKH6gfzALLa9pWauuRZ8+QdItBQy2kYYDIL/FXBrTwIhr2pdDLQ6s30
         lDQwF7U9rV4mcoA67HLE5VCXbwokZM5Ml9aHrswSQTW5vZ3q5JQEd3Y07hNbY8XY4lSd
         TzEhDEcyHjbx0rQ1/NDM75WSMV7Z3oZVYTCHK3Yx1wqeN8v6ZuCNh2NzXWOMkf1mKEpo
         Hvau25xJWBu113SOKONpzmuCHev4zL1eLSFo59o+DINwrnWlRaCvNjecjuM3GrzNPGtg
         TVFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="DEs/t0Oe";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id w2si63016wmb.4.2021.04.19.08.37.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 08:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4FP9tg03hDzxwF;
	Mon, 19 Apr 2021 17:37:47 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 17:37:46 +0200
Subject: Re: [PATCH 1/1] x86/mem.c: Fix allocation bug
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <08a134a0-778b-6b78-1b24-9214ecde5f3b@oth-regensburg.de>
Date: Mon, 19 Apr 2021 17:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="DEs/t0Oe";
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

Hi Bram,

On 19/04/2021 14:17, Bram Hooimeijer wrote:
> When creating a new page table, the table should be filled with zeroes
> to prevent decoding invalid entries as valid in the future. Given that
> in the inmate memory space no assumptions can be made on the contents of
> unallocated heapspace, zeroing needs to be done explicitly.

Don't we already zero pages when reloading a guest? (I'm not sure)
IOW: Did you really experience dirty pages?

Anyway, if we don't, then we should think if we should zero them. The
question is, if it is acceptable to leave artefacts of previously
running inmates in memory.

Thanks
  Ralf

> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  inmates/lib/x86/mem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
> index 7e1c8b83..45424ea1 100644
> --- a/inmates/lib/x86/mem.c
> +++ b/inmates/lib/x86/mem.c
> @@ -58,6 +58,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>  		} else {
>  			pt = alloc(PAGE_SIZE, PAGE_SIZE);
> +			memset(pt, 0, PAGE_SIZE);
>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>  		}
>  
> @@ -66,6 +67,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
>  			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
>  		} else {
>  			pt = alloc(PAGE_SIZE, PAGE_SIZE);
> +			memset(pt, 0, PAGE_SIZE);
>  			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>  		}
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08a134a0-778b-6b78-1b24-9214ecde5f3b%40oth-regensburg.de.
