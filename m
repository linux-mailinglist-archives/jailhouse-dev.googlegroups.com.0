Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5NQ5PVAKGQECGZQAVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF494B64
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 19:12:21 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id f9sf5561946wrq.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 10:12:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566234741; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qn1UQNRPYv0XIexqEaFB35sjRTs3cOtfPXYuQI1xbsD19SJLkhdBMRCBM/HPbotlEt
         dXiwzwuMEqaWxvvwDOZKtByyRfsi2ahrdQooGTNMjpPVuln6gwspvEIKLM6gkrH2PkKl
         2nXFCvC42tTnr1OVCCZJVi3m8obBq+KBZLY4N8sal40Y5gI50dyqTW24MwXBoR/AvQGd
         a7maeyrrJAdsyEMrFC1TeNnvbcDd4dBteTweDmEnOkgXyl8lNxGnZ5S9r0fIus2fBFLY
         aOXPLBD9zhs8sPAEmTf9kLhV14f5o2L2gj5dqiB+HinyHDR7yReQXEs2z/2U7Hc9uHPR
         GjvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=uTVYBSSJLaFyL4/uuMjfBZ101L4JhBjveqw2pUkXzFc=;
        b=umJGpwQK68n83O9+Ulm4W8K0pUi4miXauVkRSwtF4qfqdM25g8gC4hkJJX/ixf5uaH
         aETKc+FwRueuIb1Dqp9MoW82kI/BRDM9ic64Tfq9AnpQhifCY0ngbHR658gokxr92/h5
         lxu7Q5G0fgIMku/eTthNpf1SEo7rJtLKTgscDaEOoNE31JL0AuYwo0gPYoSaoE2yDO6t
         IWoGCgMTS34Ldo2MUQMUrhSndm2iyLSo3nDx5UbxWM/j2E0z2AzvtULWmSPEqr6x/sz4
         icM244afyN2k7o+W7VfIBb7boGFQ7UAroe8JjEhrTtmjyLqcPJ+PGDUccbJGrubALsgv
         jiZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZGr09w2D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uTVYBSSJLaFyL4/uuMjfBZ101L4JhBjveqw2pUkXzFc=;
        b=CeP3aYhdRaEJmcHZmu/EhD7NUYKnwVb2sEuoJhmNyRqMZLIiloa8taagfAWCGXLucO
         Irn7MWP3T/UKeyxqb0Zi/7LecCPVE4XFjCtUsE1N933Kw/2pSX3SH9lkNTFPEQ3Y9w3w
         f6OLxRmwdsA0dFqCn8RE+YkuMwheROKXvdJcArUURH2PojvzOlq+JnqJtY5AkfURz+B1
         /MOrHT1tU978Kk62FJ7BSHvmjNFkwvzyhwREm2OT89rSiYFZoemzSizm7JnCr/Od2t9s
         +PiIxlOZqNBn66Gl+c0L9AW+5qCuLI1ERzH4ikRc3WdORWhJwnGPg2yox4pRfyMvdTUL
         Lp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uTVYBSSJLaFyL4/uuMjfBZ101L4JhBjveqw2pUkXzFc=;
        b=SxHrvwrcWZtkrd9gs5CiL3Lglqq39xFxVD/Ql44bMOQ+7YKZmfxa/14KYDC0dFB/kn
         DB+Ieng22JKb+M3ZVKYH1zAbl/LrLftK5/k5BJCTILWisaoyy9oQCVfq32Rx3UYId0vZ
         XyjqdHQ3ooK2fbTkkh/AMs0JBCa6yCv9mbVNTMOuoTUNbS7d4oQ6671Q5qakVkzj23n0
         0wUPy+1g+Go8+IP0+IDWCLAUIgSNFDLoIhT7egZF1tIDzrdTadITdYL23FC6RIQCO1IF
         RmomZ+I3VoMFxRUs5viitdCAZh2vVAUEUW820zGsfQdCZQpNZjsneZdbE3nYSgaul8q7
         Ejhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0RiYAN3kocjKcoRuw5msTZqvLS8QzTu9Gw3oSnrD1wlijBsco
	hOcjkvD2eVUkw6pMFaiXc1A=
X-Google-Smtp-Source: APXvYqyztq0xGfg7EXpZ6j/BFvvQzwGJ8IC/E4LF54uxp4iN9eQOqoEbaRJD4OXFEjhtM710713pkQ==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr22060437wmc.19.1566234741443;
        Mon, 19 Aug 2019 10:12:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e0c:: with SMTP id g12ls62318wmh.4.gmail; Mon, 19 Aug
 2019 10:12:20 -0700 (PDT)
