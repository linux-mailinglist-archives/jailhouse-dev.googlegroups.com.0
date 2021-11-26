Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIVDQOGQMGQETLWG4TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042645EDCF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 13:23:00 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id q5-20020a5d5745000000b00178abb72486sf1659039wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Nov 2021 04:23:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637929379; cv=pass;
        d=google.com; s=arc-20160816;
        b=YKqEB/x8fE/0qkHC1F78oDvcwbLFvuzcUCS2/3TzuSBhhDfq4xTf0q3u93Pka84vQc
         0rfLv1FNmMmuhKf4i1o+UwK4zh1UGg+f49ylm64GNEXoXc0mlcWoDzO1BGrNIwFZ1XMQ
         GtCLEVWU0m2L+5obCHRAcZxlg/0TXAb+AY+68fJhL2UDoV29PpQFgcTNJwR68KQOh7mG
         tTHwONBnJZSqYDrhxMgS5ym6YzdUu3lbCjpP012vr4jfHkAzGntYBNltghIHZVm/ShMk
         YgLJiFoTZ2f1NOYLoEVWIOVcEXNMlLuasfGRiNYQfxtLrpo1XuvMjwZK+ZeCyknhAUTn
         F7nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=TstmCuBlJqKuDxH2wmGDQkESBR+bny+J/AuEd3M/Df4=;
        b=nEbs9TrJjNRuZ2m3wHUXdlv/M64GFb3z50vanUGgCKAxIc7d92m8kKebRH7gZtvyns
         b1aAW4EsN0VgSI4gU8iFsuJmjkMcpfc7p7eFSyE3nQ1U07448mlxXSGNnjTgiSIEhp0K
         +Dm21voiJ7CuyPD838GjECDp4ZWOAi4BH0p89e1J4YtD20ccb92skFdGpthg6OPZU4f5
         TvEIw0pVtMjCPhGg8D6JlVSzfHjb2ujr/duJE4iQjbfg1jM9V3dNEwV4WId+57IgPkC+
         Eipb7OlDglR2wVI40kF4uo2DdMBuf9WMJjGJkxL9WxwO6DJTWKKfUe3YkG7i93QQmhC2
         Mymw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TstmCuBlJqKuDxH2wmGDQkESBR+bny+J/AuEd3M/Df4=;
        b=O95J+SPHATt5x1i58lNTuPCRik+TxKkbKESYb1l6eGyn6aMgEabs1WCorWwCKmeXSZ
         0Ma2O4CJU41Eay6B/LaMbD7hqo45n/0JFnZphVXT8+0lvnnNNp8Ufr9PpqcZQ6hePGGz
         QmDqfM1iJx8kk16HQ20+5nJJ2MxJscXKLaDbmnntg7o9z23BKA1l62v6JG2DCe8v0Kmo
         FIXqSbL7Km4gtxSWhq54+dEBFTvDTkBBZc9zRcu0xB8CDuFa+HX1wHnEVnfKlpnMsT+g
         Zwbo2UQwynQ1Vuz4JvQSui5LuGkGeXBg49Z+4OV1yV/3Mw1A/6SDq/TzdJ2OLmltbNxF
         IGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TstmCuBlJqKuDxH2wmGDQkESBR+bny+J/AuEd3M/Df4=;
        b=xnltDJj+xnWxEczCVUbxPreZUMIgOqGqcN5NvJQBDrBEr0f0L/eop+PlwpXvuNUf3b
         4Wt+nO9joHeiXHZWnRSuzCEbBA9eQzGY245tO0AcnSDQqNmJsfm6ViA6rVNLdmXEdWSU
         gHy2mQAcXfrVCb2J41ifaMTYc86xyv6/E4REHbJEpRgpZEPHI/OXVox2Ci0FGNOOJu+n
         u3td+SGZDUQ4k+XbzLAu2QYqKsuliJ7L4tZ9jVvU6q2VVgioTiFEYYULviVC10BnifVM
         gC2Pau+PeNU3ew0HhoPqbavWsEmfxioiicR4yheiEsgylxmGMDo3zGMvbk4IpZBGqNvf
         Y2+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XCylOriZasj1ALzY3oicVfYQcAFYxZudeopBWYNZSvGwg6lPL
	jtQuoAZB94WygblgrasYGbE=
