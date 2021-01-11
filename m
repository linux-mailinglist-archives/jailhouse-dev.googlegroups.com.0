Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBAML6H7QKGQEDGFXROI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED62F1253
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 13:33:06 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id j21sf1344217lji.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 04:33:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610368386; cv=pass;
        d=google.com; s=arc-20160816;
        b=YzWJTBVcR60KqPoLOizWy0hnCHJQzD1BNwpSAtnf6C8Vj00tAnK2tH9IQ0zliPEDdN
         gU/yQTtwqzZN97i322G1R42BfKuXycT2LIQf8bq+xTa8n7IPIDJQZI6PjqS3MgMn3rnU
         fujzdKdAVsNRGalo2kbhqRRN8dKFDt02mgnHxuqP1lUuOM5q7ZKWhbVdbNypoCzUgTkG
         UhOx/74EpsU2lLAs/2h9DxHdsSeLre5w1WSmahxs/MkU55fKTY9jh8E+GtemUp0HeBvw
         b0LzLq5M4ktuvVqkqAsD1+SR/xn8kMwjTSbfzPEgVgB2x12I3H8HUuEj6bE2PEMfAi7O
         jnVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=DrKPS/q4wsBRWlFpxHBWWZkOKbnx+AO7YBfQMWMcAd4=;
        b=ZQu/T+kNrbQ8yK2FZcwz8EFsLrh83JIpM08W+cDvQthS0HJJOCC5RAA9yPL/6Av73w
         DfXnuY2GdvFIRV2Qk2EwihsyPFpx+1fMxsHEWbat9iO6gjVPp5Fnn3+2jEG4pDYvgaZV
         IHnDl+jCFeXzo+MoYcvotoqhrfIxv74/SuXf709tDSPlszQzup6KLM7T5KAisJdNeHmD
         0/2fCNXpC8xMC55eJIjlZjRVAGq0X9ijrSYKPb1lXYZojVzHFEPHnJwpXq1hXk6KaW/8
         jz+JrdK6cM8uzryOh9COKZecD83ndF1t8PFcXKW4sa8+wianUnftYj2DpADXaFfMMnUS
         KgmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=0Yvj6xno;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DrKPS/q4wsBRWlFpxHBWWZkOKbnx+AO7YBfQMWMcAd4=;
        b=p4l4A2YPVxO9acs/CVEWKVBHnljutVPiq+vLaxnS9B5HZIpKvp+/0zYkJ8ISFr9r7+
         w1zJCNMAv+m3jvbsW0gMcxpOEBgsHMOhtWl0lM7QdzhUUKJGTlVaPREkKN/MlSb14Lb/
         Txun7wjpsaXKRRpuEjnuRu1dLQsPvbY6QX2GJr3AsEAOewRynuH3INdKZIxxsDkqPGSD
         4N+69fASxn9Qzor6QytGymLFwtMqqSvYPgDi5IL4PqES9h7fJJ54elMQwWaH8rgZWGyL
         VWNF9NYwke617vU8T+ZAnRswGPEynXGZohyHl99dQs11gzEQPOjvwLcTSoWddm8XuTag
         TkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DrKPS/q4wsBRWlFpxHBWWZkOKbnx+AO7YBfQMWMcAd4=;
        b=aQLmwagJuI6fLq1Ga1eSEem+Y0ng7GE3X6AVgxKcMrTkNK5UbfbLzUe0wyPfv4DS0u
         kZsA/GzC03nJ4N5dhyUvB9wRgksUSR74R6JtUUryx+tpSy4YgKekcKNFaOi4Mda/0MGG
         fZFFNlNdONPnQ9shLOGB5TD99xSphzPEQygWZeb8hxrK5rZk7FFOcIm0ykVTZrA/D5WR
         zICQCdyyZApLgMCh3T1k2Gs24awTvn5NyT1PaWkTBVrQwKEktt/jBLHcxPnH8liyckKz
         DjdOkP4GbcGFfMp4LP1+OqF8W1P7S3hCvQWecz9hqxV1pa7hnDCFlKzUQMv+lo0yLT6W
         Iobg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Ae4YtuTr9C7nkTl2l+iICH6ZC4fKelPjZi/+RQQi6ka8zMJ/2
	6raVg1pa1DwmQhzMUuA+W8I=