X-Received: by 2002:a7b:c775:: with SMTP id x21mr14056734wmk.97.1566234740876;
        Mon, 19 Aug 2019 10:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566234740; cv=none;
        d=google.com; s=arc-20160816;
        b=DI86DnFiVLELBz289rTdkw5GpSCYm+tvNAdcJvj2kLzJbJN+HbAGrpWmVR4Kf1Qhic
         phfrVj+OKp9O+t1JoRRsHvojRHqCpUiT30LCK9vQ5dg7hX6UbEYC38z6u/oxVMcuND4T
         0QsPSGpl7KY9YgBIbt3tGm/WWyxN17VEDBYI7xCBoyK25/MKY7IvcIsBnqfAZgqCJBNT
         ahKszL1FISYSTUcYuh0nNLQ5aaGTHZV55OPGedP5dsaWYI74ClnvSgytNGLjMmO2Sa8T
         aTE4F1SIzSMC+Vdvp6zY9a1u3hjI98aQUK4PUc2RHsO8uaJwEsteZYz2o+FJ/t3iqBNg
         733w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=BbH+jkz855/NDzwuPeg0t1TdzXVN0EaWPNRdUWel/X8=;
        b=SpzUr9mvezCUgWBKro2kQGu+8QWM+F0rnEhA8wC1lwQtbiSDsxXVJvSihDRzVZQdPY
         jbh+jb5JeVCZ5mPlvRgQYVHvRvlr5t60oEmRZMtiS9kVS1NVQr0HriS1VCEg8HeDoHVS
         S0YJrEGhJPcSLu+UnGZ2QyB/3caEI6leA0ENcPa6YJCizZ2kpPpbpgwkBonHab09vN9q
         9ecL4gGKldWW9z8BV7VO7A54KDelZmouqZiOCWqcmy4M4/MY73oFPOaQaWKlZMIYoEx3
         LUbd+CxSUKOZ3cY20niDUiwwIBoQh5xYcFpv53yi1X26lvzaRbLNTtu5THgRXAq1R8m6
         jz8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZGr09w2D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id c4si678374wrw.2.2019.08.19.10.12.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 10:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46C0pr3JHWzxvr;
	Mon, 19 Aug 2019 19:12:20 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 19 Aug
 2019 19:12:20 +0200
Subject: Re: [PATCH v2 1/4] inmates: uart-8250: Add MDR quirk for enabling
 UART
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <jailhouse-dev@googlegroups.com>,
	<jan.kiszka@siemens.com>, <lokeshvutla@ti.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-2-git-send-email-nikhil.nd@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <7ec253ee-709a-a78c-7f91-9fdba7590b9b@oth-regensburg.de>
Date: Mon, 19 Aug 2019 19:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566224813-20129-2-git-send-email-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZGr09w2D;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 8/19/19 4:26 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
> UART is disabled by default on TI platforms and must be enabled
> via the MDR register.
> 
> Add a new flag in the jailhouse_console and apply the quirk
> as part of uart_init for 8250 driver when this flag is present.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes from v1:
> * Use console flag for MDR quirk instead of compile time flag
> 
>  include/jailhouse/console.h | 7 ++++++-
>  inmates/lib/uart-8250.c     | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
> index 8961c6e..a54bb56 100644
> --- a/include/jailhouse/console.h
> +++ b/include/jailhouse/console.h
> @@ -78,7 +78,12 @@
>  
>  #define CON_HAS_INVERTED_GATE(flags)	!!((flags) & JAILHOUSE_CON_INVERTED_GATE)
>  
> -/* Bits 13-15: Reserved */
> +/* Bit 13 is used to apply(set) or skip(clear) a MDR quirk on the console */

nit: please add a whitespace after 'apply' and 'clear'.

> +#define JAILHOUSE_CON_MDR_QUIRK		0x2000
> +
> +#define CON_HAS_MDR_QUIRK(flags)	!!((flags) & JAILHOUSE_CON_MDR_QUIRK)
> +
> +/* Bits 14-15: Reserved */

Space for two more quirks left. ;-)

>  
>  struct jailhouse_console {
>  	__u64 address;
> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
> index fb7940d..5b94b5d 100644
> --- a/inmates/lib/uart-8250.c
> +++ b/inmates/lib/uart-8250.c
> @@ -49,6 +49,7 @@
>  #define  UART_LCR_DLAB		0x80
>  #define UART_LSR		0x5
>  #define  UART_LSR_THRE		0x20
> +#define  UART_MDR1		0x8
>  
>  static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
>  {
> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>  		chip->reg_out(chip, UART_DLL, chip->divider);
>  		chip->reg_out(chip, UART_DLM, 0);
>  		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
> +		if (comm_region->console.flags & JAILHOUSE_CON_MDR_QUIRK) {

You can use CON_HAS_MDR_QUIRK here.

> +			chip->reg_out(chip, UART_MDR1, 0);
> +		}

... and remove the useless brackets.

Thanks
  Ralf

>  	}
>  }
>  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ec253ee-709a-a78c-7f91-9fdba7590b9b%40oth-regensburg.de.
