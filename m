Return-Path: <jailhouse-dev+bncBCONRR6ZTUGRBN5E3H4QKGQEP77SVPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 415672446AA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 10:58:32 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id h6sf2930365wml.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 01:58:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597395512; cv=pass;
        d=google.com; s=arc-20160816;
        b=g0F5ajcq9QVbdVBs1J9myc0QZzDC+4Id880McwLt3G765trOnSTo/XYy93tHRYvj8l
         1isDfQRLfYvQ587WGahi+hu0mGSVJh/o0s6hyrKa5x1WzuVzgqQRczIsFhvZ5wXaK0MR
         Sj+qQv2swFVUpq8hxitjO0g3mM2FVSTC3CcQDsoJcm/Cz7735eHN/nJHN4QGBFL7BhPh
         9Umj1rHIMmA5jSjRC3Ujz/6Q/uzucKAic36chjAeXZfiUHSzMFdeSEErIR1meaRIbeb6
         JCcVL9uwojrl9rjNoFeAsqXxVV+1q6ca8H6lftgK2ssQ6+SijWFRI5j183cgUrj1hDe5
         eQ5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:autocrypt:subject:from:to:sender
         :dkim-signature;
        bh=ZSIsoK8ZXlKvkiZD/J6Ts0ZkJG/87fCkxfzN58BQdQY=;
        b=FXGQtINTVJI4oP+eVrDKz291ZEhhmmFFmW4fjxmu6j6TzE89jKGwOPDU1gC1iMATYZ
         Zlm1t91u9+jjM8b0Nz6sBkA2IVdHg4zk1p8M+IegRekmbf8laKzcLhgrE8jS4uxWrxDS
         zGZ0fAtibJg/Fs6xLOrEUPZ0GnGwwl5cjt2EHSnk/k7ToJNQ/sQUcXlMwD0O0569Rwjo
         SDgBTWI71+YJ5OzOvONvUkoYonFh/JjSDNt1BGLC8x9wb7KMoPVDHNqFlKlUmekYZjU4
         mhmhyP0eiQIt5tBUZt8fTI1L3cZq35NRzjsSAiDQ37E+IPr39N/0wCgq9MSfUg3AcoKv
         e/wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZSIsoK8ZXlKvkiZD/J6Ts0ZkJG/87fCkxfzN58BQdQY=;
        b=L0LTpQSa9fY4rwtCxnNSONxCpAf+0rtnkuav1uxHmNYAgXUre/Hm8x+xouwlxaHLtm
         hXVBKpgBHZONvQgX4+gDMV+lZMZC/2D/hz0DRNgxn4P7I4Wj192/Y2/1PoAukVgggWQf
         AsaPn6bPCXLR19+Jn5ARUbxz9UBv+AfwjK+vk5JTcM1aXMtDXx+7iXsxWiG/js5hImgD
         h4zBVzONm6DfEvzNV11IwqXG5xDmTLLUrOqvQMjNH9gc166+5G3pTkZiUkf4IgyaPoer
         1Ixaq5S8LdXPm2+XaXvtxK7XQ+2hbrICAUe8utN2HHInty4AqXfY805dgYh7ut8oGcYp
         EyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZSIsoK8ZXlKvkiZD/J6Ts0ZkJG/87fCkxfzN58BQdQY=;
        b=J27Pz2NijIZ4fEMh9VZ9Q49EXVvR5FiCXbLgtWvSj2CrW1QpBTfecFaEAypIFCqQlX
         ESaU6NY0WliWdVYRqLw0R9+/Z+VMGuf5y6ttVbUr7QRErLEMUtEhxHIr0h2+Ae0k8hws
         /NwHVkPLvs+5dDm5pICjmcFhXt0HHysq+gyiO6Yu1HRSCpydYwHYQfLAyL44Gx81sNSK
         X3B7oUtJt4Jgf7luqa29YfvEmxFgxoDSi2zSaXhUHuUUsZoDar6GZAsnrt1v2GHesDQ0
         lNE5U0eWfx6x+QUdeDvScoOjBZj6bNxJueHHja71vAYVkFCoHbYg9y4snmWlHq9zCDgF
         fTGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532FDRu7324NyDWOa0/alfNgkBzfW5rGuOgf69QgxI332yZSfkwT
	wiMCgu4sS6RMwibHZWB5YPs=
X-Google-Smtp-Source: ABdhPJxiT+fbylai+pqS2a0Zr8zT4kGjssJOB3MZHtIyq3PuUfw64YNNe2NAgmLRRISA80OLVegqWw==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr1713553wmi.161.1597395511911;
        Fri, 14 Aug 2020 01:58:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3802:: with SMTP id f2ls3787294wma.0.canary-gmail; Fri,
 14 Aug 2020 01:58:31 -0700 (PDT)
