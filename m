Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBBEB3SOQMGQEXNMJFBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996165F176
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 17:53:26 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id u4-20020adfc644000000b002ad64393461sf764863wrg.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 08:53:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672937605; cv=pass;
        d=google.com; s=arc-20160816;
        b=ilmKsjdRTdMtdkMeK/gCNHBYBtuMOIsueMDKidfo7514uRA0W4g4suoHOdI22s+xk/
         HdguEnzfsX1RkXujQxwEgfTSRJaP1Y1DykmPfAi49t3hrnbWIaKElncfGBw9r3pegd3E
         RZhMPLdHvzi/HV1KIeNodAW1MRWDVuN/wKhO4MPp/v2xwOJY0EDyM3iZz3jvtXKmK6o4
         AJcuvok5sVOtj+kbf/b3odXMoqIxFSdr+AVQ1sDA2p5iK6i5XsuuBhq84iWPyNKe+eIr
         OHYdxZKGbfsc3Z1AAgiczTsSUoCGWSDQrWiUyMT00EUaXR7D5ANM//Q8a0YGAlB6L2b2
         KKGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=sxqjXl7izyhTZ0HvjjNm5STB43R/UP9wBYs9ZrJmOsg=;
        b=lFyXSxGlq5dLUKPz4t5xBi4y+ZtXUTW6aOU2N1EgwSci3TzycmTf8L/Cvb6+DMEUG2
         5UQ1WzaqfUG1MsRQp8o+EDv04VoVKyXoiEQ6GtXAOo0BD5ygoGeIHRRbUA5NOiypCcul
         8q6szdEQBdrp5wFGmphslKfPA9V6HIuqo3TAGF162BY3TgjrW4xLo8xE0OzkZSEp5Nnl
         ziY35md7YLjLKAcPnngLFZ/V8tPpfKL4pU89LZpTHx0PQAcoGrDZQo66EKtG50EETwwR
         MbWLYiJT3FxpWAZ9PHNmBy94mx+Wqdq2HJ/nxE3+JiAgeUbcmtuUbrNJ7AuUG78LpL4H
         0t3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7q0jTTK;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxqjXl7izyhTZ0HvjjNm5STB43R/UP9wBYs9ZrJmOsg=;
        b=FyMCES09v4HFzDxGUtNUJ6fVuxszyPpRJjkLwEH+fbj4hhiOLBjetc9EVNarCYS4Uk
         oWTsU8R4EthrlyB8udfBea+PS1ut4g2bMPE1+7pwhGTDPxZHlWE2SHuCmdhCgMwXoBJ+
         sEnUb4Wa9pu4n1RA+YpwHNAc1c6WMviWw4NVmSOh0zeG9bSLxFY3A8llnuE4Upnllp+m
         BO8du1I0fUebsGjbWSZb/lUEjOfKAgMzffpZgvX0b86vkgRUE5LyTVQbdydbaA/feqIY
         V3H5Fi/6R803dS0hi4zPzel6rkPAEL1mFlgjlYpJwjPVB/T4b1MCR9xZAyc9YQd53w8S
         i/hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sxqjXl7izyhTZ0HvjjNm5STB43R/UP9wBYs9ZrJmOsg=;
        b=ln+XRxvHnzb9PW6WsQVY8VZZvKfxt/E/V2QfRzVvmyN/W/7CJ8walFVKnJ1386FeXT
         pcTdvxVU5kNpIYHwlUSsZF45t6ZRAq6cVtFf/ImU3ecqJ9BvOZDuy6EhgBS+Pmsr4s2V
         Id8hatlH/QCkJzcVIO1A2egPlZvX1ANwqQeExW6rt1twoLyJbxeIbkUhfkwyNLcLy7p1
         hSH+PnxzzMFwyAs9KudVuEvbX5ZTfJkqEUyVehaxcmg8RZhHAIAzCg97AsqAgVwRLU7e
         080GTs8tcTZTFLUfA7SJPLv4nwjpl5NBJuAFsDfkGh4+NaXcOr7dkoSyzvjBTY6iKG5M
         uUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxqjXl7izyhTZ0HvjjNm5STB43R/UP9wBYs9ZrJmOsg=;
        b=XVA4oRNMYO2QFyYbbqt0h52elS5A/ANKSZb1NwkVN1ZMVmCBWU6siv7tE+RvD3e00F
         yGWuFjPh3coCTZRjKnp2VvVqDfbcZNNjY09AHj5oSKtNAauj7zwtXSwkBdzaeWzOORs2
         ZtAQe6uqeIvwPrIDrjUviBSFpfCgCv/Acqgk+DaC8k21LOsiM7VnFF3ixFfk+eDcDoyt
         Il6HgilMSKWBaTC2/27469ndlWOybRrG7BnyhFkSheuEte3QWA0Eq6i7JZ0ztEZSZZSy
         puyknbqGtPpzLR3Y9+R07Jyt0pb1P9Wo7VYTl0nqcAoIyZeermnsNttKyO3jfVjp4aNy
         v4rw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kry5K5S0n6bzhWXdMVeagAUwFNwlGgvAe/AhxUuKqqbioiris1m
	oevpM4k/DoOA9avQAz+sb58=
