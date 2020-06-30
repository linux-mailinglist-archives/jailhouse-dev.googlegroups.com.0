Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW45533QKGQEJYDIKOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901920FC85
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 21:13:32 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id o3sf17595051eda.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 12:13:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593544412; cv=pass;
        d=google.com; s=arc-20160816;
        b=xl03MccVTGv9DoUfi66DTmXBliwK6wK1YD6X80mnJ15t7RAw9hBc4OpS3loCltAbIU
         K7qgtso6ve3EUsy8PSnegweRTIGcT77T5ye/oAJGknf2zlYcfhUBIzkEH3lcc2Okbum8
         Ulnya136oGU9LkLLzOIucFVJqL3MDS6cxix5IlIxj7oiaW1w37qBajSdvB8dae1kx426
         hJz3l9mCt3cBjdPsEFBYsN5m61vhDBkXayltQ8pILDvjT5PNckgk5TvjcbDT9zNva0II
         wuadTdvnMmXPrMtANAXEZh1lxFWS6e9dynSbEcLoQlfjrt3VhJvcLz13v6Vp+1MQqjpu
         hFaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=XwvM5eUz4MN6hVhRumB6XBqEEU0D0vgvdWjZPMgtw8U=;
        b=YLhKppa4Cn4NhF7XMGZ/5a9XJJaenjFp9Z5Ewfih1b+GcwqK5hOAslGJBjWWHeSlYx
         D4i5ImTszY6UvqqS+NYTAnEmkRtGeqh18r+KFIBEQgPwwsKlqg0WtjI8M0gkw+wva9Rf
         NKG8ZRRvfJIExNpW0ML0OqLUvER+GUXQbwNXeo54tJjiYyFyITO6pTkImgDer/q/vfRj
         OkIoqocJByLi3RgZefkotNbemOUujBgP3/+Q0c/d45oUcNmfrHmU92V4gOn18DAQIHxA
         0xNWFP5NjcD9xZQkSL2pfdi3EoXiPX4Fcb8auuTvLn2TrTPLNY8N04UT67pZcTqaSYKS
         cOOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XwvM5eUz4MN6hVhRumB6XBqEEU0D0vgvdWjZPMgtw8U=;
        b=BG9PKa86qvUdin1W/nLR8KGxjqqTgeDNdjxAzawWL/uqlvDs5TspNfihSKcYS461CQ
         ObUFl6j0+UEHn68l9dVu42zrf58jv+1vbk4khGWcrfkU6xrN5/tdwMiexm4qW2wt6ODy
         tSPxc+nFqUcBo7sGtuuZuTdbgJC/A23PjVuZs/j05unu3JhjOqQ1ikBb+eoIRQNiQyZS
         dmN88/5FZCUThA4K1laXsGA8/fwJRipkxXXjSvlAsYeHUxaDhmLZr6VxPie+o7m6wFhh
         U7iUF5CoKIHZaSe6oteRu4OGGgDAaBIlK7wNDkWTPvKbQiksTjzIxsDWnSGIyJPletiw
         Dhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XwvM5eUz4MN6hVhRumB6XBqEEU0D0vgvdWjZPMgtw8U=;
        b=GPJ1deHtOaU2UKjHhq1JErg5FK1IDBUQISyt1Eft/pbbyVB+EHnzuHopRZmVZYdDJR
         cqCdul0OIpn5ZQTgR46l0z9fKv74B92w9skGShmYZswUFsCU3mzmq58je31gNDaftkJO
         5LkB9PR+KbG+jEKHActmpVaqIMAhaz0iBG/h2prBD8c3d9zDzznAFku+Kz4Tx8doon5Q
         xlBjWbDXTQhs26W62+kqx3lPAV8rdjUxLwZxQWJaCcq1szW1qkzKyT/vr76J4UIhigLG
         bvWkR9R/m32EO17op29iqigdCG1NivvG5rmAjzrVt2Qd1QhIqS0vdBFfrE2kZnOzs3oi
         Z6EA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532P1K6NUsZB21V1PkpyAJx/VKtismW66ZZRJL4OqCPJWB1LKio9
	HCT19LmavQ30Twmxg0LivE8=
