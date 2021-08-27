Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXFTUKEQMGQEWAT3RDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A363F958F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Aug 2021 09:53:01 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id c24-20020a056512239800b003cec11473d2sf1654095lfv.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Aug 2021 00:53:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630050780; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bnq2NAcJ92tHWmebirPHUCdfHkmKsyZZCEev3es2KDigz43r+F7IugZyLWjNU0Elb3
         CNNwOWMOkgGnS446bSuYCUh7PitghMlrpus3PQQErB/pGHcoWYXDjv4PYeSLe32Q/s/s
         ti4O11wpD6Cx5+NG746Oa4Ol7gy2mXRozWjG62BDDpwfox9vdIQ9lFxyvdcZG+ksE8+I
         9M4CCmgSF7aLw3jdhD12FniVUqWXc0AiWg8TRAC27dIlzYuRBC4SgzVixO+bpXzGNf1f
         8yWsCisRSCTzDQwlEHeD+dhx+/RikGSwjhRJYUlNV0oV/LGrlfW6DCJ3a4DZeOWTBv+B
         6eZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3kGAJcAw/b5YaUzHDrdDm1H61zMUS+fqozRsbOTf8uM=;
        b=yA0f5e4WCNIdCDTXPhKZ3SsClGGrdUpwupp9AUguVSB6zsY1ec1ut08YBK18KlEDJh
         Gp3dZLcFRuJCTKmgf2OhEJ3vcTy5s0le+C9coL3aeHn0EJAXiLQbMr+rTHFqLqDFzgzM
         y+W7S2/jXOOvMfsFlqYB+rxRGmM2NOPvKc5/YVAZtYMMpg0f2udFkrksfDfDyyLvhqlc
         qVkjK1LYlHnlh2Vt8MYfhaLU9I0gEhs5skyMHrLgDVChrHYsIDQnoTXuAUiV7WYyG6HH
         zvBP69Pmt+J18HiAdjbqz27a717U6wUC17WqrDJIKDEnTUXLBNWWv3AwkCNXCPlcVHtw
         MD0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3kGAJcAw/b5YaUzHDrdDm1H61zMUS+fqozRsbOTf8uM=;
        b=iudsaitc7BG1lrUp6WicZiVky8QBwJaZFWV15+aF7lM4JJFAOfmPpGUcLzKmuTxw0Y
         EerE7A+PMJlsqDDCQ0EVEuqWZ05st3QfPTJhZ0KoTLPD0/gsWVjEQRWddByfvX4VZk95
         K/GsQc4WP9z1VBkYJDnKT5i8b9U0QJg6Hy/68HaflNotkPBKbtGgl0hdca4MNKTDdbxe
         Fo8GxgFNgtGXpiAUNBrnfmeFwE0e2+235MAZOzyoxGfRjRqlcQpLj03wH2utDhSp2kbB
         oR89LJeylvOsUfrbxmBz4hpnfaS2DoHs0c4jn3rpSOqEDBG9gHDOAIakhOsbdtoLrVOU
         UvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3kGAJcAw/b5YaUzHDrdDm1H61zMUS+fqozRsbOTf8uM=;
        b=oa1AZt3GllFqRI1qZ/UsWPRJiRyUBSA6r9wU2stKHvkqajvOZQ5y3h8PDvf8uAxu0d
         IV9Hmpmc6vRGYjm/HWRn87Cc3hy13BieHH2uSev9ptoJKaQfxwpbeNdaYYy7YumAVpDJ
         62I3fvQtXhvlkBuHa4Egu05ys/NG21GEpWnFJ/C/avd4QRkR569WxiRJCpQw0didrDrG
         KVObntN0SI05avAcLdX28epU7SXV3XcDMx5qzs/OT0O6txHbP8NKxxcWN+zh0geku91y
         M1mLRIF+z8DJA607iTv5DLCXOuewYDHVAg7OeGqmUmu1ymZJO3oA70fhS1MqFcKLK+KB
         OSfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CDKvzU1O23/GT/wWeLWAIEnM24LhMXX+Pibct/Pv+ZLO4jApH
	IM5uPj7ZHOaQLC1NbBv5UzE=
