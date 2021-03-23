Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWNU46BAMGQE3MQ2OWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE62345DB8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 13:08:57 +0100 (CET)
Received: by mail-ej1-x63c.google.com with SMTP id fy8sf947399ejb.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 05:08:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616501337; cv=pass;
        d=google.com; s=arc-20160816;
        b=lBiD7l4QSx/1F+c9idCEQdt44x+bEchGYEXHsnBIRnvgSr9y3SOCDItVEzAP/zAZ58
         4Op5iM2/SkFhKpN82xy3S8pGw0lDl9iB53ZTtwCVD7+GDetj3SJyRO52AbRGviH9wRfr
         YaRYkRvw/21Fl8Cwk85F0DA1alSUKDH5wL70JS48FOuqXoh0ls8/aSfelt5Tal9Bj2Vy
         GE8KNecF2uwunn1EEz1zeJBtQMRgSAV4IeZuRxGZy4pXKEb6TCR1f6jZuKNREzmJ8n1f
         EJuTIbiZFFQwXnKH31a7Zsl2TZVrlcgKA8ZmbfbfFRNevv4rcBWjRdsNCvJxoYAY4MNu
         0hrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Q8ToqT3KseJ3Qa9LpPTy4hjHWDJuG6AlIq0/lkBS+b0=;
        b=ZSkmDNC4yfqk3EcSsrDXa11s8gay/FLtx1240cA9yNinlcURyMcJZL6/xlxqp1JXaM
         9Q5+quZtwiKAboIQ2pmDNMAEks1HGy0+6qrDL3AXoYyCi2Z7EnE+/JQIINeOZCR8+Q1+
         YCgW1Ygk3MmtI1d4qZRuXo4k0cOy21giEda+j7yRVhSCI6feVDe9xH67fZu0U6OWS0Eo
         TJ0c9viZbExJR43mfntpoXeF4MPsFuHvqJTMcrItP8SWS+a3UFdGau9OopM7syHwo9PZ
         uD5dsbET4cmGoMqe4qv04kCLXsZxx/BFI7B27E70q7YPqDDQRuK0aVdx3okITVEH22fH
         eKRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Q8ToqT3KseJ3Qa9LpPTy4hjHWDJuG6AlIq0/lkBS+b0=;
        b=fIAOTx7W6TtNibb9jH6qv3AMNGggV1s4lzD9KmXColXwcEnILDPNTlL1LwpyENguQF
         ZPCpBwULHTud6KilO6s1TtoQ7ps4s2t30aUS4103sZjZ6uvKLI6kkxpYvLwQskQn59Xc
         54ronkjy23+q5WG+7DioLmvJ/rFssLZE9elrdN64nzzSdZSvznhtT5mEkMLk8q+u9XY2
         QYwIcubVTirdR7BR9aFUKhJUOhuN5a00gFVFMvq8LyateJa8QfVbcHNT/Ii+uM2af3wi
         L98bOSi426dk6v5bmTETBEdG7EwE6tnongWQpwHlyRZ4IdvGUTZF3cBhd+WeiAsQkipU
         nphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Q8ToqT3KseJ3Qa9LpPTy4hjHWDJuG6AlIq0/lkBS+b0=;
        b=SmI1bH1nR8AsBu6YSIoeMq8ehQBmWfXYyLWubg9diIoz9nIOFm/IF+jEJUm9gEbiO7
         3f2HUXiXzfvLQZcSmrnDTAe6DrDXQL23k+klKJTHZWFB9RqKBwm3NvInSvJDQv+817YT
         uYJgtZ1QsWkIsuiDRt8ZuP05OI7ZwJ6d/FGhqEZRo+rMOaUNgRSC16LhBzCV/6k+ekAe
         Nu/3cNMOl4Kb02wHJuvYc9hgWKu2H5YL9ASOwJYzCetZ/iESfkAqxMwmT1Urgqrktqhw
         DxUEKD9ABUI9sObc2G4wJG9sS7DPKKucR+UYyCKLakJZg0LavyXQBBKNSgjtrXDDdeGS
         +wtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323dSFR6svqck9cJvVZj4LKJ4Qw9raPlnvXL9WQwskVjJ5KTU2o
	BdSTaRW9vKVJXXguXMOX8kw=
