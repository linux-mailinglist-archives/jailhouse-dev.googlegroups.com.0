Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLNX533AKGQELPLJURA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 163281F06D1
	for <lists+jailhouse-dev@lfdr.de>; Sat,  6 Jun 2020 15:35:42 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id j21sf4195833lfg.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Jun 2020 06:35:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591450541; cv=pass;
        d=google.com; s=arc-20160816;
        b=UUtaWZX1MneSvsKUEVjwfihFAmR2Hp1Il2+bfsW8h3Oyh9xIirB7VBMEjJiKWbBI1U
         E/UVRi232gwlj+PMjfyRNbacoh/5crGykGV4HOLCyoXAiTrgHTacdx6HzMvhvQF/un/4
         1FYXvaTozRJHChE0F9vAW0Eo93SJv3/LYw/hoWnL12SIUVW3eCfoi/U3pUmJu1vcQ45d
         qmuV+rhdOdJrh/K3lzrFl5wGnZ5QQ17Rf1aL/fXWXogJC8mh5rAnVRfsQIK6FBb2gA+O
         6mC4u6h4dRooWOy3OtHtK0mC6qvJmGwe8TvqF/vGTSTekf11rrnJwT7PydHmtuuZxbEz
         v52A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=rGPFXi4aEmNZsC1OGB69Eb/qWTWLFOClKBH5calBpaU=;
        b=iO6Ax0GsV5kBJsPe2RtjW1Q2DeknjRz0d/T0p0WsG2pOCHOwqFllVfyFY9s/Tk2L8N
         JhAnfqrdX7drT7R2lQ6RJjNoXu+uJifnhpVcUYhg0NuJord8Sxwm8sipMyhU/wov/b/X
         JN0sH0S0mUevbffGJQPDX6ah2cdlh61JJ28c+vj632nyw/yFZTokszq8+0VLxv5ZnooW
         w3ioWFBl4++CKmiTzkbdaratB4MUFl1+86Dfhy2Ub5jSjfPv1+DFCUmzOzupKs/vSdIK
         SfRqKSHv/lP7eAE8nJlWDWgii/dUgEbcY+Lkm69mtD3ifDyhctinf0Prth8Jx7uhzVCT
         EdXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YPwcBPje;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rGPFXi4aEmNZsC1OGB69Eb/qWTWLFOClKBH5calBpaU=;
        b=YL7EU8/RR6KhXlK6HYgYlfoJrBtzGsbhemcLIrZfIcj1e7Z4SzUejbzfEhLce2xA8E
         p+vtVGvp/ImQA1Oc7Q4FV99JYbMWzuILeRAvQxw1425IVf82Jzno2NypB+X2OJdFOTyj
         lTe5XgV36L4mGdvvfdioB117cHm0t2nG5SNHFvFRZM1yTVmPBAaHf1VevNTJ2ets+NxR
         C5xa4qca+aWIGOmoy92Q0BVTd/h/fbLIC1bglj4J5YFrcIkp1taY9ffplTz/oR3yqhgJ
         kGRDhNusdnCiRdKUY6zwz3xTYYEepB9whTyEdBPlZS0mjg90avyDMB8KX2McrtRr+tk7
         +bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rGPFXi4aEmNZsC1OGB69Eb/qWTWLFOClKBH5calBpaU=;
        b=jraaZ9qhUW9ExF2lL/e27AvIMQ389xFIqElHtceMH57+1vbhQM9RT4sXFCsl/wfiea
         Cr5WQzxyoVSLaJQ9gkqQvTic5mzZeI2TqyC3W7cqID6f2CQUErOkucyaHAHdUj29bf+0
         LoYu4fEv3Lpj8DyDz3FQU3b1HF2iefSkL+RcOk9fJZtOogrfX/kcrHyknFKCfsBO9Y/1
         oNybNkiv3mTqEM+4YlOWSPGfGLWF+8D6xj9664pAYQgxdK4rYVMfdOyuz5umcihieBoF
         HyqDycwFKpDB/uAHOQXQtNt/JOoQ2VLTNhcAW/BHU5TER8BYhNxIPiAktEadKbG8IrGv
         NS9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53322DxTpRrFgyIWg1+dsuzJak1R016YCZtrLPSmCcOgCZlxDHwe
	qG20W6uWuh3jq87zDSjZUME=
X-Google-Smtp-Source: ABdhPJzq8erfxYEBzFtQVTa6u1uI6O5dtFFZvrgOIaxGBja6AO4//Tgl7HtuKKV2y22967Q8Pq3pbg==
X-Received: by 2002:a2e:b6cd:: with SMTP id m13mr7255148ljo.391.1591450541586;
        Sat, 06 Jun 2020 06:35:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998a:: with SMTP id w10ls743857lji.0.gmail; Sat, 06 Jun
 2020 06:35:40 -0700 (PDT)