X-Google-Smtp-Source: ABdhPJxCB+J07ex8kOv0zcBlXZXpwHRe36NVgwYhXBfl8Z6YXKpYN1t7qmQJ/vBNGrHoC2glVs90sQ==
X-Received: by 2002:a05:6512:39d2:: with SMTP id k18mr5707432lfu.76.1630050780634;
        Fri, 27 Aug 2021 00:53:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2119:: with SMTP id a25ls1652439ljq.9.gmail; Fri,
 27 Aug 2021 00:52:59 -0700 (PDT)
X-Received: by 2002:a2e:9445:: with SMTP id o5mr6495635ljh.300.1630050779263;
        Fri, 27 Aug 2021 00:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630050779; cv=none;
        d=google.com; s=arc-20160816;
        b=fzyx36HKdqMnQA/kvg9dB1PL3AzjbrKr0TGetNpNx0f5oQsFAuNZgISc0q/aQdlTS5
         cfcsupcGDNewy1gYV+ShE81BGmO0STUHsj72saw7fus1RIEsqJHB18xkavYIaeQDXt3X
         sbmUreTGvM39aNfgOGpez9AgvN/+orGUaHGfonNxLa7+W4X5x2nC2RBrA0cj352eGPxb
         Dw6OOiMNuwd97tndcu6vp3Rt0R5q3OtWxBT6wj7zDSUins4LC1c1JfgUeLo1Z2pWvqT/
         ZMKmPxjDDH10DWO0TEn3QSYA9OtTSHjapeHx7bnFNqXaqApqavc66PYDF/7sNUqNbQGO
         rAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=SwCmcwSZ7CKWVizx/A1cru0GiW02Brmhdd6PFqPKzG0=;
        b=cOk2xwB6n1gnXZftKnVABLNW/tJGoucMVzct26KsD78y8e8aKYhlEJsG2b46FWk3M9
         Tcuc02IS40QlnzunXQnri5gCd7RCOQIHr+ll0EoCwWsa0MvD1shJmuVP7cYnzDu2Jt6a
         /BjNryIpi9pxVCqZehflIY/T0yKe0JiFcYOyF3Vw2mFFhlJwxqU86nBMI//BnksAVMzK
         z2335OREpy3J1sR05Rwdu+QQ+2AExRarTsACYCOkIofGFxgEl482DUqNnjp1Qh4sY2N1
         BEZKnTphgzw6QDJoby9tMX/yP9NbBTGV7cMhLqOj2v6Y6s0PeaVbau+ttNYYJgWEd23q
         fuTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h13si312364ljj.7.2021.08.27.00.52.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 00:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17R7qwi6025360
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Aug 2021 09:52:58 +0200
Received: from [167.87.7.39] ([167.87.7.39])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17R7qvni029750;
	Fri, 27 Aug 2021 09:52:58 +0200
Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, jailhouse-dev@googlegroups.com
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
Date: Fri, 27 Aug 2021 09:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
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

On 27.08.21 09:51, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> In function restrict_bitmask_access(), the current access_mask is
> implicitly assuming that it always access the whole register, but
> some registers are byte-accessible, the Guest may get/set wrong
> value when it issue a byte or halfword access to these registers.

Can you be more specific in the affected scenarios? At least one example
would be good.

> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  hypervisor/arch/arm-common/irqchip.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index 256af114..daae5512 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -69,6 +69,9 @@ restrict_bitmask_access(struct mmio_access *mmio, unsigned int reg_index,
>  		if (irqchip_irq_in_cell(cell, first_irq + irq))
>  			access_mask |= irq_bits << (irq * bits_per_irq);
>  
> +	access_mask >>= 8 * (mmio->address & 0x3);
> +	access_mask &= (1UL << (mmio->size * 8)) - 1;
> +

Are we only talking about mitigating wrong results affecting the issuing
cell? Or does the wrong mask have the potential to corrupt content that
affects other cells as well? In the latter case, we must not rely on the
cell-provided access size, I strongly suspect.

Jan

>  	if (!mmio->is_write) {
>  		/* Restrict the read value */
>  		mmio_perform_access(gicd_base, mmio);
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2d3cfe41-3c51-34f8-8130-f6b86720d835%40siemens.com.