X-Google-Smtp-Source: AMrXdXubAWw9hhPftBx1RAvZ7ADDyXFl03WRd3IVgyB5TGlWnDsw2/FJ0jvX/ok1AOLHDhGXMw8mEg==
X-Received: by 2002:a5d:40d1:0:b0:242:2bd5:b1ce with SMTP id b17-20020a5d40d1000000b002422bd5b1cemr2522598wrq.519.1672937604983;
        Thu, 05 Jan 2023 08:53:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c9f:b0:3cf:72dc:df8 with SMTP id
 k31-20020a05600c1c9f00b003cf72dc0df8ls20846495wms.0.-pod-canary-gmail; Thu,
 05 Jan 2023 08:53:23 -0800 (PST)
X-Received: by 2002:a05:600c:6d3:b0:3cf:e91d:f263 with SMTP id b19-20020a05600c06d300b003cfe91df263mr39961711wmn.4.1672937603573;
        Thu, 05 Jan 2023 08:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672937603; cv=none;
        d=google.com; s=arc-20160816;
        b=zqNhefWKTCeKoGS6Ei718udqjM1ZDvEUFRiJSrN30/dfC6pkTUyRvBJzdkBBICLRt+
         Gl+lBjDj28zlWJW8J9Fd2NJScyeRorOpulc3BRhX8m0abE9RGgakorNR4G7JMfwYz/n2
         0wC5dhPllwbx2vBAvDBopA+yq4I9Q3P9F16o1DERGoO3UV96Tkm3zTh0teVfCiGznGbh
         AkLr8M8PIb+C5tB/EtZygjisX6rblDWre2d1UGg5Ekr8Le+veKidKmWy48X1qrg4KBFI
         uH/Y3kUTcO3Ml6NVw/HyI9xGXuUGnrqRY6Jn33qH8QpidF3UOICuPuwLarL4tazHPQ84
         NV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XyTeQ4KqYDRBo7eMZfFLy1gPtXAW0P0mdmq6MR2/F/w=;
        b=wpPcZhU+n0w0pa1e55ljP96x4sv1yFnEBtdmPnIP4O0N1NYRhwbarGHkAPTvKX/+5g
         fkHQZEhuQ+3Of8ucHGk08/322MEx3c0xuk4obe+FcgcoNyOR/3kDotuvidCl/iVSa8GW
         xPmL+UZOY2NjUFX1+/kXawj8Rvcobc21LcY/yQNQHTeGVp+CZEyxlRxWW03iZobw0Cva
         7Fmeii5jWZwTHXo+vPJSWn2cs5aD8S+bG4SJovz0OtXkk4115K8Gt406Yv/YCFfQCRHC
         XV/9kFTI1J3epTGTBVlKe31YioVJbyOEWMKLL4UKC0rxJnY3vtcUUrzoiA48imnA9EKk
         lkTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p7q0jTTK;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com. [2a00:1450:4864:20::336])
        by gmr-mx.google.com with ESMTPS id p19-20020a05600c1d9300b003d2051f87ffsi103304wms.2.2023.01.05.08.53.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 08:53:23 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::336 as permitted sender) client-ip=2a00:1450:4864:20::336;