X-Google-Smtp-Source: ABdhPJx2NuXTv1HPTcPXtyaPjJspcfm6BaLl59rAQ3sr1HTXloNehjERgp8grSNoEkQFt1OCK2FeTQ==
X-Received: by 2002:a17:906:a155:: with SMTP id bu21mr4596533ejb.400.1616501337712;
        Tue, 23 Mar 2021 05:08:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:3592:: with SMTP id y18ls3044364edc.0.gmail; Tue,
 23 Mar 2021 05:08:56 -0700 (PDT)
X-Received: by 2002:aa7:d44a:: with SMTP id q10mr4219119edr.278.1616501336657;
        Tue, 23 Mar 2021 05:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616501336; cv=none;
        d=google.com; s=arc-20160816;
        b=O/OAdn524hMv+ih6tOT3Lf611n4Aud0reJxZqthc8AJCrV58xNKvqREo/BvZMRKKxN
         YFP8Yd+WVRm7EoY50tOXDjDL+wR3vPCOdolkby0WQFxKIWaZpDruFlRD4InuIHvkATaa
         yrxdHN+Fj0Z1aHOvrmobZGp+BX8pwyD4BP/R4lYTGkG5snLXYJkG8MwpdN51ZSAzMZUC
         XtFQXSHcY7AZvseU30/8eT/kprcZWX1PwOKcdScT6UH7iLwt4Avrwac7gN5VazeyL68a
         +YSKVAMX+ehG/IjCK8dMJO0fdaVq54Vvx6pdW2cE5cW7vjoT/nFuDlOyLB5N2Jgdyyjk
         k2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Qu33sMk1DMSL9+ibJaOkeq298fR1Z8IBhC2YbBnky24=;
        b=urm2ziC2C4jLyF8IyHeYPeKmu9EXdPwOnkTN4UMoY8rm0ImNoIINu7huou6NaaCs5Q
         DbX1lxg78Pg3jZbKpg+4W7bjc67NgD910ZVhfYU6tFSLR7Vozp3E4Yj9Z4BNM/hK/qUq
         GshnSH4CE4FFudL/B//U/KXC/l/sPXTbFjAdpSmjmbQT6zCVSJd6i8wsj0qfIxENALar
         6g/V5EGuyWVRIhN5u4GQVIwQCLDadvgzCi7gBPBqfp10Po0jdQBX01i/UYvmozjiIv9i
         VWSix6eRf3+/IrncMRr7B93GZyi/kRvsIcfwE0HxrXal+/uRCR7md5lQizwtjOoQaD7V
         gFjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w5si575715edv.1.2021.03.23.05.08.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 05:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NC8txX019193
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 13:08:55 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NC8tKI019488;
	Tue, 23 Mar 2021 13:08:55 +0100
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com>
 <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com>
Date: Tue, 23 Mar 2021 13:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 23.03.21 12:33, Angelo Ruocco wrote:
> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>> Hi Jan, all,
>>>
>>> I have seen that arm-zero-exits has been merged into next.
>>>
>>> My understanding is that right now the only officially supported
>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>> with only a experimental patch for the xilinx zynqmp firmware to
>>> enable SDEI.
>>>
>>> Regarding that patch, I have looked at it, tested it and added the
>>> missing non-secure-boundary check.
>>>
>>> Are you thinking of submitting it upstream? If so, how do you want to
>>> proceed?
>>
>> If you have everything ready with the patch, I would not mind if you
>> pushed that upstream. Just CC me.
> 
> The only thing missing is a proper commit message, I could also write
> that, but I don't really know whether it's appropriate for me to
> submit a patch of which I don't have the authorship. What do you
> think?

But you added something to it as you wrote above, no?

Otherwise, share what you have, and I will kick off the gerrit mess.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f88cc779-00a7-dbc5-19b7-c4ba9921d5a6%40siemens.com.