X-Google-Smtp-Source: ABdhPJwtg8xwkvp69ZLrhFuVvF006dKoHqB+UuRgfxi1w8QMl4NHZ8NezxuG0qGsb8x3TU43Cckh4w==
X-Received: by 2002:a50:ab52:: with SMTP id t18mr25238699edc.195.1593544412104;
        Tue, 30 Jun 2020 12:13:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d37:: with SMTP id dh23ls4445565edb.1.gmail; Tue,
 30 Jun 2020 12:13:31 -0700 (PDT)
X-Received: by 2002:adf:ee05:: with SMTP id y5mr23867013wrn.185.1593544331449;
        Tue, 30 Jun 2020 12:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593544331; cv=none;
        d=google.com; s=arc-20160816;
        b=fLJywTnSGxMINDC1nt7maYkXPr+PXbLS/Gz5uijczJ5XtwZq4aY1KucUfjhGqGeWZ6
         7kovBhbDcZtqylzTLOVfrzaafmTcibLFAsufKeHzhb06hegzi4Zx2ejZfJZnhTx20wct
         ydIZ+NLrKWV0hiIc3tnkCjEUyKin7Sj2FOlaSDqm1GVcy5uoSpwwX5fsn2s7VU5P2otS
         hdU+C7KzM9l2lFzO/dsZddKcP8Zhd+WHPvpRi49BjQFeulZhcSAbCXG58KCNKya/i/zD
         VCytVnWOeROSk0fyN0AtBRCWafosEIdp3AgFTEuDyTZFBDI69d/WYESNhRtQiiLra04b
         DLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OqbFSt/Cy6KoeZiJw++XRU6JFCnaQOMreNHohqsiotE=;
        b=AH0fK0mCtKiMHVJb4Gfig8ZjEqOAa9XZW83T0WEkDhLH0hX5WjdZj7JDgIWJnMIZ9l
         CMSg7tiMu198xttMY+4pwZE6ppQlU4cV8WgREBgyK5ftIQ6mMWthfICudgHx0SWXeYZm
         eHwoJzAuoiWueS1kV8uDA0YgkvE2CZpRG5cGHntB3CnnOOry3q49mXKwEKFlaltgA2Zn
         zxAXQ6I5rnIM237YHcGgDFcua4CQoYacis4uqEkg4reSBbDEMbqh85MfEMwOdHQMZh3C
         DzdirIk4RMzidw+Rhq0uoRwGMxz61O0+yr/qrUY0EYxy9VihbIuxkRGcZixCf4uk8e+2
         J+BQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id l4si198424wrw.2.2020.06.30.12.12.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 12:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05UJCA44015611
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2020 21:12:11 +0200
Received: from [167.87.7.177] ([167.87.7.177])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05UJC9xX026687;
	Tue, 30 Jun 2020 21:12:10 +0200
