Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRMUZH4QKGQEICBATEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FCF24173D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:35:33 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id sd23sf4824725ejb.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:35:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597131333; cv=pass;
        d=google.com; s=arc-20160816;
        b=za4fps48TfD15Bd6QQcFJK5n8O8Oevv6VNBF0c1AbvmfNKGewNLRHMwUSYzDkkAbEV
         JGswkfJiGY46avfASahe4O7cArjgNZaP69lfMs9FN4iB/jXqB/RsJQzRfVR3gkvcEGdE
         IOk8mp/yeNDI3aeh0H/0qLaH5D5bazbiK+q5YilEm+M0QzPFKKmyqgZin3DnsO9uX1X6
         tRkr/Y5cUx/K2RKSXxObVD6JH6gjFqlZwCaKJ1PLA7GSrHqQ44ZEqeD+yQFCyE3KZ18O
         wvoU1JXRvPwOch3Z9a++C6X3n+Htks1nVTWusX5dIPsuENqrt96WpgViwcQxes3x9HIY
         dN+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=MmujEkE1FpXZtmGAASuoeTg/RUR407Z2zCSPacRwN/U=;
        b=dJaU7w14TgEQkK78WnYs1HqtJitA0Bbzydya70fbLxjYoo5/DniAGzIdlGQkjFMvqr
         NmUOn0m0xliKoakMNIK/LtEJ0Bg1Y4XH1QlBeWK3K9738eCWj6kfFK6mi0vCHyUiUgt4
         cLCcPYpe9NYpiMXhfLaVJ6wHiyM+Zv29dl1f9/MHVko1Un6ie4Cg1mx/l6LwcKx4SZi0
         7c/L+v6ZEHi04+ux+koWsnL4NMyqBg2J31RHrXGxQhy03uzsz/wgGjtx2kehN7cKyclp
         yZ6yWC6uCe9A1y7vRdFYtTz3yami4ZH6IrFn+emj0H35FHwp+K3tIDeETy6U41+mt1Pc
         fCPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MmujEkE1FpXZtmGAASuoeTg/RUR407Z2zCSPacRwN/U=;
        b=gp6L4awX5bMGIGBzM3278RvzFDl8/RKFIqGwl8goeGFWXCfw0pfyQl1b4UaLP017P+
         pMMchhI5A6AheqazvnknXnhtZ75vIj8DMdL7NzNJ0S70UdZS5fCprybRIzQOvs+MmrIu
         ymlfb+XQpGDmhw/GWryhpdGnLH/kL7/9KPGWL3udEvJRAaeL/hJQEcPgUz/L25N68+CD
         R+zkwZf8RkIQOh1RPGFRvQQbd4tbPyHVcss8dxCWyd4ebaBQ62vldZqeP9udI7oEuOmP
         fOWJvq0DW02NylBCJiV5JxgnUsm5kWvbURx/9Mt6q0vEIps3B9kLMcvr5evfJlTdd5Ah
         4NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MmujEkE1FpXZtmGAASuoeTg/RUR407Z2zCSPacRwN/U=;
        b=rIAmcAVk0gZLP4Gkwb5OtjiCFHOs/0kIlq6GlKr/oBtw/AQ6v69KTrgRGHQi6cXGW7
         cz6pPYClUqp2oxXMwWZJqs9JXNr6hhqsLq279vLQ7a+z0N3VFPuT2BIu6/t4DLl0qM3i
         WBrpLewprEtaA7PS58UE/LuaIUf0APysduTXihlEItSRAqsoUz9DvSDr6Y90Ma2zeq0F
         fh1YkWM2JQB+IezHQVx+pHE1d//dEqhS1IR+FFYErfjPWeqZ2NH9n13Q7RPmd+6NNJdr
         sydbh8Xk8CWVLxlVm/MFzAE9WKVu4VFo9xakyG5n5/xbUkb19+tC0QQOQfKTHGjbCqe+
         F/6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Ic/ZOqGUQsCOy8uELHhb/hdYp2ACao8eDM9OYE63Jjxnfm0Zi
	GV1zbiG/8hf5Bx46NyjNDQk=
