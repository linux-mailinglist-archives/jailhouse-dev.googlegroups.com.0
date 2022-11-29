Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVPZTCOAMGQE2NVRMBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2163C628
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 18:09:42 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id 204-20020a1c02d5000000b003d06031f2cfsf1964743wmc.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 09:09:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1669741782; cv=pass;
        d=google.com; s=arc-20160816;
        b=WQO2e4eqtn6mNYvSuFlyhNOHp6n8ASyB6mX679H+MqgrZA1KqtQmnH8RJ6VN9V00x7
         XJiOaLTMKMqsurabnjP1fMIV8TbbuZ6FF6vj2OiwpEUSja5pjXKwj2uOytWJXtxbWKEg
         Ef1iuqpBsWD9DnkMBHlTcF3R6cMJtjP19yXUeSg7udhM9e1CB+4dbchyddT/3kY/uEMp
         /KDKt6bmLrGwFBWxEpx0wB0aIAJUXJ989ZhEo+Krjc20BTOE6aUgMuOz3xOeane6yqH+
         gefhOs8m1BF1Qm7LAex6Jw5Pds1+CJVyl5qTkHSYjnF7FioF+dmMt4Rp39Tcssrc0J/k
         qaeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=rPqrSieKiMnnimV8BeXZ+zD5q9LMoc424OUB8lxAU4Y=;
        b=XhnksUnoL6YMHBZSjjIwc2+lJD92QIiOg/N39Dz9vGjoUbg962Go51djpynEfvo3ks
         /MVf2ZqbTqFHm6AK2VS8UzGM0WbbkG/CkyMtM+ewtPqLpijWilU+NtRH4NvCDle/TqXZ
         UbeefLaXeioE3hbEV8+bUBGcpbzDo1AShZy3ssK35GW3c6YzlT50RvM11hn0uoPd0TmU
         3AZaW06c7hu7oyWzv2k4EOaOomuEJyFQrQ/Pr3wV9Lf1OfKGotdOUsvw42wxqp21Wnkc
         vb1/YbvNckpGyLfNmX96u9DrzhBuZMf/b21gxmdB4lmhV+M0AnKZo3ETiCEGLjN+JC7I
         4P9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=G553dpF5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rPqrSieKiMnnimV8BeXZ+zD5q9LMoc424OUB8lxAU4Y=;
        b=NvNCbNYGI0hbFApxp6fXaZ7rfDVWG+cPk4fqOCsVZC879oCnvOJrXd9tLjphpwySX7
         PumRaV6ZXSkA2yR220Ci6Yq4hW/eoecYY69Ohe4dDfsEPGjtRQksnp8GozO741upnkjp
         Bzp/LwELa0Ii3GySeGsi/Pvs/bDXgDRL2sXNr9omf+3jK4rQ9ig1ImjgX0Ev9nH89QET
         pMRrlYuJm6ykrv+AJ2cj+UUf7Ums8KSdR2BHvK7hGOy+RHrIorIaYNAkde3H5XX7AKHz
         TL5i85oQbmgSYZ0trDfqgPEaUKW+IyJCVMmmKDh/F9d2PAOW+lIBf0ImuI5cjHT4VviN
         U/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPqrSieKiMnnimV8BeXZ+zD5q9LMoc424OUB8lxAU4Y=;
        b=XiLpNrtijw82CqYIQ1x0VToLOAZ6Gf3RRwfMvAsF2Mr3LW8vFJUFcq3VZjBf1w7w0X
         Rev1ItU2eqEVGQU+dp8Tx1FONMWvCHCEF+dxCzBEfFJquDeARTGusVagxRqPHQ1YemmU
         RpRiPNK/6OWW+07vh8OQIaUG7g5h2jazef/L9hB6rsdee2p2qP3CbE8BY21OfbzvphqK
         dE+b5MMgFXo3eZn+A6cvR+fIEQ8kVbHpOtqtnXFrwXKBewVzxqrBUbJ62Zro2PfEwN1i
         Ud7S7hfFB31vx3Zd0tpf2gHwU1s+QoozZmEGcbuconplRNyCykoELhPwtX18DT4yp0Ia
         vDEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnFtxTINb5amT5t/gz1pNAWvO9o31W0dGenxhAuflHb6m6cEy/3
	TVPL09t/FU2WVCwpbxwE5u0=
