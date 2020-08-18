Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7GA534QKGQE75WD5SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF642481F6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:33:49 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id f14sf7973816wrm.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:33:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597743229; cv=pass;
        d=google.com; s=arc-20160816;
        b=hcDbXhaAYOw7WP74Ca1pxSvrHW2lPOM+fDYAUEMyCBwPska7hPavKjBYDqEsQTYEcd
         kgj7GwJC8f0Zu5ru3vDJCchkMWwTTo951GDgpHUaRon8wEa5I7fCODQ5gO942Dt0Rtqk
         u/v/tA8wMFV5QgA5PxwRgqHiN86vxyTdaFDN5tRANM6cfrYVbCH919ojwU9trRvghwPm
         ys8QrwsHFQUypscCekuCyKj6cHbbEfAEDLJspth0uIjg9xUVDbPME2NKhz9SAosQMxJ4
         e4wFXsmP7Fqe1hQDLt0d5cR5G7KNT4Clh3SeBU5yulczhQD7u4nt8xKOd14lsjo/THpe
         o4Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=WHfc3/sQDsARv78R5X80LfSkF+WGNQiWI8V7/8vhDlI=;
        b=uyteKNaEVAprAOlcdJpaBg3ZwblQt5RTlU0anX911bvaKJALMILK4ceqSOuONSXwoO
         eN3QD5FcTvP02Sny3hkaClnDhRhuCIqPdHBuPSOgNE+qIuUF82XIQHI9ywDHNpBh3Naz
         GqO8FKmY2UP9jyUxrbFT14faDDxpEV92kw6RJP4VCyORJ09B7pZfC8aFDrVl8YkOm1zI
         Nokd8gdU/20MtTcThmcgH3v4jUj++vEFREUgSkkdoMeYaDceu6hOBVg3MRgqUccMyoVM
         xTJoYo15LIKmPnJcOZ4wpLckn+IgAOzpToOh0tNDdI7eNMBQ9bf3sNf9qseVCouKH6qn
         /lcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WHfc3/sQDsARv78R5X80LfSkF+WGNQiWI8V7/8vhDlI=;
        b=OkFtEE05QT/mtCKgFqGE0dL+2bp2HCA924be7++/RfLkMBd92jG6cspO0YvJkk1Z6j
         L7Dd8oDtx/m3ChS3g5Nfn9OGEZgXYhIq4/fZl/ALg9EkoD7vRxd8zm4wrQ2K/2HPX8Lz
         8ATbWsj95OzGOgN+xr7lwSZIaYWch7u/BwLM7xrWwPJNK7Oixd9BH8K0zHZyUF2enYQJ
         C+RgdPEartFlxZiwu/RkD03l6vJCCmsPYGFIRScEsWLm7eFYsAlHZYP+mViFtbHgnuok
         q4HNZkNxrBgVWX30Dm0As0bXQQHQRyg+pa4ocTiW6pqEWaFm1+W+xNp4FAhs4TPgXirO
         2qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WHfc3/sQDsARv78R5X80LfSkF+WGNQiWI8V7/8vhDlI=;
        b=Mhosnz3wZ9aFsopl8ZpZD+0qqQCj1H2hwmCM/gnMSa4UcajI+Rlk8SjFeuTOd83glg
         ey6O/5PKVggx/MpI79bAPKTBdh5Wh2qsQgir9Ns2HHrQk49aECVaf3qidcajdqBGnGZG
         zBPLmQtstl/PYekKEjv47T68RC23vxn3q8WJpF5S7k6IzvZIAe30JtOW/mdEDTrqK1oq
         1+E4oAuhyS/kN/qN7emSpurmRpXic+0wmKjWMqkjrHlnx3bquHbo0x1l3zl710FnLwZe
         cRFxr4W0CcFRrCh9/+xdUKeakD2Bobp7x1ZDvtn0fKcybRabQslWq4ER5mS9D1rcIail
         v5oA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FtMFB9lc2DR6sCQmdFAe06mqT+rF9Gb4Yf4JosJNLoWgIQS3d
	9TBnHNPzOHK1tXmcqZ7Zjg4=