X-Google-Smtp-Source: ABdhPJz9BW90CB4s3pcc7/K+FGHV9Tvr9WVT9USBNk6FpBUvZq88zL0Ju9NanQ3wPtLw0vAA2Dyz2w==
X-Received: by 2002:ac2:5442:: with SMTP id d2mr6837446lfn.154.1610368385844;
        Mon, 11 Jan 2021 04:33:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls553429lfu.3.gmail; Mon, 11
 Jan 2021 04:33:04 -0800 (PST)
X-Received: by 2002:a19:3f87:: with SMTP id m129mr7401627lfa.560.1610368384753;
        Mon, 11 Jan 2021 04:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610368384; cv=none;
        d=google.com; s=arc-20160816;
        b=beDo0131aFLrGtkVYF8r2Njlhd40OdUutLZQ13+yEgvM7x7uxfI8VRV8D0tq8jCVBI
         wzSWhW0Sxi0Y38bZUcUzjsh4todKWj4wXglCPrxnid8KDxMCaiCDArqn3P/JXnA4jDZ1
         7DsESwuwpn9KA0JH1Clb86Bm42d0Wck54+8tap3CrI+rglugyNVGO8zGyREzJHGv1RCE
         Ky5gzJn3DICHs1RoihrrzMcu0RljdgAw0Lb5g5j8n7Fie61gwbs5suRuAFKWSIcnZb8R
         CIgW2o5pjgZBDafubfL9mO7a5SCdLlD+VKUAhOTcu6kU1aRyFmMapHBr6D7OrKxY3hma
         n+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=kmKYgLOwZMBEqvLzk7HZcxVbb6YPJh4+DZ1yXRPUmZE=;
        b=VIb4Go23dx2hnmFLZI1TAHD9XtlN17twDC0m75gZy5NOcv8rCLjmIrd17RvWcKM4l7
         Aqxo8/7BCuXbXU4i8HjTIM9xZalRGsHyK3VuH1BLbu+UE30EyrOFzX8Um+4Dco3S14SJ
         ScsZjYNipMlpl7MMRtmM3dp9SbrMZ8vsBVPeUU9I15kNyBdTwalBp/qj8JVWV5PS8Qx4
         NhDdontqwGOc0RzzetVu2e0hb3btcC3kWOlSrtT/aTtb0Qp9XPyomwA1rmw1HHopr1/A
         k6HVr4WGxBsmi8ggkuuCR28ZSG9vtdzIxWdHg3wbhqebHXDYVYNb26rAvi8omnUHh3Do
         eQbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=0Yvj6xno;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f21si941554lfe.9.2021.01.11.04.33.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 04:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DDtQm15hxzyXD;
	Mon, 11 Jan 2021 13:33:04 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level: 
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_HAS_URL_HTTP=0.001, LRZ_MSGID_HL8_3HL4_HL12=0.001,
	LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001, LRZ_URL_HTTP_SINGLE=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id k9zYvQm7fSN6; Mon, 11 Jan 2021 13:33:03 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DDtQk6zvCzybh;
	Mon, 11 Jan 2021 13:33:02 +0100 (CET)
Subject: Re: [PATCH 00/14] Cache-coloring for Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <49bddd30-ded4-3264-813c-940fc11e2354@siemens.com>
 <50b3ceff-d68d-b6c0-f335-8cec4fa67305@tum.de>
 <054fe4bd-e3ea-dfa5-c8aa-c3d2a2cad6fb@siemens.com>
 <6af26a83-8be5-0317-92c6-ffcdf636375a@tum.de>
 <085d4dfc-b4ca-a421-4f04-a04eb0d43e9c@siemens.com>
 <6d17ea6d-8696-1fb3-6c67-93a1fc856b12@siemens.com>
 <65629141-28b5-4153-7547-cfb58b22baff@tum.de>
 <9b88eab8-859b-d54b-ba2d-40395c5e1828@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <fc33efe0-deec-95cf-1fda-7f03dabac6fa@tum.de>
