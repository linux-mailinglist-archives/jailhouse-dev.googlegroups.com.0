Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXWRT3UAKGQERS32S2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9D48600
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 16:51:10 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id c6sf4293095wrp.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 07:51:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560783070; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xi0mBUTnO3qYNGVT9q+R7oPP5PYygJ08iInP1jbfiD7zLALgZ/IZf9VxphTrudPccf
         e+zvEQQMNTxH/4g1SggZw8+fo4o+UFS9q9FqHlQavZmOO4axEuD+XWneNd2HTI0P8Bx1
         rtWAHjFCs89Sq12JV5pS1/sjHcj4jP9XD+mUc+/SzKHVxLpvZLsl3W7zrHrZXm2JfzS7
         AJnsN06fkonaTKezbGWrZ9FJ3BgT2hujHzNmMNuKTh0+0xeB3zPLdgfDLfq0mgFOFfH2
         iKcSgU85dg1H47/Pe70Cvpddc2FtRoKDbcMZpRP95kDgVxpdEsZH1mzfxMgT9qDNukPj
         3OhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=1r5qkxdRh636HZh5CRApgU/zoyhyGaQfc/IVBh2d7jw=;
        b=bt1YEsvfnXVratAg2NQJIZSVBWZcz1IXMBeGz5J8afU5lOhRnUaaVppwhOkW3G/5Lh
         PmCNnCY1AYIt4gf2LHNqjVSxYUJEHhubnexezJ+KrYr0odtR9uxDqStgRTdAIPReSqDP
         gqzl7Tl4Vnxgf9q1DfA2BHUYKebmi4Zr/6Qdg+nr6X4bAOYnQkjJEnqX+6UzMi2tGKPa
         r4nY2PqngZEOqn9wrT0k3RtA7JTnzf+wJM85uNk/mJzJFF4NOz8aZLR3H/UDuFOlT87o
         +XOdVDhKrxQi6lWEGm16Mh4J0OuGT2sEzRuBU/Zpb5ZGAUgYlEZant8v7vqZSXMkSwoz
         Abxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1r5qkxdRh636HZh5CRApgU/zoyhyGaQfc/IVBh2d7jw=;
        b=prsMbleZ3ccPxpSF4CUbJw8HdKOIVDcMSTY9M2W5cFa/6GkiCWh9i+/j2KTcbk4GP7
         suwYXLQ30Iwr/xEq8c6mlWc2W36nRqxsWECbcIG1ge3kuQI3X9PR7o1uSZEPWlEM4YYN
         4xIpLDAi4ifAt7zZYGzwstw41pkWCD76LAuExJdMcpx/j9VNJHb96fyqSes8NT36KjGZ
         rAEvLpB+eQeWPbGnFdA1iKsPnB4vFHMM/9awIyxhdi/SxA8dSrhlgFOxfrZ2MzI5VeKG
         hxKMutsQvRn50unJvgW7jgXvwq5hjdkKS+PpQ28A9CaU+e//kOsEyuS8TOgAjCl8bCCi
         N6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1r5qkxdRh636HZh5CRApgU/zoyhyGaQfc/IVBh2d7jw=;
        b=YQHeXH67pOq792oWiJykAx2dRuOSsRiows9u0fRyvN4ZsMoscoY1fvLvYdRIN5cNu8
         DxdEgxKEB1g5Jaoa0/DUFrpTkiSw0YgrWwLwAhxdBPSHgdRHu+hSlKFIUT0OoN6b49GA
         ulPVyIgXFIZmgjeOrJnY586Jy0dbHXCa0F+cNnpDtvGSuEekjy3CrRdfw3CJ4MBFDiCQ
         S+YVcdMAAwyU7u0zkoFvZ/Osrk4GfVd7fRVK40Q5D/b6y/5PkPpBhsTICmKxHJRgmXGm
         IPDOuyZ/7P6NCij1SaITPf7dmH2iFiWgt5T7EB3k453wbdEeFLnqywGHuRS2gmAyojz9
         K1og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBSJ4j8a+cX0WEFYF6Tfe3FuK+Mn8PMC9YVyeUkcnk/t9rsegu
	jyuBdpN84twi+hVrEDMVTPQ=