X-Google-Smtp-Source: ABdhPJxqcW7FJQ0K+JAsiNW7DITph2T+10oVWUjV0cNlt1J/Im/i33PXmA2S1qeb9I7Z3bE59CIzKw==
X-Received: by 2002:a1c:283:: with SMTP id 125mr19576563wmc.12.1597743229010;
        Tue, 18 Aug 2020 02:33:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls102338wra.3.gmail; Tue, 18 Aug
 2020 02:33:48 -0700 (PDT)
X-Received: by 2002:a5d:514c:: with SMTP id u12mr20184678wrt.90.1597743228198;
        Tue, 18 Aug 2020 02:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597743228; cv=none;
        d=google.com; s=arc-20160816;
        b=XCOqrxM3uF+WuUPjqEjHdS6DyHnvjVmC4gE1ZXsWot52BjaLgrWmIsBFlIJ56B5rr9
         aScFyJHyPgPGOJ7XRo9YzdYjAI90CLQW/sP+mdo6gGWHoG/dZXA7TpxYbVcvKsr50M8S
         ulfqAwBlwRURCArt+YtkKI6/y5ntxCwiTsIGVvvX+s0eIN4pQ33NBQrDGcvgGUO/RLv7
         1guBJB/i6N/ySR+tTA3ge3udiLAbTz5SibQ5xuZ+4/YLoXUwyN6cUQs/2NimayUlzyNh
         V0LJlgPpRsjlVVmOMI1526TWzv7osglAX4UYN4r2Gt8aSFjmRWAYTt+AlB8+lo8A9fjE
         yV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Vp6n+e2wrmQwsLVvynyT1IGlUbGDThb5E6pzTzfqZsw=;
        b=sXoaJzl+U/PkO5mHBDkDhKWsk5ZSZIHt+zoPmeQ3LFrPGOYA92Fv8flvPM+yfsAHS6
         I0KUFFlgvjjuqMKG/hCznonMB6HcVQHkaY+/Bwd5JupExCgBl3IMAXBclD9RzgbElsLE
         3KmcKIq/DzcMaY8oR3mEqs99lb1qMgdV53YHQwObNG+sln8/ax2bQMPShXXCy+L3cCR7
         fLgtFhqhjGzTto2RZ8xo8Ks3BkWE+Ke4Marp8hpWWNa5ZFbsC3UiKSN+4K99bTepu0C6
         mkxW2w++iuuEv8Wl/GDvp0gCQWQbZDQxcQZlS7xFNuQoZVWvHPV9lucndNwXqW+Fl2LN
         qcOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z23si46164wml.1.2020.08.18.02.33.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 02:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07I9Xl5h032633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 11:33:47 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07I9XlHs011673;
	Tue, 18 Aug 2020 11:33:47 +0200
Subject: Re: [PATCH V3 2/4] hypervisor: gic-v3: solve incompatibility problems
 in gic_v3_init()
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200819142807.20972-1-alice.guo@nxp.com>
 <20200819142807.20972-2-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e61a831e-27ef-541d-0291-b86ba8f86cc9@siemens.com>
Date: Tue, 18 Aug 2020 11:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819142807.20972-2-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.08.20 16:28, Alice Guo wrote:
> In gicv3_cpu_init(),32-bit guests use mmio_read32() to read 64-bit
> GICR_ TYPER in twice. Using mmio_read32() causes the execution of
> arch_handle_dabt(), which finally calls gicv3_handle_redist_access().
> Reading the higher 32 bits of GICR_TYPER uses
> mmio_read32(redist_addr + GICR_TYPER + 4), so add a processing case
> "GICR_TYPER + 4" in gicv3_handle_redist_access().
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  hypervisor/arch/arm-common/gic-v3.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 6a1d90f8..584c2c79 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -351,6 +351,9 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
>  		if (cpu_public->cpu_id == last_gicr)
>  				mmio->value |= GICR_TYPER_Last;
>  		return MMIO_HANDLED;
> +	case GICR_TYPER + 4:
> +		mmio_perform_access(cpu_public->gicr.base, mmio);
> +		return MMIO_HANDLED;
>  	case GICR_IIDR:
>  	case 0xffd0 ... 0xfffc: /* ID registers */
>  		/*
> 

Applied, but I replace subject and commit message as proposed.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e61a831e-27ef-541d-0291-b86ba8f86cc9%40siemens.com.
