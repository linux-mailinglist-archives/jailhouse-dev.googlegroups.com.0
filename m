Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLG3TXUAKGQERW3BPWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C547FD7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 12:38:37 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id e143sf1077898lfd.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 03:38:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560767917; cv=pass;
        d=google.com; s=arc-20160816;
        b=YxMxtiY4qssBzX8Cak0j+/R9vQPhLQrXpxCCUDkImJ+PWdm4YEX8Ua68oPJWHdEJvr
         /bIpXZRbRI5RK+gvdM+C4nVc8IEd+a2npPCtRtQkuPFXSYXDzjBomUSjgTjWDUucw0il
         XAXtn1vJXRsKIUVBQmg7aydpsiLzc2NO0xJsNh8uHC5uE0jwgZD1EM0/KatCdmpDJvbp
         E+izm6EOk6stZbkA69e3iTuZuSsAMqtxT24GOnBB+eL45Hi503W/GGDNEQMIlep//QPO
         2Vc7X+WD/zWpMl/0u7dEhJENvWCZSs02sWkmgNPk29pvwQFNPbOCrny7nbRe4Xg9QbBG
         eqtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=VwKyczob71EeHLJqnP+yv8oN/WbczBSBAcOB6pAXBFQ=;
        b=VO9pv1CFhqOwTY1a8CQDTBv/njl65w9CGMohl+CeCJs9Br0y9JOS3Q9w6cc1V8OSjL
         v+yUABKqESCEKMH04Q/OQ7Yrj+LQXb/Y9kI6HJtaLHKBkS9kyRmBcGboRiaTsfTPj5+e
         nrqZ02sPQ2+1CmLk6It7LS7hF+5mOh18XsWnC8xjP1F4rtWLiFQHu+0Ur99da1X7NETW
         LyEVS88xEE+RsMT+fCycxVT4hUPbgWuyZYKyIOAJ+OfTqRwtnmzrC2XSd60xAEHgiqlH
         dcG47CWjGOMJT48o3ROwv5buUDIlKivhxyGkk8Puq1MrDVVVInH9GrburCskbz56AEEm
         iwnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VwKyczob71EeHLJqnP+yv8oN/WbczBSBAcOB6pAXBFQ=;
        b=QEJ230ZHV2YcKLMWLLdhGdwwHmT8P9qGz5aQiTOHXiBZ6TXQQoswNrQmUQ/bU4tpvj
         YknBgt2/YZVgOac0tNUTo2Le6Vn3M0ObEqHog7yg4sGr8rwKMMi7I5RIRIjKr12YVAch
         5bOI3fqVnSb48xqV7jBvBULnuEz8c3XkVNMp4egLEcsOdAxyhPo/P+3zl7rjp7VZJRuQ
         ObzV9pSCI7893c+3Rts0nMPqHtFoxCQcaXakKKlJGGzO8lr+WPVN7/MP790kMn/ugEEK
         bJ3dv6wPu563Hrx4NSyDErTgNFA/qR6UPLqG8w4ObasVafKmAo5oEFhBUcb3ivBiWVWS
         wfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VwKyczob71EeHLJqnP+yv8oN/WbczBSBAcOB6pAXBFQ=;
        b=BUADwswnANnZH7ot4WLPw6Gn68bCpKYatx9ViZhwRNuirIDrfWh5faMW70D0vpIpln
         T1J7wFWh1S3d4uoygmq8IIw3VEnwy7K7QuKEyi9IjqZNSfJgnIHJyUAv/Cdym/YBJSVm
         w8Ms5uaM9/3FPsO8uUevlK5N34X576um4A9DyV6LHEFTAJGl+VoTiRyZsIuMExOCU5DI
         KJ+9DSXZrN4e4c72JC5b5IYse6U1FypQm5WwMYlNhRbMFSTg9SBejsYJ5Y7c/n6toSp0
         MWZptsHDjvQKIAdCzX0fSqupiBxaN2VCrMGxARfNhUqupSnK0+/rmK2pbb/CCOvxkQxd
         j+aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXE6ThpovpDU4kEQiiAsm8qXXtYIBTxyIAIdl0NSl+TePtO+Qd6
	+pshoCFQf1rvwX9ATW3RURo=
X-Google-Smtp-Source: APXvYqzY1iHEX6e5kpFJhOSXfHV8zzhh8BZpdyEZcArMhfHWqUNWHFohEDRVylBAyT0m0ftKpS2F0A==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr11405271ljl.8.1560767917184;
        Mon, 17 Jun 2019 03:38:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:418e:: with SMTP id z14ls1368917lfh.16.gmail; Mon, 17
 Jun 2019 03:38:36 -0700 (PDT)
