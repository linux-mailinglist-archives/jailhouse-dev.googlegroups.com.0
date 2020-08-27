Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7VTX5AKGQE6TPCFSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 380532541D8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 11:19:32 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id u11sf1674985eds.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 02:19:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598519972; cv=pass;
        d=google.com; s=arc-20160816;
        b=e7hBA9/smeLtBP/lrlPioHDo8SHsEFOzL/NVuI4l4rkKhYAhqwjhPhoBWb1TT4NgaT
         TZ8DOQXSAvVc6p3oYYI3K3zuJ7nV8MbQ9M5V6AyHqrfqjxWKo02/j8F1el5dMRa+NGLZ
         zSLM1UV1VVXZoFn2ZrJBtcnbQYnmcylglfZNqFM3cZLhkEHqjcDOwCvcysWluBInfaPa
         /C+bSZ/EJMHfvHKbh1X43wekUSz/xZ4iJE25oVDLg/D9T1V0TDkUJOmcWDiyMCksJ13D
         8uXV8Z7Ke4ls5ZIo0ZJIFGolZzqsi/WW28SunFVeuMkIJ4Hyh/MVwN6uhKCWAyl8IlDr
         +GQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=XAkxe7wwem/tkaXyLWjXsjesP6lB3R4pb999MaYjXoE=;
        b=R7yWKlrrPSAWfSojRH2VElXimpViMI4onsRq9WfVWXCZ/Z1M5BIArye0834+nxIrPM
         lAVcr/hksDxA8J0ESVGgI0gZu+P3r9iPIyVSiIlx+Zi93FacfEgO2EB6TRhKPOFs3Q+3
         IzIXDt9464VWIQD5u4qr5pRFoz3zEFicZU+W/rsEeLoraeP/d0Ipr2vKlZcgKiHmhOZE
         +BrMaGyqDHbmuJjx6IWWNhwxusVLIXereuHgBTmimvRBThkRi5+NucYHhdXwMKgerdfb
         INWq3hin9hd0/7+lff9ZE0pgA2FtIFwOaZV9haX+Jlf/RCPr+2eo1a2mabr+rhnbETOM
         jGnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XAkxe7wwem/tkaXyLWjXsjesP6lB3R4pb999MaYjXoE=;
        b=dgHoOEza4hatPmhK1gZ6IAlw6KSzY+b2Da3czEYXpJf1PMQKHE0BMh5GHdz5NLSYjH
         Hx8fQg4DNYltxiIOGZluERiN5wWI0JvBkTUQ/16oH6sTV04v7xKZ9NMkFnTPAuE089WG
         8pglanuOg50FDJDBN4kJc4sHA+Oy7Q4t7bPzh9kYHTZLBzmX2P7e3druuG54TWn7BAZX
         wHJbAypLuZ7MWF5lnzuMA7vakRgIlu+LD/6Jlfw0vMoP5Zcc8Ds/N1gqhJKMKRDNYk2I
         bnhZ0sPtJ7uUrQXcaANISjAOlHBlk69v2bI6jNa43t9F5OrzP3xSPyrGtiBOkcKjL0co
         7A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XAkxe7wwem/tkaXyLWjXsjesP6lB3R4pb999MaYjXoE=;
        b=ozePjjlbKhKSoH5KIMZec+kDZks/FNrwqmp4RP1fqWjvrvuatbkNoytIOcXqSRbi7P
         zphgrnS4VRUwfgFM76BcLcnxRM+o0cB4FncqjTKfKg8aUar0/2j1FV0YTw0P9ewuLJsu
         7P2CWELQjSLlJbnZgdy0axtBLEeNSBCYKiElujfBuErvBqwy8CO6+1SN+VQ3ucVl/t7U
         9Yve3dSnVtBEM8oXpl5fD/M2SIXtcEVlirTasFF5deAqljJA7Vb2aHzExnqk+WV6vuvM
         vLCVLu26ZC/xt7mwonewlbvKcK6ICDNtnakhn58sq7Ax7JW+oPlnXRy9uYZxhww9WakO
         8x4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530w7yCFMSM2Kw/+3jFCaQ9f4SQObytAOdSsqcQ2VHkMR3egVdQl
	3orPj4rwFJMrfkRX8beKHtQ=
X-Google-Smtp-Source: ABdhPJxY4KXKYhhnnV9GEHP9EiP+euy8V15xUiXdUW8ic4/LMJp/HXlsffgzl3K6y9/xOI+AtHc4Lg==
X-Received: by 2002:a17:906:9591:: with SMTP id r17mr1577449ejx.424.1598519971905;
        Thu, 27 Aug 2020 02:19:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:e08f:: with SMTP id gh15ls790537ejb.6.gmail; Thu, 27
 Aug 2020 02:19:31 -0700 (PDT)