Date: Mon, 11 Jan 2021 13:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9b88eab8-859b-d54b-ba2d-40395c5e1828@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=0Yvj6xno;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 11/01/2021 12:46, Jan Kiszka wrote:
> On 11.01.21 12:21, Andrea Bastoni wrote:
>> Hi Jan,
>>
>> On 11/01/2021 08:36, Jan Kiszka wrote:
>>> On 25.11.20 17:12, Jan Kiszka wrote:
>>>> On 25.11.20 16:59, Andrea Bastoni wrote:
>>>>> On 25/11/2020 11:51, Jan Kiszka wrote:
>>>>>> On 25.11.20 10:15, Andrea Bastoni wrote:
>>>>>>> On 25/11/2020 07:07, Jan Kiszka wrote:
>>>>>>>> On 23.11.20 21:45, Andrea Bastoni wrote:
>>>>>>>>> Hello Jan, hi all,
>>>>>>>>>
>>>>>>>>> As discussed a couple of weeks ago, here an updated version of th=
e "cache-coloring" for Jailhouse.
>>>>>>>>>
>>>>>>>>> A short recap on what's coloring (see Documentation/cache-colorin=
g.md):
>>>>>>>>>> Cache coloring is a software technique that permits LLC partitio=
ning,
>>>>>>>>>> therefore eliminating mutual core interference, and thus guarant=
eeing more
>>>>>>>>>> predictable performances for memory accesses.
>>>>>>>>>
>>>>>>>>> In this version of the patch, we've tried to keep the changes in =
the hypervisor core minimal. Also, since coloring is something that should =
be transparent to inmates/VM (coloring belongs to the IPA/PA hypervisor tra=
nslations), the Linux driver has been only minimally modified.
>>>>>>>>>
>>>>>>>>> Coloring API
>>>>>>>>> ------------
>>>>>>>>>
>>>>>>>>> The patch adds a small architecture API layer that implements col=
oring. The API is fully implemented only on arm64.  arm32 could be also a p=
ossible target for coloring, x86 already has CAT. Despite being implemented=
 by only one architecture, having a small common API layer integrates IMHO =
better than other solutions in the main code (without adding conditionally =
compiled code).
>>>>>>>>>
>>>>>>>>> The API is:
>>>>>>>>>     arch_color_map_memory_region()   // cell_create
>>>>>>>>>         Color-maps the memory of the cell. Coloring requires mult=
iple passes to keep a contiguous VA, while "punching holes" in the PA accor=
ding to the allocated colors.
>>>>>>>>>
>>>>>>>>>     arch_color_unmap_memory_region() // cell_destroy
>>>>>>>>>         The opposite of create: search and give back each piece o=
f colored PA.
>>>>>>>>>
>>>>>>>>>     arch_color_remap_to_root()       // cell_load
>>>>>>>>>         Given that we don't want to modify the driver (i.e., we d=
on't want the driver to do non-contiguous color-ioremap) we let the root ce=
ll believe that the IPAs it is ioremapping are contiguous, but in reality t=
he PA are non-contiguous (colored). This is currently done by using a very =
high VA (IPA) address as "base" for the load-remap-to-root-cell operation. =
This value is configuration dependent and can be specified in the root cell=
 to avoid (unlikely) conflicts.
>>>>>>>>>
>>>>>>>>>     arch_color_unmap_from_root()     // cell_start
>>>>>>>>>         Returns the mapping setup by the cell_load to the root ce=
ll.
>>>>>>>>>
>>>>>>>>> Two APIs are implemented only by arm64:
>>>>>>>>>     arm_color_dcache_flush_memory_region()  // range flushing
>>>>>>>>>         Also flushing should be done in a "colored way".
>>>>>>>>>
>>>>>>>>>     arm_color_init()                        // hook for the initi=
alization of coloring
>>>>>>>>>         Reads the parameters (size of the LLC way, base offset fo=
r the load-remapping operation) needed by coloring. There's also some debug=
ging code to autodetect the cache-geometry and determine the size of the wa=
y.
>>>>>>>>>
>>>>>>>>> Configuration
>>>>>>>>> -------------
>>>>>>>>>
>>>>>>>>> From the configuration point of view, a colored memory region is =
a normal memory region with a color attached. The color is expressed direct=
ly in the memory region as color-bitmask and the flag JAILHOUSE_MEM_COLORED=
 is used to identify such a region. Contiguous bits in the bitmask identify=
 a color (region) to be used for the memory region. The size of the mapping=
 doesn't change due to coloring.
