Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD425DTQKGQEDCGOBKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED87384B5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 09:06:56 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id r5sf1703387edd.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 00:06:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559891216; cv=pass;
        d=google.com; s=arc-20160816;
        b=AVQbaCLoEag0/Ce3IivUdU4U6y1ap225L0pLP5sEReaAXcgdirkEnjfnu0cUyhCCal
         0xY5AVG+G22bs1IZZt/rC8Aqp8HhwUGsDeHjDBBsD5h7QDqycYKxRxzNPfOxTLdSQ0A6
         pahS8U5rfBb0Ny+pAKBQJYGvEvglRfuOuR7DZadCzJvJPY7DkgRPyaie4SpyLtYwAP+6
         v9Iw8ANnURlzYCpd9PzhWse40bzwdA7k9wWz7qIrSavFBviJnEMD3DDkPo8l0cPexIfs
         1MW69h2wHAlWaKr+npTZfwe+LZafcRZNfbSpQYhmQq2SmNIkh3Q/l4CAnsC53awhQcL/
         0fow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=/GNFzSVvTpIg/UPc8D7N4oEMup5hJFIbr2o4gfOz9Vw=;
        b=mUNzf3ZgWIOFoKw+GlQ6AfODZe/fHMM6wTxLu+5g92GBraUimU2RlbLusfTg9gCG7A
         Pqnnq/JkUIJAUMfjtlZ7UilLLsRDLq0SKQvG7nrlVHNShznwHscE+gWubRWYi28LNEoh
         fLTb9UNci7w9mZKrc8CfI0N3l9TVrQ1DVO4r0p/wv8CzjqVFaf9Z9h/GFLUqDimPZjg2
         JVbQBG1lOry4d5cbYME+11XNBuOiNRtEcFQCoNoTUqZu6IDdHLVJTs//6a7qAcQvfyJw
         itV3OY5FakV22kextMwP2uftpD/Bne8XgJkwfwRkFaLV2Vpkj1lhZyXCnuU663xs+ss7
         5zmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/GNFzSVvTpIg/UPc8D7N4oEMup5hJFIbr2o4gfOz9Vw=;
        b=BMX6C6UZvQnHpv+95xauzVRiRZMD59O4P0LTJdOzVQqQ1zlc5Ys4Pc3cvBb2E9vLj6
         O/3YERsG+9gY2lozQ2ZjoeM3ufPxD6bSKIAhfyCgYetJLZkhulMmtVsjL+EpOazEWNuQ
         JdsO/A/Fw8tFXs5EwNEHLUL0y363nyobJa7N1MGn8paXYZAdHbIu0GBzxlZ4FxOJ903I
         3nrFXpZ0USL+/ZfriNzByJeXuhBrVyHFx7vCP6NKMniIvNOtmmeIOLz9VuyJjH4YdMwD
         mt+XM1ZTEv01YxQzyPxOOlN8ys6B1qFDtHJfsZ5MvoxGJD+fw1WNgb4rwICR126EFM+7
         Cxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/GNFzSVvTpIg/UPc8D7N4oEMup5hJFIbr2o4gfOz9Vw=;
        b=GLgmoMUgYTn8UMk9rHdz0PXYqAVbPti4AYHXqmlAfEpRASQcnm55vkaEn0O21rhFmP
         21KGEGAC2wfD2663+kr+K4by9q5kJ/65NX23xyLl4AQRNB3F4YWOsAO+nH4B0i+lOZIv
         kpt3YJ9cb5TrNQ+H2SN/eDYjR1zcKLbwP/aRhvTMBemOka+HKFHqvLgXc4mcB5CGGvr1
         8c7P8ltSC+961hzUSMux0L4I/dUrxwwi5rodNWT6IsjtQn727FWistjpNuwhU85zca6t
         PK8lijt0Fe0y+ZhwFgessFmW/SQvW53nuF4elAu4ponQaAEHirjzwL/R3O8x4F6EWrQ/
         wTxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7m9LMaILsTgzwhb/jirUxCSiw4j5bEEv9wqLch3Pcs83kVpie
	ZtP/VUnHDj7QQEKxI3ojavs=
