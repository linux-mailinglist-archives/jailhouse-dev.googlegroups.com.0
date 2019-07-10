Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOHLSXUQKGQEOX4NOBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88C6408D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 07:20:57 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id i18sf260152ljc.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 22:20:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562736057; cv=pass;
        d=google.com; s=arc-20160816;
        b=rAYNG3fBOiYgq1eM0bQApkhjMsrOWcgCkFY6cecqDecE+9WUfNAdNm/xn+WQzCKRwn
         mpdxv+tI6Zbvi9V3YIH0k0Xdt+2p0EyaDLVmgNwggm+74ltqqDUy3pD9LWcftPuCOcCM
         Cz6zRtPrSR+zgmappm6RM8HeO8rz+HPHOvO9XMfvfXw/tHKNadY1hsOp5DB+qGiUQrLt
         43+9NT8XcdtetQccWk/Qa1fFeuJb8k3xA94hF0SJBRLrTKSCtUSmE6MwZMStGTyxMye8
         Wj9TcBHpXmTrDVFwgFHbnzAmF4oExF6rew1ZuMi6czlw5DXQM/Qy7LifaR1yTB2I91zJ
         tzpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Ks0pSqf7O8IxE4m3zw7CNvb03mMe4YPOqBk3ipk8MbM=;
        b=ahfdsfWoKnsNGXhZeW1qFi9Kwfm3AlZRSDu/hHhSHhsAnzI3U3c9NiFGMeKGAaJBfI
         rkF5o1uLp4QLOI6bZ+iUo7KO3jMD/8N083FyYpkbbSNga3vcAiYXmY6sJJWXKTgv48W5
         FU53RtWLeN2jAWHZXZQdNvb03VFFSGHcUEnZcVHEEjAYFZ4vJcwlf75wO3/KOKCK3u18
         iV9Oh4/broDF5UK1Y+Lz5g+QU3pf0H52Y5neZ0I0tr/czsEik0omoOlvc29YzQuc1RQh
         s4W4EyMCfXEC3eHXG33J8LtJcMYlUdQ7EBRbg3+MzI5+bmrILsT4addAt0s/lW/UDmiZ
         0PfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ks0pSqf7O8IxE4m3zw7CNvb03mMe4YPOqBk3ipk8MbM=;
        b=tJ2eGVqXbquWQwOH/ZVXFJLmzdYa62S+RvbB4lJtCaS2UUkW3FL4fF0UJQ0MtPhxAb
         Krh1xQwR67y3T9G8E6GNrtGjv9LSb5fTvNFg0xTfrEBzqxmNHY2ctgS89tQvlUwjR2X2
         uRzPGA+0pJeKtYKsfD2DXN6+VZ3cEjDtTgcFpMNTq9I6oxMeqyzpUgfTvZSGeZviuplo
         kjK7kfM5gOmJ7nt3ysBI2JzyF9GP+1z72xp/U0j0/chO1yQIdH+CsOMDH//ywj9BLwx9
         qAiWMIsb3GzTFgIB1XRi1rjxyfq+buUEhw135QybMXLvbvChwGRXD75ME2roDVlIJgLf
         A41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ks0pSqf7O8IxE4m3zw7CNvb03mMe4YPOqBk3ipk8MbM=;
        b=ktJrDrdY/n24U7Tm1QJFUp75jth/DyHkoDLGsyhMMJjfjl/WrsCMWeUhF37IBrZcJe
         v02q+L44FeKFTRXPOPLmFm+rMbVwsD5SVoWuwRsNB6sJM1bXo9+pzXGwpKM9M3j2nn4R
         oD5bWqq7Xv7SHEyABFjzhyk9/PUCEdymPxPBfXooFU+1hQXNvhRFFuTyUev24qZBpx2d
         TnwW9ohQzTm7J05oVdn7ODQGQOitvxeBzzlIF7AXM5IITGSFyctIcjzticFF4SJ384GY
         gnzsGJYJ+ZF90iK9HZPk660qBEEsMQWZUDrNkLb8ahbRj2Kmppg6K8h1PscJ+aZxy5G7
         zRzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUIhdQLUcFk3QiFCgRPyZeGIf2NI8IRldCNo1vFCrE/y9jyT6SP
	YYHtnHDbgNFoHUyFWjG2SHY=