>>>>>>>>>
>>>>>>>>> For example, with 16 colors, a full way size is selected by 0xfff=
f, while 1/4 of the way size is selected by 0x000f.
>>>>>>>>>
>>>>>>>>> (Note: we also experimented with a different version that defined=
 separate "normal" and "colored" memory regions. The approach presented in =
this version is more robust.)
>>>>>>>>>
>>>>>>>>> Main coloring "loop"
>>>>>>>>> --------------------
>>>>>>>>>
>>>>>>>>> The coloring APIs basically boil down to a loop that appropriatel=
y selects --according to the color-- the physical addresses where to perfor=
m a selected operation. The selection is done efficiently with bit operatio=
ns on the bitmask.
>>>>>>>>>
>>>>>>>>> An alternative approach is to hook coloring deep into the mapping=
 functionalities of the hypervisor. Basically, all low level mapping functi=
ons support coloring, and the non-colored case becomes the "special case."
>>>>>>>>> This approach was not followed because to be implemented "cleanly=
", all the architecture mapping APIs have to be extended to support colorin=
g, but only one-architecture then really implement it.
>>>>>>>>>
>>>>>>>>> Instead, the implemented approach to have an additional "coloring=
" API integrates more nicely. Additionally, coloring will be hopefully only=
 a transitory techniques (some years?) that could be eventually replaced by=
 hardware-based techniques (e.g., MPAM). When this happens, removing the ad=
