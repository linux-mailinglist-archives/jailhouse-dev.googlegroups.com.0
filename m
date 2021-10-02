Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGW24CFAMGQEIQ4KF3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id A063F41FAB8
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Oct 2021 11:57:47 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id f32-20020a0565123b2000b003fd19ba9acasf5637696lfv.10
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Oct 2021 02:57:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633168667; cv=pass;
        d=google.com; s=arc-20160816;
        b=cTz6ug3sOMykM5u7bWmHd/yBNDeG0840jWyKGY68w4K1Ugmiq83gHZTk+HTAxXPBZK
         oNQsIBe+ZEcr2lYMtOZU8x9ExCHG4cFUcQrVnoKi88YoreZJsY1MGcpynfXUG1M0TV47
         FYjNjkFu7A7lmG0iy9eE8HglAcp1Vh41vRH8z2dcX0UI8UZhieWFqBaZ1GiqxJ6ND+WV
         UK29V6X2iWUCrPSXsuJ4Hs4h7dUO7SBBjPwVGmssytfZwZ9RyQCb/FtqU29Ruew59eE0
         ++RXC3mTRVUi/o4v/hxebiKaLoVxizb5S9xq+YKPll84T7NwR3WDRd/g0P7ChjubmzC3
         uXOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=7LKmTPO9GtqerZgvWiD0UZgiG4Bf9Ka8H08UCqReXcg=;
        b=FoY7nplTtTiIas0SCxt/gj31jXmQ3iQmWpHxbHTFXJNnNHZmBXWAy/L5EEYnSgsCFJ
         itxaoRE+VZqsvj0Y6sfMu/UH2KWN2SZvd6WnTtWhJ1SkYWyHc1VmA9BaRe5vrIqp5aTT
         rUAL/bBXx+68qYtFuVw6WmRpbJvRTAsFiZYyAVcyE5QEeTJZNyiqRYbJVT24aw0ZPiaf
         vu6X1NU6Wy63O9zabgMeV2uDFarUiKFxDJHUYaO+PU8Oz5lUuvh9++UhFT3ojvJg9n3C
         rSHjtepV6oxMzeWTukf/SKzQlbppg98QqES76FfSN9XTKuZNIo431XWgfCPzK3xzXcAJ
         tLNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="i/g3tku6";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7LKmTPO9GtqerZgvWiD0UZgiG4Bf9Ka8H08UCqReXcg=;
        b=HaLLFZa3C2poADTxWVFLdOO30ushCgtlG+lhkHM8xkNUg/CLatEqthH9N57R33fgKJ
         bt4iwr/Bj42wNTsyROPzSPAWWC8Z14Zbvi3HI84x0BF3hi6q7T6XTjirrXTJjNYRwci9
         ZWgY9mdxLMRodgKYxK/mw2q0wSwkZj0oRgLooYLX9AxGEo/wgp/QAOer7ETDfx3Y8SRE
         jOJRiRrlYoqN+qWN7jWHO/fD3zpwonpEyjTeXwDYbqqH2qs5yfzGWCjaS5o+lc4JSBon
         OY5TIO2sL8WSNoOo6dihX+bAWx9ezEAN5pHD+d0DwNkOPv+FVxTneFBgnoDBGE8AW4nU
         RLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7LKmTPO9GtqerZgvWiD0UZgiG4Bf9Ka8H08UCqReXcg=;
        b=2lOlXjRm4QxxRnpIiAxjoA2I59cHsokRKmaUXmIt+bAGErWQn3haXJMMUTV28hWG9o
         lSfoJfowTFO/+HKzQUl88NYOIsKlOd4SQcJQF8w+4/5swSsNYFAyQP2MJOtEfRVXxLIa
         ju7Eikl9kf1UE7YfBCWmJ5oke7CshfZNILHwL5zK0nUW8Cs6XQqdwsyvxHK4GKQRlg3W
         pPkLH1bFpgsyEJlt1Cl1zNbOeCEf5HB+rz9Ihv4EW2PJC27gF1t6oiHq4E/ATpC527Xo
         3X0RHLbjW4TsW1McekywwmS3ibwr8AWYQ8nwsGs0YfqI8GldoRuzRm+1fl9b1CaoftPe
         /1zQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533h1xPYKtArET9dFwo5FEgSlXwvmIJSdPj0ZZLbtmapW+d4Md0c
	l7S/IA91I0NxoRXJvrP08BA=
