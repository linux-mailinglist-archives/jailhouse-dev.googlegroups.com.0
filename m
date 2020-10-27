Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUWF4D6AKGQEFC3FTWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67C29AD86
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:38:27 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id 31sf756182wrg.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:38:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603805907; cv=pass;
        d=google.com; s=arc-20160816;
        b=praNDfcMuBQg+jEV4+sh5XQh9IIbxTNvmzQmgb2Qwe3B8Ql2ZUCVuVXLuVsebEoKgP
         Pm+QZxuA/bXp01a0oPksKht/nej86RJSiFavrqA77QmfA1VnnQppEPiZKs/VB1F3qAUe
         x/SRf/7+xN0P+kO9h9IZlmbY1iGHb09SAiTBKjHA5CWBTlmESrc9eUKjoIFLJBWsSpWY
         adBzdI89qaHz3P/ubpt5uCbkTWRvSYoyaVtcGjlm4Avk6CFE5sYQKNtwQV7wO6IqxOcS
         SQKmPXOqL88PMeWl4TZ5QrdWvpsF3jJ4Hj1b03qcjhsgZgJemC2rTdvgF7bfxT07T+UF
         Z90g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ljHDH3byr27RfFDE5b+SwcsNw6AiSK4FFgHk19esk00=;
        b=l7ke/z/izso43EJskxMpsk8YbeordzGX5D2gaDyB/aS+/ARbzv8aFLhCktO9op/Z1z
         2QU+CtEcHrnie20YxBbZa6YrfjVtW2cr8v2TdaLE1QlC+8L3teA28bK80TwvDYYUQbJI
         nZASXXZIYTiNrYirG7MSRvAaqOAPh+Aahf3euu3eiIFjBQ8z+0u802jkHnUBs9B5kSDl
         WW+cS30KCixlGeUQ3qiJpEp1lDMOwT0IaYvB+Bhu5fJCquK2dqTbvN+5Xa2rhm7vIMYC
         2kHWqKkddGPyneIKADYgfSBvcFTetvbTnurhSMM0KVkmH9cRFOWqJ3806JqITraqWxoQ
         J2bg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ljHDH3byr27RfFDE5b+SwcsNw6AiSK4FFgHk19esk00=;
        b=RbdH6S5S6zql9c6y/T50hmiRmI7/Hw82SatfH7o6PR3jmOLHn0UW3OLWBnoyYg4eCC
         2YadX+Wc2dODFy8CmUvIgqPhMeZ5lcZX/E8avdViKKos/3M+yugTEqV/DYMivKFHfHzI
         /cdj5k/dgpMyxHNZSl8BTBYcbH4gBhoYGApFVKSK3EKd4bol75CeYmCGMVPzJaj5cpfd
         tPpYOcC++iTXSsX3CcBJk6feEqqWhncj+wntYhRCb7eBaiYd/rvMNPG5btd5THZyTmVF
         Dc22VeLjmKmT+obUmvn+zONLsKUoJjp7sUNCo6s/NFCvmGpHlykLe0EkXVFqXupZidxb
         RhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ljHDH3byr27RfFDE5b+SwcsNw6AiSK4FFgHk19esk00=;
        b=QkoQB9xxwA+KQDCQwv/JaQvDgSe8h9O1koSohIzINHaXJC2K6JET8idx8G4ohGgxA5
         S+8rOQe+MkzYZ1Aj0ydA0Px8jb5Hk74Mhqq/OhaLPlKWcidNCx9WT0gl+qAo1fY6QG8v
         nkj7ZTJhSw8rdvONj87XvCpzgwVFw3xJVUNazTsvqW32PKSDvxo3azSevWDBF5HcF/Pl
         CdX2fOt4gLvT3wWIqR8fhKRSCJGAbYX2s/VprVsRCFI/Ri648hiLtsHYhv2zZIJMwLKk
         /uRTthzY5SKgMQxOaJ3fb3RuKRqW1mmyKNNkHcuqzrD7HWmXiJbBYG0QJcXrYPcJiO8r
         eP6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531I2Go7W71TBz0Xpsu0FQEEaI+XPavVdgo9jg2el0CxxiptYGBW
	uniyG9+HU/uAeRRLzMpNeuk=