ditional coloring API requires less rework than the other approach.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Debugging Code
>>>>>>>>> --------------
>>>>>>>>>
>>>>>>>>> The patches also provide a "debugging-only" code that can be acti=
vated by defining CONFIG_DEBUG (it sounded more Jailhouse-oriented than NDE=
BUG). In debugging mode, the coloring provides an autodetection for arm64 c=
ache geometry.
>>>>>>>>> Additionally, I've added an assert() function that can be used at=
 runtime in debugging only contexts (could be used independently from color=
ing).
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Feedback and comments welcome.
>>>>>>>>>
>>>>>>>>> Best,
>>>>>>>>> Andrea
>>>>>>>>>
>>>>>>>>> Andrea Bastoni (12):
>>>>>>>>>   arm-common: bitops: add most-significant-bit operation
>>>>>>>>>   hypervisor, driver, archs: add basic empty infrastructure for c=
oloring
>>>>>>>>>   hypervisor: arm64: add cache coloring implementation
>>>>>>>>>   hypervisor configuration: hook autodetection for coloring_way_s=
ize
>>>>>>>>>   configs: arm64: add example configuration for colored ZCU102 in=
mate
>>>>>>>>>   hypervisor: protect inclusion of control.h
>>>>>>>>>   hypervisor, driver: add platform information to configure color=
ing
>>>>>>>>>     params
>>>>>>>>>   configs: arm64: hook-in coloring parameters for ZCU102
>>>>>>>>>   hypervisor: provide runtime assert() helper for DEBUG only
>>>>>>>>>   hypervisor: provide implementation for __assert_fail() and grou=
p
>>>>>>>>>     panic-related functions
>>>>>>>>>   hypervisor: coloring: use assert instead of "BUG"
>>>>>>>>>   hypervisor: coloring: make cache autodetection debug-only
>>>>>>>>>
>>>>>>>>> Luca Miccio (2):
>>>>>>>>>   Documentation: add description and usage of cache coloring supp=
ort
>>>>>>>>>   pyjailhouse: add support for colored regions
>>>>>>>>>
>>>>>>>>>  Documentation/cache-coloring.md               | 198 ++++++++++++=
++++++
>>>>>>>>>  configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
>>>>>>>>>  configs/arm64/zynqmp-zcu102.c                 |   6 +
>>>>>>>>>  driver/cell.c                                 |  10 +-
>>>>>>>>>  driver/cell.h                                 |   1 +
>>>>>>>>>  driver/main.c                                 |  12 ++
>>>>>>>>>  hypervisor/Makefile                           |   2 +-
>>>>>>>>>  hypervisor/arch/arm-common/control.c          |   1 +
>>>>>>>>>  .../arch/arm-common/include/asm/bitops.h      |  10 +
>>>>>>>>>  .../arch/arm-common/include/asm/dcaches.h     |   8 +
>>>>>>>>>  hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
>>>>>>>>>  hypervisor/arch/arm/control.c                 |   1 +
>>>>>>>>>  hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
>>>>>>>>>  hypervisor/arch/arm/traps.c                   |   1 +
>>>>>>>>>  hypervisor/arch/arm64/Kbuild                  |   5 +
>>>>>>>>>  hypervisor/arch/arm64/cache_layout.c          | 148 ++++++++++++=
+
>>>>>>>>>  hypervisor/arch/arm64/coloring.c              | 184 ++++++++++++=
++++
>>>>>>>>>  hypervisor/arch/arm64/control.c               |   1 +
>>>>>>>>>  .../arch/arm64/include/asm/cache_layout.h     |  21 ++
>>>>>>>>>  hypervisor/arch/arm64/include/asm/coloring.h  | 137 ++++++++++++
>>>>>>>>>  hypervisor/arch/arm64/setup.c                 |   3 +
>>>>>>>>>  hypervisor/arch/arm64/traps.c                 |   1 +
>>>>>>>>>  hypervisor/arch/x86/amd_iommu.c               |   1 +
>>>>>>>>>  hypervisor/arch/x86/control.c                 |   1 +
>>>>>>>>>  hypervisor/arch/x86/efifb.c                   |   1 +
>>>>>>>>>  hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
>>>>>>>>>  hypervisor/arch/x86/ioapic.c                  |   1 +
>>>>>>>>>  hypervisor/arch/x86/svm.c                     |   1 +
>>>>>>>>>  hypervisor/arch/x86/vmx.c                     |   1 +
>>>>>>>>>  hypervisor/control.c                          | 111 ++++------
>>>>>>>>>  hypervisor/include/jailhouse/assert.h         |  37 ++++
>>>>>>>>>  hypervisor/include/jailhouse/control.h        |  34 +--
>>>>>>>>>  hypervisor/include/jailhouse/panic.h          |  40 ++++
>>>>>>>>>  hypervisor/include/jailhouse/printk.h         |   4 +
>>>>>>>>>  hypervisor/panic.c                            |  86 ++++++++
>>>>>>>>>  hypervisor/pci.c                              |   1 +
>>>>>>>>>  hypervisor/printk.c                           |   1 +
>>>>>>>>>  hypervisor/uart.c                             |   1 +
>>>>>>>>>  include/jailhouse/cell-config.h               |  11 +
>>>>>>>>>  pyjailhouse/config_parser.py                  |   9 +-
>>>>>>>>>  40 files changed, 1201 insertions(+), 121 deletions(-)
>>>>>>>>>  create mode 100644 Documentation/cache-coloring.md
>>>>>>>>>  create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>>>>>>>>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/cache_layout.c
>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/coloring.c
>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/cache_layou=
t.h
>>>>>>>>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>>>>>>>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/assert.h
>>>>>>>>>  create mode 100644 hypervisor/include/jailhouse/panic.h
>>>>>>>>>  create mode 100644 hypervisor/panic.c
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks for the update! I assume it's functional and can be used in
>>>>>>>> tests? Asking as there seems to be a lot of debug code and comment=
s.
>>>>>>>
>>>>>>> Yes, it is functional and it can be used for testing. I assumed thi=
s wasn't the
>>>>>>> final version, and the debug code + commented out code are still th=
ere in the
>>>>>>> places where it can be useful to take a look to understand how the =
machinery is
>>>>>>> working.
>>>>>>>
>>>>>>> I'm also interested in your point of view regarding having a CONFIG=
_DEBUG option
>>>>>>> in Jailhouse. Basically a "debugging/development-enabled" version (=
with assert()
>>>>>>> and extra verbose output), and a "production" one.
>>>>>>>
>>>>>>>> Scanning through it, I still find it very arm64-centric, rather th=
an
>>>>>>>
>>>>>>> It is. As mentioned, I don't know if it is meaningful to have a x86=
 version of