X-Google-Smtp-Source: APXvYqwGxxkfOpytuneOmxsqCabSOlLId1sOOULZBuLWgq1TXej7eyQ1Jnsr+r5NwKjucFEM5PU0aQ==
X-Received: by 2002:adf:f812:: with SMTP id s18mr10729968wrp.32.1560783070476;
        Mon, 17 Jun 2019 07:51:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls5038831wme.1.gmail; Mon, 17 Jun
 2019 07:51:09 -0700 (PDT)
X-Received: by 2002:a7b:c455:: with SMTP id l21mr19819027wmi.114.1560783069904;
        Mon, 17 Jun 2019 07:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560783069; cv=none;
        d=google.com; s=arc-20160816;
        b=bMWL2W/JeH4TAvixz0TXzr37GxSkpNjd2WJqq9Pe9LP6Mt41UzJCo8eJJ05RW1sPYl
         nqWIO6Tl9HX8Wy9WUM4f7RHbFkN6hhVjfBttjTAby+1j6CZbc7MpPBFALuMGt57EukRU
         m72g8ODUa+6jwNhGHBgW0oaiIQ3wNS+DnH7rg3Y64qxjPRNo5ZolhHnl8gwiIJKaIkxG
         O2XDg9A1eRicvwotGfylvRqfa401HulbJxrMwaDzitvWisWR536IIM9EX0NXsUiRtiYf
         oI2UHGTGujfZx/AQl00lKtI4tznGYc61RBSaD9E9yYLVxJQzT+oK+zuFs2XRdPujMiAi
         hg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ZEj+s4DDH16zTYlHpVvcai5F+ML9cUvvp93OxYIFgg4=;
        b=Yu//wufopGotfKSpx2yyBNdVhUqwa5jWoulHPcIhPseTFRcWQzT126sxf6C6EUvNGk
         jiKQZn56+29eoEblRTkYM5roI1zvWGoJDSKmAE320trve/MxKG83XR4ejjYyuDCWOBLN
         eDRbL/ItW0rlakusiENyDjOxYR1AjgAaT+dPnzG+UAZwJzh6yLvWgbR5X3R37OiMO2XQ
         Sse5ZSMfQTUUcInm+dThVcnNV/ZJx0BR+f4kE7oqmuDedV8CniFJuRDRcgdj1ICPVj4X
         YyctzMJry1EfSPXunjuD6vIudGnBvtCThM/P9uhhCn41riIXaK62S3i6ODtdJa7C8aR6
         gOqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v3si220651wrg.3.2019.06.17.07.51.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HEp9KV012443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 16:51:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HEp9L5016275;
	Mon, 17 Jun 2019 16:51:09 +0200
Subject: Re: [PATCH 2/2] x86: vtd: Limit index of vtd_update_irte to 16 bits
To: Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
 <20190617131321.8585-2-mario.mintel@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <099b48da-a1af-a420-ab61-f8da99ec5c5d@siemens.com>
Date: Mon, 17 Jun 2019 16:51:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190617131321.8585-2-mario.mintel@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 17.06.19 15:13, Mario Mintel wrote:
> See Intels VT-d Architectures Specification, chapter 5.1.3:
> "Maximum number of IRTEs in an Interrupt Remapping Table is 64K."
> 
> Hence the max numbers of IRTEs is 65535 so we can limit the index to 16
> bits.
> 
> Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
> ---
>   hypervisor/arch/x86/vtd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
> index 8e076b4b..d0dd4fd8 100644
> --- a/hypervisor/arch/x86/vtd.c
> +++ b/hypervisor/arch/x86/vtd.c
> @@ -556,7 +556,7 @@ static void vtd_init_unit(void *reg_base, void *inv_queue)
>   	vtd_update_gcmd_reg(reg_base, VTD_GCMD_IRE, 1);
>   }
>   
> -static void vtd_update_irte(unsigned int index, union vtd_irte content)
> +static void vtd_update_irte(u16 index, union vtd_irte content)
>   {
>   	const struct vtd_entry inv_int = {
>   		.lo_word = VTD_REQ_INV_INT | VTD_INV_INT_INDEX |
> 

I don't see the value of this change, though. Actually, doesn't the compiler 
even bark at us then when passing in a wider type (which we do so far)?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/099b48da-a1af-a420-ab61-f8da99ec5c5d%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