X-Google-Smtp-Source: APXvYqy1UCUTRVkq8+FIsE6XA8HpGQkuvDH7Xa93nAR1absou1r3DxuhTjID57/+5R5ZjyTvuctmZg==
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr14027867lfg.62.1562736056442;
        Tue, 09 Jul 2019 22:20:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5307:: with SMTP id c7ls72297lfh.7.gmail; Tue, 09 Jul
 2019 22:20:55 -0700 (PDT)
X-Received: by 2002:ac2:514b:: with SMTP id q11mr13766986lfd.33.1562736055736;
        Tue, 09 Jul 2019 22:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562736055; cv=none;
        d=google.com; s=arc-20160816;
        b=KuWwbl1MInsKoffC/e31BdKqnm2K4ewG6P6Pg8eJNDfZ7LPF8FqPae91QSA5FFcukW
         K52C7akfCAwOcxs7jTxfJnES+74MZ6tpaSqhtev5wfGifrEUCsfn5XCNK8XyIT2U8DX8
         JEf10cb85jFH36Z2JiKL6+oe1KOHWSuy1c52JMMhVoyltb1zTSyxzL+p+CrDAOznLpYP
         FnQALSFIoxc18tybGs630jFiHuEQb5DuA3TLgvdDS4WxTGIIWeqYgS7cWMC5GH8bp2HV
         cRPLLdY1Rbv4o3le0rUq+t+Hby4fhBp5KiQDr96+OH8pNiXyKoD5WN6a3k8IwJ9BiW6i
         zC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=bMXEpjOi1FsRZO1CZvkw+vWu47w4DvRPVn3ushb+EuY=;
        b=ttPODgeHbqrYM9fxW+eU0NBNz1+/gmWHLHrW1rmMLLakDiEKt2P+xLu9+z3xOxAjv9
         XDuz0onTWhIPaXSDW6lnUxTmBySwLJJJA/MGCf743pbNRdeOPmA+eCPilPfCjHYGoPYv
         c1ea1RYXC7Ys/qsFWbwfnbyJNXRrGBCAxpav+jo7Fe4RxN36hxw9TCJGRzdpvAf+Ftid
         mM5U4jJb4bqG/hCR9nEjxrNN8z/u9wyZSpwB/cNGm1sW2xHM/EfVbBXFo6D8EnM4BHTB
         n4hUxEdJPT+obmRgAC7oyDFc7okLCs2FiJ3y76VTQBIX3BqJu7Q48d1jUo/I/Lc5WWPw
         C+DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q25si77225lfp.0.2019.07.09.22.20.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 22:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6A5KsGm029871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 07:20:54 +0200
Received: from [167.87.5.232] ([167.87.5.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6A5KrGi026479;
	Wed, 10 Jul 2019 07:20:54 +0200
Subject: Re: PL interrupt in UltraZed
To: Alejandro Largacha <alexlargacha@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
Date: Wed, 10 Jul 2019 07:20:53 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.07.19 06:57, Alejandro Largacha wrote:
> Hello,
> 
> I have been paying with jailhouse in a UltraZed SoM with AES-ZU-IOCC-G carrier
> card from avnet.
> So far, I have been able to enable the root cell, create a aremetal cell where I
> was able to load the baremetal
> examples like gic-demo and a custom one where I was able to turn on some leds
> via axi gpio in PL side.
> 
> Now I'm trying to run an example where I can catch the interrupt from an axi
> gpio in PL and I am not able to do that.
> I'm using PL to PS interrupts in my design and the signal is being generated. I
> also tested with Xilinx SDK.
> I tried with PS to PL group 0 and group 1. Irq numbers 121 and 136 and no
> success. I don't know what I'm missing.
> I attach the cells and the demo source.
> 

Your baremetal cell config is not permitting the cell access to the GIC
interrupt 136 you are using. Replicate the irqchip entry and create bitmask
where only bit 136 - 32 (32 is the base) is set. See also other examples
in-tree, including those for the zcu102 or the ultra96. Both grant their
non-root linux cells access to certain interrupts.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a1ea8f98-2709-d789-8564-6c719b58526c%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
