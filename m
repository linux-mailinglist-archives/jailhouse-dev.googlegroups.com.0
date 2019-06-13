Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSHSRHUAKGQELVBTPRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FE442E1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 18:26:49 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 3sf2734223ljq.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 09:26:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560443208; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lb/PQkjjsW8MeR21e4Kpi178cASxK+jTLdzwbXoOWs0gdAd189vJOgiyrhjfatNQBy
         pznNjdkRP6IP93IA+Mo/bKo86HB00RYPQof8ql3XUm25/JeCGvC19tflCpg2zGf9B2bZ
         ARf975Pj6CrvZi5fWGs8V57bkzEc4HG9nzfBzmlaMU8BSxeCjblcz/nMc6tvLuzb2D/q
         BIbtK+OjHRgHJjondhwUOQ+l6XSH43BVwj4xo4pWKyht6bB1r452rhwwQY+g1FbZlUTk
         375J3bshQ6s1o0oadD1yJy4/LlDw/lZBAWHSmbme6wWiDd2Ii9E2b3NbZ0x8H/v/xo67
         ZNdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=A3zFubrHusFHYgKzRcBKWDWsBjhBPjoXx+HSGLc2mT0=;
        b=qZInTIkZA4KsE2PfI9Ww/O0ueOnBsTW2rJw8EwuuMkRSx2lshQ8OQRcZ9NdtK8MHoE
         RxIemMSvj128VMtNi0BMYoZ+/2TMSZLHE5LxKJmzq2WYXidx9V/DWwJ0l0sLjBNNMuzK
         HpkwhezAUy5q4ueWFDdG7m2Lzy7KILPZ8jvi1cus/XOtWmysAsrmI5TsZ8YGxRjze//Y
         8MDMBPjPzt6LgIPlHge6N7JtJIc+QDuIqL2gEBR6tRMc4O7kuv06wgEUxs6hqx+nk7zw
         2WWhWluXKoW77uGY0kgRG3CoDU4Ay324euvsH/EugtAN4QvfjzmYP2B/6lXt4ybXqhHB
         4aig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A3zFubrHusFHYgKzRcBKWDWsBjhBPjoXx+HSGLc2mT0=;
        b=Rd7Gnpmc4w878Dc7OyirVlWltm2gWMg70CP5jnxDXnQlEPh/0/x0I+AH++s7ODl1k3
         RspqQ5qCUtLGKIP8N+kTp4jO3rpWzsCSBhO92tMZX+A1CrzebGzcTcGy16uuIDnyUVjx
         2i6E3lCMgTuBtpWsl4uAUU6gBsn039goxWCaNUorZOLBzN5NwSiszpxQWEdftmcNvpEe
         xY5TCXeem6vPx+BCN5Gc4HS9qHaWGZ1/k1/HTWa4EZObKE6dbpZcpj3P+p5wOtIrmC0x
         +i73zUfjvtBoyHXoz/meA0IHG16HYM3PCy8BB3JQxAE2qC1OxtrhU7jGyeQ+MzYLTrQG
         /jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A3zFubrHusFHYgKzRcBKWDWsBjhBPjoXx+HSGLc2mT0=;
        b=UqBda8k5b3w7zUPk0Skli8akVDVMq8jhdOis8u3BErQtIQuAVegCFtZYhNeu2rPbfK
         O03hG216HCLcK5cnYnqd7HZQ+znqiFDKKJoYVqlyOrSeQYuIpng8i7QiOD6iUfaas8RR
         Bmq5TAdXai+9X9SjQiG4bd4Zc9pruZ3i8xGzpTHcWfY4RtH/3GIIUCMbg5CRZYLjfulF
         ylgfgmS40rqMp46rtvk2yAUmyld/1RxOBjOm9jQtRSEDHC9WGGG4+LQxJU/58NNkO07+
         RhS41PR14OHTbiEWv1sY6Q72iu1Z9R3RHUHbtvZYm3Y0+SDgpy4h4xoC++8LXDjIqjNY
         N4xg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUX7p4Uugsc+KrNGU+ng1Cpp86xNC9ZDia2LVofe3CJNBJxREKP
	q2oQr0EIivEzPreqJoVvFus=
X-Google-Smtp-Source: APXvYqxTyl5YIoClnjgI98fZT2K7Vy8cSS6RQQ6OU98A5dD2Duhs3oXhoh3UOu1vkP9szfqVIBBaxQ==
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr31217919lje.27.1560443208879;
        Thu, 13 Jun 2019 09:26:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:157:: with SMTP id c23ls713814ljd.8.gmail; Thu, 13
 Jun 2019 09:26:48 -0700 (PDT)