>>>>>>> the coloring, and for how long there will be the need to have color=
ing in
>>>>>>> software. So, the patches try to keep the changes in both hyperviso=
r and driver
>>>>>>> to a minimum.
>>>>>>
>>>>>> x86 might not be meaningful for modern CPUs with CAT, but it is anot=
her
>>>>>> test case. But I'm also thinking of RISC-V and what else might come =
along.
>>>>>
>>>>> Coloring in software on x86 might not be trivial. But yes, RISC-V cou=
ld be a
>>>>> test case, and maybe there will be some hardware support that can be =
exploited
>>>>> there...
>>>>>
>>>>>>>> generically addressing the topic as I pointed out in previous revi=
ews.
>>>>>>>> And keeping modifications of the driver minimal is not necessarily=
 a
>>>>>>>> sign we are on the same page already.
>>>>>>>
>>>>>>> We've experimented also with a version that does "more" in the driv=
er. I think
>>>>>>> that more changes in the driver only add complexity. In the end the=
 hypervisor
>>>>>>> have to distinguish anyway between colored and non-colored mapping,=
 and
>>>>>>> scattering the load logic between driver and hypervisor has more ma=
intenance
>>>>>>> effort than a single clean configuration parameter.
>>>>>>
>>>>>> You are possibly right, it's just hard for me to follow this as ther=
e is
>>>>>> no code or more concrete design to prove that argument.
>>>>>
>>>>> I've synched with Luca and Marco, and I've pushed here
>>>>>
>>>>> https://gitlab.com/bastoni/jailhouse/-/commits/wip/design/coloring-dr=
iver/
>>>>>
>>>>> some relevant commits that show how a possible driver-integrated solu=
tion could
>>>>> look like.
>>>>>
>>>>> Note that the "jailhouse_ioremap_col()" function in driver/main.c bas=
ically
>>>>> replicates the same coloring loop that should also be provided by the=
 hypervisor
>>>>> to do colored-mapping and how the logic about the "next_colored()" sh=
ould be
>>>>> "moved-up" to be shared between HV and driver.
>>>>
>>>> Need to look into that, so a blind shot: If it's mere replication of
>>>> logic, a common include with the core functionality can help to avoid
>>>> duplication. If it's more, this is a point.
>>>>
>>>
>>> Finally had the time to study: I don't see a major issue with the
>>
>> Thank you for checking this.
>>
>>> jailhouse_ioremap_col replicating the mapping logic the hypervisor does=
.
>>> The core logic is in next_colored, and that is shared.
>>> jailhouse_ioremap_col is a simple loop.
>>>
>>> However, jailhouse_ioremap_col should be enhanced to a generic
>>> jailhouse_ioremap that maps also uncolored memory the same way. To my
>>> understanding, next_colored already returns the next physical page in
>>> the uncolored case.
>>>
>>>>>
>>>>> This non-clean separation, and the fact that the IPA/PA mapping shoul=
d not
>>>>> belong to the driver, but only to the HV are among the reasons why we=
 moved to
>>>>> the solution presented in the patch series.
>>>>
>>>> If code overall grows massively, it's valid to consolidate in the HV. =
If
>>>> it's just about having it somewhere, the driver is the better place.
>>>>
>>>
>>> Would be interesting to see the diffstat of the hypervisor with your
>>> driver coloring extension. The cache layout detection leaves to
>>> hypervisor, and no new hypercall is added. Should be worth it.
>>
>> What do you mean here? In the version posted in the patches (the most up=
dated
>> version) there is no hypercall. Do you have in mind a cross-over between=
 the two
>> versions?
>>
>> What is the objective you would like to achieve from a design point of v=
iew?
>>
>=20
> Right, there is no special call anymore. I meant the special handling of
> colored regions for set-loadable, though. That can be avoided.

The cost of avoiding it, is to make Linux running in the root-cell aware th=
at a
mapping is colored, and have something similar to the loops in "color_cell_=
op()"
also in the ioremap_colored() in Linux.

(In the wip/design/coloring-driver version, this loop complexity is hidden =
in
next_colored() + next_color(), but the basic complexity is the same.)

To me, coloring should just effect the IPA - PA translation, and except for=
 the
configuration dependent offset, the coloring can be kept transparent for Li=
nux.

> The hypervisor then just needs to apply generic coloring rules when
> mapping regions into cells. And the root cell will request the loadable
> region by adding the non-root cell's color to its respective region.
>=20
> Jan
>=20

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc33efe0-deec-95cf-1fda-7f03dabac6fa%40tum.de.
