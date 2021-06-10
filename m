Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBPYRCDAMGQE2BRIKRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FCA3A306C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 18:21:25 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id g14-20020a5d698e0000b0290117735bd4d3sf1187996wru.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 09:21:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623342085; cv=pass;
        d=google.com; s=arc-20160816;
        b=0SvWDGvVXmYm14jW8sHB2IZ4jEHxxNAjSxicpZaPWiQuSz3klYn366+xGjuGGJJiM5
         YiG++X65dASR+MmJ0xK5DvwGjWQmxtE3lP4SjCzCMyXAeclUsODnncq1rQR5OWT9Wrfe
         vBoL0YSNc/2T9U/v6Vn0NqxeLyKG4RHqfALmS91cvswZDmgvVww3KF1WKeinYBtUjktR
         pV/RmmhDxeYTcKtb6D8eqb06XpQCLuopqEyGwdM5rTI+kdEJFFpezj8lfULSF98HdpjU
         KsDSk5ONo67dSGwe6dNtBTop50NufTW8Wp/3Pgc2g8ERB2/f3tlYNl/q4ZgsQJx0vWkq
         uAJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=bhKZHXCvQhNO4AOjr0W8BUM89/SZo0+/OAPKhFVcar0=;
        b=cuwWEECxtxSTM9uefodgmt+W6gbP5TewB/CC8Oqz0cTZidKeyoDMECL+Xpd6WPgJY8
         arei0kaxCjH+1ek8Z7WNHCb5yic2Z/YQvISLETQKPja27ooceicaXkvOLTy4KkSnDGBh
         rh93skooHDF53O2YRuS+/8QtgEzSNlQxoptZZZo4wjT44Sixyl7wAIAy+TUDk49twR37
         KerdEisBDf9SYqMyz+P7g0iLpkmzFIpBiL9bzjNNjS6H9lm7qzQCcuur0UJGPnxKI/hr
         Q6CNjMTHXfyYwhVpJDbTazFBjAa4aUnEKYi7MurvvToq7dghYF3NE2+aixB8x3RPI/D2
         obNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ARRWSpo4;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bhKZHXCvQhNO4AOjr0W8BUM89/SZo0+/OAPKhFVcar0=;
        b=h3aM4AgZ/VSHbAkA/JPcal5/8DnH8sCnACKUx7ubgVnvGC1vBqFF2fuRJu+W9ZxfWe
         b+fo9Wp0Meugscv1iwChmtCPh+YcReh2nagpugIjP7XQZcpIk+Acv+ZjEzr/ZGh0kUr1
         JJ5K3PO9sX2zf49Sox0I8y3wwGUZA7vYMWnbRdT5ObdgKURp6qfP+ycxnne9FOMUNs/n
         IExH9VxxkFFf2Lid+7tlC7jfafsH53HJZyFVT5Vsc+X6Xjr+6WGSse3mm86W1l6dASOr
         4k6VO/Vd3SW+uGppKPP85aYRUasb2zVtoSOofW9MQcw4bpzdwx5oL7bFxDKE/jSdDdKS
         pPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bhKZHXCvQhNO4AOjr0W8BUM89/SZo0+/OAPKhFVcar0=;
        b=endRngBFkWXpGSl7HiC7f1/JljXJAKGfE7VdoMxQuiykPnIVOQdwnfYrVVRAhJNrY+
         uCoDKBD72NSTua/RbkkLEog1Vyf1/Ri7HaAqx3XJpvbt0NErC1fH8gMHaqFnRNUJuBnE
         LyeVev58MiBScqMeznnzaL3leFFwuUqVWQAMu26f69a/RLoHSWewRTZF3Vm7T2m1CJzW
         Yg15w/tVb/xUyRHwqU38S5b+HbHuhQTqFw2VaYw1MHufqMWKKRUYFNIuy/erX1A/1jTl
         jzmW+njAXzfxbz2RV+w7Ll7RqIholQyaEjS3pFCOWPHlZ0Bqzmf6HT2r6Y2OdwAGlUFF
         zt+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533PwJyZ2UgZQBag7ShDWeRLIW7s50IzapP2XcQX7PFaeXZ8v73O
	pP2u5aWerbG6jSxO7awqfxA=