X-Google-Smtp-Source: ABdhPJwov9MuuVDJTcpw+kT1vyBfQ1jsDA/43BXyPBF5MnBKoeKFC31nPuvOXgE36C1R+h27fUTBDw==
X-Received: by 2002:a05:6512:32c7:: with SMTP id f7mr2947123lfg.593.1633168667090;
        Sat, 02 Oct 2021 02:57:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1242:: with SMTP id h2ls2345271ljh.2.gmail; Sat, 02
 Oct 2021 02:57:46 -0700 (PDT)
X-Received: by 2002:a2e:b702:: with SMTP id j2mr2612368ljo.6.1633168665939;
        Sat, 02 Oct 2021 02:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633168665; cv=none;
        d=google.com; s=arc-20160816;
        b=G48Was+Qc5f/WkRa+7raZ8DDlrD60/1uhfQTEN8RISKSw3NvEI1Tnx/225olGxbZsi
         ogg84mJL6MTuJxXlzb3lBQHcjYOEcu28oYLFwj7o9dXmOh/0eZUo2KNrXLTkytHGzpiX
         771xRD1WU96+4bBBfnt7lLdr7U4wtuDo948fBXxqTQzw00lU7F9A7XMi6h48SeT1u2TD
         QPq4CFBcS0q00vkXSQOLOCheh+rZuhAn++9XSBTjeyHBxEJgp2V7Akq3UHMBkAEv6RBO
         UU4Jrba4R/SOawausx4+0tkv5/RKWRWqZP/ffQ6B8zZqoGPluFjxqxgZvX9jC27zcorJ
         BrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=9mR+tNf3P/CSvGjuoGmcuE+qQQ/lCGgiqM3W0g/3xUU=;
        b=BeKy/NZRIK0c1f0REJvtAjBA1s1LwNslJICCPrvEQCnAAMhRDmA2onemxmtgsRns9w
         2K4GHZJDxQG+plIo1fSq3EsscchhtjiLLI6wau/4Er7dJVhKCE8nyt6E+hoEQpI12lTf
         W6BnMmdt5oqOYXWTp00B9r3LhxMX47b7AJIgVMSNgAz15aG7bYAyhNV3EJwwwxs8zqEW
         XHv23k1L3sXqE0+qqJ9N+BXXHwRPcdZ7r1jyCkp7uQaLJE/JvTcXsIGpZgpMTp09eczn
         LtLwEt+MJt3+qc7BcQeZ5qyXOwe+sZiQ7nCQm1ECzCy4tWn+/oVNHMaPZ+yL+TGTYluH
         NrnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="i/g3tku6";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id a3si559674lji.6.2021.10.02.02.57.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 02:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [100.82.103.131] ([178.24.248.3]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MECCP-1mgk840KFp-00ALUg; Sat, 02
 Oct 2021 11:57:45 +0200
Subject: Re: ioremap_page_range force nx in linux 5.15
From: Jan Kiszka <jan.kiszka@web.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB276022E2F0E48908180F2DA188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bb692a80-925b-ae39-1681-d98874810c5a@web.de>
Message-ID: <e519da55-623b-9bbb-953d-feed24db114f@web.de>
Date: Sat, 2 Oct 2021 11:57:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bb692a80-925b-ae39-1681-d98874810c5a@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:s6FSYsuUGZgUuQiYRt6P2gbC5WUK4od+4Kc3Kj9oSqcwjZobL1u
 91dhhWbI8+97i51bZ1bb6CETlcLsxXSwOkL4mbsChteqO7bcWYrujuox8RQhZk7zenDm3uH
 FJITDlOdZPljq3gbAGxVJW0/lIgbkSbtjM1FT51f7OlueKPxsioanzEuKDXUoYytasR+rKL
 j+mJygDWud5f+3VJ6M06g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QDFkd7yIWlM=:MTIhT/kwjLo6fMlYVdRe6+
 2QfiygCkYv6dWHa4SUU8t9r6wv2Kr5F3OxEw6Z0PR0o8+1N+ozoRlirf2gNOwRrU5MGjz0G8H
 RwFGHTB1kahTFXwS+KSs0UlQj46dkBh1Nxfnj3IWmWbzc4i1PR8VabAjIDNSAfFvWTsfU6pih
 VRPZySIHkyQxAepEyUhhRiYggGrKWJQ2YoLP6w8pYY3KmSsm9hKW0qbn3LybyJP97aPPorY2M
 MTH3HcaMGIVjxzBZ51pi3dd4alyQ7nCm9uDYl2l48SP7x2B710yKbl7mc/fO3d4NNT9h1ce6O
 RmhDeVkndf/JyjctR9DxfI+pohiTE2ycnZFP2gsD+j2omoLQqhABTVhr9X6GgC1K7O4UhZ/cZ
 3KACPMQlSgntptwx+ZmC5ktExUZ38aOSdzBofazFBoyaKPPM69NaQgN95rCvkO5GezNmAwRzd
 D9oJvh/EBPgZPzrKo47OSu22MFu3pULKtf8FU10q97rfOTVuCrcuvX0K2+m+q3gvCwJNoL2Vt
 gIFSW1MDQK+OpBO76M6RUZbjM4racTZmU9Ee5OWsQe092Vh6dFJq8WJ4d0kudS/tZW7vfhOys
 /cJVY0TlZ4o1ZyUiSvZsEX7r5vlQxv16PK4HHROM/0yXqAZrV2n1bsTcFAi20tbFyIBM9OnF5
 HEnVGkVQ0EE6HIgTt9Z7KbrGik0uRrh2ghE84QZx3uJ3MidJBhNdu7XD/DdvvXwINLF9DWPH0
 GX4PvfGpgdCmAduYEaKUUBjdE3GFlBmengFOoz4PUVo2Qs+Z/a6Qd6HypjLFnTJjiW+7SBV/D
 DqY+FDFCZO8c2QmCxMlC6+nB12NJWdu3/+q5QUsoZzisp90ijfyQw66w+HMZTdEYk2N1akh3s
 XmmhE9+fA0c8zPRIZcFsdDSC6w2Mq2l3ECToJlv8Zo1FjlQ2Zd+NeYdIKWT6uhZHdcwY4v8JP
 ZDhGUoiXELUb7oV0lpZ//giVOL4HdUfLzYN655iJGgD+iGrPX/EZ43WIei1rVOW+Gs9fuXETX
 24/QkHk/12IAcTLN1EudYeIaqHCa6Z+B1D6ogOhkTPl5jjOYgBqco6QduL/DT9XLXqd45HuVg
 bz1pAUiodOzjWM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="i/g3tku6";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 24.09.21 17:52, Jan Kiszka wrote:
> On 24.09.21 10:58, Peng Fan wrote:
>> Jan,
>>
>> With the commit, enter_hypervisor->entry will not work anymore, because it is not
>> executable now! Any suggestion?
>>
>> commit 8491502f787c4a902bd4f223b578ef47d3490264
>> Author: Christoph Hellwig <hch@lst.de>
>> Date:   Tue Sep 7 19:56:04 2021 -0700
>>
>>     mm: don't allow executable ioremap mappings
>>
>>     There is no need to execute from iomem (and most platforms it is
>>     impossible anyway), so add the pgprot_nx() call similar to vmap.
>>
>>     Link: https://lkml.kernel.org/r/20210824091259.1324527-3-hch@lst.de
>>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>>     Cc: Nicholas Piggin <npiggin@gmail.com>
>>     Cc: Peter Zijlstra <peterz@infradead.org>
>>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index e44983fb2d156..3055f04b486bb 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>>  {
>>         int err;
>>
>> -       err = vmap_range_noflush(addr, end, phys_addr, prot,
>> +       err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>>                                  ioremap_max_page_shift);
>>         flush_cache_vmap(addr, end);
>>         return err;
>>
>> Thanks,
>> Peng
>>
>
> Two options come to my mind:
>
>  - carry another revert in the Jailhouse kernel branch (we already have
>    some there...)
>

FWIW, I've just done that to bump queues/jailhouse to 5.15-rc [1].

>  - explore using a different mapping mechanism or a different page
>    source that permit executable mappings for the trampoline pages
>    (those used before activating Jailhouse's own mappings)
>
> The latter would only work for arm64 so far (JAILHOUSE_BORROW_ROOT_PT),
> but other archs should be converted to that scheme eventually.
>

That path should still be explored, mid to long-term at.

Jan

[1]
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e519da55-623b-9bbb-953d-feed24db114f%40web.de.