X-Received: by 2002:a05:651c:cc:: with SMTP id 12mr7049565ljr.397.1591450540858;
        Sat, 06 Jun 2020 06:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591450540; cv=none;
        d=google.com; s=arc-20160816;
        b=jR9p1vQDLgM3s+zpL0zgJLRw4xOY/5/veN+Zsp2cHGSQp+s+Z3dQoJnTMmcMWAb27w
         OmNRnIFDpf0h+sToscA9svtQJagNYwJUTzVYNsvGRugEtSrL60PL31YGW9wvjiPrkbzc
         W1U1lFmBNveblg/lc7bvzuHmlJytFu3p5WNhInvjDMhHWxsS1odTX5hm0kT09zLDSy7b
         hcVha82UhKJA0pnRG9QNkF74/yfRnyVyvrXLUWR2il9/baU1p9MXNPJoICR0hD5y82aE
         9OGck0rcbeaKBPdgCwKzYfTG1+0Shq/i93t3Wk1szyiu7EWYiqqbITw+AfLuTIOWygzJ
         zsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=xj1IB2hJb/hIe067hxJD2X5bjgI9hN7zLfzqHUJBYRw=;
        b=AHOMiQ3vvVDi9jEIVV0MQf1zF6Dp7z37tv1vvSXSwDivZfYEoa5z82DG+LMxhUuxVo
         CBczLiWISXyp5uoC9tsdmUVhnWNRFDVfKucJZK+MnK8tCcsiYVqfrlpuyxIJs2r5tt1o
         IIb6i52FC43djdy3p6PDFiM55RQC32at+h+uwKXiv63Tuih5V8ZuYQt9Jmbjqigf2t65
         3g9bpOwtmWDsc6NInYnyqBuBPZ0ndxP8xWwU8Q3cB4MBFH17Bdmi4pPzQTNs8A6Uil18
         qAxe/FVSpD531DqplJKco5RDHdGfxc0m0E4Pt55AJ2WqvXyrHNkTwlVrrt825RB7Feu7
         JDxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YPwcBPje;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id w6si326793lji.2.2020.06.06.06.35.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jun 2020 06:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49fLB35yV8zxyt;
	Sat,  6 Jun 2020 15:35:39 +0200 (CEST)
Received: from [172.18.243.198] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 6 Jun 2020
 15:35:39 +0200
Subject: Re: [PATCH 06/15] pyjailhouse: config_parser: Add SystemConfig
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
 <68401c86c58700c207069a9c423c2a0ed5bb7126.1591107398.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <f3bc48a2-9676-b46e-4aaa-c0d5f046497c@oth-regensburg.de>
Date: Sat, 6 Jun 2020 15:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <68401c86c58700c207069a9c423c2a0ed5bb7126.1591107398.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YPwcBPje;
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

On 6/2/20 4:16 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Add parsing of system configurations. This is so far only processing
> essential fields needed to validate the structure, extract the
> hypervisor memory and access the root cell data.
> 
> The root cell is parsed via CellConfig. As the embedded cell contains no
> signature and revision, CellConfig needs to be made aware of this mode.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  pyjailhouse/config_parser.py | 43 +++++++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index 43dc1dbc..2d0967d5 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -90,7 +90,7 @@ class PIORegion:
>  class CellConfig:
>      _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
>  
> -    def __init__(self, data):
> +    def __init__(self, data, root_cell=False):
>          self.data = data
>  
>          try:
> @@ -109,10 +109,11 @@ class CellConfig:
>               self.vpci_irq_base,
>               self.cpu_reset_address) = \
>                  struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
> -            if str(signature.decode()) != 'JHCELL':
> -                raise RuntimeError('Not a cell configuration')
> -            if revision != _CONFIG_REVISION:
> -                raise RuntimeError('Configuration file revision mismatch')
> +            if not root_cell:
> +                if str(signature.decode()) != 'JHCELL':

signature == b'JHCELL' is a much simpler comparison.

> +                    raise RuntimeError('Not a cell configuration')
> +                if revision != _CONFIG_REVISION:
> +                    raise RuntimeError('Configuration file revision mismatch')
>              self.name = str(name.decode())
>  
>              mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
> @@ -137,4 +138,34 @@ class CellConfig:
>                  self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
>                  pioregion_offs += PIORegion.SIZE
>          except struct.error:
> -            raise RuntimeError('Not a cell configuration')
> +            raise RuntimeError('Not a %scell configuration' %
> +                               ('root ' if root_cell else ''))
> +
> +
> +class SystemConfig:
> +    _HEADER_FORMAT = '=6sH4x'
> +    # ...followed by MemRegion as hypervisor memory
> +    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
> +
> +    def __init__(self, data):
> +        self.data = data
> +
> +        try:

Why to we need such a huge try block?

> +            (signature,
> +             revision) = \
> +                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
> +
> +            if str(signature.decode()) != 'JHSYST':

Same here.

  Ralf

> +                raise RuntimeError('Not a root cell configuration')
> +            if revision != _CONFIG_REVISION:
> +                raise RuntimeError('Configuration file revision mismatch')
> +
> +            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
> +            self.hypervisor_memory = MemRegion(self.data[offs:])
> +
> +            offs += struct.calcsize(MemRegion._REGION_FORMAT)
> +            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
> +        except struct.error:
> +            raise RuntimeError('Not a root cell configuration')
> +
> +        self.root_cell = CellConfig(self.data[offs:], root_cell=True)
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f3bc48a2-9676-b46e-4aaa-c0d5f046497c%40oth-regensburg.de.