X-Received: by 2002:a2e:9654:: with SMTP id z20mr21381009ljh.52.1560443208030;
        Thu, 13 Jun 2019 09:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560443208; cv=none;
        d=google.com; s=arc-20160816;
        b=LaRXBjX+LVsmH9hkKRazOM2E6FHAi/TupQePnJz7zqqs3rt/8Wr68Y/AkT4Q0XGGYX
         GixfD6xSZywLP9IM8ko1NAke75+B5MTVvLtVE7jqr0U6lxifR1FzbTTLowvU6KioqHIZ
         U30p5cbGy0deJKRWjo5vYfBGmiGSlwfrkqV2QqLAePNRyE0xQOrHzlVDNpw6yL051BGh
         GhUxfit88nQYmEaaCd0hWYLoeEB3pojE2LsHi83JI7nMVvFwERHNJmk+3XHMBhRnOjkP
         +HazfK4hH4tu2Jc8i7TgTN/UJDSPMiU+BRmVfwnmVLugtJnz+7B1zraKOP2xWl3Bh2/b
         j4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=oyU2i1YMegfhMDXo8+XLzUB8tQJsxycYLa2KnoAk+RI=;
        b=hw+sP3T6kXxIrW2HO4EhW9S27t1UMYm1t9bsjg3kJT9R5sn0rjNY9gkBfIinUOJ5SW
         N3Ku4XesJW4xHgBYNptUWhhT24GCCLHIihK0oh0Yd6ZWjTczZTBhKRH2Cs/vYBlZFUoe
         EuH51w4Evkg1kEHmmxcERJjqJxeZtKm3YPDszh2IgJDuyFNPik0MgCWNjO7V7mAEPfIC
         rLF3cDUYT3J74Y/fK7aOzmEjNa5fmHyUTrLGzHDIc/qPioG1fdGOTZVq7LTeKVwzebti
         ScPn6kt6rmPJXi9VwBmpswKJV/BzEyBrEON8fgA/VUTQFEm4C8/GJL3qeD1p1WoTdsz/
         r77A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v29si20912lfq.2.2019.06.13.09.26.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 09:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5DGQlMd008991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 18:26:47 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5DGQlaq006071;
	Thu, 13 Jun 2019 18:26:47 +0200
Subject: Re: [PATCH 1/5] inmates: lib: Use wider types for time-related
 constants
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
 <20190612130332.6175-2-ralf.ramsauer@oth-regensburg.de>
 <5f477941-2c06-0a37-9397-03aeec6c62b9@siemens.com>
Message-ID: <9cda6f51-7293-4d7e-28ed-58c8195357f6@siemens.com>
Date: Thu, 13 Jun 2019 18:26:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <5f477941-2c06-0a37-9397-03aeec6c62b9@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 13.06.19 18:20, Jan Kiszka wrote:
> On 12.06.19 15:03, Ralf Ramsauer wrote:
>> Especially when timing is involved, multiplications tend to overflow
>> 32 bit. It's better to use 64 bit variables during the calculation. ULL
>> for constants ensures the correct width of intermediate results.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/lib/include/inmate_common.h | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/inmates/lib/include/inmate_common.h=20
>> b/inmates/lib/include/inmate_common.h
>> index d9f1df5f..c85f1383 100644
>> --- a/inmates/lib/include/inmate_common.h
>> +++ b/inmates/lib/include/inmate_common.h
>> @@ -42,9 +42,9 @@
>> =C2=A0 #define NULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ((void *)0)
>> -#define NS_PER_USEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000UL
>> -#define NS_PER_MSEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000000UL
>> -#define NS_PER_SEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000000000=
UL
>> +#define NS_PER_USEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000ULL
>> +#define NS_PER_MSEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000000UL=
L
>> +#define NS_PER_SEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1000000000=
ULL
>> =C2=A0 #ifndef __ASSEMBLY__
>> =C2=A0 typedef s8 __s8;
>>
>=20
> Did you check if this is side-effect free for ARMv7 inmates?
>=20

OK, can answer this myself: The defines are generic, but they are used on x=
86=20
only so far.

Merged the series into next.

Thanks,
Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9cda6f51-7293-4d7e-28ed-58c8195357f6%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
