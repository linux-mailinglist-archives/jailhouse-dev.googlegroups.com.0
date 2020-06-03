Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5UO373AKGQEOY64NUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id E85391ED3CB
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:53:26 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id do21sf1002993ejc.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:53:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199606; cv=pass;
        d=google.com; s=arc-20160816;
        b=WsSPRuj3qHrQ1sTnDiGRVAeyeJS5frA/mzrq9A24xqV2sP7gbvGCoWNp2Ur/VrEQkK
         1VWdRtv9ZdUVqvshljcxF/bmysTBJx0gAjDH3Pft+HuCjsMM5+pky97VdjZFZwc7XCeR
         287cTEmNpLYQ0uIvoIoiLbjikeKUvZ+PEkIwTzmYwlyj4j7vXDMaS7S6J1U/NapOw2TI
         GRzCw8788MysB8pxgTzQIIH44f0rlQzl0J2XaGD2rClp75+9D//+4n5dxdki2+Mpbr1O
         jCFixgHHMdGGvnzT+iikiXHmGWx/RnCsTj05EP06m6HO/u8b7IGVnh+3itzYstHsp/N5
         3YtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=4ZTIYcoM7FJcrgI1DWoKveqQLjLdPXtnancHy+OB1GE=;
        b=CSZR783Igz9b80ezvup/bADllH1r1ylrAdS7o3xwa/Z8QKYODM8daPMGZu/JP5F4hp
         KhDmYBWqci2s/Nvr0y/4ByAC0roiDtOFxJ4JaHB9hAIUAt24OjbS/ncbAYwg/zyfClhz
         StBWt0KwKeAsBHZLmoX3hYIPkodBEP5UJlIn+63T2PXdyo9CzABH5D0fj66Osu1QmkPd
         vYq86YJbwXva3JYnr+VmTww9Jq+WwuO0OuAaXeL7lnTqUC677GDFuX3BClADuJKDV+ju
         /k4KstC5sPzoHD57R5Zx8F5NoncQHYD2WGmzQujsrPOPN/AzSukhi6151Ha47tQTk6Nk
         wMqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4ZTIYcoM7FJcrgI1DWoKveqQLjLdPXtnancHy+OB1GE=;
        b=YkhUpS0Gx5ks6sXXC8KJCn+f8Zk6qXRD+g5mjMfQiXrzS8W9eEqW8b1sFWSku36j9U
         9jJIn3V6ES3P/IoGFjkkF/3SchuyrKTYe1Kgxpr5m4PxKmzmFU+Hyz8etNaWakJVwiwX
         kskx/z8YBLM4y86r8glmM2KO8H4CHtGsVhSvi1/1SJd4QL8P9xWEAy6MSQ/EP0tc3tVm
         zBeKjA9dp0MAmEm3Sn38AFAlMnenr8xKEDT7e6w9TsW6FNIkQJPMg2ESRpJC02W6e/dt
         AOvHI5CEmP+0HJBaAgIQmXAHu/JSPmrxXB8ZwbD2GgoryXuvNEymIukFb8zmU0HLHnX5
         cK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4ZTIYcoM7FJcrgI1DWoKveqQLjLdPXtnancHy+OB1GE=;
        b=iTizEH7/5Ou21Dtnuon5QPyGOpmsPn3hSIeEqZGuTu8KZn7uEbgJt3TcLogG4PP0Rj
         EDRSd8dRRNfxt6qpESOaO4X/pWrP8hXvE4imtcgjgICPq04CsMn1Et3HQF3Kn7hng+Ub
         htX32kDrTojAwASwC4CYFeEVakr643lF9zj4fcrzxXLo9Piz305n/fh3dcSZRnsb7xNZ
         jKpiSYC7MDbUoDFZA7yLdZ+JU5h6PzeN6gUIOX3RIs6sZg1fexsJe4RObjDqcsqQ0EBZ
         b9GGrbgCrXTzSvb1AZpPT9YcqeVuOj686GjqihMF6T94VnNT7CzscnqBMn+wdYupbNLf
         /+YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531XPGxpPo9JAJ5qofdV8YwbGZXg68K17mI9DLmYEvV/zQob0ONf
	mxSYrdL9MyIcYfDkvzT7ex4=
X-Google-Smtp-Source: ABdhPJz23TfK5oxEmnbWO+aPImqc/oMVtIdOtPfh2uZGDfYR+CqNh3+1M/TI00FlgG8UNAHWQcoAdg==
X-Received: by 2002:a17:906:edb6:: with SMTP id sa22mr29503005ejb.393.1591199606609;
        Wed, 03 Jun 2020 08:53:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a82:: with SMTP id y2ls1110282ejf.2.gmail; Wed, 03
 Jun 2020 08:53:25 -0700 (PDT)
