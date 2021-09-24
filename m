Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBY7DW6FAMGQE2IK47CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 593744177FD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 17:42:28 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id x29-20020ac259dd000000b003f950c726e1sf9475000lfn.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 08:42:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632498148; cv=pass;
        d=google.com; s=arc-20160816;
        b=Aw3UthyFFbX7MwlVnS53OOX8Vjcokq/8/3ZM96A2W8qr9VEjIx5VVhEUzpSrUPNYWW
         g+/bcuqrjE6xZuMNXWiYnXRFVTblcoX+h1dScpyU3kPW9jAwAbw84xyVJyk/UQROqzm5
         /+P3sC6TgI67YQuyk6WjHi+4PqXfDYElDxERdvchEnlo488IpyfxQBVVIcyMTa+Ya/5V
         ACEjeGoPB5vf/3TJDWaYUHm5KSUsbak8loBmsNrx/ryx2vV6vwk17hbZwbrVIlhRL3SC
         oIKo3dIG3h8ZVY/Au10pmcZT9LtvbK1OgjB6iqwTTWpyQQGVenMS5PaWCQ0V204xr/M9
         kxYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=GjwNNJv5ijl8F6tV2sfhw5PibzjSTtkWt00I90DHVg0=;
        b=eEa2B5M4Q9aglv+3xHinRDkGEl9PW5VtmUiH739mADlxkzZTBy47VE/yG4ciX802lA
         uJhYVMx+I1NjcUb3jXXqy8sbpFTLcmSeD+gMRulgG20aJy3njASdDO2CHIpNApUh+aQy
         N2mMhJoiBI7xkwlIgS/28SDJJPD1YfMJMnIlt1N/HQlGCByBolSVsV3G/NAHkUCCjPnj
         Cxk1eM5NvCTCCKS041DQfCz5tGusGKKXhguLj9RMZsRa703HUY7dCgMx2kQhP2eWkDd+
         jyNpi8N5gS5x8xJM7ybCXuqbFM46hJX6RR8xzzAAD4OCKcNonjgQDmnEId16gne2ghfL
         eEIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lv/9DtGE";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GjwNNJv5ijl8F6tV2sfhw5PibzjSTtkWt00I90DHVg0=;
        b=BDAyfXwE1GflS4C2DOeT4eq9mNFifZSy3m5i1ebPTBTtPXuMvN3jt1PZFmzMELwLr3
         +WloZiSle2qeqDwJO/csdybMzPdjSLJODFR8jJ0FDQk9XoHJln0vVHmRlpydOzvXUQWD
         2gSf3rHi6ax4Zr279JcG2gsVuOdbvNh+QBIi29F/JUERAk9K6PzF3EfkHzAUsd5nEGnq
         3ZpCgT6pdWXUH7z8HfpW+OWXyn6RpvmJaindDhWc7QCEAGYW47vNqDMq/2/gReJ17byD
         0uy9KLRHnS5NyQRuOc4A77jOk7A/W0faHNwZxaVBcaICHpfLog2maiPdJIbhcays+IhF
         hzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GjwNNJv5ijl8F6tV2sfhw5PibzjSTtkWt00I90DHVg0=;
        b=on/nAXhd7CLfo5cUpzkcz0pz37BGHIi9EY4HfAGsQGpOlHN92qHZY8ljxiTKWJt0MZ
         /8jj+H1KkqHrUn0+8griCXTaZG6d+fChJEhRgDzEZmF51zgt+UU+pne7psP5FAQjDp2m
         3QS6fGAXqZhCfHdE4JCsWxe9qDslnc5Y9dGjldjJQq6WoctIXt5dQgzfJIdKBL6pxGlv
         S4WJ7o4UTRQoxm4j/+GwY3erAcpEVY2yuU08Zm+BQ84Hy2tc3sH0dj5xuHQ+igV4rAE2
         oN3gYHsItiVgSskJfKLXB7+DIj4mkPbTpjD5QKYSEbQJ/xMdupaNLr+0SdAoBZIOKglA
         0FiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316Ej378Gn4SRojeOwZEz+jj15ZWzjCzV8sYS7KOZTv833/t5bh
	BWZWKNRq6KizkUs1C7bFNrM=
