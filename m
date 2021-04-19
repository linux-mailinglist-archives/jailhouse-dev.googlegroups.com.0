Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGXD62BQMGQE57EMNQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C25364854
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 18:36:42 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id x20-20020a7bc2140000b029012bb4d2b5d6sf4679458wmi.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 09:36:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618850202; cv=pass;
        d=google.com; s=arc-20160816;
        b=OPTdYhnkcaZg/SnFtDsDpdNS/4codz+zyo6yO7leGLEQpYE7JFY5erIWYGBhGqIHGt
         gUnp608mGx+4F1M1/5AdkLORXQsxaIxFKePogkBB36KAGS5sCPugdmz+eWTJnT6Rqt31
         31HGfrlbWAPEGlHYS7jK2x/bJ4Ygyt+QkfvZr8WU1gm1uCSpFYm4bZdcw/+p4FiGIwUs
         xnD+WX4PRoBZKj3gLlOsqP8ZcUhaee0ACF2zUdOxtoD0gM60aYY3cUrrAcinMi4uJe8I
         Cl//wGeFASPlVmurFmIgpltH++rFxXnFjMg/QmvYOaYg+DP/NejdpyTxExzIEOO9qbl3
         aqxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=mMim82ni29n6t/s1aDkSzLgZOPRJ1UpT07W2ux2DBg4=;
        b=1EhpIxTcNTU4hS5OH1Swwzdh9Qly/P9ilVCz1WFMPWfGLmDOpDF+bD1zkbUTRmLuO2
         5CtfZqOpwJQCiBWCKbXnGgcTYor3hie0ha0fgmScF0gYJWyzyw8O775hGn53SfNzXZeN
         M8+oMARpBmaBWMSm8Vq+7bXIgfrj22eoN8delXugcAWnghZ3BMqX9TK2KZQokklCScKb
         XICNgIiPMDc4Ez1Dn8rNR9/prOyfd6rFsvl1bsCluoF+k5D1qp3OFbv9tJl2V3qh6hh6
         5+4M9ZnGJjuyP2PJUQV/Tv3+U417G1BBQ9o/WqnuMdJDSsvmtSRUTTETtUURV1HpHne6
         rreQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mMim82ni29n6t/s1aDkSzLgZOPRJ1UpT07W2ux2DBg4=;
        b=qRGvVBIpZZP4Hkseoo/CWuRyr2LHf687Dg+7soe2NKn3Vt7kpXaBIrA409W4bXEgJM
         sseBpOBtKCwq98LEAdWl8G76cba5EuFht0QAmTLdtLY2IZE1CV7iIGrv0xNJKQve2hHq
         x2Mu3ZbUuV5dRjtC3QB+oFuj75OHS+8553FJZGinrWXqma03G/A+SlKRV5PpeWn9d9Ej
         8T/tohnguO8dgxk8lyiZiQqZAphZrTa4HISb20YaWt9r+vLPaRSrX9xRnduD1iFS+nwC
         PHCyG4nQjX56IW5fhBLNJqcOJ+RqEk/L7F1JGx5kX7AqEkatifFEpfIa18KhSy9hZUkS
         BNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mMim82ni29n6t/s1aDkSzLgZOPRJ1UpT07W2ux2DBg4=;
        b=K8TqwlIluGVfq1BtUvb8D0QLE9aeJPYIX0L5eMLXuD2sfP+VC16TW3PUrFH8p67L1X
         qXobtJATiPI+qp6+OL6LOKrC8kqE+yvHS7WdWyPF3byU/Csw+ZFQGBI68SxAhn5Wa997
         dgMJPze5Yni3E+P5RBPdo0O1aI31MdgOWQXU2aLe3rClbGx19dkOA6oB/cARGHrckdWk
         t4TrkiYm24cEqqkvw3Kq3wwK8D2PgPvs1UGQ/N/fy4LKYPZn9kU9ieV5iJ0AuiohPs+l
         lgsehVvdWKZ47Df9cL/5lzI7gB09OHTaDxOze3BC7myrD5Lq6rZg98MjqpjMzygeSIIY
         Lm/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315e0nbEz5OII3O1iQ/8luaK2CH5Ve46V8BLxIrFeeJibPNG/IO
	Ny6BOC1irsPitZ5T1tNPb/Q=
X-Google-Smtp-Source: ABdhPJw2+UsVn2L7C6Zsyn/ZV01feoAAN2zI6+wEZnn1CctYucBiylZeHmfJUD+UVOaaouopy6t5NQ==
X-Received: by 2002:adf:cc89:: with SMTP id p9mr14994198wrj.223.1618850202369;
        Mon, 19 Apr 2021 09:36:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4a04:: with SMTP id c4ls8225172wmp.1.gmail; Mon, 19
 Apr 2021 09:36:41 -0700 (PDT)