X-Google-Smtp-Source: ABdhPJxQtr7EVNC305J51p+yOHyfF0tq9nXieEryKAkfhtZzdGNXODQYiWME1rwSMhf3P0O/bBdHPg==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr14345068wrt.22.1637929378941;
        Fri, 26 Nov 2021 04:22:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f1c2:: with SMTP id z2ls8050515wro.2.gmail; Fri, 26 Nov
 2021 04:22:58 -0800 (PST)
X-Received: by 2002:adf:d18f:: with SMTP id v15mr13250468wrc.447.1637929378057;
        Fri, 26 Nov 2021 04:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637929378; cv=none;
        d=google.com; s=arc-20160816;
        b=xHPijr8pKZgj4DPlXiJvUNfHhci85AnQLYtrSc08x1AWwoGBZ9zrMq2YH+gzMeq/zz
         oY+slXhDsQI02Ho1cBFonlRjGHuW4ge43BWBobFD842ZaTzHGLquv+5+rwUtS9r1nsNN
         TngAdm75xxT3Wqjii4AANaIpvgINIgczTb+pUYTW69RHRrPfBCiOx5qe04LqqsO4Pwz/
         d8biLa7v6LBwjl/xaaKH9ntmzf8ihraSY/6EQlDkhGo5/eZelQSzJkAADGqRZNdTBjeh
         bOIaOvZuCUwC9WJJNosRrgZAIMJw9wTpY82JzpNB3TPGPVMaXGcMPeQAJYW4jq+sciKH
         QXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=l8vWOpmHL+FuWx6C6YfF7Y+j2ASQffFHNIyp11MCHzc=;
        b=t+hhuLIx4tgvBTPjeX2/Y6LOsHr1YOb2/94ksEfFimVC+nwtfJRZhLTFi6+DGJBndV
         fuiTEFWZKRdoRLY0LBvfb1mT7D4Q2vc3l2qG7nhZljt2jIDuwXX8+90m3qdebCUYClXt
         WsMSolUwIE17LY5PLpKPZbv8wJwLzx0B/SHqghkuSrAQhELusvoh0EIAN5JbZrAlwpMF
         nWZflsTIcf+ZghKUGG+hgPfCSqNRn3o28J+xWJL5Z84jsJhrTQOdQh8GNXw8vDF8SaT2
         KZYP8pGKVibyswQcTo1bkDWvc/53wn+3KcoanSBPMXUo8h6hZhkVSjI0OeQr192STjZB
         xspA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c2si1400038wmq.2.2021.11.26.04.22.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Nov 2021 04:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AQCMvId009215
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Nov 2021 13:22:57 +0100
Received: from [167.87.72.134] ([167.87.72.134])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AQCMum6025933;
	Fri, 26 Nov 2021 13:22:56 +0100
Subject: Re: Jailhouse cell linux
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
 <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
 <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
 <83e82fe2-6a32-339c-01bf-46a7a51d8e22@siemens.com>
 <ccf64b1a-986c-4f02-8103-5a04f99a8a5fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <171e1797-c04c-a816-9235-73891de7a422@siemens.com>
Date: Fri, 26 Nov 2021 13:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ccf64b1a-986c-4f02-8103-5a04f99a8a5fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 25.11.21 16:36, Moustafa Nofal wrote:
> =C2=A0
>=20
>=20
>     https://github.com/siemens/linux/commits/jailhouse-enabling/5.10
>     <https://github.com/siemens/linux/commits/jailhouse-enabling/5.10>
>=20
> =C2=A0What is the cleanest way to apply the patch? I used the following
> commands and installed Jailhouse, and loaded the kernel Image produced
> by the patch.
> make defconfig
> make -j4 Image modules dtbs
> sudo nice make -j4 bindeb-pkg
> sudo dpkg -i *.deb
> jailhouse was compiled successfully, but commands are not working. So,
> am I missing something? do I have to copy the .dtb files?
>=20

As pointed out before, reference remains jailhouse-images. In this case,
you want to look at the defconfig used there.

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
jailhouse-dev/171e1797-c04c-a816-9235-73891de7a422%40siemens.com.