X-Received: by 2002:a1c:5451:: with SMTP id p17mr1742079wmi.180.1597395511105;
        Fri, 14 Aug 2020 01:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597395511; cv=none;
        d=google.com; s=arc-20160816;
        b=X4ouHj631NnSLMZZd06Ck6sC6jhicVmKxGpAGf514Gvs24rjp71oXVLk72PY97x6Fi
         Maav49d/IwQFZMDGpuKdAcARcliP4AVliu/pLYJJxsDau+n0ZU7K/oyVqGISTYruuryY
         IBcPMjoyWhMDkJ6ja+eFu2tx7CmQ+PBIz/cIzxAePYgxm+bp6rYbzNbgW7SGpkRpj0iE
         niHLvcrEoN2FTlPhg0hR0WXAD/XRlcVp9mnEPZLyo2XMxIutm+w7kLv+1aAWMwhKCl2B
         obyJhGp7aCKN8jmy2FSAwOae+9f3qArlgj/tMnEsvjv+Z19XIGIMD2c4y41TENHUiTnF
         sEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:autocrypt:subject:from:to;
        bh=SLhWwJ9NzsgjxePXpRqDnVuHDvWpj58qDIQ25sToifk=;
        b=BOO6BioDE/SAj61pVY7+gSjwXq2X1hZ9RiYZk9I15ncF8ok2MX/lwVDo2le/awI+9t
         f63zTNvm4tm9Y9bWxF6asT0/KVbZUIHR1FdgmLyQLVKsrj15UNEjRIym+4psQlO8smCs
         MgE7Mu4i9Hus+OA4Y07gK71CIsVCTKUrccc4we6cJ9zRs/X/KeYrL0WExosDAOABshFx
         WIUCLAfaOpkBdCDozYPQNBXd8GAJKbhOOTABb6ymKuM4K9qk00qDzW/cSmovCiFky1us
         tZ0az0UFm2QYBxWa5ye1v7RAPMUlP0bV6xbsKUvX+CsU94YQWeXqj5NSzRgBIjwL/Tnv
         cb0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
Received: from mx04.uni-tuebingen.de (mx04.uni-tuebingen.de. [134.2.5.214])
        by gmr-mx.google.com with ESMTPS id j83si864845wmj.0.2020.08.14.01.58.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 01:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) client-ip=134.2.5.214;
Received: from [134.2.14.31] (tichy.Informatik.Uni-Tuebingen.De [134.2.14.31])
	by mx04.uni-tuebingen.de (Postfix) with ESMTPSA id E2F7F4A92D
	for <jailhouse-dev@googlegroups.com>; Fri, 14 Aug 2020 10:58:30 +0200 (CEST)
To: jailhouse-dev@googlegroups.com
From: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Subject: autojail an automatic jailhouse configuration frontend for jailhouse
 on AARCH64 devices
Autocrypt: addr=christoph.gerum@uni-tuebingen.de; keydata=
 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
 T29y/VTnmoSXIbqAbOajhVUuOH67EXAD
Message-ID: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
Date: Fri, 14 Aug 2020 10:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: christoph.gerum@uni-tuebingen.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of christoph.gerum@uni-tuebingen.de designates
 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
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

Hello,

Over the last few months, our team has been working on an automatic
configuration utility for jailhouse. As our effort now nears a usable
state, we would like to present it to the jailhouse community.

Our tooling is available on https://github.com/ekut-es/autojail

The documentation is available on
https://atreus.informatik.uni-tuebingen.de/~gerum/autojail/

The tooling works by extracting information about the target hardware
from the Linux runtime system (currently mainly
/sys/firmware/devicetree/), and then generating jailhouse cell configs
for root- and guest cells from a minimal configuration file.

It differs from the current jailhouse config in the following ways:

   - It targets aarch64 instead of x86_64.
   - It supports configuration of guest and root cells.
   - It allows a simplified configuration of IVSHMEM_NET.

The current release has the following limitations, which we would like
to address in the coming weeks:

   - No generation of configuration for the inmates (networking,
device-tree)
   - Dead Simple Memory allocator that will probably give up at a
relatively low memory pressure.
   - Configuration of inter-cell communication is supported for
IVSHMEM_NET devices only
   - Only tested on Raspberry  PI 4B
   - No configuration of SMMU or other IOMMUs

The current release has so far only been tested on Raspberry PI 4B, and
this announcement mainly is here as a request for comments, and to
evaluate how our work might fit into the general jailhouse ecosystem.

   - Would there be interest to somehow integrate it more closely into
the jailhouse ecosystem?
   - We would be very interested, if we could use it as a configuration
generator for the current work on memory coloring in jailhouse.

Kind Regards,
Christoph Gerum

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ec8b8710-e966-1abf-0f64-d9e10d7e005c%40uni-tuebingen.de.
