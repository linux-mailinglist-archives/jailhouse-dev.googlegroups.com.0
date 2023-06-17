Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXFUW2SAMGQEIL7SP3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E273408D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Jun 2023 13:34:54 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id ffacd0b85a97d-30b218c0bbbsf564987f8f.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Jun 2023 04:34:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1687001694; cv=pass;
        d=google.com; s=arc-20160816;
        b=SkYU4KEJVDleReDPhM/2j2BMllu+KaOheBWRtKdA4EIwcKqzEKuGLiQ44/SibjBNLL
         qFrB9ktaSl7+DtJfHGpV+zqOHvLmqmXj8GaXis6UupJ+hqNP6WuJ9XJUz0tY2z64tFCX
         /vFVvjUbeshXGBdGL99qAkZG98ECa1JzIagwT1mbjGxJg1/Qt8XK3mqxBBinQBGsgYqo
         aXAbIh82xuou0i9eUOOGN5G+jhyAwLnrXLy4a35xzLBpi8bh7EhFzqfNb0QtsPuBggiA
         NJ2zkOYRm7kw5fOHc9rNdYvIFrE590RiFbUAzxstu8+jz9hNw6qeB+fngCbaRISsUjON
         XTQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Lsodr54nogWeYJIMAmLFgPAhm2VYZP5b2Cbb3OGHRCI=;
        b=dPFfCvIe4IayR4oDifspF6ujQDm+1g4Ms3mlXlhsMhMR7OdYjLsC/xgPZrnmFWt1qz
         /5wgH/Ed4NbTSaRGqh+iXACiIX83EQC1Ey2S7Me6s0AIrFCzgwGIAcQ0++zBYVSxN3Lj
         ZeIduTip5u9DhpBCuCrKnkhHS8rX+iqasQnT+Az5nKEMcTX03fd9bSTpHVQfme4jpnVF
         DkpPtaZYdKVSuO2OCa263DZ2YzQtw/Mug130TbTltPhfarDTt6T7DSCq7n0BrUKCnC9e
         1DECpjD7wGtcxoWzhKA1aq71qdkcvh+eskKGD4w+bUetXQaM9zjpWbi2nF3+9mpe1MQi
         ANlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QhfBJ4rL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1687001694; x=1689593694;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Lsodr54nogWeYJIMAmLFgPAhm2VYZP5b2Cbb3OGHRCI=;
        b=ZxrP7IE6RHBEk+8PsgPuVlgjmKXcSZ7HhdRptWco4jik+hH3WHwnTBiuxbrqp1jIsU
         keJoB+wAi+BMOXD1pmKKk9agRIYG38b4alLWZoAMuSNwifzUcsMJ6UDVh1ztfM5c2QEw
         9WW6BKg9rv6JT+Sjgp5jP26PbwPqXgHgaK9MKZ35QtMnqOBuUPNvXl92Rot2AiVIpgiu
         pFJ9vaUjqGOGnnGTSnRHE/t5ConqNpns1jGJ8WJkHxz+UIXySwWrF9ViNTXSlmUgNeL8
         FE6d6J0ro6YO3JaRXlv4mGiVcQ9ugBkbjv2SzkLHjekTVBtPFwAEempiY5HeOhu4xupv
         flUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687001694; x=1689593694;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-beenthere:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lsodr54nogWeYJIMAmLFgPAhm2VYZP5b2Cbb3OGHRCI=;
        b=foz4gM3PsnZV0OmZlnffQiYcjhZ3LE0OR90k64JcDD9gRDVJ3ULMsCKx6g5KhYzrF4
         KAGR/vE5wHl8OrmQRSiOxi5XxeOw7iCVqtc52qoBVwxhnd+dEN//bQdEc7iVTetT3TS6
         Z2szHda+oaC7LDo2ZmF6lKOF5Mn9/ER7IHzKUaUTfVlRFplkUiJ05DjyWo2cQTd1aanL
         EverU4AvzsfCj7nHSEckHnkiw0AGX1sh6B9qcUcIj68ZEomwJQmf2SxVnd7kKVvEraeH
         NOanlKxeYhpFiMRHfQg7t2yPFbxuey1A90Fy8B39FGpF3HSmtaQLUqIzogsp9HqB0vaX
         TLcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxqWnj2uVMs+HiLGNTHCFgOwJR7SnnvZEIDCW7MuH01VLF23b8t
	Wc6z80puwtWfHn1G0M85zoI=