X-Google-Smtp-Source: ABdhPJy54QhxRxtybbRC1CiKsTwBdMKkYbHNa8Nak048OX5g0dkd1QVALGUqDgbPEtvb9/dxh+ofyQ==
X-Received: by 2002:a05:6512:118a:: with SMTP id g10mr10339874lfr.206.1632498147892;
        Fri, 24 Sep 2021 08:42:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:324d:: with SMTP id c13ls469964lfr.0.gmail; Fri, 24
 Sep 2021 08:42:26 -0700 (PDT)
X-Received: by 2002:ac2:5cae:: with SMTP id e14mr9638138lfq.406.1632498146713;
        Fri, 24 Sep 2021 08:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632498146; cv=none;
        d=google.com; s=arc-20160816;
        b=DbBuATyE3SYIMI/T37kde7Q3KoWNpmEgMeN3X/HyZPHHaq5ENVY1+1SUzfGtn/7ZV/
         o2/6vHdiDsFI4jrI1x9sMb2Lq8ljA4E9YxfOketKBsFEXAkfiCQx2xvxuOT9GeZMsm8U
         PeuMUcRjMPzHkO09g1pbcRcP2LnllrNn4HMKcSQjQvvlyKt2jaP+EX8KuQpgqB6hBeE/
         KyFMlaihdY6q37zSEz7rBqWRvBJwOqdVm5WWg7160Q0WQNnRPvhpa1uN2pixRvS5ukd0
         THWL+qGJuOYoj9bpN6w22su71AwquESqTE7xetDJLhYFsRutV0lV7TWwTyjVLqImkt6O
         uCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ce7c/k8PUqA9T30WqPMXZIgcHro4KQaau3RXB0nIPLQ=;
        b=P91K2nDG/5Wj3b+soqrG+HtEg6obGGk1VHpZtn7Uu4f4e2Kkqv3YGdLXArj4EP/fEz
         O02Mm9ybUx9xd9GX9JoOSwoy75S9OIxddat2rpe+f1O+WF4ktZxi9O9tLCJiGIwgtrGs
         K+LUAPZyVnnzrkXBjjl7tTNLyDaEsWKAn34eHhqcKAhd9QXZG767YVvlX4cW0l1NB86B
         PHeZksuCpFmNqGr659JRJSOTAzS8Hh0VigzA8+62apEafMMJVLJB2PEtIuQb7kDOj8Cz
         RoFb6fgN6AgHGokJ6M997IrMpm4oWE8zPjjKyu/2O5b4p9VlmsWuAtTQUHBCm/5/FdM5
         TcRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="lv/9DtGE";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id z33si502793lfu.5.2021.09.24.08.42.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPpIE-1mYjIJ29re-004xFu; Fri, 24
 Sep 2021 17:42:25 +0200
Subject: Re: [PATCH 2/2] Kbuild: use toolchain stdarg.h
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
 <20210917074630.2585329-2-peng.fan@oss.nxp.com>
 <65d5f035-decd-c602-4a53-4ce898b22cfc@siemens.com>
 <DB6PR0402MB2760C093D4F7223290A0189188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <caeffc84-ecdc-408d-b759-4294911af7cf@web.de>