X-Received: by 2002:a05:6512:4c5:: with SMTP id w5mr15784880lfq.171.1560767916384;
        Mon, 17 Jun 2019 03:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560767916; cv=none;
        d=google.com; s=arc-20160816;
        b=DxVpWCxTFfsWWvC0R7qI0xdnu68nOG0UKCMtCtMfH/yfmncRkQkBPByMz6BBNt0ZEg
         VGHYHc/wPiyO1xFiQtjY3B/T2r4ADRI+D3BgjnkGd1G8w/f3xsqNCldbFofOnF8e5yrS
         A1FP6kywI1smq5yISzP7FTRghDaRqTY9EHT95uDz47aI1cCalcGXGWPqwy2Ud09G7GmQ
         FSREa/YeTGDdAnzOQsixWOQRXnMM/lgGfmIOhTTa3dr2gwy2xFM2v+JQE//b3Fzv0HKe
         B74f7GOigpzi8j/EQ/vvPjNO0RtlEQXL3Q6tMcB6H0hgM/pSpfMla74HBraxv49nA/Jy
         xVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=FnqWMVSqSI297geyupEuoRSWLLTkp0gDNnn6FY7P3BI=;
        b=OvLia+iRKVLbD7L2TOnTk4FPHP2UyAKI7TGneSd8BLHp/60my9WzGjtPooMQUfqdLH
         gBjY8rt43bXK1vhQIJlZTkF/q4AXSyL1xvsnJmBinjI2ZcHWIMc+t37E+GIOFs6F5xoe
         GbiHrW276XiwTH252hR+OgOsvtbYZbW9BVcqpfDl1hoYUHnfVXJYsLcdDlevVla+pieL
         RSOl2uflluaUdddqe8oTN6SXM/f45H8Z5cljNQ3nZiDcYavW5zFa835zqym5LzrE3SxB
         t7Auzi5xoQlBkdxUYKUhW01ZF/fcGVs+JobF9I1JNsdVcc8TxzsQL1y0GrQB8Ce78HmT
         bsPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v29si615513lfq.2.2019.06.17.03.38.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HAcZqR000629
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 12:38:35 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5HAcZ0g006173;
	Mon, 17 Jun 2019 12:38:35 +0200
Subject: Re: [PATCH] x86: amd: fix comment in MSR bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
 <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
 <45c22944-7a26-547d-9a55-b7703279d0a4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6cdb4766-2689-c36d-22cf-91ef1aab6f21@siemens.com>
Date: Mon, 17 Jun 2019 12:38:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <45c22944-7a26-547d-9a55-b7703279d0a4@oth-regensburg.de>
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

On 04.06.19 23:24, Ralf Ramsauer wrote:
> Hi Valentine,
>=20
> maybe this somehow got lost -- did you already find time to have a look
> on this?
>=20
> Thanks
>    Ralf
>=20
> On 5/12/19 9:44 AM, Jan Kiszka wrote:
>> On 10.05.19 15:10, Ralf Ramsauer wrote:
>>> Writes to MSR 0x803 are intercepted, and not reads (as the comment
>>> stated).
>>>
>>> The correctness of the rest of the list was checked with a short helper
>>> tool.
>>>
>>> There's also a read-intercepted area that can be zipped.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/svm.c | 9 ++-------
>>>  =C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
>>> index 9c3e971b..60d236be 100644
>>> --- a/hypervisor/arch/x86/svm.c
>>> +++ b/hypervisor/arch/x86/svm.c
>>> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE)))
>>> msrpm[][0x2000/4] =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x2fc/4=
 ...=C2=A0 0x2ff/4 ] =3D 0x80, /* 0x2ff (w) */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x300/4=
 ...=C2=A0 0x7ff/4 ] =3D 0,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* x2APIC MSRs =
- emulated if not present */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0=
x803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (r) */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0=
x803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (w) */
>>
>> Then we rather have a bug here: 0x802 and 0x803 are both read-only
>> registers. We
>> actually want to intercept 0x803 reads, in order to map them on xAPIC
>> reads. And
>> writes just simple be allowed as they will cause #GP then.
>>

Can you try if changing the value to 0x50 works (with the apic-demo) or eve=
n=20
improves things? I don't have a working AMD box in reach.

Thanks,
Jan

>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x804/4=
 ...=C2=A0 0x807/4 ] =3D 0,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x808/4=
 ...=C2=A0 0x80b/4 ] =3D 0x93, /* 0x808 (rw), 0x80a (r),
>>> 0x80b (w) */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x80c/4=
 ...=C2=A0 0x80f/4 ] =3D 0xc8, /* 0x80d (w), 0x80f (rw) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0=
x813/4 ] =3D 0x55, /* 0x810 - 0x813 (r) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x814/4 ...=C2=A0 0=
x817/4 ] =3D 0x55, /* 0x814 - 0x817 (r) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x818/4 ...=C2=A0 0=
x81b/4 ] =3D 0x55, /* 0x818 - 0x81b (r) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x81c/4 ...=C2=A0 0=
x81f/4 ] =3D 0x55, /* 0x81c - 0x81f (r) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x820/4 ...=C2=A0 0=
x823/4 ] =3D 0x55, /* 0x820 - 0x823 (r) */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x824/4 ...=C2=A0 0=
x827/4 ] =3D 0x55, /* 0x823 - 0x827 (r) */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0=
x827/4 ] =3D 0x55, /* 0x810 - 0x827 (r) */
>>
>> That looks good.
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x828/4=
 ...=C2=A0 0x82b/4 ] =3D 0x03, /* 0x828 (rw) */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x82c/4=
 ...=C2=A0 0x82f/4 ] =3D 0xc0, /* 0x82f (rw) */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x830/4=
 ...=C2=A0 0x833/4 ] =3D 0xf3, /* 0x830 (rw), 0x832 (rw),
>>> 0x833 (rw) */
>>>
>>
>> Jan
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
jailhouse-dev/6cdb4766-2689-c36d-22cf-91ef1aab6f21%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