X-Received: by 2002:a1c:7315:: with SMTP id d21mr22894273wmb.155.1618850201405;
        Mon, 19 Apr 2021 09:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618850201; cv=none;
        d=google.com; s=arc-20160816;
        b=Ti9qd+oOnc1U0UdJYXo6dG8KebLGShAaZSwz5ja0SHhfZj4Tnv//lS0h3dcvlBxrpM
         6aCXC5yfL2ezxEGfo//nmESIG/3gVXHbh23pH+LgLA9ixXzpJxB2xcLTbF3xfLJ6yWs9
         7yqOW6wc38YN94KFAOS8OD8WPHfFqKaHqlUouvVt+b/Uvfvs74Bbf4qmzRCPod+EUL5u
         Bm1bgVnDvxHfZSC7GGRhHfen7XuRR7NY9xFc3HTnB+L6/B3g+7pQ77v4p5kBTSw/sHzF
         95LhGo2AnSPWliU/PX+4l/CwsMJjc40YgKZw/bU3SNwciB+kC65ATivZNtclInroisXR
         firA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2VOTp6xU7nClx/sJziirxMCyyuJQBgVExVi0oofs1/8=;
        b=Y6VnLUgZ9tOq7C9i9kQ8ak4hCnhD9srGLHchcDCrV2jpIZ7/+i5zNlugWLgex54ZSK
         J8g7UBdj3ME3XTSBNZh4zei21cnuG3p6TIEflLadQkPnA5SWY564EoWgjpd4DgGpfW/9
         MQzq08RERfDLVVpgqwGc8+YLUBeJs66faQmovEzfMPmuClf6Wb/9OkVbFXrlkrRIWlrv
         m3DXErSNu+wwH9GnepxNwZsiYFEYVTzbnOMX2g64cMA5w2PD5jBnbsRxy7UTXcsB45yX
         iOB6h34MOt1PsORY/oZ27p9iJG18I3HX/h4yw1mcrdZy14WgInqYdDoCWh+WcjWSPOld
         0TtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k6si1201193wrm.2.2021.04.19.09.36.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 09:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JGaf7N030495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Apr 2021 18:36:41 +0200
Received: from [167.87.240.116] ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JGTPMo000361;
	Mon, 19 Apr 2021 18:29:25 +0200
Subject: Re: [PATCH 1/1] x86/mem.c: Fix allocation bug
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <08a134a0-778b-6b78-1b24-9214ecde5f3b@oth-regensburg.de>
 <31b95b80-a2da-09cc-a6bc-a89f51bb0a1e@oth-regensburg.de>
 <AS8PR02MB666320D586D371E642EEC562B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a91a6b11-6bb4-fcc8-fd9a-bcbc36332d29@siemens.com>
Date: Mon, 19 Apr 2021 18:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB666320D586D371E642EEC562B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 19.04.21 18:03, Bram Hooimeijer wrote:
>>
>> On 19/04/2021 17:37, Ralf Ramsauer wrote:
>>> Hi Bram,
>>>
>>> On 19/04/2021 14:17, Bram Hooimeijer wrote:
>>>> When creating a new page table, the table should be filled with
>>>> zeroes to prevent decoding invalid entries as valid in the future.
>>>> Given that in the inmate memory space no assumptions can be made on
>>>> the contents of unallocated heapspace, zeroing needs to be done explic=
itly.
>>>
>>> Don't we already zero pages when reloading a guest? (I'm not sure)
>>> IOW: Did you really experience dirty pages?
>>
>> Just cross-checked: Looks like we don't zero inmate memory on cell reloa=
d.
>> Now I wonder why I never experienced a similar bug=E2=80=A6 But we haven=
't many
>> inmates that make excessive use of the heap.
>=20
> I was just writing that I got to the same conclusion. Before sending in t=
he patch,=20
> I was seriously considering what I overlooked, given that I never ran int=
o this=20
> before either, even when doing memory latency experiments. This occasion =
it=20
> was a single MMIO address, and thus I didn't move the heap_pos to an addr=
ess=20
> beyond the communication region, if that might influence something. I gue=
ss not,
> and sheer luck is involved so far.
>=20
>>
>>>
>>> Anyway, if we don't, then we should think if we should zero them. The
>>> question is, if it is acceptable to leave artefacts of previously
>>> running inmates in memory.
>>
>> I think we should rather implement a zalloc() wrapper around alloc(), wh=
ich
>> gives us guarantees to return zeroed pages. We have some other spots in
>> libinmate where we could substitute alloc/memset-sequences in libinmate,=
 e.g.
>> in lib/arm-common/mem.c and lib/x86/smp.c.
>=20
> I would also prefer zalloc(), as memset clears the area per byte which se=
ems=20
> inefficient. Though I expect the store-buffer in the CPU to combine the w=
rites.
>=20

We don't have optimized memset/copy implementations in the inmate lib.
If there is a need, someone would have to write them first.

Jan

> Actually, the alloc/memset sequence in arm-common/mem.c prevents the issu=
e
> from arising on Arm platforms, and this patch uses memset just to be cons=
istent=20
> with the Arm implementation.=20
>=20
> I'll send a new proposal.=20
>=20
> Thanks, Bram=20
>=20
>>
>>   Ralf
>>
>>>
>>> Thanks
>>>   Ralf
>>>
>>>>
>>>> Signed-off-by: Bram Hooimeijer
>>>> <bram.hooimeijer@prodrive-technologies.com>
>>>> ---
>>>>  inmates/lib/x86/mem.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c index
>>>> 7e1c8b83..45424ea1 100644
>>>> --- a/inmates/lib/x86/mem.c
>>>> +++ b/inmates/lib/x86/mem.c
>>>> @@ -58,6 +58,7 @@ void map_range(void *start, unsigned long size, enum
>> map_type map_type)
>>>>                      pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
>>>>              } else {
>>>>                      pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
>>>> +                    memset(pt, 0, PAGE_SIZE);
>>>>                      *pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FL=
AGS;
>>>>              }
>>>>
>>>> @@ -66,6 +67,7 @@ void map_range(void *start, unsigned long size, enum
>> map_type map_type)
>>>>                      pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
>>>>              } else {
>>>>                      pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
>>>> +                    memset(pt, 0, PAGE_SIZE);
>>>>                      *pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FL=
AGS;
>>>>              }
>>>>
>>>>
>>>
>=20

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a91a6b11-6bb4-fcc8-fd9a-bcbc36332d29%40siemens.com.