X-Received: by 2002:a17:907:2805:: with SMTP id eb5mr21036153ejc.254.1598519970990;
        Thu, 27 Aug 2020 02:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598519970; cv=none;
        d=google.com; s=arc-20160816;
        b=GDpLUgB7CgnzKA/3KP1rNXTMaAVo4MyjzC1BZvDXSMIWGsW2Bh8uhZC+YDmCBXE24S
         3H1wmOnH0DGQ2SsZS+RTgDFm+zDD6t6P/mQJBaLCJDmRZFzXeZKOnGzhzL87TiXpZc8b
         f6g8D0x6LSsUZXEpKeVIWIQIhQJSwbykNV1nWO3b1fUGV9IiBzqeNutUdcFNgGU14z09
         ISA9p9W1R6XkyB1kYER2n/zyVtO6LaXepLcgo7CUDCHgV0nI3qxO/Uf1TFBFyThaMvIy
         rAP3lTvTo+Iv7HUT+knJyCXm38OEip47C1xrsMWNRB/LnXYBgSrW3+TrRccS4KJu3Joo
         Jc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=t7N75ri1gLxgtKB2oqeSIU+l/ETyiGMnAdzX/uyB3qs=;
        b=oCuyyp0ERIiAm+eYPD4hP+LKVH04vtyR/pcRWUa9G6O+MBMaRTeG7geC2AzSyRlBvh
         vqxA9ow6RDMniWrpjKrkX3HP0MpE9rz89LH9gyNrJGrJsR4eg2a3t99coh1Rcf2FnWKX
         2hqvIZglj2oQfb7sL+9rcuqY+4crlNdfA66u52FowMM4mVkfqv1H6mXjgSmtL6iSkcu5
         CDqR5ov9y0HxbPhf9XYfaCBS/euako2khIEnDuYqfVm9uAj4/xFKbI1PxaHVLcN/1h7+
         0dpR/CH3r8ghHyGDgUvqMpWa1aadKuJgKVItyapMzsqdSUiUqbCh4VgKgcLeLAu4GuMy
         AHvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x17si56980edr.0.2020.08.27.02.19.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 02:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07R9JULG027991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2020 11:19:30 +0200
Received: from [167.87.79.124] ([167.87.79.124])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07R9JTXo031774;
	Thu, 27 Aug 2020 11:19:29 +0200
Subject: Re: [PATCH] Documentation: fix display resolution number
To: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
Cc: jailhouse-dev@googlegroups.com
References: <20200826231119.1445942-1-daniel.sangorrin@toshiba.co.jp>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b6209318-ac6a-1835-940a-588b2ba6a64c@siemens.com>
Date: Thu, 27 Aug 2020 11:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826231119.1445942-1-daniel.sangorrin@toshiba.co.jp>
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

On 27.08.20 01:11, Daniel Sangorrin wrote:
> I was wondering why the configuration size didn't match
> the multiplication and then I realised there was an
> errata.
> 
> Signed-off-by: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
> ---
>  Documentation/debug-output.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
> index 5bdc412c..c86270eb 100644
> --- a/Documentation/debug-output.md
> +++ b/Documentation/debug-output.md
> @@ -41,7 +41,7 @@ Possible register distances (MMIO only, PIO is implicitly 1-byte), to be or'ed:
>  
>  Possible framebuffer formats (EFIFB only);
>  
> -    - JAILHOUSE_CON_FB_1024x768    /* 1024x786 pixel, 32 bit each */
> +    - JAILHOUSE_CON_FB_1024x768    /* 1024x768 pixel, 32 bit each */
>      - JAILHOUSE_CON_FB_1920x1080   /* 1920x1080 pixel, 32 bit each */
>  
>  ### .address and .size
> @@ -92,7 +92,7 @@ Example configuration for EFI framebuffer debug out on x86:
>  
>      .debug_console = {
>          .address = 0x80000000, /* framebuffer base address */
> -        .size = 0x300000, /* 1024x786x4 */
> +        .size = 0x300000, /* 1024x768x4 */
>          .type = JAILHOUSE_CON_TYPE_EFIFB,  /* choose the EFIFB driver */
>          .flags = JAILHOUSE_CON_MMIO | \    /* access is MMIO */
>                   JAILHOUSE_CON_FB_1024x768 /* format */
> 

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b6209318-ac6a-1835-940a-588b2ba6a64c%40siemens.com.