X-Google-Smtp-Source: ACHHUZ70hlUKKaPg3wYBWPMgo+LrLEFhvGaJCNPzn9ROv9l63PrY7k168cpj4ytKhmpm4KdNIIvv7g==
X-Received: by 2002:adf:fc82:0:b0:30f:c188:67e0 with SMTP id g2-20020adffc82000000b0030fc18867e0mr3809449wrr.21.1687001693247;
        Sat, 17 Jun 2023 04:34:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:602:b0:30b:3044:3be1 with SMTP id
 bn2-20020a056000060200b0030b30443be1ls411476wrb.0.-pod-prod-01-eu; Sat, 17
 Jun 2023 04:34:51 -0700 (PDT)
X-Received: by 2002:a5d:518a:0:b0:30c:5e52:5bad with SMTP id k10-20020a5d518a000000b0030c5e525badmr2994734wrv.18.1687001691001;
        Sat, 17 Jun 2023 04:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687001690; cv=none;
        d=google.com; s=arc-20160816;
        b=SkFZuRWcfpQmu/ttWOhdFboydV+B8hAhh8ANAgAbgtP1rOX0G6J0uEiJUTtWvWE0JK
         ixnWW13yK4fbKVY6igb2LyxTvbGW4phoH0c+GTr9UkflgVwNNGRIsY4F2+cqLvgNKc1l
         6Q0CYLhb51m3Bc25USb7m/RB24bOtnxY0LWDqaHH/dfIE678/vm030XmQQ9Rbm0/L6Kc
         Dm98M49MJ0zqiJKOdz3pkSRfYYKMcqLUbb/oMh5r8XiG7+CMQmrB4X3/eWWWpjPFAH9A
         e2mtSZxaf4f1s+qa6YmpFszf9ZDR4nsXu6iSjKD86xB/bEgm5KCs9uVRKWK+5jPcMfyX
         xNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vl0D9go33nBjA8StimRWk4PobJtRT9Lg52uOF25/GQY=;
        b=vOZ6brj8vT8QrSvHk8avaJ8PLvYKjLXJzCsRRWIJ2irkufgsujv5GrDHmFfgfOYVzO
         iXU8qScj07OGS56uSA8bVK+WukYlguknowmOaojOqHJiy/H0NFZL+cxm3LDwHjx5YHyU
         nvVgRwM/NN21n8RK9xQczMKK3BIxq1/YfGgodJ4TGKh6dNj4cbqhKq/v51QzwYRybxg6
         yZ96NpITmTpmW2oWqxutADYtwuqg9QmomJziXmLgFx6u5VNhZHuoV4smn5HQdbsgI3Xq
         E8EjkVEdS/t981v5TOhxRtFRIE3kaP7vUzohBFkhzRgGLDP/siaFdzOJQ7O8wePKOuhL
         pgWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QhfBJ4rL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id bs20-20020a056000071400b0031111287632si466858wrb.0.2023.06.17.04.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 04:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Qjv8B3XLSzxtx;
	Sat, 17 Jun 2023 13:34:50 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Jun
 2023 13:34:50 +0200
Message-ID: <1bb61848-d373-4eb8-2b7e-1601a5a02b8c@oth-regensburg.de>
Date: Sat, 17 Jun 2023 13:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: NXP adoption of jailhouse hypervisor
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, "Lex, Johannes (uib02572)"
	<johannes.lex@vitesco.com>
References: <DU0PR04MB94173DED6C08CED6A986E3338858A@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <DU0PR04MB94173DED6C08CED6A986E3338858A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QhfBJ4rL;
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

Hi Peng,

On 16/06/2023 03:50, Peng Fan wrote:
> NXP adoption of jailhouse hypervisor
> 
> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/harpoon-rtos-on-cortex-a:HARPOON

Uh, very nice! Thanks for the pointer and for the work!

FYI: We just successfully enabled Jailhouse for NXP's S32G{2,3} 
platform. Patches will likely be upstreamed soon.

Thanks,
   Ralf

> 
> Regards,
> Peng.
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1bb61848-d373-4eb8-2b7e-1601a5a02b8c%40oth-regensburg.de.