X-Google-Smtp-Source: ABdhPJwapjYJXXbp40cL6TCGN0JQTk6oUOAtDqV5PhVQGJaozWiNC1LO9kS+U3kQ/85vsVKz1M0X+w==
X-Received: by 2002:a17:907:204e:: with SMTP id pg14mr26182887ejb.324.1597131333362;
        Tue, 11 Aug 2020 00:35:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c40c:: with SMTP id j12ls1539646edq.2.gmail; Tue, 11 Aug
 2020 00:35:32 -0700 (PDT)
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr24937958edu.11.1597131332693;
        Tue, 11 Aug 2020 00:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597131332; cv=none;
        d=google.com; s=arc-20160816;
        b=iRjXi4+St83aKpzXKL8FPGU9LgvtOMjF3pfYpx4YYcEBgC2N8LnDZ2Ic9sGdaH3IXD
         YKy8yH0y72PoN014M+cc46WWkL1Urf3jjCeCO1O5ugbTH6YVVhRY1x1cR4v5v6y3vlv2
         U2dDBxp6Sze1Gqe8OMbdmcQDeaXcYY/dm+GvR2f01uC1s6rR6BCFXjk4Qll8ThMlFoD6
         5xwScVqcXu8+5OrBIgtKM1qzXVulTE/qyXBFfJpcfJBO7XGqOZxtqWLs7u1E40+A6ylF
         w8VSpEfC6EX07w26bHqr+3mnQ8XJHIMYkgxZ3Bvj2PIxKbcEPfuFoGjvo6nom+KIVHoe
         QQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=9htoZCqwB5W22BKI8kxPp7rhN6XngiDaKfcicG/LrjY=;
        b=giSDs9EIWUIZIBXPB8Y1OkJ/ABC+D6GCkSK8t4P+KrAZGlrZSgBdqlOvYWUuBp7Mps
         DPozGRrxl39FLr5kMvKdHoFvddIQ4Ch4FZEBVHnKTDeYycR6oDqkNP2XCy/CILUeCQly
         maryrmFndhvWkpB9tBCUt8ZC9NihR9Kn07Qn+ySfJk6pTK+kvcZag45rpXxu0qMMa5HB
         J1oAHcDCOTmPZtrME3obN4NA9abgW7G3sCsv42IOet8NHxOZOt2C57bh34YpFSK4BUij
         l28X/hczdE+7Q6MXWXT1y0pQc6UWH/ruihfu9bLFDzhSPf7CpLCc6hXfGdZyclFdwZ/s
         7ZCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b5si950518edx.4.2020.08.11.00.35.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07B7ZWWO007944
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:35:32 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7ZVkO007456;
	Tue, 11 Aug 2020 09:35:31 +0200
Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
Date: Tue, 11 Aug 2020 09:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807030632.28259-9-peng.fan@nxp.com>
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

On 07.08.20 05:06, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> bit23 is SPAN, not reserved bit.
> 

This is not correct, see D7.2.81 in the ARMv8 manual.

Where did you get this from? What is it trying to fix?

Jan

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm64/include/asm/sysregs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
> index 0105b109..a7370373 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -64,7 +64,7 @@
>  #define SCTLR_EE_BIT	(1 << 25)
>  #define SCTLR_UCI_BIT	(1 << 26)
>  
> -#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (3 << 22) | (3 << 28))
> +#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (1 << 22) | (3 << 28))
>  #define SCTLR_EL2_RES1	((3 << 4) | (1 << 11) | (1 << 16) | (1 << 18)	\
>  			| (3 << 22) | (3 << 28))
>  
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4821d0a0-f8f3-582b-1182-9c5424f68ec3%40siemens.com.