X-Received: by 2002:a17:906:2484:: with SMTP id e4mr30003036ejb.155.1591199605859;
        Wed, 03 Jun 2020 08:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199605; cv=none;
        d=google.com; s=arc-20160816;
        b=YFLf2VDJ4rIZ6MaqFlYr3RoYaV6Y0q/2XBvPctIRkXQD2HtI9+IC3oBfRHCdS4zuaY
         sPOjj20ruEiChLVvfS6m3PMQ45gUjv0G6UVtNAUJqDYAfR9w7Sa0ZhTi1ian7qQJrU2F
         YPoxSEn5hIpQp+9uYGXuT744jKjFJsfpvb5j9m1cCx8rvqcrGVtBxBByGf0AKJg7KyeT
         a8U8umbFJ/5k866Ua9UECH2UD0C6MoiZquKBDMeWhq+NAQaiBd0h/PeWRHoKzoK6BGfT
         wvwKX+kr3Krrjb2snrgGGvpwFNatMoQ2oxBQ2e6uiboUi3ghGRfq2BgIYmVbsOP2fTT8
         IjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=CMfyn+8h4l6AgJREdSb3m8HnxqCpf/pZPXEGTrV5z9o=;
        b=TC9ohd48KKdos4N671ie4Y308Tta/eb36E93XrmoUit0WFdC1sagF88KLCyuOQTCOK
         fa+lKpyRNp+RbHy5VmBy+LwW1MTBArDAJ+X88PRjQDU686C2v4XbjsyeCt7IAFBuwV0C
         I87kiltsfNlsOSbwPkmLoZTtN04ymcYgrxSNzZpJIeMxQ3rdQAYvpaVvBwkWszArobyG
         rR0SrShQPDQUoLlNScnHrup+eQSF8FyogkfcFSV9m+u4wB2t8Ne5gV6Pr+M8aXUSqDB5
         +nX7gQI9wqbYX8mVmbaAeEGzNlnDIKzWKL8HsRZj8hQvJ9gCPnedfL2Hk5tqiuX++tdK
         X8WQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a23si120081edn.0.2020.06.03.08.53.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 053FrPHX021228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 17:53:25 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FrO7A009990;
	Wed, 3 Jun 2020 17:53:24 +0200
Subject: Re: question on Jailhouse-Images network
From: Jan Kiszka <jan.kiszka@siemens.com>
To: dd <497738387@qq.com>, jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <tencent_800F98F7CFF07895690D05760CB69748C805@qq.com>
 <684ff2b7-9e60-5680-ca8c-c624baeefd85@siemens.com>
Message-ID: <640544fa-311c-c7f9-3781-1808c55f9900@siemens.com>
Date: Wed, 3 Jun 2020 17:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <684ff2b7-9e60-5680-ca8c-c624baeefd85@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 03.06.20 17:45, Jan Kiszka wrote:
> On 03.06.20 15:30, dd wrote:
>> Hello jan!
>> I encountered network problems when I boot linux image built from
>> jailhouse-images repository on my rpi4.
>> I found there is no network on this system, i could not get a ipv4
>> address using=C2=A0 eth0.
>> and I haven't found a way to configure the network And i can't install
>> tools.
>> So I wrote this email to ask if this is because the Linux kernel does
>> not support related options.
>> Is there a way to make the systemnetwork working?
>=20
> Wireless is supposed to work fine, that's how I connect to my RPi. To
> enable it, you need to provide a /etc/network/interfaces.d/wlan file
> like this:
>=20
> allow-hotplug wlan0
>=20
> iface wlan0 inet dhcp
>         wpa-ssid ...
>         wpa-psk ...
>=20
> Just tested eth0 as well, and it worked out of the box but had excessive
> latencies.
>=20
> Note also that my image is a bit older (kernel 5.4.29), and the latest
> kernel version may have more issues in this regard.

In fact, that version is what is in current master of jailhouse-images.
An update to a slightly newer kernel is not in the next branch. Feel
free to test it as well.

Jan

>=20
> The RPi support relies on the downstream Raspy kernel, and that in a
> version they do not include in Raspbian AFAIK. Unfortunate setup, but,
> yeah...
>=20
> Jan
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/640544fa-311c-c7f9-3781-1808c55f9900%40siemens.com.
