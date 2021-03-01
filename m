Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHWF6SAQMGQEGXZOOTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C2C328726
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Mar 2021 18:21:35 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id m17sf826346wml.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Mar 2021 09:21:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614619295; cv=pass;
        d=google.com; s=arc-20160816;
        b=xLkJzPSp7wDp5XT4o+RCHlkBMeCyjzRzUHT5lDgVhc8zEBYQW38a3QVrW6G3DtgH55
         69nn8/OQ9/AkRb6XTfI0jUuzsfJNF0FhMgWcoM/fV/3MimdBlkOIyeRQPWtzOZBIqAu0
         YA1tL1VhnSKb+IdAQj0wNBKM7Zix8MlWUZoSGscUemf/FDVwWHtUjKYGnhQ22fdt+59U
         82fsPKNiMhStjUI0OU0QkfFNc7lYI/lRcGuNxvuTFJapdwPjfzLfHyf9zKe1WD3Msboi
         GL1CzcNdrh9srjkLNsV9A3/5zVBRWuEn4EkaRhOnIY4fpieAX9yEgA7ypiPsacZjjeTP
         oTeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=jiXlIgHfeC4vUgGIsG7jpXzWOrJBlnuwpfUCCsXLzTc=;
        b=zlAPt3USn+VT/z/NE5DEK8RhsXvV+kwquOWAisByxMcmUCkwf/bBo3xtYYaYQIyXUZ
         1NFBUHs6YKKbJOeZDGRxaIQ2yuiyvZoLPDlCQR5wIAFl9zbnEfrv/xHpevubIFeP10FL
         0e8QyWmyIIuThUHj9FJvSbILuuYzDN/htf9s3jWtMf1BLgalAYFzFb/nUbSrEECx5M1G
         BcHdAn1wmxm047RrdMIsAlAwSkJPzzZRAIbx2rzcrF++Fdvlrdjo+nQ2XRho2oxQ/7Ux
         b6F3ovdfWafzIQ/vjJaxcJgWjyC7NONd5ZYbZnjEpFeAPbhJ46XDa1AgjtnH8OkmKDCa
         jEog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jiXlIgHfeC4vUgGIsG7jpXzWOrJBlnuwpfUCCsXLzTc=;
        b=FbfwtUWuS+ELndwmUmyHWRntNlf4Q6wAsQ3xybp7X/OMeW0wpQWY/2BVvVa7qYIjki
         lJ2CJn4lmNg78nMzj3wq6RYx4WZm7E6xtmnv22/zxmuxZiaeUxE7CVO8UnPbUGR1oJr6
         8CNwZloTwI+cr3YQTzl4nknPnfkV6XnCbGCdlQ/yTQ4S0Tqk2a6LzXl4za9yBA+joaGN
         E7MqQiEGRhKiu0Gxs5/u36BVBeI6mrJrS5H6jF/ek1V8V7kDOGmuBEi7xEsfYL0JUTJS
         xU6uXJDilBdxfaOmq2B6myV0Vk6f+3KABlal6KGGzRGTesfaMJD6LdRiF/+owprIcf6r
         MbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jiXlIgHfeC4vUgGIsG7jpXzWOrJBlnuwpfUCCsXLzTc=;
        b=KM4I6vETAhf4ma4fXWZxQyBP56c3XA20/fTJxPOgESOiFsyU4UUHaScFSUSr+sLegC
         F580dFW5o7HGH3c3efuRR42TuLNFpiPtilivx5jbUASE8gbAyAlisepTsVSyfn2JLBul
         RLMnj8H1gw4h8Ex6fH+7o4mBGs5T9RMh2I8KF1ccoJGE42hT6AHctCznzg2mtfMrwiyO
         Yr5EY6AZGSJE4nW/ZssikkblBZP2VPEL4932NnKqRDvF+z8WHLkMA8J4uwflDU/Tijkt
         hxTXeY3/n79FsrVR8OMuaCvDlZszZqcOFfQN0xXepl1KB081tPF3cV0TuILeMCAnLSBB
         o+rA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532cauGjwgBLh+IHauD/Iw5gAQENJ8/MtkWbipXfpJmOOCBbbrYc
	npbvALK6hFhvm42cHliJbUY=
