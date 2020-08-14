Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR633L4QKGQEZYO4COA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADB244C22
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 17:29:11 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id f13sf1575868ljj.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 08:29:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597418951; cv=pass;
        d=google.com; s=arc-20160816;
        b=DX+Jdd4gOW/i9Br/exHZmhTFFaDdMDarciJDRWHjcej3ls9YXOIrtuXHpoK9P0Abvq
         UI1iqgdTs9Kv7ihBdSOSU1T6S5DByJOJpasAMKiSXEIYdCqkJ7Vu5EDM1PXWmrsRyxTV
         GoS8IBHbCn72ebl46gCgHATUinaDagzFTtHGzEVOO/6/dz6nZTys35rp7xKlRVin4658
         0nodkchxsrk5bxmqirzCvt7OTx5h9vRWlekPYMcUlhNExxAYfrb8q/eHCaFZoCE2KUVz
         9YnhrYMnP1MWJ2K8EfoVGQFycazaUemRKPZTsd5KM3Xoztc/YL3ANrxwMYh/pvedN5Ex
         NzzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Yt9MYfHcegyhRN68noBtHpAPcSutfdRlMQLJ4mJYQck=;
        b=q1A7hLUzlEOpoZ3sUE3fBYlxc/AlojRleuS5alHIW6lNCg8q21uHo/65Qs/yQSm+Cf
         SuVw5Cc9NbmMJ+ITmwU8Cj+kwhd/vCFlq2z05F/BkltKhyMCt/ZnkIAwuvO5a2TxV8gn
         FLqJhpbeStJUEA4vw3z0Y7IC01r8O3sBKsHCEhcowj5JFBCH6nvNR1ZufvfX/ZvBvF9y
         OXka9KCUyJcGVOiZ2g4wmkBo7cFqdGd+vf43vZMOfoWvlsNMoebUIOsL4q1J3PxaAu9L
         Be3i19exYcYuIbvlnFroNOlRD3Xqf0EhjSYnHm8Py/Y0gmDyhP02mN5nNevrwFYRNI6S
         c4Dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Yt9MYfHcegyhRN68noBtHpAPcSutfdRlMQLJ4mJYQck=;
        b=NMP4fYBMC0gO1mJiG3FfEGM/UIo4RBfhoyeR0z+C9JBDHuOUBX6jcDIbnWBhq8ktCz
         mtWBxX00BsDyy4AVBrW/Tc7BaQUDB+1N2lZoJffEkpgg4Xiw5Az2g6LfelIF2SqPvOMP
         9Obq+5F7hpz+w8lZZ/MaUZuGiPabRorM0UvE3lSNKM1ZYUZdWVYqQ5DWiRGSgb9UehRu
         O9Zry2Hc57YlQ8HZk1OSCdIKyhZlGxWnw80fFVjnEGFi2SZRB4dSGMWjPgGfCZDTtcgD
         qw98YfnFyKyUVNTHlO2L93IjNMVRoCEB3vqr0cfMQqW3b8+BeGeE4B/YRaJdU/anKFNG
         nKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Yt9MYfHcegyhRN68noBtHpAPcSutfdRlMQLJ4mJYQck=;
        b=XZJ/CDA1IxsDPV8HYxfNFhkoIFh4QxyHGu7uuEGDdnVEqxB56ptz7bFHluhNET978p
         YNW+gYwFP6LMAQSZKiZNqfIRSgGQmdMNRWfXygbdvGVPy2bncDLme03OpKAUphUlCBEZ
         Xmkm18umL9fHPwaTJutVYuGyCJ06NNLB0Do6lIgpI47pfKJr4hP4W6JPzwfGPu49Hcwh
         CdxHOYa4S32FOzusgbe9bFSn38j7lRvobGgp6e59f3dZd+4I/NxdUBVg9CWBHJ+gYKjX
         QJcJMHDQpfTfPkGTS2ydwc3UOG4G/8I74SmhcQxodPV4vUq5SZdjw1gdzA89l93V0QM8
         Y0yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KyYAdsm0OfXYQmEtyORWalraI/nY+QprMQrfBHJ7qDWnqq0b9
	tfzJwjV4roQQIW/+a6bW/YQ=
X-Google-Smtp-Source: ABdhPJzqv/hncABGgNlN3gUft1f9UutnLryC3pRepZlPWBZ0Q/GsefM4UYeslYCTlf4Q9LJ2cJMrmw==
X-Received: by 2002:a19:848d:: with SMTP id g135mr1457360lfd.1.1597418951210;
        Fri, 14 Aug 2020 08:29:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:294:: with SMTP id b20ls104401ljo.9.gmail; Fri, 14
 Aug 2020 08:29:10 -0700 (PDT)