Subject: Re: [PATCH 01/11] pyjailhouse: config_parser: store binary format
 specification in struct.Struct
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6229c648-1b9e-19ed-95b0-6a5fd55e12e9@siemens.com>
Date: Tue, 30 Jun 2020 21:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 30.06.20 08:42, Andrej Utz wrote:
> Improves its handling in the code and slightly increases the overall
> performance as well.
> 
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/config_parser.py | 51 ++++++++++++++----------------------
>   1 file changed, 20 insertions(+), 31 deletions(-)
> 
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index 6b9d9066..b75b9312 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -52,15 +52,13 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
>   
>   
>   class MemRegion:
> -    _REGION_FORMAT = 'QQQQ'
> -    SIZE = struct.calcsize(_REGION_FORMAT)
> +    _BIN_FMT = struct.Struct('QQQQ')
>   
>       def __init__(self, region_struct):
>           (self.phys_start,
>            self.virt_start,
>            self.size,
> -         self.flags) = \
> -            struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
> +         self.flags) = self._BIN_FMT.unpack_from(region_struct)
>   
>       def __str__(self):
>           return ("  phys_start: 0x%016x\n" % self.phys_start) + \
> @@ -106,37 +104,32 @@ class MemRegion:
>   
>   
>   class CacheRegion:
> -    _REGION_FORMAT = 'IIBxH'
> -    SIZE = struct.calcsize(_REGION_FORMAT)
> +    _BIN_FMT = struct.Struct('IIBxH')
>   
>   
>   class Irqchip:
> -    _IRQCHIP_FORMAT = 'QIIQQ'
> -    SIZE = struct.calcsize(_IRQCHIP_FORMAT)
> +    _BIN_FMT = struct.Struct('QIIQQ')
>   
>       def __init__(self, irqchip_struct):
>           (self.address,
>            self.id,
>            self.pin_base,
>            self.pin_bitmap_lo,
> -         self.pin_bitmap_hi) = \
> -            struct.unpack_from(self._IRQCHIP_FORMAT, irqchip_struct)
> +         self.pin_bitmap_hi) = self._BIN_FMT.unpack_from(irqchip_struct)
>   
>       def is_standard(self):
>           return self.address == 0xfec00000
>   
>   
>   class PIORegion:
> -    _REGION_FORMAT = 'HH'
> -    SIZE = struct.calcsize(_REGION_FORMAT)
> +    _BIN_FMT = struct.Struct('HH')
>   
>       def __init__(self, pio_struct):
> -        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT,
> -                                                      pio_struct)
> +        (self.base, self.length) = self._BIN_FMT.unpack_from(pio_struct)
>   
>   
>   class CellConfig:
> -    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
> +    _BIN_FMT = struct.Struct('=6sH32s4xIIIIIIIIIIQ8x32x')
>   
>       def __init__(self, data, root_cell=False):
>           self.data = data
> @@ -155,8 +148,7 @@ class CellConfig:
>                self.num_pci_caps,
>                self.num_stream_ids,
>                self.vpci_irq_base,
> -             self.cpu_reset_address) = \
> -                struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
> +             self.cpu_reset_address) = self._BIN_FMT.unpack_from(self.data)
>               if not root_cell:
>                   if signature != b'JHCELL':
>                       raise RuntimeError('Not a cell configuration')
> @@ -164,55 +156,52 @@ class CellConfig:
>                       raise RuntimeError('Configuration file revision mismatch')
>               self.name = str(name.decode())
>   
> -            mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
> -                self.cpu_set_size
> +            mem_region_offs = self._BIN_FMT.size + self.cpu_set_size
>               self.memory_regions = []
>               for n in range(self.num_memory_regions):
>                   self.memory_regions.append(
>                       MemRegion(self.data[mem_region_offs:]))
> -                mem_region_offs += MemRegion.SIZE
> +                mem_region_offs += MemRegion._BIN_FMT.size
>   
>               irqchip_offs = mem_region_offs + \
> -                self.num_cache_regions * CacheRegion.SIZE
> +                self.num_cache_regions * CacheRegion._BIN_FMT.size
>               self.irqchips = []
>               for n in range(self.num_irqchips):
>                   self.irqchips.append(
>                       Irqchip(self.data[irqchip_offs:]))
> -                irqchip_offs += Irqchip.SIZE
> +                irqchip_offs += Irqchip._BIN_FMT.size
>   
>               pioregion_offs = irqchip_offs
>               self.pio_regions = []
>               for n in range(self.num_pio_regions):
>                   self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
> -                pioregion_offs += PIORegion.SIZE
> +                pioregion_offs += PIORegion._BIN_FMT.size
>           except struct.error:
>               raise RuntimeError('Not a %scell configuration' %
>                                  ('root ' if root_cell else ''))
>   
>   
>   class SystemConfig:
> -    _HEADER_FORMAT = '=6sH4x'
> +    _BIN_FMT = struct.Struct('=6sH4x')
>       # ...followed by MemRegion as hypervisor memory
> -    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
> +    _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
>   
>       def __init__(self, data):
>           self.data = data
>   
>           try:
> -            (signature,
> -             revision) = \
> -                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
> +            (signature, revision) = self._BIN_FMT.unpack_from(self.data)
>   
>               if signature != b'JHSYST':
>                   raise RuntimeError('Not a root cell configuration')
>               if revision != _CONFIG_REVISION:
>                   raise RuntimeError('Configuration file revision mismatch')
>   
> -            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
> +            offs = self._BIN_FMT.size
>               self.hypervisor_memory = MemRegion(self.data[offs:])
>   
> -            offs += struct.calcsize(MemRegion._REGION_FORMAT)
> -            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
> +            offs += MemRegion._BIN_FMT.size
> +            offs += self._BIN_FMT_CONSOLE_AND_PLATFORM.size
>           except struct.error:
>               raise RuntimeError('Not a root cell configuration')
>   
> 

Cover letter missing, so I'm commenting here: Will have a look, but not 
the next days. Definitely looking forward to play with it!

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6229c648-1b9e-19ed-95b0-6a5fd55e12e9%40siemens.com.