X-Google-Smtp-Source: ABdhPJxEDzvtwpzAVVU1heAaZ9Y3iqSYrdumopX71+xQCN0ewEldxEDx9HC4MbXiPLXNfnTGJZaBKw==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr11934759wmk.49.1614619295093;
        Mon, 01 Mar 2021 09:21:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:58f0:: with SMTP id f16ls12378826wrd.0.gmail; Mon, 01
 Mar 2021 09:21:34 -0800 (PST)
X-Received: by 2002:adf:f941:: with SMTP id q1mr18343941wrr.189.1614619294113;
        Mon, 01 Mar 2021 09:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614619294; cv=none;
        d=google.com; s=arc-20160816;
        b=e79GfrlV/bPSk3FY/xGp6KhCvXWAUV4t9Ma4nS2cBjdJL18Ce3492pWpVW1OwXU4AM
         xlwElZW6X6mxAqk0Me0zgZszpWWXU+pvGKTq8g1bif1e5QywCp0zF3OyOEEqc8iaVtR5
         GCIDFwJ2hvLPZtWx5wr2sD9blwhEyH0RoEczorhjn1mhv89sjn6wrXlQ+ztCgPZ8Y0uA
         P0+KN/B9iuuv9MwQYH8qOeNn5We55QhREmbVP+XoZmmEte8L8bEjpxKKlAKQx5Qs289n
         iRRlU1pA3Hob8djTxyP429s7hu9vBwVJKDxtIh5z1IbwPcn4X7IDa4qpq9we9D8c+BhE
         p9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=iO/PiNZNCDh4wv343IPkfkOa+4VPcLICkoiZs68ZFDc=;
        b=Qt4IOBd4bGZhhHZBMoMBPSPQ8fNtJytzYWp2/PU2b1pDy7RjORwngjjVbTvfg0WDyL
         5NtsPvXUAwckfvKmocK6ULHlmGZ6sikI25iALO47QI6SfVN0j7qNBrlrS1Pu5FLc6Bfp
         s8ExGmKOCCwYh74YMUOszQ8ERirOErh2FvwhHU2oFP7DFVq9jT4Kd173LsWAGzHCsoiJ
         DsVRt3dOVpZh1YRx212LzI15RzDzR3k73AyhOTTEdTHH6IxX/CeVvTiYT4OooHUa0kgC
         vofk0wlSDoy7EXyTOy+MtQI9XT9/22fomjcWZkXVYfGo29S5u6VL7MBEsJ92GUoG+HX+
         95Ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m3si27784wme.0.2021.03.01.09.21.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 09:21:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 121HLXEm014120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Mar 2021 18:21:33 +0100
Received: from [167.87.94.143] ([167.87.94.143])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 121HGWLh006394;
	Mon, 1 Mar 2021 18:16:32 +0100
Subject: Re: How to run freeRTOS for RaspBerry 4B in cell ?
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <be230d1c-42c1-4a49-9a85-1d30c6fb613cn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <818b7e62-807d-d86d-2ebf-b74d144ee56e@siemens.com>
Date: Mon, 1 Mar 2021 18:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be230d1c-42c1-4a49-9a85-1d30c6fb613cn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 25.02.21 13:35, Smith li wrote:
>=20
> jailhouse has support RaspBerry 4B hardware.=C2=A0
>=20
> Are there some=C2=A0 pages about build and=C2=A0 run=C2=A0 freeRTOS=C2=A0=
 =C2=A0in cell ?
>=20

There is https://github.com/siemens/freertos-cell, but that will likely
not fit as is because it was developed for a cortex-a7 and some
allwinner chips.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/818b7e62-807d-d86d-2ebf-b74d144ee56e%40siemens.com.