X-Google-Smtp-Source: ABdhPJyqyMgYgHIoVIsn0X4EN2GSuxH6bbeSstJlDaVDUg9Y/iB4a2+/EkjesBgx7G/czFRRb9ESGA==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2852521wmp.187.1603805906971;
        Tue, 27 Oct 2020 06:38:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls2331132wrs.2.gmail; Tue, 27 Oct
 2020 06:38:26 -0700 (PDT)
X-Received: by 2002:a5d:5612:: with SMTP id l18mr3127251wrv.372.1603805905934;
        Tue, 27 Oct 2020 06:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603805905; cv=none;
        d=google.com; s=arc-20160816;
        b=bIz/ucKkEXfgGQaxh1dCS7FTnCaJLCGdghqBs+ll2Uhtp6f6xBPxSuL9x5FIpqi4xp
         hgTm1ltyh34qZ5AJnYFWnF1e0x3O/HwCpo6E5YmGLAv0ZtSwLG0AtyZaRSkwgy88Twly
         6u49wnyoAhNS6fhXSC/nyV0r83dvnv5+YAGTZv4vCQ0/lv2ShPJPG5ZdzuS7zokaeThL
         uby2p3zKNZ/eA4zBp8/ODDPI2jFeHBMU0iv9XW7k9ij3ERMp+tMzF5/AIGYLRyxe0kOa
         oy8f1XFUcSwv1K95YbjdctQotlLDlX1rCkB6c2n+IpvmNzVrfMh1WKV2olMjXli4Vrrb
         8mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OSP5I/vViG1TZWV9qUiyEwZwkhQWXfxr0DA2L9r5w/o=;
        b=RuUr2/2ckv5BLYxJ+oPOEDR2TS4qG0XCMFaSSOYNFrrShCwkCdbVpdVafiy0eBIoWI
         IUGQB14awRG9s/P5t/2ULCgq39BZGwfH8n62pEL+sjQvUSKUS6rJj+6h+elrANd1nex/
         RuwzLz7+LLWGIV14sltAH5hz1b9cV4xlko7V0RLE4nhnqe2HDDtca/DfNLJgD895f3pu
         CCG0niJht1cf+JVGjkAxWRNX8pSWtZsBdESotf9wWZTMYvwXApjTvEUcq/sGlrSW6FqL
         qLUOanafdAFBB5eKn8AJj8rri2f9Ey19kaxNbOtqb18uuHPTtJTWJUNvVqXLcdbvFkpw
         CwaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o138si38962wme.2.2020.10.27.06.38.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDcPWX026365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:38:25 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDcPoK027762;
	Tue, 27 Oct 2020 14:38:25 +0100
Subject: Re: [PATCH v2 33/33] hypervisor: Makefile: re-introduce -Werror and
 remove -Wno-error=*
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-34-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e51c05cd-8ad9-d771-cd19-545865d2701c@siemens.com>
Date: Tue, 27 Oct 2020 14:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-34-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Re-introduce Werror that was temporarily removed in 94ed4d4d1a30.
> Remove Wno-error* and consolidate the CFLAGS warnings.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index 524653aa..8e3f946d 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -26,12 +26,10 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
>  		-I$(src)/../include/arch/$(SRCARCH) \
>  		-I$(src)/../include
>  KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
> -KBUILD_CFLAGS := -g -Os -Wall -Wextra \
> +KBUILD_CFLAGS := -g -Os -Werror -Wall -Wextra \
>  		 -Wstrict-prototypes -Wtype-limits \
>  		 -Wmissing-declarations -Wmissing-prototypes \
> -		 -Wnested-externs -Wno-error=nested-externs \
> -		 -Wshadow -Wno-error=shadow \
> -		 -Wredundant-decls -Wno-error=redundant-decls \
> +		 -Wnested-externs -Wshadow -Wredundant-decls \
>  		 -Wundef -Wdeprecated \
>  		 -fno-strict-aliasing -fno-pic -fno-common \
>  		 -fno-stack-protector -fno-builtin-ffsl \
> 

Thanks for this again. Given the noisiness and the (assumed) low value,
I would just go without Wunused-parameter for now.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e51c05cd-8ad9-d771-cd19-545865d2701c%40siemens.com.