X-Received: by 2002:a05:651c:238:: with SMTP id z24mr1628903ljn.172.1597418950355;
        Fri, 14 Aug 2020 08:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597418950; cv=none;
        d=google.com; s=arc-20160816;
        b=fc0TU4DGainz2dLo5H9jDiMpBFq5xUjBTXbryvlx3FS3Tx9jUDTP/gBmtFGH/3Td7h
         e1ntfmRwwx797xfW4sWD7HjFDR2DDNIHpJIVG59As3PTmXoTdyGvKlKw2JcXoeftf+Nk
         ympyFgqhzXkadtG+br7Wp35+ZboPHDuXdnLePiaY2AbC+KknZft0d3zuv5z25eyrX25W
         PPJutlCW2vCtErN6vczddi/CZB/cA347s5+Jwh2IypACV3wENWS8Wk49xyuYWcRY54/z
         pGntw4l4rqQP4ez78i+6vZV/73Mji4JZ/Xcv2M3o5SID+W4X3NgmTisRaJsm0F4dBSwx
         MHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WvXTEBYDpn9vAqCiaNwO510oOHibO5JTMDJwavrjJV4=;
        b=G96IV5CEgDUQn23YbyKdk8762kaUJ2TvXBEprPVGVobnaVUbnbDgLqYmLlexiTWT7j
         jrp8ZtRCvdy5nt8C60K4Ozdx0ixm2POYXfxmM2XKzSiBlOJ3l4mTC1Gvtzq6+pxOhDyj
         XoOZFgznjCW3czwBRUGC5CAx9W8GkagIicGigQEqmB5g6aMtdgsLG1zDnDHz6nMQHGQf
         CGp1AXEc5vpJXoQx2nvfrR5BWAlwJ+R9Fvoqt63xYgggr69mdPUy186NZSIvo5bIIOi8
         SX5ei3n+UD7cIgITFkkYg45sMWIzN+T2flLnVd/b90wjKXmMqYfx2KBtzbBFzMbvbVt3
         3hng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z26si428892lfe.5.2020.08.14.08.29.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 08:29:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EFT9Zk018710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 17:29:09 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EFT8Gt001517;
	Fri, 14 Aug 2020 17:29:09 +0200
Subject: Re: autojail an automatic jailhouse configuration frontend for
 jailhouse on AARCH64 devices
To: Christoph Gerum <christoph.gerum@uni-tuebingen.de>,
        jailhouse-dev@googlegroups.com
References: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a588e2a5-b7cd-7df8-7341-2e7f9da79b6f@siemens.com>
Date: Fri, 14 Aug 2020 17:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Hi Christoph,

On 14.08.20 10:58, Christoph Gerum wrote:
> Hello,
> 
> Over the last few months, our team has been working on an automatic
> configuration utility for jailhouse. As our effort now nears a usable
> state, we would like to present it to the jailhouse community.
> 
> Our tooling is available on https://github.com/ekut-es/autojail
> 
> The documentation is available on
> https://atreus.informatik.uni-tuebingen.de/~gerum/autojail/
> 
> The tooling works by extracting information about the target hardware
> from the Linux runtime system (currently mainly
> /sys/firmware/devicetree/),

As you are processing a device tree already, can you also consume an 
offline dtb?

Did you also already have a look at system-dt 
(https://elinux.org/Device_tree_future#System_Device_Tree_2019.2C_2020)? 
That could become the next logical step for dt-based systems.

> and then generating jailhouse cell configs
> for root- and guest cells from a minimal configuration file.

Important "detail": It comes with a new human-processable configuration 
format, you YAML schema, right? Is that format as powerful (or 
low-level) as the binary format, i.e. a full replacement of the current 
C files? Or does it provide abstractions like "give me 1GB, I don't care 
where", or "give me device B, with whatever I/O resources it comes"?

How is the (planned) workflow then? Currently on x86, you call "config 
create" and then perform manual tuning on the resulting C config for the 
root cell to make it work. I suspect that is what "autojail extract" is 
about. In your case, tuning would be done on to the yml file? How would 
will the workflow be for non-root cell configs?

Hint: Add a user story to your documents would help getting a big 
picture quicker.

> 
> It differs from the current jailhouse config in the following ways:
> 

I suspect you meant the current config generator.

>     - It targets aarch64 instead of x86_64.

A final architecture will have to address all archs, even if the input 
for x86 will remain different.

>     - It supports configuration of guest and root cells.
>     - It allows a simplified configuration of IVSHMEM_NET.
> 
> The current release has the following limitations, which we would like
> to address in the coming weeks:
> 
>     - No generation of configuration for the inmates (networking,
> device-tree)
>     - Dead Simple Memory allocator that will probably give up at a
> relatively low memory pressure.

Where does the memory allocator come into play?

>     - Configuration of inter-cell communication is supported for
> IVSHMEM_NET devices only
>     - Only tested on Raspberry  PI 4B
>     - No configuration of SMMU or other IOMMUs
> 
> The current release has so far only been tested on Raspberry PI 4B, and
> this announcement mainly is here as a request for comments, and to
> evaluate how our work might fit into the general jailhouse ecosystem.
> 
>     - Would there be interest to somehow integrate it more closely into
> the jailhouse ecosystem?
>     - We would be very interested, if we could use it as a configuration
> generator for the current work on memory coloring in jailhouse.

Specifically coloring is a scenario where more tooling support for 
config generation and validation is needed, indeed. You may have seen 
that new "jailhouse config check" command which performs the latter (and 
should work with your approach as well as it processes binary configs), 
but we also need more of the former.

So, yes, there is definitely interest in new ideas and concrete 
solutions, specifically for arm64 (though not only). After having to 
refactor configs/ recently, more than once, I would appreciate a lot if 
we could reduce the manual maintenance.

What needs careful thoughts are the possible use cases and workflows. We 
need a solution that automates what can be safely automated, ideally 
warns when user input or validation is needed and does not stand in the 
way when manual tweaking must be applied. That is due to the low 
abstraction level of the binary config format the hypervisor consumes.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a588e2a5-b7cd-7df8-7341-2e7f9da79b6f%40siemens.com.