X-Google-Smtp-Source: AA0mqf4neUVkFJkpv2UOAyqNQ9Oyb7GU0IUihWdAgC74YYw9Q0Ei9tHE50C3prgCKMxg1tszc+zOfg==
X-Received: by 2002:a05:6000:18c7:b0:236:a471:81c3 with SMTP id w7-20020a05600018c700b00236a47181c3mr35357093wrq.392.1669741782208;
        Tue, 29 Nov 2022 09:09:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:ac7:b0:3cd:d7d0:14b6 with SMTP id
 c7-20020a05600c0ac700b003cdd7d014b6ls8403931wmr.1.-pod-control-gmail; Tue, 29
 Nov 2022 09:09:40 -0800 (PST)
X-Received: by 2002:a05:600c:1d1e:b0:3d0:4720:5293 with SMTP id l30-20020a05600c1d1e00b003d047205293mr16321991wms.176.1669741780462;
        Tue, 29 Nov 2022 09:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669741780; cv=none;
        d=google.com; s=arc-20160816;
        b=vTpyreWFq3ePPL3VC4L0sNZBEvgDr3vzRwB02zvruzCgjXT4xCSlqR5r65SisM51f7
         ohRn93Z13ZWRi3QopUThuCPUj6zMjsGe1yjAKj+PhljN+S2ClHg6mkuARgQFiAkGPP2Y
         I+nIIL55MTlCsxUthFO+z9VKSd+qAzbWebkNsryLcoqTYPPaME6SppmM5MKkevjfFcjQ
         KK1nloij4yu6ZT+iABthX0x7xP308FGJPXBPXgtyUyJl3IH1BFoOYY2chc/o0zk6TvOa
         kPKmxSrUONiauMfO+ZkdhjdmYWMwisnjVmQqWyVPDtxqmrnlNE4WXme7Jv/RQaZ4exBJ
         izjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T8vddOB2XXz+B+ULgMDy8mMRqlQpkRcNSkGnVxJOY9U=;
        b=p/VpYkP1ISF9nBEc3XKau/vOIXiyYMrVP0kMgiQE2lbhwUHpn52P26ZuZm3bpcL/wY
         INygbmsSmvZV6sUAUF/X2dZaI7dY5Mo8KEF5CVi/obk9e8gF2y+ndIBIY4izRdCG7MsB
         PLKZYwaTLoZDWMxWjC6kN/x5VNVua1G7d98mDfWwIqZkKR9dfQh/q4c48wayc7r5+DT/
         iN590yE+scY2HTIBbQf+Dh5G+JGn3m2auA45h9RAodsNvEqstlIctLs6ZNgGPTcsci0T
         go1uMYRNe4rVNSM4Ih2PqKlw7RHAIVOiNrOyWkNXe/f08fWbMwprubcmTpgQtdc6n2Ee
         kPtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=G553dpF5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id m128-20020a1ca386000000b003cfbf566cb8si17111wme.2.2022.11.29.09.09.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 09:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NM82r07tgzxsR;
	Tue, 29 Nov 2022 18:09:40 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 29 Nov
 2022 18:09:39 +0100
Message-ID: <3dcce533-4ec7-de06-aeee-d06b61d666ce@oth-regensburg.de>
Date: Tue, 29 Nov 2022 18:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Chris Paterson <chris.paterson2@renesas.com>, Prabhakar
	<prabhakar.csengg@gmail.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=G553dpF5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 07/11/2022 00:05, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
> 
> Changes apply on top of next branch [2] and the kernel used for testing is
> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
> 
> No changes from previous version sent to ML, just rebased on the next branch.
> 
> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0

For the series, especially the UART parts:

Reviewed-By: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks,

   Ralf

> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (3):
>    renesas: Add SCIF support
>    configs: arm64: Add root cell config for Renesas RZ/G2M SoC
>    configs: arm64: Add demo cell config for Renesas RZ/G2M
> 
>   Documentation/debug-output.md                 |    1 +
>   configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
>   configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
>   configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
>   hypervisor/arch/arm-common/Kbuild             |    2 +-
>   hypervisor/arch/arm-common/dbg-write.c        |    2 +
>   hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
>   hypervisor/arch/arm-common/uart-scif.c        |   44 +
>   include/jailhouse/console.h                   |    1 +
>   inmates/lib/arm-common/Makefile.lib           |    2 +-
>   inmates/lib/arm-common/uart-scif.c            |   65 +
>   inmates/lib/arm-common/uart.c                 |    2 +
>   12 files changed, 1594 insertions(+), 3 deletions(-)
>   create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
>   create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
>   create mode 100644 configs/arm64/renesas-r8a774a1.c
>   create mode 100644 hypervisor/arch/arm-common/uart-scif.c
>   create mode 100644 inmates/lib/arm-common/uart-scif.c
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3dcce533-4ec7-de06-aeee-d06b61d666ce%40oth-regensburg.de.