Received: by mail-wm1-x336.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1798815wms.2
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Jan 2023 08:53:23 -0800 (PST)
X-Received: by 2002:a05:600c:1d10:b0:3d8:8a0c:7016 with SMTP id
 l16-20020a05600c1d1000b003d88a0c7016mr2593479wms.97.1672937603057; Thu, 05
 Jan 2023 08:53:23 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
In-Reply-To: <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Thu, 5 Jan 2023 11:53:12 -0500
Message-ID: <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000008fc9e205f18723ff"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=p7q0jTTK;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::336 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008fc9e205f18723ff
Content-Type: text/plain; charset="UTF-8"

Jan - Thanks again. I have not tried the config check yet. Actually, it
does not work on hw currently, it does not find pyjailhouse module. I'll
check whats going wrong with it and let you know.
-tommi

to 5. tammik. 2023 klo 10.21 Jan Kiszka (jan.kiszka@siemens.com) kirjoitti:

> On 05.01.23 15:34, Tommi Parkkila wrote:
> > Thanks for your reply, Jan. I managed to get forward from the 'hang'
> > condition. There were several misdefinitions on my root-cell
> > configuration. Now I get the root-cell started sometimes, but more often
> > I get two types of issues after enable command. Any help or ideas where
> > to continue my debugging would be greatly appreciated. Please, see the
> > issues explained below.
>
> Already tried "jailhouse config check"?
>
> >
> > Thanks,
> > -tommi
> >
> > +++++++++++++++++++++++++++++++++
> >
> > 1. Terminal hangs
> > -- After the enable command for the root cell, jailhouse gets started
> > but then the terminal goes unresponsive. Below, example log, where I
> > give ls cmd, which then causes terminal to go unresponsive...:
> >
>
> Missing interrupts could be one reason. Or something is completely
> broken with memory mapping so that a kernel device driver gets stuck on
> waiting for some register bit to flip, e.g. But most frequent are
> interrupt issues, specifically around GIC resources being improperly
> passed through. The config checker may find that.
>
> > /*root@stm32mp1:~# modprobe jailhouse
> > [ 1315.034414] jailhouse: loading out-of-tree module taints kernel.
> > root@stm32mp1:~# jailhouse enable
> > ~/jailhouse/configs/arm/itron_stm32mp157.cell
> >
> > Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 0
> > Code location: 0xf0000040
> > Page pool usage after early setup: mem 28/1514, remap 0/131072
> > Initializing processors:
> >  CPU 0... OK
> >  CPU 1... OK
> > Initializing unit: irqchip
> > Initializing unit: PCI
> > Page pool usage after late setup: mem 50/1514, remap 5/131072
> > [0] Activating hypervisor
> > [ 1355.352714] The Jailhouse is opening.
> > root@stm32mp1:~# ls*/
> >
> > 2. Issue with setting CPU clock
> > -- The second issue I see is related to i2c bus and system clock.
> > Terminal starts printing error statements infinitely after Jailhouse
> > opening. Below, is a snippet of an example logs.
> >
> > */[   85.322027] The Jailhouse is opening.
> > [   85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_enable clock
> > root@stm32mp1:~# [   85.339233] cpu cpu0: _set_opp_voltage: failed to
> > set voltage (1350000 1350000 1350000 mV): -22
> > [   85.350413] cpufreq: __target_index: Failed to change cpu frequency:
> -22
> > [   85.357706] cpu cpu0: _set_opp_voltage: failed to set voltage
> > (1350000 1350000 1350000 mV): -22
> > [   85.365124] cpufreq: __target_index: Failed to change cpu frequency:
> -22
> > [   85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage
> > (1350000 1350000 1350000 mV): -22
> > /*- - -
> > +++++++++++++++++++++++++++++++++
>
> Same possible reasons as above. Or do you know how clock control happens
> on that platform? Is there firmware (TF-A?) involved?
>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAP8Rr619HSJUVs3GTLBzP%3Dr_4_svq8yvbP5JAADjWK2dwoLLZg%40mail.gmail.com.

--0000000000008fc9e205f18723ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan - Thanks again. I have not tried the config check yet.=
 Actually, it does not work on hw currently, it does not find pyjailhouse m=
odule. I&#39;ll check whats=C2=A0going wrong with it and=C2=A0let you know.=
<div>-tommi</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">to 5. tammik. 2023 klo 10.21 Jan Kiszka (<a href=3D"mailto=
:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>) kirjoitti:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 05.01.23 15:34, Tommi Pa=
rkkila wrote:<br>
&gt; Thanks for your reply, Jan. I managed to get forward from the &#39;han=
g&#39;<br>
&gt; condition. There were several misdefinitions on my root-cell<br>
&gt; configuration. Now I get the root-cell started sometimes, but more oft=
en<br>
&gt; I get two types of issues after enable command. Any help or ideas wher=
e<br>
&gt; to continue my debugging would be greatly appreciated. Please, see the=
<br>
&gt; issues explained below.<br>
<br>
Already tried &quot;jailhouse config check&quot;?<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -tommi<br>
&gt; <br>
&gt; +++++++++++++++++++++++++++++++++<br>
&gt; <br>
&gt; 1. Terminal hangs<br>
&gt; -- After the enable command for the root cell, jailhouse gets started<=
br>
&gt; but then the terminal goes unresponsive. Below, example log, where I<b=
r>
&gt; give ls cmd, which then causes terminal to go unresponsive...:<br>
&gt; <br>
<br>
Missing interrupts could be one reason. Or something is completely<br>
broken with memory mapping so that a kernel device driver gets stuck on<br>
waiting for some register bit to flip, e.g. But most frequent are<br>
interrupt issues, specifically around GIC resources being improperly<br>
passed through. The config checker may find that.<br>
<br>
&gt; /*root@stm32mp1:~# modprobe jailhouse<br>
&gt; [ 1315.034414] jailhouse: loading out-of-tree module taints kernel.<br=
>
&gt; root@stm32mp1:~# jailhouse enable<br>
&gt; ~/jailhouse/configs/arm/itron_stm32mp157.cell<br>
&gt; <br>
&gt; Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 0=
<br>
&gt; Code location: 0xf0000040<br>
&gt; Page pool usage after early setup: mem 28/1514, remap 0/131072<br>
&gt; Initializing processors:<br>
&gt; =C2=A0CPU 0... OK<br>
&gt; =C2=A0CPU 1... OK<br>
&gt; Initializing unit: irqchip<br>
&gt; Initializing unit: PCI<br>
&gt; Page pool usage after late setup: mem 50/1514, remap 5/131072<br>
&gt; [0] Activating hypervisor<br>
&gt; [ 1355.352714] The Jailhouse is opening.<br>
&gt; root@stm32mp1:~# ls*/<br>
&gt; <br>
&gt; 2. Issue with setting CPU clock<br>
&gt; -- The second issue I see is related to i2c bus and system clock.<br>
&gt; Terminal starts printing error statements infinitely after Jailhouse<b=
r>
&gt; opening. Below, is a snippet of an example logs.=C2=A0<br>
&gt; <br>
&gt; */[ =C2=A0 85.322027] The Jailhouse is opening.<br>
&gt; [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_enable=
 clock<br>
&gt; root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0: _set_opp_voltage: faile=
d to<br>
&gt; set voltage (1350000 1350000 1350000 mV): -22<br>
&gt; [ =C2=A0 85.350413] cpufreq: __target_index: Failed to change cpu freq=
uency: -22<br>
&gt; [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage: failed to set voltage<=
br>
&gt; (1350000 1350000 1350000 mV): -22<br>
&gt; [ =C2=A0 85.365124] cpufreq: __target_index: Failed to change cpu freq=
uency: -22<br>
&gt; [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage<=
br>
&gt; (1350000 1350000 1350000 mV): -22<br>
&gt; /*- - -<br>
&gt; +++++++++++++++++++++++++++++++++<br>
<br>
Same possible reasons as above. Or do you know how clock control happens<br=
>
on that platform? Is there firmware (TF-A?) involved?<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr619HSJUVs3GTLBzP%3Dr_4_svq8yvbP5JAADjWK2dwoL=
LZg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAP8Rr619HSJUVs3GTLBzP%3Dr_4_svq8yvbP5JAA=
DjWK2dwoLLZg%40mail.gmail.com</a>.<br />

--0000000000008fc9e205f18723ff--