X-Google-Smtp-Source: ABdhPJxYFRdlDfI0RLivYW3d0mjiuozoctbDNhSAMhYmvoylkn6kyMB2EwnseXcSE7M3wrVHTgMb2w==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr6522104wrs.307.1623342085656;
        Thu, 10 Jun 2021 09:21:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ded0:: with SMTP id i16ls1930968wrn.1.gmail; Thu, 10 Jun
 2021 09:21:24 -0700 (PDT)
X-Received: by 2002:adf:eeca:: with SMTP id a10mr6237791wrp.184.1623342084711;
        Thu, 10 Jun 2021 09:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623342084; cv=none;
        d=google.com; s=arc-20160816;
        b=fjJOWrD01oKztQG/jfXsA+zXPRPS0C6nuJ+F9pwcVKxhbejPrWXUH4nwBl8hblSc2W
         pUs5iWW3bRHn5fC+yu8OwWlBjwpergvGFSwhnGL6bU1Xp7JRheRgFoRlFzdHMj3igPM8
         9XNlOoxoUJQGIQDm/J8de340kppT05UnSVPYZjoreUphpLh1MMtZSWF3rb74Lh5bplcb
         QZFJScCF5dUpa97shp8BnHnGl2X2LgzwNDMagV2vogUbn+JztMzp0rt2eZhFKAw6mtaQ
         yO9/3j73YEjQ2gaaR4PmUhDxfMv+WfjQbKooNcpfnhAWN7yeyY8mYZcYikqc11BkWIts
         Zitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=GjvUDx1Fv5yrZZX1VftKQlVCtx6RjAIiwqYaktAvs/o=;
        b=WdMCMjkvf9GQG8dIQg71jAwtGZRUGNlXVh6k0fPjEGnKgwHZayKcNOE8zZ8xEoeWsi
         t4BbhigdV3kqpATe3KaOsy+lrtj9I/Uwq84G/ppH8/UDLMQFBKSaeLf4ZzgKi3iaNjQ8
         GwBh0oW9tqfKuZ+VqQ7MAYanliHSCo1Js9W6GH0IOK3J8aHvst0FfLLP0Zqj1A3c1n84
         0dXRwa2h4cqHRIUr1YkabEqW77x7AhP33zrZn5KBmbafo4a0ewjUZ0j4/ZfNeGcDvdej
         AR+m+79LCU7uL24tbdWbi/vr+ilpOwk62E177iuNMqxIDoktA2wJ9mLG/K1bIt+xKCgs
         DQrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ARRWSpo4;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id h7si514856wml.3.2021.06.10.09.21.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 09:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4G18P02RSDzy0M;
	Thu, 10 Jun 2021 18:21:24 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::bec4] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 10 Jun 2021 18:21:24 +0200
Subject: Re: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB666395F0E1F80DF99676D9B7B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <4173b69d-f0db-e651-db90-9a654fd3fde0@oth-regensburg.de>
Date: Thu, 10 Jun 2021 18:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB666395F0E1F80DF99676D9B7B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ARRWSpo4;
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



On 10/06/2021 17:56, Bram Hooimeijer wrote:
> From 6d0539fdcc4734cd0ae54df4b89df5a2664ac83f Mon Sep 17 00:00:00 2001
> From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> Date: Thu, 10 Jun 2021 17:27:57 +0200
> Subject: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
> 
> Ensures that calls to stop(), defined in the inmate library, set the
> cell-state to shutdown.
> 
> This prevents the cell to be locked but unable to respond due to being
> stuck in the halt() loop. It also ensures that returning in inmate_main()
> shuts down the cell.
> 
> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> ---
>  inmates/lib/include/inmate_common.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
> index 1c20a0af..250531ea 100644
> --- a/inmates/lib/include/inmate_common.h
> +++ b/inmates/lib/include/inmate_common.h
> @@ -92,6 +92,9 @@ typedef enum { true = 1, false = 0 } bool;
>  
>  static inline void __attribute__((noreturn)) stop(void)
>  {
> +	if(comm_region){

I think you don't have to check that. Generally, you can disable the
communication region. But have a look at inmates/lib/setup.c: If you're
using libinmate, the communication region must be present.

> +		comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
> +	}
>  	disable_irqs();

I'd do it right after disable_irqs().

Thanks
  Ralf

>  	halt();
>  }
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4173b69d-f0db-e651-db90-9a654fd3fde0%40oth-regensburg.de.
