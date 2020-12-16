Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI4X5D7AKGQE7TWN6YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D01D2DC13E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 14:29:09 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id b26sf7274523oti.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 05:29:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608125347; cv=pass;
        d=google.com; s=arc-20160816;
        b=bfpKPPzPj7soNTVw0RWh1FjsOpt44vo3rs6xyViGtRKgFfIfKshIG7OfC2TqABSuJh
         XzAY8jPpnPi61o/ZG1EZtNuzIzvPrNf7wIk/0oSVUVV9B/zRosZaMOKjCCDEJraN306z
         ly9+4huWnwrLiXFFTuhHW5XA1gsJ3+43v/A3kfq3eunwFeCqrMW4mcSHsjM1Bnu0HC2I
         75WjJBEBTAaywD0D4HQMcbFCrbJM6xrVBls6n5EyWmpfASAdsgJpvlWA9JELdbnTy12E
         2vS22Tjfo0CjUBObBOK3AuPaAY2HZY+J+qhlK3Wg0gR7rU6YPuesdj1hpG9d50EfJz9A
         u+mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Koyu/zwZmK6Mdya+5IKK2HB5V84lG6UCWYNJj4pvqvc=;
        b=YOYVJqRUb4s0d8w55c1aMPGgRoerEglV9SYMoKDUY1qzFOyKNoJ38xeLPyDIMe+2yd
         6mCNlm1beQgebwwsUFUHrQfF+9GunOCYfF11KSo4bMFIdsTXBAxdlOpD0uD/IJ+2nOMP
         Ab87BSBrwB9Y1TgaDbcCYJ0F24vRLwaDjKas3eRErOps9MaKuhavXYLh9yiDheowvILX
         NE1uYUpSMI+6iJxXigXhB6RjWNkbcgL+tXK5bJpFmf/VSSPRxWCa7y5D4lQ8EuzghN8D
         pn1rVCbs+cIrKtDxH1LRg0CWYIeH58csGmssuhDLb6nEGxFjTywOe0JwD3hpriskKMsI
         6+2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Koyu/zwZmK6Mdya+5IKK2HB5V84lG6UCWYNJj4pvqvc=;
        b=mgUcpCbYuFje81ui7t+dojlDCSyi3aJX26nGuxgKD6XVJhM58wbKNn3e0zexLx7Pd0
         TIt+5WfyLCNfGb6Hi/HKGG8Mx7f7ad2kbZzW1wOFRncEXp332jUFMZoAD5pCwC/unvT+
         H6/L2kLc6OTZxkKQMJYPsof6YygCXRUCFhnptw3xZ7Kz6yVc4lKu2ErntVM4LhEPqJSh
         dNQTjNgaVgAWLnvOrynxWZWIefv8GJUNIw1X4cwP6mlcCwMPl2WR+oSAD1eai4QmPset
         +OYOJriv1SIl6k6hgAVX7Kn178NIfxBbE/sF9yRmwbnTFrx4nQtNz/tVvL2QKIhWxOsB
         zgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Koyu/zwZmK6Mdya+5IKK2HB5V84lG6UCWYNJj4pvqvc=;
        b=n8saFWSC2YBBBZ1sWMqQPR1bJeMCVjPXMWnRC9RC5qZQnnPBN4gXwek1kId2vvPwbr
         p/rMGXF2IXjy5tnUHjeuPJJNniUrWfqYgzJojo9vG2VCJuX7Acxw6lXMLn9/UIo8gowe
         uaJ21DxD8eFz2scwcMaU3fg+/Z93qZUoBf2kvsJtl4Lc63GDiQXhX8BW5NFs2iX+JgAW
         P8VoJt2PNHeaZ4YFW6+gYKdpBuVvsLWCd64SyNZxMvzirXIgdJjpE8MnUIRWzmyk07QW
         ZJ2zGGBcZxUXy9s1011m4mv32lCi5N8yVltOFsDeAgXjPPJS0F0uoqYkPgVGFV2Ey+tm
         xUTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532fzChstxE36lsRl5jyHPSxWTau8i837fIAytWBvbVbMriOEZMC
	CDspRyotGV4d6QkHTlGuuis=
X-Google-Smtp-Source: ABdhPJzDOtCnSWJpEtLf1FwPPFDg25nH2fE9s6Efcur4GCuqPeNy4aPio07iPHMdfp/0nvbcI3qKSQ==
X-Received: by 2002:a4a:3001:: with SMTP id q1mr227723oof.88.1608125347524;
        Wed, 16 Dec 2020 05:29:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:a843:: with SMTP id r64ls5991556oie.2.gmail; Wed, 16 Dec
 2020 05:29:06 -0800 (PST)
X-Received: by 2002:aca:b06:: with SMTP id 6mr1957818oil.74.1608125346674;
        Wed, 16 Dec 2020 05:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608125346; cv=none;
        d=google.com; s=arc-20160816;
        b=HgUeE6AHkZ67iblqRDuZQXxIfxspofnHqFnatitiJ827Am4jhMQU7q+H3jl7PxAVIa
         0R1spqjzn79wlESDdViiQn1/LkCUZ3RHYuZGh5ItgkqG/I1zdkZeNgQaq2LWoXuGRdw0
         HFr/eg9vgajN5pGsVC+bwaVSZ9T1lNs0lRt7xQXm9oJhuh3Uo9X3ma/T1xveApn7pcYl
         xAdLmoJBYc0RnqRFRbtmBRxMXdGnSv5AAhiS097s5KrpPLh9jUtte/YfO+c6x6GCJMBJ
         GV4uceVKQj+7N6kVLGFzcOZ1TaEBnzHeg9GWRIGIUDr+M6ACvJor6/71fqw762H4Ix75
         TQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hGOsrjqn29SbMKIg/p6dPzGqamdh+0CpaM9Ljqwg9Oc=;
        b=RFfjpv1QktRCXMdq4gkCRseldc27xQLOYlF4BI0aIBPqtKrJrdqAQRcKtTupoSvCHo
         /cp33GY6qdL7Hg4hhcozIPFbF0sNBs7S1TnPDMeWnFhkws4XpynyjUmqcvwlZcnxqSFs
         4M9OTd021z31gs+pc4jOK7ZF8+BEzR8lq0EyVtmvWi6iifxYarD84hk7GO+qrX9p7WC8
         d3BPxsuzGjTPTh6boGz6TmmE5Cwbw9OqcPT+YQXhLpt1Y/e5Gm0DEG30d6KkEWdC2NHA
         wIaL+5OS/5c+daAntofEW3B5wsLP28UTVarJizxTJKNTacnxIOkCNSXJPCQp0cDW4cPk
         dreg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w68si192118oia.4.2020.12.16.05.29.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 05:29:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BGDT4rY017640
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Dec 2020 14:29:04 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BGDT4V0011373;
	Wed, 16 Dec 2020 14:29:04 +0100
Subject: Re: arm64 zero exits
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
Date: Wed, 16 Dec 2020 14:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 15.12.20 08:16, Peng Fan wrote:
> Hi Jan,
> 
> Will you merge the arm64 zero exits branch to master? And when?
> 

Still wanted to also upstream the zynqmp enabling, but I do not find the
time... Did you test that branch against imx8 extensively?

Maybe I should rebase and post for official review...

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f99a10d5-db9c-fd70-e0ee-87aabe30e596%40siemens.com.