Date: Fri, 24 Sep 2021 17:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760C093D4F7223290A0189188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:2Blg90xVJAzAzSJXA+5SGS4gaX2U0l0nSJu6LTQfmKukFvMHZv4
 8SkZQ6e4spMKO0IDOqnFEWw7Bqofo9WbEIj0Vft2Utjv3Ex8YwkN6sHDbJAALWAWgqSc/P6
 HPUIRx0KBTVUjBzDyvAASiOeXsmjdu+eKPpiNgvf6f6SqlMnJcjIQU0fTxhjd5Tm02ehLmq
 VIgDOGL+7Lqsl+7mfgo7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gP+lH5Jo08A=:BI0kggShvHrFJWf7gJuT1t
 UCUsuy3VebKFfxIdaEjLIGZ5oHqls5/N496luNFBjnxzATdd/Vjssymz/pIDwTe42Gy1QATMg
 gFOXpCVCzcnYA8auhKNlAZMKx4sPaSqk4zB1BT8125GMHbUYMAqbajqxkB+htzoO3ROM+eQX3
 Qh3Grd6yHfMe48eoWhBiNuJIMx1d6GfudYUnorDsxIyah9R2kxr+b7QlIwk9D/OK8DNIcJhw5
 8dDUuSmAAO4K/BdoOb4JWcRXs8IRqIWaMMcE/ZMgaVciUfaxJSPnSlpyJAu+HmNoDjflrVIfo
 lCAKZgx0Sbbbh7TAqXuIFw3NoWTwj8E0RCEmyKEoaoCbX85mkjOPZlZlICkORDiGfh1R3Xx73
 lx7cFeBJKU+rCCJP4KxGAAv5HPlQDdICm5fKEuWQCxKLsnSIvaryEEaDB5aQpr3mT5OyNcQyu
 QQMhmE7HOvcObv3xfDgLT8P6Bn4VKxbZ3Gz6FoIR0JeCBQntpd4PaHVUITO8uFyxMUJYEjAce
 hRIJGrGvtsuBk+IjODFli3hTkp7g78uoY+XnifWkb5DLof/Zq+fnxOxnmCSL9FKkHqEf6tO0Z
 +ydART36pBmFw+LLQZaMdXO2qiSI0Yr374sLFvktZTouwOlaL63MRwM18/P3GfUvP5jleU49h
 uqnofVJ7Uw/LC0y4XUL9ETX2bwInLMNEhZ6IdbGuPZTmek6CR9k5jQ+8URBLlqnVGDskDoLzC
 ZtxDev3OdGOhqlShID6plmLGqVxn22yMdEuwnyi+Ro24j5Z54KeXjF1rMQJ42qWFxz4xkIdmZ
 ZyO+Hm36BzB5i62nyYhREAYswKF++5zn9Ye/bPg9GE+m4uyxbme/34TtezbfSc3sY4BEmwFCB
 /AHBidUwj/ckmBZcROMmThgNYOvB73H2s1plzUcf6igCaWMnhxuWwtlBPytbXKD4QWNoeqB8C
 0tCp6KCAwAOUTchVITuOPvo7jMhuFXXhlylTS9D2UGrg/fqGbNO+GH+NyMCs72aTrkUJw6pWU
 TEroZTbNS1G5GHPxnApoxF1FjLrxRmrnYPGpsZgxT87Z/qd4j3coLPZQ8sFg1RlfpL4wNCI7D
 LK2DC8lYT4SIMs=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="lv/9DtGE";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 24.09.21 10:45, Peng Fan wrote:
>> Subject: Re: [PATCH 2/2] Kbuild: use toolchain stdarg.h
>>
>> On 17.09.21 09:46, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> Linux Kernel has shipped a in-house stdarg.h under include/linux/ and
>>> drop using the header files with -isystem.
>>>
>>> However jailhouse need to support multiple kernel versions, instead to
>>> add Kernel version check in various source files, update to still use
>>> toolchain stdarg.h with -isystem option.
>>>
>>
>> Also here: 5.15+?
>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>  Kbuild | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Kbuild b/Kbuild
>>> index 2863c121..fecf61f7 100644
>>> --- a/Kbuild
>>> +++ b/Kbuild
>>> @@ -58,6 +58,8 @@ subdir-y := hypervisor configs inmates tools
>>>
>>>  obj-m := driver/
>>>
>>> +NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC)
>>> +-print-file-name=include)
>>> +
>>
>> Shouldn't we prepare for phasing this out at some point, i.e. indeed make
>> these flags version-dependent? Would be a single point, no?
>
> Kernel put stdarg.h under include/linux/, so if need version check, I suppose
> in .h/.c file, need add for all the files include stdarg.h
>
> #if xxx
> #include <linux/stdarg.h>
> #else
> #include <stdarg.h>
> #endif
>
> So I choose to use toolchain stdarg.h here.

We could carry a stub linux/stdarg.h in our include folder that pulls
the toolchain stdarg.h for older kernels or does #include_next otherwise.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/caeffc84-ecdc-408d-b759-4294911af7cf%40web.de.