X-Google-Smtp-Source: APXvYqy7rXvJW0NiLSKg2/ITdBUSKnFLoS8yW4qRt9AN5c+wQDAB2LztHpeOwkM1V/ov/N9orjEXQg==
X-Received: by 2002:a17:906:7ad7:: with SMTP id k23mr45828283ejo.0.1559891216088;
        Fri, 07 Jun 2019 00:06:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7807:: with SMTP id u7ls1962125ejm.13.gmail; Fri, 07
 Jun 2019 00:06:55 -0700 (PDT)
X-Received: by 2002:a17:906:610:: with SMTP id s16mr44882368ejb.108.1559891215346;
        Fri, 07 Jun 2019 00:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559891215; cv=none;
        d=google.com; s=arc-20160816;
        b=K7uS2KiXLfRRfx2DO9U2YtnCkpYc3yGoJivYFTbK0zXT9lvRBMNxAMFrK1cKaKLF/V
         uZr5ikL460QLIOWAVXpbs2BK+S0LmmxGjcCu3x94gOnq3FMkUeqQSJbYsMOOkNJFVGgx
         I+ifFJnhrvi4hWAOZbOsnEE/DHTLW/ToVOqCbbbetm0EVrIpo8ART+tGbtemV6mhnnEN
         bG32JfPlA76OfHNO5Ec6zLmqWPajqwvMwKkMu1xdl7RAqwEueADwAo+f5N24rbsK40Ce
         rPeDD0T4CYf9bOzrJZhSHYcDQIKpVRUwJPrIFbc3NvmMW08+BzT+ZYcJOOX9VQHkiuut
         WbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iCNRa1HCwHnslGIoTE/Ntzjx7TgMwjCDIpHQoDxAYO4=;
        b=ESY8fxzXR4TLO2+hh6W+t3Cz3mfKbOXmFj+mCf6vOqoM3vSmd1JBwm3mY4oUfdusqf
         L/I/VDhrL0cTLJUfyCz+nqTSMmYPBle0Ksys0a4le2wiY+WMZszglOgc3+ydg4Kin7mM
         rsAhuO2rNAC+lg6LVl+Cft/pE/XuZ0wf17SeVWXTJhr0gmSmEtXkpJCaijeNJVPE+O6I
         BO/+WHtPK5i9yvyJ7C0+UOfZg8rI3tWD1szFNALls+YckCiq4GUkO+Btgh3WTl7cVoL8
         Dkc79aKEzkfnmAZLqWWTflScIURVLfk3VnaqmTr0VysYjrlgHQPhWOM3pnGanFNX4EON
         LCSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t36si39769edb.0.2019.06.07.00.06.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5776sNv016197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jun 2019 09:06:54 +0200
Received: from [139.22.112.121] ([139.22.112.121])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5776o3E027538;
	Fri, 7 Jun 2019 09:06:51 +0200
Subject: Re: [PATCH] pyjailhouse: sysfs_parser: fix IVDM memory region
 definition
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <20190605153900.32177-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6c82b0ff-36a8-4916-acc0-f1dc32d8b6eb@siemens.com>
Date: Fri, 7 Jun 2019 09:06:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190605153900.32177-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 05.06.19 17:39, Andrej Utz wrote:
> Second parameter to MemRegion must be its end (inclusive).
> 
> Fixes: 5fe206927c05 ("tools: Implement ACPI IVRS table parser")
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index fa32ba48..83222c4a 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -481,7 +481,10 @@ def parse_ivrs(pcidevices, ioapics):
>                         'regions. The memory at 0x%x will be mapped accessible '
>                         'to all devices.' % mem_addr)
>   
> -            regions.append(MemRegion(mem_addr, mem_len, 'ACPI IVRS', comment))
> +            regions.append(
> +                MemRegion(mem_addr, mem_addr + mem_len - 1, 'ACPI IVRS',
> +                    comment))
> +
>           elif type == 0x40:
>               raise RuntimeError(
>                   'You board uses IVRS Rev. 2 feature Jailhouse doesn\'t '
> 

Thanks, applied, fixing up the whitespace warning.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6c82b0ff-36a8-4916-acc0-f1dc32d8b6eb%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
